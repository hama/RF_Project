# -*- coding:utf-8 -*-

from kwcheckout import *
from kwpayment import *

reload(sys)
sys.setdefaultencoding('utf-8')


def admin_orders_by_raw_data_py(query_str, cookie=init_cookie):
    url = home_page_url + '/api/admin/orders'
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


def admin_orders_by_str_py(string, cookie=init_cookie):
    url = '%s/api/admin/orders/%s' % (home_page_url, string)
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


def del_order_py(order_id, cookie=init_cookie):
    '''
    删除订单（只能软删除已取消订单）
    :param order_id:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s.json' % (home_page_url, order_id)
    try:
        response_data = requests.delete(url=url, headers={"cookie": cookie['cookie']})
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def query_all_dealing_order_py(cookie=init_cookie):
    '''
    查询待处理订单全部列表的信息
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    del data['page']
    del data['per_page']
    data['deal_status'] = 'dealing'
    return admin_orders_by_raw_data_py(data, cookie)


def query_dealing_order_by_num_py(num=10, cookie=init_cookie):
    '''
    查询待处理订单列表的信息(默认10条)
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['per_page'] = num
    data['deal_status'] = 'dealing'
    return admin_orders_by_raw_data_py(data, cookie)


def get_dealing_order_count_py(cookie=init_cookie):
    '''
    获取待处理订单总个数
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['deal_status'] = 'dealing'
    return admin_orders_by_raw_data_py(data, cookie)['content']['count']


def query_all_undeal_order_py(cookie=init_cookie):
    '''
    查询未完成订单全部列表的信息
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    del data['page']
    del data['per_page']
    data['deal_status'] = 'undeal'
    return admin_orders_by_raw_data_py(data, cookie)


def query_undeal_order_by_num_py(num=10, cookie=init_cookie):
    '''
    查询未完成订单列表的信息(默认10条)
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['per_page'] = num
    data['deal_status'] = 'undeal'
    return admin_orders_by_raw_data_py(data, cookie)


