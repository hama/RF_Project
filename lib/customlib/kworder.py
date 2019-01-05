# -*- coding:utf-8 -*-

from kwcheckout import *
from kwpayment import *
from kwshipping import *

reload(sys)
sys.setdefaultencoding('utf-8')


def admin_orders_by_raw_data_py(query_str={}, cookie=init_cookie):
    url = home_page_url + '/api/admin/orders'
    return do_get(url, query_str, cookie=cookie)


def admin_orders_by_str_py(string, cookie=init_cookie):
    url = '%s/api/admin/orders/%s' % (home_page_url, string)
    query_str = {}
    return do_get(url, query_str, cookie=cookie)


def orders_fulfillments_via_post_py(order_token, data, cookie=init_cookie):
    '''
    设置订单发货
    :param order_token:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s/fulfillments' % (home_page_url, order_token)
    return do_post(url, data, cookie=cookie)


def orders_fulfillments_via_get_py(order_token, cookie=init_cookie):
    '''
    查询订单发货状态
    :param order_token:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s/fulfillments' % (home_page_url, order_token)
    query_str = {}
    return do_get(url, query_str, cookie=cookie)


def orders_finish_py(order_token, fulfillment_id, cookie=init_cookie):
    '''
     B端确认收货
    fulfillment的id通过orders_fulfillments_via_post_py获取
    :param order_token:
    :param fulfillment_id:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s/fulfillments/%s/finish' % (home_page_url, order_token, fulfillment_id)
    return do_patch(url, {}, cookie=cookie)


def orders_cancel_py(order_token, cookie=init_cookie):
    '''
     B端取消订单
    :param order_token:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s/cancel' % (home_page_url, order_token)
    return do_patch(url, {}, cookie=cookie)


def del_order_py(order_token, cookie=init_cookie):
    '''
    删除订单（只能软删除已取消订单）
    :param order_token:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/orders/%s.json' % (home_page_url, order_token)
    return do_delete(url, cookie=cookie)


def shipment_with_conf_py(order_token, conf={}, cookie=init_cookie):
    '''
    设置订单发货通过conf
    :param order_token:
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(orders_fulfillments_data)
    dict_deepupdate(data, conf)
    return orders_fulfillments_via_post_py(order_token, data, cookie=cookie)


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
    return admin_orders_by_raw_data_py(data, cookie=cookie)


def query_dealing_order_by_num_py(num=10, cookie=init_cookie):
    '''
    查询待处理订单列表的信息(默认10条)
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['per_page'] = num
    data['deal_status'] = 'dealing'
    return admin_orders_by_raw_data_py(data, cookie=cookie)


def get_dealing_order_count_py(cookie=init_cookie):
    '''
    获取待处理订单总个数
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['deal_status'] = 'dealing'
    return admin_orders_by_raw_data_py(data, cookie=cookie)['content']['count']


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
    return admin_orders_by_raw_data_py(data, cookie=cookie)


def query_undeal_order_by_num_py(num=10, cookie=init_cookie):
    '''
    查询未完成订单列表的信息(默认10条)
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['per_page'] = num
    data['deal_status'] = 'undeal'
    return admin_orders_by_raw_data_py(data, cookie=cookie)


def get_undeal_order_count_py(cookie=init_cookie):
    '''
    获取未完成订单总个数
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(query_orders_data)
    data['deal_status'] = 'undeal'
    return admin_orders_by_raw_data_py(data, cookie=cookie)['content']['count']


def query_order_py(order_token, cookie=init_cookie):
    '''
    查询指定order的信息
    :param order_token:
    :param cookie:
    :return:
    '''
    return admin_orders_by_str_py(order_token, cookie=cookie)


def get_order_num_by_order_token_py(order_token, cookie=init_cookie):
    '''
    获取指定order订单编号
    :param order_token:
    :param cookie:
    :return:
    '''
    return admin_orders_by_str_py(order_token, cookie=cookie)['content']['order']['order_no']


