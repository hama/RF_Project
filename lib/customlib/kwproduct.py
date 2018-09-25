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
    data['images'] = [image]
    data['status'] = 0

    add_product_py(data, cookie)


def add_launched_product_py(cookie=init_cookie):
    '''
    添加已上架商品
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(product_max_data)
    data['images'] = [image]
    data['status'] = 1

    add_product_py(data, cookie)


def add_empty_quantity_product_py(cookie=init_cookie):
    '''
    添加min商品，除必填项（标题、售价、重量）其余不填，保存默认
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(product_min_data)
    data['variants'][0]['inventory_management'] = True
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


def add_product_with_conf_py(conf, cookie=init_cookie):
    '''
    通过conf（dict数据类型）配置来添加产品
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(product_max_data)

    key_list = conf.keys()
    if 'title' in key_list:
        data['meta_title'] = conf['title']
        data['title'] = conf['title']
        data['url'] = '/products/' + conf['title']
    if 'subtitle' in key_list:
        data['brief'] = conf['subtitle']
    if 'status' in key_list:
        data['status'] = conf['status']
    if 'saleprice' in key_list:
        data['price'] = conf['saleprice']
        data['variants'][0]['price'] = conf['saleprice']
    if 'rawprice' in key_list:
        data['compare_at_price'] = conf['rawprice']
        data['variants'][0]['compare_at_price'] = conf['rawprice']
    if 'settax' in key_list:
        data['variants'][0]['taxable'] = conf['settax']
    if 'weight' in key_list:
        data['variants'][0]['weight'] = conf['weight']
    if 'sku' in key_list:
        data['variants'][0]['sku'] = conf['sku']
    if 'tags' in key_list:
        data['tags'] = conf['tags']
    if 'images' in key_list and conf['images'] == 'yes':
        data['images'] = [image]
    elif 'images' in key_list and conf['images'] == 'no':
        data['images'] = []
    else:
        data['images'] = [image]

    add_product_py(data, cookie)


def product_updatestatus_py(product_list, status, cookie=init_cookie):
    """
    更改商品状态
    :param product_list:
    :param status: -1 = 删除商品（非数据库） | 0 = 设置下架 | 1 = 设置上架
    :return:
    """
    exist_products_id = get_exist_productsid_py()
    if isinstance(product_list, str) and product_list == 'all':
        product_list = exist_products_id
    elif isinstance(product_list, int):
        num = product_list
        product_list = exist_products_id[:num]

    url = home_page_url + "/api/product/updatestatus"
    data = {"product_ids": product_list, "status": status}
    try:
        resData = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if resData.status_code == 200 \
                and (json.loads(resData.content)['state'] == 0 \
                     or json.loads(resData.content)['state'] == 1):
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
    product_updatestatus_py(1, -1, cookie)


def del_latest_product_py(num, cookie=init_cookie):
    """
    删除最新商品
    :param num:
    :param cookie:
    :return:
    """
    product_updatestatus_py(num, -1, cookie)


def del_all_product_py(cookie=init_cookie):
    """
    删除全部商品
    :return: True | False
    """
    product_updatestatus_py('all', -1, cookie)


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


def get_oldest_productid_py():
    products_list = json.loads(product_search_py())['data']['products']
    try:
        return products_list[-1]['id']
    except Exception as e:
        return 1


def get_exist_productsid_py():
    products_list = json.loads(product_search_py())['data']['products']
    products_id = []
    for product in products_list:
        products_id.append(product['id'])
    return products_id


if __name__ == '__main__':
    # product_search_py()
    # del_first_product_py()
    # del_all_product_py()
    # add_discontinued_product_py()
    # add_launched_product_py()
    conf = {'tags': ['color']}
    add_product_with_conf_py(conf)
    # del_latest_product_py(2)
