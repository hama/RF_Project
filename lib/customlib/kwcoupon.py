# -*- coding:utf-8 -*-

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