def get_latest_dealing_order_num_by_num_py(num, cookie=init_cookie):
    '''
    通过指定个数，获取最新待处理订单的订单编号
    :param cookie:
    :return:    订单编号list
    '''
    data_dealing_orders = query_dealing_order_by_num_py(num, cookie=cookie)['content']['orders']
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
    return get_latest_dealing_order_num_by_num_py(1, cookie=cookie)[0]


def get_latest_undeal_order_num_by_num_py(num, cookie=init_cookie):
    '''
    通过指定个数，获取最新未完成订单的订单编号
    :param cookie:
    :return:    订单编号list
    '''
    data_undeal_orders = query_undeal_order_by_num_py(num, cookie=cookie)['content']['orders']
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
    return get_latest_undeal_order_num_by_num_py(1, cookie=cookie)[0]


def get_productidlist_in_order_py(order_token, cookie=init_cookie):
    '''
    通过order_token获取对应order中的productid
    :param order_token:
    :param cookie:
    :return: list
    '''
    productidlist_in_order = []
    for item in query_order_py(order_token, cookie=cookie)['content']['order']['line_items']:
        productidlist_in_order.append(item['id'])
    return productidlist_in_order


def add_order_by_tokens_py(tokens, cookie=init_cookie):
    '''
    通过order_token添加新订单
    	支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中
    :param tokens:
    :param cookie:
    :return:
    '''
    return add_deading_order_with_conf_py(tokens, cookie=cookie)['order_token']


def add_deading_order_with_delivering_status_py(conf={}, cookie=init_cookie):
    '''
    创建待处理订单的发货状态为：待发货
    	COD支付	待支付	待发货	进行中
    :param conf:
    :param cookie:
    :return:
    '''
    return add_deading_order_with_conf_py(conf, cookie=cookie)['order_token']


def add_deading_order_with_some_delivered_status_py(conf={}, cookie=init_cookie):
    '''
    创建待处理订单的发货状态为：部分发货
    	COD支付	待支付	部分发货	进行中
    :param conf:
    :param cookie:
    :return:
    '''
    tokens = add_deading_order_with_conf_py(conf, cookie=cookie)
    productidlist_in_order = get_productidlist_in_order_py(tokens['order_token'], cookie=cookie)
    conf = {'line_item_ids': [productidlist_in_order[0]]}
    shipment_with_conf_py(tokens['order_token'], conf, cookie=cookie)
    return tokens['order_token']


def add_deading_order_with_all_delivered_status_py(conf={}, cookie=init_cookie):
    '''
    创建待处理订单的发货状态为：全部发货
    	COD支付	待支付	全部发货	进行中
    :param conf:
    :param cookie:
    :return:
    '''
    tokens = add_deading_order_with_conf_py(conf, cookie=cookie)
    productidlist_in_order = get_productidlist_in_order_py(tokens['order_token'], cookie=cookie)
    conf = {'line_item_ids': productidlist_in_order}
    shipment_with_conf_py(tokens['order_token'], conf, cookie=cookie)
    return tokens['order_token']


def add_deading_order_with_some_finished_status_py(conf={}, cookie=init_cookie):
    '''
    创建待处理订单的
    发货状态：部分完成
    	COD支付	待支付	部分完成	进行中
    :param conf:
    :param cookie:
    :return:
    '''
    tokens = add_deading_order_with_conf_py(conf, cookie=cookie)
    productidlist_in_order = get_productidlist_in_order_py(tokens['order_token'], cookie=cookie)
    conf00 = {'line_item_ids': [productidlist_in_order[0]]}
    conf01 = {'line_item_ids': [productidlist_in_order[1]]}
    fulfillment_id00 = shipment_with_conf_py(tokens['order_token'], conf00, cookie=cookie)['content']['fulfillment'][
        'id']
    fulfillment_id01 = shipment_with_conf_py(tokens['order_token'], conf01, cookie=cookie)['content']['fulfillment'][
        'id']
    # orders_finish_py(tokens['order_token'], fulfillment_id00, cookie=cookie)
    orders_finish_py(tokens['order_token'], fulfillment_id01, cookie=cookie)
    return tokens['order_token']


