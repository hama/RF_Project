# -*- coding:utf-8 -*-

from do_request import *
from kwproduct import add_max_product_py
from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def coupon_code_list_py(query_str={}, cookie=init_cookie):
    """
    查询优惠码列表
    :param cookie:
    :return:
    """
    url = home_page_url + "/api/coupon-code/list"
    return do_get(url, query_str, cookie=cookie)


def coupon_code_detail_py(query_str={}, cookie=init_cookie):
    """
    通过id查询优惠码
    :param cookie:
    :return:
    """
    url = home_page_url + "/api/coupon-code/detail"
    return do_get(url, query_str, cookie=cookie)


def coupon_code_random_code_py(cookie=init_cookie):
    """
    获取随机优惠码
    :param cookie:
    :return:
    """
    url = home_page_url + "/api/admin/discount-code/random-code"
    query_str = {}
    return do_get(url, query_str, cookie=cookie)


def coupon_code_refresh_py(data, cookie=init_cookie):
    """
    添加/修改优惠码
    :param cookie:
    :return:
    """
    url = home_page_url + "/api/admin/discount-code"
    return do_post(url, data, cookie=cookie)


def get_coupon_code_random_code_py(cookie=init_cookie):
    """
    获取随机优惠码
    :param cookie:
    :return:
    """
    return coupon_code_random_code_py(cookie=cookie)['content']['data']['code']


def coupon_select_product_py(query_str={}, cookie=init_cookie):
    """
    选择商品列表
    :param data:
    :param cookie:
    :return:
    """

    url = home_page_url + "/api/admin/discount-code/select-product"
    return do_get(url, query_str, cookie=cookie)


def get_list_product_id_py(conf={}, cookie=init_cookie):
    """
    获取所选商品
    :param conf:
    :param cookie:
    :return: list
    """
    data = copy.deepcopy(coupon_select_product_data)
    dict_deepupdate(data, conf)
    return coupon_select_product_py(data, cookie=cookie)['content']['list'][0]['product_id']


def add_coupon_code_with_conf_py(conf={}, cookie=init_cookie):
    """
    通过conf添加优惠码
    :param conf:
    :param cookie:
    :return:
    """
    data = copy.deepcopy(coupon_code_refresh_data)
    dict_deepupdate(data, conf)
    key_list = conf.keys()
    if 'code' not in key_list:
        data['code'] = get_coupon_code_random_code_py(cookie=cookie)
    product_id = get_list_product_id_py()
    if not product_id:
        add_max_product_py(cookie=cookie)
        time.sleep(0.2)
        product_id = get_list_product_id_py(cookie=cookie)
    data['entitled_product_ids'] = [product_id]

    return coupon_code_refresh_py(data, cookie=cookie)


def add_doing_coupon_code_py(conf={}, cookie=init_cookie):
    """
    添加一个正在进行的coupon code
    :param cookie:
    :return:
    """
    certain_date = get_certain_date_py()
    certain_date = certain_date['yesterday_date']
    timeArray = time.strptime(certain_date, "%Y-%m-%d %H:%M:%S")
    conf['starts_at'] = int(time.mktime(timeArray))
    return add_coupon_code_with_conf_py(conf, cookie=cookie)


def add_before_coupon_code_py(conf={}, cookie=init_cookie):
    """
    添加一个未开始的coupon code(规范)
    :param cookie:
    :return:
    """
    certain_date = get_certain_date_py()
    certain_date = certain_date['tomorrow_date']
    timeArray = time.strptime(certain_date, "%Y-%m-%d %H:%M:%S")
    conf['starts_at'] = int(time.mktime(timeArray))
    return add_coupon_code_with_conf_py(conf, cookie=cookie)


def add_finish_coupon_code_py(conf={}, cookie=init_cookie):
    """
    添加一个已结束的coupon code
    :param cookie:
    :return:
    """
    certain_date = get_certain_date_py()
    certain_date_start = certain_date['todayBeforeYesterday_date']
    timeArray_start = time.strptime(certain_date_start, "%Y-%m-%d %H:%M:%S")
    conf['starts_at'] = int(time.mktime(timeArray_start))

    certain_date_end = certain_date['yesterday_date']
    timeArray_end = time.strptime(certain_date_end, "%Y-%m-%d %H:%M:%S")
    conf['ends_at'] = int(time.mktime(timeArray_end))
    return add_coupon_code_with_conf_py(conf, cookie=cookie)


if __name__ == '__main__':
    # print coupon_code_random_code_py()
    # print add_before_coupon_code_py()
    print add_before_coupon_code_py()
