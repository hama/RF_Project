# -*- coding:utf-8 -*-

from do_request import *
from kwproduct import add_max_product_py
from raw_data import *
from variable import *
import json

reload(sys)
sys.setdefaultencoding('utf-8')


def rebate_list_py(query_str={}, cookie=init_cookie):
    """
    满减活动列表
    :param data:
    :param cookie:
    :return:
    """

    url = home_page_url + "/api/admin/discount-rebate"
    return do_get(url, query_str, cookie=cookie)


def rebate_detail_py(rebate_id, cookie=init_cookie):
    """
    获取满减活动详情
    :param data:
    :param cookie:
    :return:
    """

    url = '%s/api/admin/discount-rebate/%s' % (home_page_url, rebate_id)
    return do_get(url, {}, cookie=cookie)


def rebate_select_product_py(query_str={}, cookie=init_cookie):
    """
    选择商品列表
    :param data:
    :param cookie:
    :return:
    """

    url = home_page_url + "/api/admin/discount-rebate/select-product"
    return do_get(url, query_str, cookie=cookie)


def rebate_refresh_py(data, cookie=init_cookie):
    """
    更新满减活动信息
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/discount-rebate/' % (home_page_url)
    return do_post(url, data, cookie=cookie)


def rebate_end_py(rebate_id, cookie=init_cookie):
    """
    提前结束满减活动
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/discount-rebate/%s' % (home_page_url, rebate_id)
    data = {"id": rebate_id, "status": "end"}
    return do_patch(url, data, cookie=cookie)


def rebate_delete_py(data, rebate_id, cookie=init_cookie):
    """
    删除满减活动
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/discount-rebate/%s' % (home_page_url, rebate_id)
    return do_post(url, data, cookie=cookie)


def rebate_selected_info_py(data, cookie=init_cookie):
    """
    获取已选商品信息
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/admin/discount-rebate/selected-product'
    return do_post(url, data, cookie=cookie)


def rebate_preconfig_py(data, cookie=init_cookie):
    """
    更新满减活动前配置
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/rebate/preconfig'
    return do_post(url, data, cookie=cookie)


def get_select_product_list_py(conf={}, cookie=init_cookie):
    """
    获取所选商品
    :param conf:
    :param cookie:
    :return: list
    """
    data = copy.deepcopy(rebate_select_product_data)
    dict_deepupdate(data, conf)
    return rebate_select_product_py(data, cookie=cookie)['content']['list']


def get_not_in_activities_product_list_py(conf={}, cookie=init_cookie):
    """
    获取未参加活动的商品(为创建rebate而构造的数据)
    :param cookie:
    :return: list
    """
    products_list = get_select_product_list_py(conf, cookie=cookie)
    not_in_activities_product_list = []
    for product in products_list:
        if product['other_activity'] == 0:
            product_id = product['product_id']
            sub_product_id = []
            for sub_product in product['variants']:
                sub_product_id = sub_product['variant_id']
            product_data = {"product_id": product_id, "variant_id": sub_product_id}
            not_in_activities_product_list.append(product_data)
    return not_in_activities_product_list


def add_rebate_with_conf_py(conf={}, cookie=init_cookie):
    """
    通过conf（dict数据类型）配置来添加产品
    :param conf:
    :param cookie:
    :return:
    """
    not_in_activities_product_list = get_not_in_activities_product_list_py()
    if not_in_activities_product_list == []:
        add_max_product_py(cookie=cookie)
        time.sleep(0.2)
        not_in_activities_product_list = get_not_in_activities_product_list_py()
    conf["product_list"] = json.dumps({"product": not_in_activities_product_list})

    data = copy.deepcopy(rebate_refresh_data)
    dict_deepupdate(data, conf)

    return rebate_refresh_py(data, cookie=cookie)


def add_doing_rebate_py(conf={}, cookie=init_cookie):
    """
    添加一个正在进行的rebate
    :param cookie:
    :return:
    """
    certain_date = get_certain_date_py()
    certain_date = certain_date['yesterday_date']
    timeArray = time.strptime(certain_date, "%Y-%m-%d %H:%M:%S")
    conf['starts_at'] = int(time.mktime(timeArray))

    return add_rebate_with_conf_py(conf, cookie=cookie)


def add_before_rebate_py(conf={}, cookie=init_cookie):
    """
    添加一个未开始的rebate(规范)
    :param cookie:
    :return:
    """
    certain_date = get_certain_date_py()
    certain_date = certain_date['tomorrow_date']
    timeArray = time.strptime(certain_date, "%Y-%m-%d %H:%M:%S")
    conf['starts_at'] = int(time.mktime(timeArray))

    return add_rebate_with_conf_py(conf, cookie=cookie)


def add_finish_rebate_py(conf={}, cookie=init_cookie):
    """
    添加一个已结束的rebate
    :param cookie:
    :return:
    """
    certain_date = get_certain_date_py()
    start_certain_date = certain_date['todayBeforeYesterday_date']
    start_timeArray = time.strptime(start_certain_date, "%Y-%m-%d %H:%M:%S")
    conf['starts_at'] = int(time.mktime(start_timeArray))

    end_certain_date = certain_date['yesterday_date']
    end_timeArray = time.strptime(end_certain_date, "%Y-%m-%d %H:%M:%S")
    conf['ends_at'] = int(time.mktime(end_timeArray))

    return add_rebate_with_conf_py(conf, cookie=cookie)


def end_all_rebates_py(cookie=init_cookie):
    """
    结束所有活动
    :param cookie:
    :return:
    """
    rebates_id = get_exist_doing_rebatesid_py(cookie=cookie)
    for rebate_id in rebates_id:
        rebate_end_py(rebate_id, cookie=cookie)



def get_all_rebates_count_py(conf={}, cookie=init_cookie):
    """
    获取rebates总数
    :param conf: {progress=0|1|2|3}
    :param cookie:
    :return:
    """
    rebate_list = rebate_list_py(conf, cookie=cookie)['content']
    if rebate_list['data'] == []:
        return 0
    else:
        return rebate_list['total']


def get_exist_rebatesid_py(progress, cookie=init_cookie):
    """
    返回存在的满减活动的id
    :param progress: 0|1|2|3
    :param cookie:
    :return:
    """
    # query_str = copy.deepcopy(query_list_data)
    count = get_all_rebates_count_py({'progress': progress}, cookie=cookie)
    if count == 0:
        return []
    products_list = rebate_list_py({'page': 1, 'size': count, 'progress': progress}, cookie=cookie)['content']['data']
    products_id = []
    for product in products_list:
        products_id.append(product['id'])
    return products_id


def get_exist_all_rebatesid_py(cookie=init_cookie):
    """
    返回存在的所有满减活动的id
    :param cookie:
    :return:
    """
    return get_exist_rebatesid_py(0, cookie=cookie)


def get_exist_doing_rebatesid_py(cookie=init_cookie):
    """
    返回存在的正在进行满减活动的id
    :param cookie:
    :return:
    """
    return get_exist_rebatesid_py("ongoing", cookie=cookie)


if __name__ == '__main__':
    add_doing_rebate_py()
    #print get_exist_doing_rebatesid_py()
    # print rebate_select_product_py()
    # print add_doing_rebate_py()
    # print add_before_rebate_py()
    print add_doing_rebate_py()




