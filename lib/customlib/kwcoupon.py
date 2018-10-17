# -*- coding:utf-8 -*-

from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def coupon_code_list_py(query_str={}, cookie=init_cookie):
    '''
    查询优惠码列表
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/coupon-code/list"
    try:
        response_data = requests.get(url=url, headers={"cookie": cookie['cookie']}, params=query_str)
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def coupon_code_detail_py(query_str={}, cookie=init_cookie):
    '''
    通过id查询优惠码
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/coupon-code/detail"
    try:
        response_data = requests.get(url=url, headers={"cookie": cookie['cookie']}, params=query_str)
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def coupon_code_random_code_py(cookie=init_cookie):
    '''
    获取随机优惠码
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/coupon-code/random-code"
    try:
        response_data = requests.get(url=url, headers={"cookie": cookie['cookie']})
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def coupon_code_refresh_py(data, cookie=init_cookie):
    '''
    添加/修改优惠码
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/coupon-code/refresh"
    try:
        response_data = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def get_coupon_code_random_code_py(cookie=init_cookie):
    '''
    获取随机优惠码
    :param cookie:
    :return:
    '''
    return coupon_code_random_code_py(cookie=cookie)['content']['data']['code']


def add_coupon_code_with_conf_py(conf={}, cookie=init_cookie):
    '''
    通过conf添加优惠码
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(coupon_code_refresh_data)
    dict_deepupdate(data, conf)
    key_list = conf.keys()
    if 'code' not in key_list:
        data['code'] = get_coupon_code_random_code_py(cookie=cookie)
    if 'shipping_area' in key_list:
        data['shipping_area'] = conf['shipping_area']
    if 'shipping_plan' in key_list:
        data['shipping_plan'] = conf['shipping_plan']
    if 'has_other_country' in key_list:
        data['has_other_country'] = conf['has_other_country']

    return coupon_code_refresh_py(data, cookie=cookie)['content']['data']['id']


def add_default_coupon_code_py(cookie=init_cookie):
    '''
    添加一个默认的coupon code
    :param cookie:
    :return:
    '''

    return add_coupon_code_with_conf_py(cookie=cookie)