def add_deading_order_with_finished_status_py(conf={}, cookie=init_cookie):
    '''
    创建待处理订单的
    发货状态：全部完成
    订单状态：已完成
    	COD支付	已支付	全部完成	已完成
    :param conf:
    :param cookie:
    :return:
    '''
    tokens = add_deading_order_with_conf_py(conf, cookie=cookie)
    productidlist_in_order = get_productidlist_in_order_py(tokens['order_token'], cookie=cookie)
    conf = {'line_item_ids': productidlist_in_order}
    fulfillment_id = shipment_with_conf_py(tokens['order_token'], conf, cookie=cookie)['content']['fulfillment']['id']
    orders_finish_py(tokens['order_token'], fulfillment_id, cookie=cookie)
    return tokens['order_token']


def add_undead_order_with_to_pay_status_py(cookie=init_cookie):
    '''
    创建未完成订单的支付状态为：待支付
    	无	待支付	未完成
    :param conf:
    :param cookie:
    :return:
    '''
    return get_tokens_with_products_py(cookie=cookie)['order_token']


def add_undead_order_with_pay_fail_status_py(cookie=init_cookie):
    '''
    创建未完成订单的支付状态为：支付失败
    	线上支付	支付失败	未完成
    :param conf:
    :param cookie:
    :return:
    '''
    config = {}
    card_info = {
        "card_first_name": "name ",
        "card_email": "qiansuixin@autotest.com",
        "card_phone": "123456789011",
        "card_postcode": "0000",
        "card_number": "123123123123123",
        "card_month": "12",
        "card_year": "27",
        "card_code": "001"
    }

    activate_payment_credit_card_py(cookie=cookie)
    payment_pay_conf = copy.deepcopy(payment_pay_data)
    payment_pay_conf['card_info'] = card_info
    payment_pay_conf['payment_line'] = get_expected_payment_line_py(
        {'payment_method': 'credit_card', 'payment_channel': 'ipaylinks'}, cookie=cookie)
    do_pay_with_conf_py(payment_pay_conf, cookie=cookie)
    config['payment_pay_data'] = payment_pay_conf
    return add_deading_order_with_conf_py(config, cookie=cookie)['order_token']


def add_undead_order_with_order_cancel_status_py(cookie=init_cookie):
    '''
    创建未完成订单的订单状态为：已取消
    	无	待支付	已取消
    :param conf:
    :param cookie:
    :return:
    '''
    tokens = get_tokens_with_products_py(cookie=cookie)
    orders_cancel_py(tokens['order_token'], cookie=cookie)
    return tokens['order_token']


def add_undead_order_with_pay_cod_py(conf={}, cookie=init_cookie):
    '''
    创建未完成订单的订单状态为：已取消
    	cod	支付取消	已取消
    :param conf:
    :param cookie:
    :return:
    '''
    tokens = add_deading_order_with_conf_py(conf, cookie=cookie)
    productidlist_in_order = get_productidlist_in_order_py(tokens['order_token'], cookie=cookie)
    conf = {'line_item_ids': productidlist_in_order}
    shipment_with_conf_py(tokens['order_token'], conf, cookie=cookie)
    orders_cancel_py(tokens['order_token'], cookie=cookie)
    return tokens['order_token']


