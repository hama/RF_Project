# -*- coding:utf-8 -*-

from kwproduct import *

reload(sys)
sys.setdefaultencoding('utf-8')


# ---------------------------B端接口------------------------------
def checkout_settings_post_py(data, cookie=init_cookie):
    url = home_page_url + "/api/checkout/settings"
    return do_post(url, data, cookie=cookie)


def checkout_settings_get_py(query_str={}, cookie=init_cookie):
    url = home_page_url + "/api/checkout/settings"
    return do_get(url, query_str, cookie=cookie)


# ---------------------------C端接口------------------------------
def checkout_order_post_py(data, cookie=init_cookie):
    '''
    创建订单
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/api/checkout/order"
    return do_post(url, data, cookie=cookie)


def checkout_price_py(data, cookie=init_cookie):
    '''
    计算最终价格的接口
    :param data:
    :param cookie:
    :return:
    '''
    url = myshoplaza_url + "/api/checkout/price"
    return do_post(url, data, cookie=cookie)


def checkout_shipping_lines_py(query_str={}, cookie=init_cookie):
    '''
    获取checkout的入参shipping_lines
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/api/checkout/shipping-lines"
    return do_get(url, query_str, cookie=cookie)


def checkout_policy_py(query_str={}, cookie=init_cookie):
    '''
    获取某一项 policy 详情
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/api/global-config/policy"
    return do_get(url, query_str, cookie=cookie)


def checkout_shipping_available_country_py(query_str={}, cookie=init_cookie):
    '''
    获取物流可用国家
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/api/checkout/shippings/available-country"
    return do_get(url, query_str, cookie=cookie)


def checkout_shipping_available_province_py(country_code_2, cookie=init_cookie):
    '''
    获取物流可用省份
    api/checkout/shippings/available-province?code={country_code_2}
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/api/checkout/shippings/available-province?code={}" % country_code_2
    return do_get(url, {}, cookie=cookie)


def checkout_payments_py(query_str={}, cookie=init_cookie):
    '''
    获取支付方式列表
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/api/checkout/payments"
    return do_get(url, query_str, cookie=cookie)


def checkout_order_get_py(order_id, cookie=init_cookie):
    '''
    获取订单详情
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/api/checkout/order/%s" % order_id
    return do_get(url, {}, cookie=cookie)


def checkout_payments_pay_py(data, cookie=init_cookie):
    """
    支付订单
    :param data:
    :param cookie:
    :return:
    """
    url = myshoplaza_url + '/api/checkout/payments/pay'
    return do_post(url, data, cookie=cookie)


def checkout_order_complete_py(data, cookie=init_cookie):
    """
    complete-order 接口
    :param data:
    :param cookie:
    :return:
    """
    url = myshoplaza_url + '/api/checkout/order/complete'
    return do_post(url, data, cookie=cookie)


def checkout_order_repay_py(data, cookie=init_cookie):
    """
    重新支付订单
    :param data:
    :param cookie:
    :return:
    """
    url = myshoplaza_url + '/api/checkout/order/repay'
    return do_post(url, data, cookie=cookie)


def checkout_place_order_py(data, cookie=init_cookie):
    '''
    订单地址的接口
    :param data:
    :param cookie:
    :return:
    '''
    url = myshoplaza_url + "/api/checkout/order/place"
    return do_post(url, data, cookie=cookie)


def do_pay_with_conf_py(conf={}, cookie=init_cookie):
    """
    支付订单
    :param conf:
    :param cookie:
    :return:
    """
    data = copy.deepcopy(payment_pay_data)
    dict_deepupdate(data, conf)

    return checkout_payments_pay_py(data, cookie=cookie)


def get_tokens_py(data, cookie=init_cookie):
    return checkout_order_post_py(data, cookie)['content']['data']


def get_tokens_by_productid_py(product_id, cookie=init_cookie):
    '''
    通过productid获取order_token
    1、获取variants_id，2、返回产品的order_token
    :param cookie:
    :return:
    '''
    return get_tokens_by_productidlist_py([product_id], cookie)


def get_tokens_by_productidlist_py(product_id_list, cookie=init_cookie):
    '''
    通过productidlist获取order_token
    1、获取variants_id，2、返回产品的order_token
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(checkout_order_data)
    data['line_items'] = []
    line_item = {'quantity': 1, 'variant_id': 628, 'note': ''}
    for product_id in product_id_list:
        line_item_data = copy.deepcopy(line_item)
        variant_id = products_id_get_py(product_id, cookie)['content']['product']['variants'][0]['id']

        line_item_data['variant_id'] = variant_id
        data['line_items'].append(line_item_data)
    return get_tokens_py(data, cookie)


def add_place_order_with_conf_py(conf={}, cookie=init_cookie):
    '''
    给订单添加收货地址信息
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(place_order_data)
    dict_deepupdate(data, conf)

    return checkout_place_order_py(data, cookie)


def add_complete_order_with_conf_py(conf={}, cookie=init_cookie):
    '''
    递交订单数据
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(complete_order_data)
    dict_deepupdate(data, conf)

    return checkout_order_complete_py(data, cookie)


def do_price_calculate_with_conf_py(conf={}, cookie=init_cookie):
    '''
    计算最终价格
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(price_data)
    dict_deepupdate(data, conf)

    return checkout_price_py(data, cookie)


def get_shipping_lines_with_conf_py(conf={}, cookie=init_cookie):
    '''
    获取shipping_lines
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_lines_data)
    dict_deepupdate(data, conf)

    return checkout_shipping_lines_py(data, cookie=cookie)


def set_checkout_process_with_conf_py(conf={}, cookie=init_cookie):
    '''
    设置checkout流程
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(checkout_settings_data)
    dict_deepupdate(data, conf)

    return checkout_settings_post_py(data, cookie=cookie)


def set_single_page_checkout_process_py(cookie=init_cookie):
    return set_checkout_process_with_conf_py({'checkout_page_type': 'single'}, cookie=cookie)


if __name__ == '__main__':
    # print json.dumps(checkout_shipping_lines_py(shipping_lines_data))
    print do_price_calculate_with_conf_py()
