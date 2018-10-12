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


def payment_channel_py(data, cookie=init_cookie):
    '''
    绑定credit card账号
    :param data:
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/payment/channel"

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
    payment_data = get_exist_expected_payment_data_py(expected, cookie=cookie)
    if isinstance(payment_data, dict):
        if payment_data['is_enable'] == '1':
            re_data = payment_data['channel_list'][0]
            re_data['payment_method'] = payment_data['payment_method']
            return re_data
        elif payment_data['is_enable'] == '0':
            return 'please turn on expected payment_method'
    return payment_data


def get_exist_expected_payment_data_py(expected, cookie=init_cookie):
    '''
    获取指定的已存在支付方式数据
    :param expected:
    :param cookie:
    :return:
    '''
    for payment_data in payment_list_py(cookie=cookie)['content']['data']:
        payment_method = payment_data['payment_method']
        if expected == payment_method:
            return payment_data
    return 'there is not expected payment_method,please add it'


def activate_payment_cod_py(cookie=init_cookie):
    """
    激活支付方式 cod
    :return: True | False
    """
    data = copy.deepcopy(payment_method_activation_data)
    data['method_is_enable'] = 1
    data['payment_method'] = "cod"
    return payment_method_py(data, cookie=cookie)


def inactivate_payment_cod_py(cookie=init_cookie):
    """
    去激活支付方式 cod
    :return: True | False
    """
    data = copy.deepcopy(payment_method_activation_data)
    data['method_is_enable'] = 0
    data['payment_method'] = "cod"
    return payment_method_py(data, cookie=cookie)


def is_binding_account(cookie=init_cookie):
    '''
    判断credit_card是否绑定了账号（目前只有credit_card）
    :param cookie:
    :return:
    '''
    payment_data = get_exist_expected_payment_data_py('credit_card', cookie=cookie)
    if isinstance(payment_data, dict):
        return payment_data['channel_list'][0]['account_list'][0]['client_id']
    else:
        return payment_data


def activate_payment_credit_card_py(cookie=init_cookie):
    """
    激活支付方式 credit_card
    :return: True | False
    """
    # 确保已绑定credit card账号
    is_binding = is_binding_account(cookie=cookie)
    if is_binding == None:
        # 绑定credit card账号
        data00 = copy.deepcopy(payment_channel_data)
        payment_channel_py(data00, cookie=cookie)

    data = copy.deepcopy(payment_method_activation_data)
    data['method_is_enable'] = 1
    data['payment_method'] = "credit_card"
    return payment_method_py(data, cookie=cookie)


def inactivate_payment_credit_card_py(cookie=init_cookie):
    """
    去激活支付方式 credit_card
    :return: True | False
    """
    data = copy.deepcopy(payment_method_activation_data)
    data['method_is_enable'] = 0
    data['payment_method'] = "credit_card"
    return payment_method_py(data, cookie=cookie)


def do_pay_with_conf_py(conf={}, cookie=init_cookie):
    '''
    支付订单
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(payment_pay_data)
    dict_deepupdate(data, conf)

    return payment_pay_py(data, cookie=cookie)


if __name__ == '__main__':
    # print activate_payment_cod_py()
    # print inactivate_payment_credit_card_py()
    print inactivate_payment_credit_card_py()