def add_deading_order_with_conf_py(conf={}, cookie=init_cookie):
    '''
    通过conf添加新订单
    	支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中

    # ---------- step one ----------
    # 生成raw订单2个方式：
    # 1、加入购物车，点击checkout
    # 2、商品详情页点击buynow
    # 调用接口：myshoplaza_url + "/checkout/create"
    # 进入checkout页面，即生成未完成订单，状态为：
    # 日期	               收货人姓名	 支付方式	 支付状态	 订单状态
    # 2018.10.13 13:14:40		     无	     待支付	 未完成
    # ---------- step two ----------
    # 确定物流、计费、收货地址：
    # 调用接口：
    # 1、myshoplaza_url + "/checkout/shipping/lines"
    # 2、myshoplaza_url + "/checkout/price/calculate"
    # 3、myshoplaza_url + "/checkout/place-order"
    # 进入checkout页面，即生成未完成订单，状态变为：
    # 日期	               收货人姓名	 支付方式	 支付状态	 订单状态
    # 2018.10.13 13:14:40  name	     无	     待支付	 未完成
    # ---------- step three ----------
    # 支付：
    # 调用接口：myshoplaza_url + '/checkout/payment/pay'
    # 进入Payment页面，即生成待处理订单，状态变为：
    # 日期	               收货人姓名	 支付方式	 支付状态	 物流状态	 订单状态
    # 2018.10.13 13:14:40  name 	 COD支付	 待支付	 待发货	 进行中
    :param conf:
    :param cookie:
    :return:
    '''

    tokens = do_create_raw_order_process_py(conf, cookie=cookie)

    do_place_order_process_py(conf, tokens, cookie=cookie)

    do_pay_process_py(conf, tokens, cookie=cookie)

    return tokens


def do_create_raw_order_process_py(conf, cookie=init_cookie):
    '''
    # ---------- step one ----------
    # 生成raw订单2个方式：
    # 1、加入购物车，点击checkout
    # 2、商品详情页点击buynow
    # 调用接口：myshoplaza_url + "/checkout/create"
    # 进入checkout页面，即生成未完成订单，状态为：
    # 日期	               收货人姓名	 支付方式	 支付状态	 订单状态
    # 2018.10.13 13:14:40		     无	     待支付	 未完成
    :param conf:
    :param cookie:
    :return:
    '''
    key_list = conf.keys()
    if 'order_token' in key_list and 'checkout_token' in key_list:
        # 接受已生成的订单
        tokens = {}
        tokens['order_token'] = conf['order_token']
        tokens['checkout_token'] = conf['checkout_token']
    else:
        if 'productidlist' in key_list:
            # 指定产品生成订单
            tokens = get_tokens_by_productidlist_py(conf['productidlist'], cookie=cookie)
        else:
            # 生成默认订单（含两个max产品）
            tokens = get_tokens_with_products_py(cookie=cookie)
    return tokens


def do_place_order_process_py(conf, tokens, cookie=init_cookie):
    '''
    # ---------- step two ----------
    # 确定物流、计费、收货地址：
    # 调用接口：
    # 1、myshoplaza_url + "/checkout/shipping/lines"
    # 2、myshoplaza_url + "/checkout/price/calculate"
    # 3、myshoplaza_url + "/checkout/place-order"
    # 进入checkout页面，即生成未完成订单，状态变为：
    # 日期	               收货人姓名	 支付方式	 支付状态	 订单状态
    # 2018.10.13 13:14:40  name	     无	     待支付	 未完成
    :param conf:
    :param tokens:
    :param cookie:
    :return:
    '''
    # 是否满足前提条件：查看是否存在物流
    create_only_one_shipping_py(cookie=cookie)

    key_list = conf.keys()
    # 1、调shipping_lines接口
    shipping_lines_conf = {}
    if 'shipping_lines_data' in key_list:
        shipping_lines_conf = conf['shipping_lines_data']
    shipping_lines_conf['order_token'] = tokens['order_token']
    shipping_lines_result = get_shipping_lines_with_conf_py(shipping_lines_conf, cookie=cookie)
    data_shipping_line = shipping_lines_result['content']['data']['shipping_lines'][0]
    # 2、调计算价格接口
    price_calculate_conf = {}
    if 'price_calculate_data' in key_list:
        price_calculate_conf = conf['price_calculate_data']
    price_calculate_conf['order_token'] = tokens['order_token']
    price_calculate_conf['checkout_token'] = tokens['checkout_token']
    price_calculate_conf['shipping_line'] = data_shipping_line
    calculate_result = do_price_calculate_with_conf_py(price_calculate_conf, cookie=cookie)
    # 3、调订单地址接口
    place_order_conf = {}
    if 'place_order_data' in key_list:
        place_order_conf = conf['place_order_data']
    place_order_conf['order_token'] = tokens['order_token']
    place_order_conf['checkout_token'] = tokens['checkout_token']
    place_order_conf['prices'] = calculate_result['content']['data']['prices']
    place_order_conf['shipping_line'] = data_shipping_line
    return add_place_order_with_conf_py(place_order_conf, cookie=cookie)


