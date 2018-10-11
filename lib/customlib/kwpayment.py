# -*- coding:utf-8 -*-

from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def payment_method_py(data, cookie=init_cookie):
    """
    收款渠道激活
    """
    url = home_page_url + "/api/payment/method"

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


def payment_channel_py(method_is_enable=1, payment_method="cod", cookie=init_cookie):
    url = home_page_url + "/api/payment/channel"
    data = {"method_is_enable": method_is_enable, "payment_method": payment_method}

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


def payment_pay_py(data, cookie=init_cookie):
    '''
    付款-下订单
    :param data:
    :param cookie:
    :return:
    '''
    url = myshoplaza_url + '/checkout/payment/pay'
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


def payment_list_py(cookie=init_cookie):
    '''
    收款渠道列表
    :param data:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/payment/list'
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


def get_expected_payment_line_py(expected, cookie=init_cookie):
    '''
    获取指定的payment_line数据
    :param expected: credit_card/cod
    :param cookie:
    :return:
    '''
    for payment_line in payment_list_py(cookie)['content']['data']:
        payment_method = payment_line['payment_method']
        if expected == payment_method and payment_line['is_enable'] == '1':
            re_data = payment_line['channel_list'][0]
            re_data['payment_method'] = payment_method
            return re_data
        elif expected == payment_method and payment_line['is_enable'] == '0':
            return 'please turn on expected payment_method'
    return 'there is not expected payment_method,please add it'


def add_payment_cod_py():
    """
    添加支付方式 cod
    :return: True | False
    """
    data = copy.deepcopy(payment_method_activation_data)
    data['method_is_enable'] = 1
    data['payment_method'] = "cod"
    return payment_method_py(data)


def del_payment_cod_py():
    """
    删除支付方式 cod
    :return: True | False
    """
    data = copy.deepcopy(payment_method_activation_data)
    data['method_is_enable'] = 0
    data['payment_method'] = "cod"
    return payment_method_py(data)


def add_payment_pk_py():
    """
    添加支付方式 paylinks
    :return: True | False
    """
    data = copy.deepcopy(payment_method_activation_data)
    data['method_is_enable'] = 1
    data['payment_method'] = "credit_card"
    return payment_method_py(data)


def del_payment_pk_py():
    """
    删除支付方式 paylinks
    :return: True | False
    """
    data = copy.deepcopy(payment_method_activation_data)
    data['method_is_enable'] = 0
    data['payment_method'] = "credit_card"
    return payment_method_py(data)


def do_pay_with_conf_py(conf={}, cookie=init_cookie):
    '''
    支付订单
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(payment_pay_data)
    dict_deepupdate(data, conf)

    return payment_pay_py(data, cookie)


if __name__ == '__main__':
    print payment_list_py()
