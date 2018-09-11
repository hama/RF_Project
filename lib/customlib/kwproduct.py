# -*- coding:utf-8 -*-

from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def product_search_py(api='/api/product/search?page=0&limit=20', cookie=init_cookie):
    """
    公共获取数据方法
    :param p_url: url
    :return: dict
    """
    p_url = home_page_url + api
    ret_data = requests.get(url=p_url, headers={"cookie": cookie['cookie']})
    return ret_data.content


def add_product_py(data, cookie=init_cookie):
    """
    添加商品
    :return: True | False
    """
    url = home_page_url + "/api/product/add"

    try:
        resData = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if resData.status_code == 200 and json.loads(resData.content)['state'] == 0:
            return True
        else:
            return False

    except Exception as e:
        return e


def add_discontinued_product_py(cookie=init_cookie):
    '''
    添加未上架商品
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(product_max_data)
    data['images'] = []
    data['status'] = 0

    add_product_py(data, cookie)


def add_launched_product_py(cookie=init_cookie):
    '''
    添加已上架商品
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(product_max_data)
    data['images'] = images
    data['status'] = 1

    add_product_py(data, cookie)


def add_min_product_py(cookie=init_cookie):
    '''
    添加min商品，除必填项（标题、售价、重量）其余不填，保存默认
    :param cookie:
    :return:
    '''
    add_product_py(product_min_data, cookie)


def add_max_product_py(cookie=init_cookie):
    '''
    添加max商品，即所有可填项都填
    :param cookie:
    :return:
    '''
    add_launched_product_py(cookie)


def updates_status_py(product_list, status, cookie=init_cookie):
    """
    更改商品状态
    :param product_list:
    :param status: -1 = 删除商品（非数据库） | 0 = 设置下架 | 1 = 设置上架
    :return:
    """
    first_product_id = get_latest_productid_py()
    if isinstance(product_list, str):
        if product_list == 'all':
            product_list = range(1, first_product_id + 1)
        elif product_list == 'first':
            product_list = [first_product_id]

    url = home_page_url + "/api/product/updatestatus"
    data = {"product_ids": product_list, "status": status}
    try:
        resData = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if resData.status_code == 200 and json.loads(resData.content)['state'] == 0:
            return True
        else:
            return False

    except Exception as e:
        return e


def del_first_product_py(cookie=init_cookie):
    """
    删除首个商品
    :return: True | False
    """
    updates_status_py('first', -1, cookie)


def del_all_product_py(cookie=init_cookie):
    """
    删除全部商品
    :return: True | False
    """
    updates_status_py('all', -1, cookie)


def getAllProductCount_py(cookie=init_cookie):
    p_url = home_page_url + "/api/product/search"
    sub_list = requests.get(url=p_url, headers={"cookie": cookie['cookie']})
    total = json.loads(sub_list.content)['data']['total']

    return total


def get_latest_productid_py():
    products_list = json.loads(product_search_py())['data']['products']
    try:
        return products_list[0]['id']
    except Exception as e:
        return 1


if __name__ == '__main__':
    # product_search_py()
    # del_first_product_py()
    # del_all_product_py()
    # add_discontinued_product_py()
    add_launched_product_py()
