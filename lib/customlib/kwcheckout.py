# -*- coding:utf-8 -*-

from kwcustomer import *
from kwproduct import *

reload(sys)
sys.setdefaultencoding('utf-8')


def checkout_save_py(data, cookie=init_cookie):
    url = home_page_url + "/api/checkout/save"
    return do_post(url, data, cookie=cookie)


def checkout_create_py(data, cookie=init_cookie):
    '''
    创建checkout
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/checkout/create"
    return do_post(url, data, cookie=cookie)


def checkout_price_calculate_py(data, cookie=init_cookie):
    '''
    计算最终价格的接口
    :param data:
    :param cookie:
    :return:
    '''
    url = myshoplaza_url + "/checkout/price/calculate"
    return do_post(url, data, cookie=cookie)


def checkout_shipping_lines_py(query_str={}, cookie=init_cookie):
    '''
    获取checkout的入参shipping_lines
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/checkout/shipping/lines"
    return do_get(url, query_str, cookie=cookie)


def checkout_place_order_py(data, cookie=init_cookie):
    '''
    订单地址的接口
    :param data:
    :param cookie:
    :return:
    '''
    url = myshoplaza_url + "/checkout/place-order"
    return do_post(url, data, cookie=cookie)


def get_tokens_py(data, cookie=init_cookie):
    return checkout_create_py(data, cookie)['content']['data']


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
    data = copy.deepcopy(checkout_create_data)
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
    # key_list = conf.keys()
    # if 'order_token' in key_list:
    #     data['order_token'] = conf['order_token']
    # if 'shipping_line' in key_list:
    #     data['shipping_line'] = conf['shipping_line']
    # if 'shipping_address' in key_list:
    #     data['shipping_address'] = conf['shipping_address']
    # if 'discount_code' in key_list:
    #     data['discount_code'] = conf['discount_code']
    # if 'customer_info' in key_list:
    #     data['customer_info'] = conf['customer_info']
    # if 'prices' in key_list:
    #     data['prices'] = conf['prices']

    return checkout_place_order_py(data, cookie)


def do_price_calculate_with_conf_py(conf={}, cookie=init_cookie):
    '''
    计算最终价格
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(price_calculate_data)
    dict_deepupdate(data, conf)
    # key_list = conf.keys()
    # if 'order_token' in key_list:
    #     data['order_token'] = conf['order_token']
    # if 'shipping_line' in key_list:
    #     data['shipping_line'] = conf['shipping_line']
    # if 'shipping_address' in key_list:
    #     data['shipping_address'] = conf['shipping_address']
    # if 'discount_code' in key_list:
    #     data['discount_code'] = conf['discount_code']
    # if 'customer_info' in key_list:
    #     data['customer_info'] = conf['customer_info']

    return checkout_price_calculate_py(data, cookie)


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


def set_checkout_process_py(conf={}, cookie=init_cookie):
    '''
    设置checkout流程
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(checkout_save_data)
    dict_deepupdate(data, conf)

    checkout_save_py(data, cookie=cookie)
    return admin_customers_address_settings_py(data, cookie=cookie)


if __name__ == '__main__':
    # print json.dumps(checkout_shipping_lines_py(shipping_lines_data))
    print set_checkout_process_py()