def do_pay_process_py(conf, tokens, cookie=init_cookie):
    '''
    # ---------- step three ----------
    # 支付：
    # 调用接口：myshoplaza_url + '/checkout/payment/pay'
    # 进入Payment页面，即生成待处理订单，状态变为：
    # 日期	               收货人姓名	 支付方式	 支付状态	 物流状态	 订单状态
    # 2018.10.13 13:14:40  name 	 COD支付	 待支付	 待发货	 进行中
    :param conf:
    :param tokens:
    :param cookie:
    :return:
    '''
    # 是否满足前提条件：查看是否开启支付方式
    activate_payment_cod_py(cookie=cookie)

    key_list = conf.keys()
    # 4、调付款接口
    if 'payment_pay_data' in key_list:
        payment_pay_conf = conf['payment_pay_data']
        # 保证payment_line的数据是有效的
        if not conf['payment_pay_data'].has_key('payment_line'):
            data_payment_line = get_expected_payment_line_py({'payment_method': 'cod', 'payment_channel': 'cod'},
                                                             cookie=cookie)
            payment_pay_conf['payment_line'] = data_payment_line
    else:
        payment_pay_conf = copy.deepcopy(payment_pay_data)
        data_payment_line = get_expected_payment_line_py({'payment_method': 'cod', 'payment_channel': 'cod'},
                                                         cookie=cookie)
        payment_pay_conf['payment_line'] = data_payment_line
    payment_pay_conf['order_token'] = tokens['order_token']
    payment_pay_conf['checkout_token'] = tokens['checkout_token']
    return do_pay_with_conf_py(payment_pay_conf, cookie=cookie)


def add_dealing_order_with_products_py(cookie=init_cookie):
    '''
    添加待处理订单(包含两个产品)
        支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中
    :param cookie:
    :return:
    '''
    tokens = get_tokens_with_products_py(cookie=cookie)
    add_order_by_tokens_py(tokens, cookie=cookie)
    return tokens['order_token']


def add_dealing_order_with_product_py(cookie=init_cookie):
    '''
    添加待处理订单(只包含一个产品)
    	支付方式	支付状态	物流状态	订单状态
        COD支付	待支付	待发货	进行中
    :param cookie:
    :return:
    '''
    tokens = get_tokens_with_product_py(cookie=cookie)
    add_order_by_tokens_py(tokens, cookie=cookie)
    return tokens['order_token']


def add_dealing_order_by_productidlist_py(productidlist, cookie=init_cookie):
    '''
    通过productidlist创建待处理订单
    :param productidlist:
    :param cookie:
    :return:
    '''
    return add_deading_order_with_conf_py({'productidlist': productidlist}, cookie=cookie)['order_token']


def add_undeal_order_with_products_py(cookie=init_cookie):
    '''
    添加未完成订单(包含两个产品)
    	支付方式	支付状态	订单状态
    	无	    待支付	未完成
    :param cookie:
    :return:
    '''
    return get_tokens_with_products_py(cookie=cookie)['order_token']


