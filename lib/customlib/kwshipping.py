# -*- coding:utf-8 -*-

from do_request import *
from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def shippings_get_py(query_str={}, cookie=init_cookie):
    '''
    获取物流列表
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings' % (home_page_url)
    return do_get(url, query_str, cookie=cookie)


def shippings_id_get_py(shipping_id, cookie=init_cookie):
    '''
    获取物流详情
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings/%s' % (home_page_url, shipping_id)
    return do_get(url, {}, cookie=cookie)


def shippings_country_py(query_str={}, cookie=init_cookie):
    '''
    获取物流国家列表
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings/%s/country' % (home_page_url, query_str)
    return do_get(url, query_str, cookie=cookie)


def shippings_id_country_py(shipping_id, cookie=init_cookie):
    '''
    根据物流id获取物流国家列表
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings/%s/country' % (home_page_url, shipping_id)
    return do_get(url, {}, cookie=cookie)


def shippings_id_country_code_province_py(shipping_id, code, cookie=init_cookie):
    '''
    根据国家code获取物流省份列表
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings/%s/country/%s/province' % (home_page_url, shipping_id, code)
    return do_get(url, {}, cookie=cookie)


def shippings_country_code_province_py(code, cookie=init_cookie):
    '''
    根据国家code获取物流省份列表
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings/country/%s/province' % (home_page_url, code)
    return do_get(url, {}, cookie=cookie)


def shippings_country_selectable_py(query_str={}, cookie=init_cookie):
    '''
    根据国家codes获取可选物流省份状态
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings/country/selectable' % (home_page_url)
    return do_get(url, query_str, cookie=cookie)


def shippings_id_country_selectable_py(shipping_id, query_str={}, cookie=init_cookie):
    '''
    根据国家codes及物流id获取可选物流省份状态
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings/%s/country/selectable' % (home_page_url, shipping_id)
    return do_get(url, query_str, cookie=cookie)


def shippings_delete_py(shipping_id, cookie=init_cookie):
    '''
    删除物流方案
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings/%s' % (home_page_url, shipping_id)
    return do_delete(url, {}, cookie=cookie)


def shippings_post_py(data, cookie=init_cookie):
    '''
    添加物流方案
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings' % (home_page_url)
    return do_post(url, data, cookie=cookie)


def shippings_put_py(data, shipping_id, cookie=init_cookie):
    '''
    修改物流方案
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/shippings/%s' % (home_page_url, shipping_id)
    return do_put(url, data, cookie=cookie)


def add_shipping_with_conf_py(conf={}, cookie=init_cookie):
    '''
    通过conf添加物流
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_data)
    dict_deepupdate(data, conf)

    return shippings_post_py(data, cookie=cookie)['content']['id']

def add_ID_price_fee_shipping_py(conf={}, cookie=init_cookie):
    '''
    通过conf添加物流
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(ID_shipping_data)
    dict_deepupdate(data, conf)

    return shippings_post_py(data, cookie=cookie)['content']['id']

def add_price_fee_shipping_py(conf={}, cookie=init_cookie):
    '''
    添加只有price_fee的物流
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_data)
    data['plans'] = [
        {
            "name": "price_fee",
            "desc": "price_fee_description",
            "rule_type": "price",
            "rule_range_min": 0,
            "rule_range_max": 0,
            "rule_range_infinite": True,
            "rule_range_unit": "USD",
            "support_cod": True,
            "rate_type": "normal",
            "rate_amount": '10'
        }
    ]
    dict_deepupdate(data, conf)
    return shippings_post_py(data, cookie=cookie)

def add_weight_fee_shipping_py(conf={}, cookie=init_cookie):
    '''
    添加只有weight_fee的物流
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_data)
    data['plans'] = [
        {
            "name": "weight_fee",
            "desc": "weight_fee_description",
            "rule_type": "weight",
            "rule_range_min": 0,
            "rule_range_max": 0,
            "rule_range_infinite": True,
            "support_cod": True,
            "rate_type": "normal",
            "rate_amount": '10',
            "rule_range_unit": "g"
        }
    ]
    dict_deepupdate(data, conf)
    return shippings_post_py(data, cookie=cookie)


def add_quantity_fee_shipping_py(conf={}, cookie=init_cookie):
    '''
    添加只有quantity_fee的物流
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_data)
    data['plans'] = [
        {
            "name": "quantity_fee",
            "desc": "quantity_fee_description",
            "rule_type": "quantity",
            "rule_range_min": 0,
            "rule_range_max": 0,
            "rule_range_infinite": True,
            "rule_range_unit": "件",
            "support_cod": True,
            "rate_type": "normal",
            "rate_amount": '10'
        }
    ]
    dict_deepupdate(data, conf)
    return shippings_post_py(data, cookie=cookie)


def del_all_shipping_py(cookie=init_cookie):
    """
    删除全部物流方案
    :return: True | False
    """
    shippings_list = shippings_get_py(cookie=cookie)['content']
    for shipping in shippings_list:
        shippings_delete_py(shipping['id'], cookie=cookie)


def create_only_one_shipping_py(conf={}, cookie=init_cookie):
    """
    创建唯一的物流方案
    (若当前有且仅存一个物流时，返回它的shippingId；
    若大于一个物流，则删除所有，并添加一个默认物流；
    若没有物流，则添加一个默认物流)
    :return: True | False
    """
    num = num_of_exist_shipping_py(cookie=cookie)
    if num == 1:
        return shippings_get_py(cookie=cookie)['content'][0]['id']
    elif num > 1:
        del_all_shipping_py(cookie=cookie)
    return add_shipping_with_conf_py(conf, cookie=cookie)


def num_of_exist_shipping_py(cookie=init_cookie):
    '''
    存在物流方案的个数
    :return: 存在物流的个数
    '''
    data = shippings_get_py(cookie=cookie)
    return len(data['content'])




#物流商接口

def shipping_merchant_get_py(query_str={}, cookie=init_cookie):
    '''
    获取物流商列表
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/carrier-service' % (home_page_url)
    return do_get(url, query_str, cookie=cookie)

#创建物流商
def shipping_merchant_post_py(data, cookie=init_cookie):
    '''
    添加物流商
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/carrier-service' % (home_page_url)
    return do_post(url, data, cookie=cookie)

def add_shipping_merchant_with_conf_py(conf={}, cookie=init_cookie):
    '''
    通过conf添加物流商
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_merchant_data)
    dict_deepupdate(data, conf)

    return shipping_merchant_post_py(data, cookie=cookie)['content']

#删除物流商
def shipping_merchant_delete_py(shipping_id, cookie=init_cookie):
    '''
    删除物流商
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/carrier-service/%s' % (home_page_url, shipping_id)
    return do_delete(url, cookie=cookie)

def del_all_shipping_merchant_py(cookie=init_cookie):
    """
    删除全部物流商
    :return: True | False
    """
    shippings_merchant_list = shipping_merchant_get_py(cookie=cookie)['content']['list']
    for shippings_merchant in shippings_merchant_list:
        shipping_merchant_delete_py(shippings_merchant['id'], cookie=cookie)


if __name__ == '__main__':
    del_all_shipping_merchant_py()
    # print del_all_shipping_py()
    # print add_price_fee_shipping_py({'plans': [{'rule_range_min': '5000.00'}]})
    # print add_quantity_fee_shipping_py()
