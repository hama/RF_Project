# -*- coding:utf-8 -*-

from do_request import *
from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


# 目前只支持ipaylinks和cod
def payment_methods_post_py(data, cookie=init_cookie):
    """
    创建支付方式
    """
    url = home_page_url + "/api/payment/methods"
    return do_post(url, data, cookie=cookie)


def payment_methods_put_py(data, payment_methods_id, cookie=init_cookie):
    '''
    更新支付方式
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/payment/methods/%s' % (home_page_url, payment_methods_id)
    return do_put(url, data, cookie=cookie)


def payment_methods_patch_py(data, payment_methods_id, cookie=init_cookie):
    '''
    更新支付方式状态
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/payment/methods/%s' % (home_page_url, payment_methods_id)
    return do_patch(url, data, cookie=cookie)


def payment_channels_post_py(data, cookie=init_cookie):
    '''
    创建支付渠道
    :param data:
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/payment/channels"
    return do_post(url, data, cookie=cookie)


def payment_channels_get_py(query_str={}, cookie=init_cookie):
    '''
    获取支付渠道
    :param data:
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/payment/channels"
    return do_get(url, query_str, cookie=cookie)


def payment_channels_put_py(data, payment_channels_id, cookie=init_cookie):
    '''
    更新支付渠道
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/payment/channels/%s' % (home_page_url, payment_channels_id)
    return do_put(url, data, cookie=cookie)


def payment_get_py(query_str={}, cookie=init_cookie):
    '''
    获取支付列表
    :param data:
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/payment"
    return do_get(url, query_str, cookie=cookie)


def payment_auth_get_py(query_str={}, cookie=init_cookie):
    '''
    获取支付渠道授权
    :param data:
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/payment/auth"
    return do_get(url, query_str, cookie=cookie)


def payment_pay_py(data, cookie=init_cookie):
    '''
    付款-下订单
    :param data:
    :param cookie:
    :return:
    '''
    url = myshoplaza_url + '/checkout/payment/pay'
    return do_post(url, data, cookie=cookie)


def get_expected_payment_line_py(expected, cookie=init_cookie):
    '''
    获取指定的payment_line数据
    :param expected: credit_card/cod
    :param cookie:
    :return:
    '''
    payment_data = get_exist_expected_payment_data_py(expected['payment_method'], cookie=cookie)

    if isinstance(payment_data, dict):
        if payment_data['status'] == 'open':
            for payment_line in payment_data['channel_list']:
                if payment_line['payment_channel'] == expected['payment_channel']:
                    return payment_line
        elif payment_data['status'] == 'close':
            return 'please turn on expected payment_method'
    return payment_data


def get_exist_expected_payment_data_py(expected, cookie=init_cookie):
    '''
    获取指定的已存在支付方式数据
    :param expected:
    :param cookie:
    :return:
    '''
    for payment_data in payment_get_py(cookie=cookie)['content']:
        if expected == payment_data['payment_method']:
            return payment_data
    return 'there is not expected payment_method,please add it'


def activate_payment_cod_py(cookie=init_cookie):
    """
    激活支付方式 cod
    :return: True | False
    """
    data = copy.deepcopy(payment_method_activation_data)
    data['status'] = "open"
    data['payment_method'] = "cod"
    return payment_methods_post_py(data, cookie=cookie)


def inactivate_payment_cod_py(cookie=init_cookie):
    """
    去激活支付方式 cod
    :return: True | False
    """
    data = copy.deepcopy(payment_method_activation_data)
    data['status'] = "close"
    data['payment_method'] = "cod"
    return payment_methods_post_py(data, cookie=cookie)


def is_binding_account(cookie=init_cookie):
    '''
    判断credit_card是否绑定了账号（目前只有credit_card）
    :param cookie:
    :return:
    '''
    payment_data = get_exist_expected_payment_data_py('credit_card', cookie=cookie)
    if isinstance(payment_data, dict) and payment_data['channel_list']:
        for channel in payment_data['channel_list']:
            if channel['payment_channel'] == 'ipaylinks':
                return channel['account']['client_id']
    else:
        return None


def get_certain_payment_channel_id(expected, cookie=init_cookie):
    '''
    获取指定payment_channel的id
    :param expected:
    :param cookie:
    :return:
    '''
    channels_list = payment_channels_get_py(cookie=cookie)['content']
    for channel in channels_list:
        if channel['payment_channel'] == expected:
            return channel['id']
    return 'Can not get payment channel id'


def activate_payment_credit_card_py(cookie=init_cookie):
    """
    激活支付方式 credit_card
    :return: True | False
    """
    # 确保已绑定credit card账号
    is_binding = is_binding_account(cookie=cookie)
    payment_channel_id = get_certain_payment_channel_id('ipaylinks', cookie=cookie)
    if is_binding == None:
        # 选择指定支付方式
        data00 = copy.deepcopy(payment_channel_change_channel_data)
        payment_channels_put_py(data00, payment_channel_id, cookie=cookie)
        # 绑定credit card账号
        data01 = copy.deepcopy(payment_channel_data)
        payment_channels_put_py(data01, payment_channel_id, cookie=cookie)

    data = copy.deepcopy(payment_method_activation_data)
    data['status'] = "open"
    data['payment_method'] = "credit_card"
    return payment_methods_post_py(data, cookie=cookie)


def inactivate_payment_credit_card_py(cookie=init_cookie):
    """
    去激活支付方式 credit_card
    :return: True | False
    """
    data = copy.deepcopy(payment_method_activation_data)
    data['status'] = "close"
    data['payment_method'] = "credit_card"
    return payment_methods_post_py(data, cookie=cookie)


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
    print activate_payment_cod_py()