def get_tokens_with_product_py(cookie=init_cookie):
    count = get_all_products_count_py(cookie=cookie)
    if count == 0:
        add_max_product_py(cookie=cookie)
        time.sleep(0.5)
    productid01 = get_latest_productid_py(cookie=cookie)
    return get_tokens_by_productid_py(productid01, cookie=cookie)


def get_tokens_with_products_py(cookie=init_cookie):
    count = get_all_products_count_py(cookie=cookie)
    if count == 0:
        add_max_product_py(cookie=cookie)
        add_max_product_py(cookie=cookie)
        time.sleep(1)
    elif count == 1:
        add_max_product_py(cookie=cookie)
        time.sleep(0.5)
    search_data = get_exist_productsid_py(cookie=cookie)
    productid01 = search_data[0]
    productid02 = search_data[1]
    productidlist = [productid01, productid02]
    return get_tokens_by_productidlist_py(productidlist, cookie=cookie)


def add_undeal_order_by_productidlist_py(productidlist, cookie=init_cookie):
    '''
    通过productidlist创建未完成订单
    :param productidlist:
    :param cookie:
    :return:
    '''
    return get_tokens_by_productidlist_py(productidlist, cookie=cookie)['order_token']


def add_undeal_order_with_product_py(cookie=init_cookie):
    '''
    添加未完成订单(只包含一个产品)
        支付方式	支付状态	订单状态
    	无	    待支付	未完成
    :param cookie:
    :return: order_token
    '''
    return get_tokens_with_product_py(cookie=cookie)['order_token']


if __name__ == '__main__':
    # print add_undead_order_with_pay_fail_status_py()
    # print add_undeal_order_with_product_py()
    # print add_undeal_order_with_products_py()
    # print add_dealing_order_with_product_py()
    # print add_dealing_order_with_products_py()
    # print add_deading_order_with_conf_py()
    # print add_undead_order_with_to_pay_status_py()
    # print add_undead_order_with_pay_fail_status_py()
    # print add_undead_order_with_order_cancel_status_py()
    print add_deading_order_with_delivering_status_py()
    # print add_deading_order_with_some_delivered_status_py()
    # print add_deading_order_with_all_delivered_status_py()
    # print add_deading_order_with_some_finished_status_py()
    # print add_deading_order_with_finished_status_py()

    # print get_tokens_by_productid_py('602')
    # print get_tokens_by_productidlist_py(['602', '601'])
    # print json.dumps(query_undeal_order_by_num_py())
    # print get_tokens_with_products_py()
    # shipping_address = {"first_name": "auto", "last_name": "test"}
    # place_order_conf = {'shipping_address': shipping_address}
    # conf = {'place_order_data': place_order_conf}
    # print add_deading_order_with_conf_py(conf)
    # print add_dealing_order_with_products_py()
    # print shipment_with_conf_py('90e29c86-4780-4fb1-bfb1-36249deb69bc')
    # print orders_finish_py('90e29c86-4780-4fb1-bfb1-36249deb69bc', '85382d5a-6d8a-4d46-8c50-9407802173ba')
    # print add_deading_order_with_some_delivered_status_py()
    # print add_deading_order_with_some_finished_status_py()
    # print payment_list_py()
    # print add_undead_order_with_pay_fail_status_py()
    # print query_all_dealing_order_py()
    # print payment_list_py()
    # print product_search_py()
    # print add_deading_order_with_delivering_status_py()
    # print get_latest_undeal_order_num_py()
    # productid = add_max_product_py()\
    # print add_order_by_productid_py(productid)
    # print query_dealing_order()
    # print query_undeal_order()
    # print del_order('2e043a92-46c5-4f26-953a-88f347cd1e08')
    # conf = {'place_order_data': {'shipping_address': {'first_name': 'testedOject'}}}
    # print add_deading_order_with_conf_py(conf)
    # add_undead_order_with_pay_fail_status_py()

