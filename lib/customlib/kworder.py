# -*- coding:utf-8 -*-

from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def order_dropdown_py(api='/api/order/dropdown?page=0&limit=20&key=', cookie=init_cookie):
    """
    公共获取order数据方法
    :param p_url: url
    :return: dict
    """
    p_url = home_page_url + api
    ret_data = requests.get(url=p_url, headers={"cookie": cookie['cookie']})
    return ret_data.content


def order_add_py(data, cookie=init_cookie):
    url = home_page_url + "/api/order/add"

    try:
        response_data = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200 and json.loads(response_data.content)['state'] == 0:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def order_updatestatus_py(order_list, status, cookie=init_cookie):
    """
    更改专辑状态
    :param order_list:
    :param status: -1 = 删除专辑（非数据库）
    :return:
    """
    exist_orders_id = get_exist_productsid_py()
    if isinstance(order_list, str) and order_list == 'all':
        order_list = exist_orders_id
    elif isinstance(order_list, int):
        num = order_list
        order_list = exist_orders_id[:num]

    url = home_page_url + "/api/order/updatestatus"
    data = {"order_ids": order_list, "status": status}
    try:
        resData = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if resData.status_code == 200 and json.loads(resData.content)['state'] == 0:
            return True
        else:
            return False

    except Exception as e:
        return e


def add_order_with_conf_py(conf, cookie=init_cookie):
    '''
    通过conf（dict数据类型）配置来添加专辑
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(collecion_data)

    key_list = conf.keys()
    if 'title' in key_list:
        data['meta_title'] = conf['title']
        data['title'] = conf['title']
        data['url'] = '/orders/' + conf['title']
    if 'image' in key_list and conf['image'] == 'yes':
        data['image'] = image
    elif 'images' in key_list and conf['image'] == 'no':
        del data['image']
    else:
        data['image'] = image

    return order_add_py(data, cookie)['content']['data']['order_id']


def add_order_with_pic_py(cookie=init_cookie):
    '''
    添加含封面的专辑
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(collecion_data)
    data['image'] = image

    return order_add_py(data, cookie)['content']['data']['order_id']


def add_order_without_pic_py(cookie=init_cookie):
    '''
    添加不含封面的专辑
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(collecion_data)
    del data['image']

    return order_add_py(data, cookie)['content']['data']['order_id']


def del_latest_order_py(cookie=init_cookie):
    """
    删除最新专辑
    :return: True | False
    """
    order_updatestatus_py(1, -1, cookie)


def del_latest_orders_py(num, cookie=init_cookie):
    """
    删除最新专辑s
    :param num:
    :param cookie:
    :return:
    """
    order_updatestatus_py(num, -1, cookie)


def del_all_orders_py(cookie=init_cookie):
    """
    删除全部专辑
    :return: True | False
    """
    order_updatestatus_py('all', -1, cookie)


def get_latest_orderid_py():
    orders_list = json.loads(order_dropdown_py())['data']['orders']
    try:
        return int(orders_list[0]['order_id'])
    except Exception as e:
        return 1


def get_exist_productsid_py():
    orders_list = json.loads(order_dropdown_py())['data']['orders']
    orders_id = []
    for order in orders_list:
        orders_id.append(order['order_id'])
    return orders_id


if __name__ == '__main__':
    add_order_without_pic_py()
    print add_order_with_pic_py()
    # del_latest_order_py()
    # del_all_orders_py()
    del_latest_orders_py(4)
