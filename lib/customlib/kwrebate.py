# -*- coding:utf-8 -*-

from do_request import *
from kwproduct import add_max_product_py
from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def rebate_list_py(query_str={}, cookie=init_cookie):
    '''
    满减活动列表
    :param data:
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/rebate/list"
    return do_get(url, query_str, cookie=cookie)


def rebate_detail_py(rebate_id, cookie=init_cookie):
    '''
    获取满减活动详情
    :param data:
    :param cookie:
    :return:
    '''
    url = '%s/api/rebate/detail/%s' % (home_page_url, rebate_id)
    return do_get(url, {}, cookie=cookie)


def rebate_select_product_py(query_str={}, cookie=init_cookie):
    '''
    选择商品列表
    :param data:
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/rebate/select-product"
    return do_get(url, query_str, cookie=cookie)


def rebate_refresh_py(data, cookie=init_cookie):
    '''
    更新满减活动信息
    :param query_str:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/rebate/refresh'
    return do_post(url, data, cookie=cookie)


def rebate_end_py(data, cookie=init_cookie):
    '''
    提前结束满减活动
    :param query_str:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/rebate/end'
    return do_post(url, data, cookie=cookie)


def rebate_delete_py(data, cookie=init_cookie):
    '''
    删除满减活动
    :param query_str:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/rebate/delete'
    return do_post(url, data, cookie=cookie)


def rebate_selected_info_py(data, cookie=init_cookie):
    '''
    获取已选商品信息
    :param query_str:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/rebate/selected-info'
    return do_post(url, data, cookie=cookie)


def rebate_preconfig_py(data, cookie=init_cookie):
    '''
    更新满减活动前配置
    :param query_str:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/rebate/preconfig'
    return do_post(url, data, cookie=cookie)


def get_select_product_list_py(conf={}, cookie=init_cookie):
    '''
    获取所选商品
    :param conf:
    :param cookie:
    :return: list
    '''
    data = copy.deepcopy(rebate_select_product_data)
    dict_deepupdate(data, conf)
    return rebate_select_product_py(data, cookie=cookie)['content']['data']['products']


def get_not_in_activities_product_list_py(conf={}, cookie=init_cookie):
    '''
    获取未参加活动的商品(为创建rebate而构造的数据)
    :param cookie:
    :return: list
    '''
    products_list = get_select_product_list_py(conf, cookie=cookie)
    not_in_activities_product_list = []
    for product in products_list:
        if product['other_activity'] == 0:
            product_id = product['product_id']
            sub_product_id = []
            for sub_product in product['sub_product']:
                sub_product_id.append(sub_product['sub_product_id'])
            product_data = {"product_id": product_id, "sub_product_id": sub_product_id}
            not_in_activities_product_list.append(product_data)
    return not_in_activities_product_list


def add_rebate_with_conf_py(conf={}, cookie=init_cookie):
    '''
    通过conf（dict数据类型）配置来添加产品
    :param conf:
    :param cookie:
    :return:
    '''
    not_in_activities_product_list = get_not_in_activities_product_list_py()
    if not_in_activities_product_list == []:
        add_max_product_py(cookie=cookie)
        time.sleep(0.2)
        not_in_activities_product_list = get_not_in_activities_product_list_py()
    conf["product_list"] = json.dumps({"product": not_in_activities_product_list})

    data = copy.deepcopy(rebate_refresh_data)
    dict_deepupdate(data, conf)

    return rebate_refresh_py(data, cookie=cookie)['content']['data']['id']


def add_doing_rebate_py(conf={}, cookie=init_cookie):
    '''
    添加一个正在进行的rebate
    :param cookie:
    :return:
    '''
    certain_date = get_certain_date_py()
    conf['date_start'] = certain_date['yesterday_date']
    return add_rebate_with_conf_py(conf, cookie=cookie)


def add_before_rebate_py(conf={}, cookie=init_cookie):
    '''
    添加一个未开始的rebate(规范)
    :param cookie:
    :return:
    '''
    certain_date = get_certain_date_py()
    conf['date_start'] = certain_date['tomorrow_date']
    return add_rebate_with_conf_py(conf, cookie=cookie)


def add_finish_rebate_py(conf={}, cookie=init_cookie):
    '''
    添加一个已结束的rebate
    :param cookie:
    :return:
    '''
    certain_date = get_certain_date_py()
    conf['date_start'] = certain_date['todayBeforeYesterday_date']
    conf['date_end'] = certain_date['yesterday_date']
    return add_rebate_with_conf_py(conf, cookie=cookie)


if __name__ == '__main__':
    # add_max_product_py()
    print add_before_rebate_py()
    # print rebate_select_product_py()
