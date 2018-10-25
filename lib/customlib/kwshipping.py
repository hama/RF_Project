# -*- coding:utf-8 -*-

from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def shipping_refresh_py(data, cookie=init_cookie):
    url = home_page_url + "/api/shipping/refresh"
    return do_post(url, data, cookie=cookie)


def shipping_list_py(cookie=init_cookie):
    '''
    查询物流列表信息
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/shipping/list'
    query_str = {}
    return do_get(url, query_str, cookie=cookie)


def add_shipping_with_conf_py(conf={}, cookie=init_cookie):
    '''
    通过conf添加物流
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_data)
    dict_deepupdate(data, conf)
    # key_list = conf.keys()
    # if 'shipping_name' in key_list:
    #     data['shipping_name'] = conf['shipping_name']
    # if 'shipping_area' in key_list:
    #     data['shipping_area'] = conf['shipping_area']
    # if 'shipping_plan' in key_list:
    #     data['shipping_plan'] = conf['shipping_plan']
    # if 'has_other_country' in key_list:
    #     data['has_other_country'] = conf['has_other_country']
    if data['has_other_country'] == 1:
        data['shipping_area'] = []

    return shipping_refresh_add_py(data, cookie=cookie)['content']['data']['shipping_id']


def shipping_refresh_add_py(data, cookie=init_cookie):
    '''
    添加物流
    :param data:
    :param cookie:
    :return:
    '''
    return shipping_refresh_py(data, cookie=cookie)


def shipping_refresh_del_py(shipping_id, cookie=init_cookie):
    '''
    删除物流
    :param shipping_id:
    :param cookie:
    :return:
    '''
    data = {"shipping_id": shipping_id, "is_enable": 0}
    return shipping_refresh_py(data, cookie=cookie)


def add_max_shipping_py(cookie=init_cookie):
    '''
    添加max物流，即所有可填项都填
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_data)
    return shipping_refresh_add_py(data, cookie=cookie)


def add_price_fee_shipping_py(rate_amount='10.00', cookie=init_cookie):
    '''
    添加只有price_fee的物流
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_data)
    data['shipping_plan'] = '[{"name":"price_fee","shipping_method":"price","range_min":"0.00","range_max":-1,' \
                            '"rate_amount":%s,"payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]' % (
                                rate_amount)
    return add_shipping_with_conf_py(data, cookie=cookie)


def add_weight_fee_shipping_py(rate_amount='10.00', cookie=init_cookie):
    '''
    添加只有weight_fee的物流
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_data)
    data['shipping_plan'] = '[{"name":"weight_fee","shipping_method":"weight","range_min":"0.00","range_max":-1,' \
                            '"rate_amount":%s,"payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]' % (
                                rate_amount)
    return add_shipping_with_conf_py(data, cookie=cookie)


def add_quantity_fee_shipping_py(rate_amount='10.00', cookie=init_cookie):
    '''
    添加只有quantity_fee的物流
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_data)
    data['shipping_plan'] = '[{"name":"quantity_fee","shipping_method":"quantity","range_min":"0","range_max":-1,' \
                            '"rate_amount":%s,"payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]' % (
                                rate_amount)
    return add_shipping_with_conf_py(data, cookie=cookie)


def del_all_shipping_py(cookie=init_cookie):
    """
    删除全部物流方案
    :return: True | False
    """
    return keep_certain_shipping_py(cookie=cookie)


def keep_latest_shipping_py(cookie=init_cookie):
    """
    保留最新的那条物流方案
    :return: True | False
    """
    return keep_certain_shipping_py([1], cookie=cookie)


def keep_certain_shipping_py(num_list=[], cookie=init_cookie):
    """
    保留某些物流方案
    :return: True | False
    """
    if num_of_exist_shipping_py(cookie=cookie) == 0:
        return {'result': 'success', 'content': 'there are not shipping to be deleted'}
    shipping_list_data = shipping_list_py(cookie=cookie)['content']['data']
    for i in range(len(shipping_list_data)):
        if i + 1 in num_list:
            continue
        shipping_refresh_del_py(shipping_list_data[i]['shipping_id'], cookie=cookie)
    return {'result': 'success', 'content': 'assigned shipping had been deleted'}


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
        return shipping_list_py(cookie=cookie)['content']['data'][0]['shipping_id']
    elif num > 1:
        del_all_shipping_py(cookie=cookie)
    return add_shipping_with_conf_py(conf, cookie=cookie)


def num_of_exist_shipping_py(cookie=init_cookie):
    '''
    判断是否存在物流方案
    :return: 存在物流的个数
    '''
    data = shipping_list_py(cookie=cookie)
    if 'data' in data['content']:
        return len(data['content']['data'])
    else:
        return 0


if __name__ == '__main__':
    print del_all_shipping_py()
    # print shipping_list_py()
    print add_quantity_fee_shipping_py()
