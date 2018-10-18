# -*- coding:utf-8 -*-

from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def product_search_py(query_str={}, cookie=init_cookie):
    '''
    查询产品列表信息
    :param query_str:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/product/search'
    return do_get(url, query_str, cookie=cookie)


def product_info_py(query_str={}, cookie=init_cookie):
    '''
    查询产品信息
    :param query_str:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/product/info'
    return do_get(url, query_str, cookie=cookie)


def product_add_py(data, cookie=init_cookie):
    """
    添加商品
    :return: True | False
    """
    url = home_page_url + "/api/product/add"
    return do_post(url, data, cookie=cookie)


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
    return do_post(url, data, cookie=cookie)


def add_discontinued_product_py(cookie=init_cookie):
    '''
    添加未上架商品
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(product_max_data)
    data['images'] = [image]
    data['status'] = 0

    return product_add_py(data, cookie=cookie)['content']['data']['product_id']


def add_launched_product_py(cookie=init_cookie):
    '''
    添加已上架商品
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(product_max_data)
    data['images'] = [image]
    data['status'] = 1

    return product_add_py(data, cookie=cookie)['content']['data']['product_id']


def add_empty_quantity_product_py(cookie=init_cookie):
    '''
    添加min商品，除必填项（标题、售价、重量）其余不填，保存默认
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(product_min_data)
    data['variants'][0]['inventory_management'] = True
    return product_add_py(data, cookie=cookie)['content']['data']['product_id']


def add_min_product_py(cookie=init_cookie):
    '''
    添加min商品，除必填项（标题、售价、重量）其余不填，保存默认
    :param cookie:
    :return:
    '''
    return product_add_py(product_min_data, cookie=cookie)['content']['data']['product_id']


def add_max_product_py(cookie=init_cookie):
    '''
    添加max商品，即所有可填项都填
    :param cookie:
    :return:
    '''
    return add_launched_product_py(cookie=cookie)


def add_product_with_conf_py(conf={}, cookie=init_cookie):
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
    if 'setshipping' in key_list:
        data['variants'][0]['requires_shipping'] = conf['setshipping']
    if 'tags' in key_list:
        data['tags'] = conf['tags']
    if 'images' in key_list and conf['images'] == 'yes':
        data['images'] = [image]
    elif 'images' in key_list and conf['images'] == 'no':
        data['images'] = []
    else:
        data['images'] = [image]

    return product_add_py(data, cookie=cookie)['content']['data']['product_id']


def del_latest_product_py(cookie=init_cookie):
    """
    删除最新商品
    :return: True | False
    """
    product_updatestatus_py(1, -1, cookie=cookie)


def del_latest_products_py(num, cookie=init_cookie):
    """
    删除最新商品s
    :param num:
    :param cookie:
    :return:
    """
    product_updatestatus_py(num, -1, cookie=cookie)


def del_all_products_py(cookie=init_cookie):
    """
    删除全部商品
    :return: True | False
    """
    product_updatestatus_py('all', -1, cookie=cookie)


def get_all_products_count_py(cookie=init_cookie):
    return product_search_py({}, cookie=cookie)['content']['data']['total']


def get_latest_productid_py(cookie=init_cookie):
    query_str = copy.deepcopy(query_list_data)
    products_list = product_search_py(query_str, cookie=cookie)['content']['data']['products']
    try:
        return products_list[0]['id']
    except Exception as e:
        return 1


def get_oldest_productid_py(cookie=init_cookie):
    query_str = copy.deepcopy(query_list_data)
    products_list = product_search_py(query_str, cookie=cookie)['content']['data']['products']
    try:
        return products_list[-1]['id']
    except Exception as e:
        return 1


def get_exist_productsid_py(cookie=init_cookie):
    query_str = copy.deepcopy(query_list_data)
    products_list = product_search_py(query_str, cookie=cookie)['content']['data']['products']
    products_id = []
    for product in products_list:
        products_id.append(product['id'])
    return products_id


def add_max_product_with_sub_py(cookie=init_cookie):
    '''
    添加max商品，即所有可填项都填（含子产品）
    :param cookie:
    :return:
    '''
    return product_add_py(product_max_data_with_sub, cookie=cookie)


def add_one_product_with_sub_py(cookie=init_cookie):
    """
    添加一个sub商品
    :param cookie:
    :return:
    """
    return product_add_py(product_onw_data_with_sub, cookie=cookie)


if __name__ == '__main__':
    pass
    print del_all_products_py()
    # product_search_py()
    # del_latest_product_py()
    # del_all_products_py()
    # print add_max_product_py()
    # print add_max_product_py()
    # print add_one_product_with_sub_py()
    # product_info_py()
    # print add_launched_product_py()
    # conf = {'tags': ['color']}
    # add_product_with_conf_py(conf)
    # del_latest_products_py(2)
