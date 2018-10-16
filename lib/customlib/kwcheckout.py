# -*- coding:utf-8 -*-

from kwproduct import *

reload(sys)
sys.setdefaultencoding('utf-8')


def set_checkout_step_py(customer_name=None, customer_contact=None, cookie=init_cookie):
    """
    设置checkout结账流程的-地址-姓名输入的模式
    :param customer_name: 1= 名字 2=姓 ／ 名
    :param customer_contact: 1= 邮箱 2= 手机 3 = 邮箱／手机
    :return: True | False
    """
    set_url = home_page_url + "/api/checkout/save"
    if customer_name == None or str(customer_name) == "": customer_name = 1
    if customer_contact == None or str(customer_contact) == "": customer_contact = 3
    customer_name = int(str(customer_name))
    customer_contact = int(str(customer_contact))

    data = {
        "company_setting": 2,
        "customer_authority": 2,
        "customer_contact": customer_contact,
        "customer_email": 1,
        "customer_name": customer_name,
        "customer_phone": 2,
        "postcode_setting": 1,
        "privacy_policy": "",
        "refund_policy": "",
        "server_policy": ""
    }
    try:
        res_data = requests.post(url=set_url, headers={"cookie": cookie['cookie']}, json=data)
        if res_data.status_code == 200 and json.loads(res_data.content)['state'] == 0:
            return True
        else:
            return False
    except Exception as e:
        print e


def checkout_save_py(data, cookie=init_cookie):
    url = home_page_url + "/api/checkout/save"

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


def checkout_create_py(data, cookie=init_cookie):
    '''
    创建checkout
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/checkout/create"
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


def checkout_price_calculate_py(data, cookie=init_cookie):
    '''
    计算最终价格的接口
    :param data:
    :param cookie:
    :return:
    '''
    url = myshoplaza_url + "/checkout/price/calculate"
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


def checkout_shipping_lines_py(query_str={}, cookie=init_cookie):
    '''
    获取checkout的入参shipping_lines
    :param data:
    :param cookie:
    :return: order_token
    '''
    url = myshoplaza_url + "/checkout/shipping/lines"
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


def checkout_place_order_py(data, cookie=init_cookie):
    '''
    订单地址的接口
    :param data:
    :param cookie:
    :return:
    '''
    url = myshoplaza_url + "/checkout/place-order"
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


def get_order_token_py(data, cookie=init_cookie):
    return checkout_create_py(data, cookie)['content']['data']['order_token']


def get_order_token_by_productid_py(product_id, cookie=init_cookie):
    '''
    通过productid获取order_token
    1、获取variants_id，2、返回产品的order_token
    :param cookie:
    :return:
    '''
    return get_order_token_by_productidlist_py([product_id], cookie)


def get_order_token_by_productidlist_py(product_id_list, cookie=init_cookie):
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
        query_str = {'product_id': product_id}
        variant_id = product_info_py(query_str, cookie)['content']['data']['variants'][0]['id']
        line_item['variant_id'] = variant_id
        data['line_items'].append(line_item)
    return get_order_token_py(data, cookie)


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

def start_pc_show_py(show=0,cookie=init_cookie):
    """
    是否开启PC优化
    :param show: 默认0 = 关闭 | 1 = 开启
    :param cookie:
    :return:
    """
    url = home_page_url + "/api/themes/switch-pc"
    data = {"status": int(show), "theme_id": 1}
    try:
        res = requests.post(url=url,headers={"cookie":cookie['cookie']},json=data)
        print res.content
        if json.loads(res.content)['state'] == 0 :
            return True
        else:
            return False
    except Exception as e:
        print e

def get_shipping_lines_with_conf_py(conf={}, cookie=init_cookie):
    '''
    获取shipping_lines
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_lines_data)
    dict_deepupdate(data, conf)

    return checkout_shipping_lines_py(data, cookie)


def set_checkout_process_py(conf={}, cookie=init_cookie):
    '''
    设置checkout流程
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(checkout_save_data)
    dict_deepupdate(data, conf)

    return checkout_save_py(data, cookie)


if __name__ == '__main__':
    # print json.dumps(checkout_shipping_lines_py(shipping_lines_data))
    print set_checkout_process_py()