def get_undeal_order_count_py(cookie=init_cookie):
    '''
    获取未完成订单总个数
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['deal_status'] = 'undeal'
    return admin_orders_by_raw_data_py(data, cookie)['content']['count']


def query_order_py(order_id, cookie=init_cookie):
    '''
    查询指定order的信息
    :param order_id:
    :param cookie:
    :return:
    '''
    return admin_orders_by_str_py(order_id, cookie)


def get_order_num_by_order_id_py(order_id, cookie=init_cookie):
    '''
    获取指定order订单编号
    :param order_id:
    :param cookie:
    :return:
    '''
    return admin_orders_by_str_py(order_id, cookie)['content']['order']['order_no']


def get_latest_dealing_order_num_by_num_py(num, cookie=init_cookie):
    '''
    通过指定个数，获取最新待处理订单的订单编号
    :param cookie:
    :return:    订单编号list
    '''
    data_dealing_orders = query_dealing_order_by_num_py(num, cookie)['content']['orders']
    list_order_num = []
    for data_dealing_order in data_dealing_orders:
        list_order_num.append(data_dealing_order['number'])
    return list_order_num


def get_latest_dealing_order_num_py(cookie=init_cookie):
    '''
    获取最新一个待处理订单的订单编号
    :param cookie:
    :return:    订单编号
    '''
    return get_latest_dealing_order_num_by_num_py(1, cookie)[0]


def get_latest_undeal_order_num_by_num_py(num, cookie=init_cookie):
    '''
    通过指定个数，获取最新未完成订单的订单编号
    :param cookie:
    :return:    订单编号list
    '''
    data_undeal_orders = query_undeal_order_by_num_py(num, cookie)['content']['orders']
    list_order_num = []
    for data_undeal_order in data_undeal_orders:
        list_order_num.append(data_undeal_order['number'])
    return list_order_num


def get_latest_undeal_order_num_py(cookie=init_cookie):
    '''
    获取最新一个未完成订单的订单编号
    :param cookie:
    :return:    订单编号
    '''
    return get_latest_undeal_order_num_by_num_py(1, cookie)[0]


def add_order_by_order_token_py(order_token, cookie=init_cookie):
    '''
    通过order_token添加新订单
    	支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中
    1、调计算价格接口 2、调shipping_lines接口 3、调订单地址接口 4、调付款接口
    :param product_id_list:
    :param cookie:
    :return:
    '''

    data_price_calculate = copy.deepcopy(price_calculate_data)
    data_price_calculate['order_token'] = order_token
    calculate_result = do_price_calculate_with_conf_py(data_price_calculate)

    data_shipping_lines = copy.deepcopy(shipping_lines_data)
    data_shipping_lines['order_token'] = order_token
    shipping_lines_result = checkout_shipping_lines_py(data_shipping_lines)

    data_place_order = copy.deepcopy(place_order_data)
    data_place_order['order_token'] = order_token
    data_place_order['prices'] = calculate_result['content']['data']['prices']
    data_place_order['shipping_line'] = shipping_lines_result['content']['data']['shipping_lines'][0]
    add_place_order_with_conf_py(data_place_order)

    data_payment_line = payment_list_py()['content']['data'][0]['channel_list'][0]
    data_payment_pay = copy.deepcopy(payment_pay_data)
    data_payment_pay['order_token'] = order_token
    data_payment_pay['payment_line'] = data_payment_line
    return payment_pay_py(data_payment_pay, cookie)


def add_dealing_order_with_products_py(cookie=init_cookie):
    '''
    添加待处理订单(包含两个产品)
        支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中
    :param cookie:
    :return:
    '''
    order_token = add_undeal_order_with_products_py(cookie)
    add_order_by_order_token_py(order_token, cookie)
    return order_token


def add_dealing_order_with_product_py(cookie=init_cookie):
    '''
    添加待处理订单(只包含一个产品)
    	支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中
    :param cookie:
    :return:
    '''
    order_token = add_undeal_order_with_product_py(cookie)
    add_order_by_order_token_py(order_token, cookie)
    return order_token


def add_undeal_order_with_products_py(cookie=init_cookie):
    '''
    添加未完成订单(包含两个产品)
    	支付方式	支付状态	订单状态
    	无	    待支付	未完成
    :param cookie:
    :return:
    '''
    count = product_search_py(cookie)['content']['data']['total']
    if count == 0:
        add_max_product_py(cookie)
        add_max_product_py(cookie)
    elif count == 1:
        add_max_product_py(cookie)
    search_data = product_search_py(cookie)
    productid01 = search_data['content']['data']['products'][0]['id']
    productid02 = search_data['content']['data']['products'][1]['id']
    productidlist = [productid01, productid02]
    return get_order_token_by_productidlist_py(productidlist)


def add_undeal_order_with_product_py(cookie=init_cookie):
    '''
    添加未完成订单(只包含一个产品)
        支付方式	支付状态	订单状态
    	无	    待支付	未完成
    :param cookie:
    :return:
    '''
    count = product_search_py(cookie)['content']['data']['total']
    if count == 0:
        add_max_product_py(cookie)
    productid01 = product_search_py(cookie)['content']['data']['products'][0]['id']
    return get_order_token_by_productid_py(productid01)


if __name__ == '__main__':
    # print get_order_token_by_productid_py('602')
    # print get_order_token_by_productidlist_py(['602', '601'])
    # print json.dumps(query_undeal_order_by_num_py())
    # print add_undeal_order_with_products_py()
    print add_dealing_order_with_products_py()
    # print get_latest_undeal_order_num_py()
    # print get_order_num_by_order_id_py('1c9b41d0-7a20-4600-9a33-459353c892be')
    # productid = add_launched_product_py()\
    # print add_order_by_productid_py(productid)
    # print query_dealing_order()
    # print query_undeal_order()
    # print del_order('2e043a92-46c5-4f26-953a-88f347cd1e08')
