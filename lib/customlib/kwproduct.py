# -*- coding:utf-8 -*-

from do_request import *
from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def products_get_py(query_str={}, cookie=init_cookie):
    """
    商品列表
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/products' % (home_page_url)
    return do_get(url, query_str, cookie=cookie)


def products_id_get_py(product_id, cookie=init_cookie):
    """
    商品详情
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/products/%s' % (home_page_url, product_id)
    return do_get(url, {}, cookie=cookie)


def products_post_py(data, cookie=init_cookie):
    """
    创建商品
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/admin/products'
    return do_post(url, data, cookie=cookie)


def products_patch_py(data, product_id, cookie=init_cookie):
    """
    修改商品
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/products/%s' % (home_page_url, product_id)
    return do_patch(url, data, cookie=cookie)


def products_delete_py(product_id, cookie=init_cookie):
    """
    删除商品
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/products/%s' % (home_page_url, product_id)
    return do_delete(url, cookie=cookie)


def products_publish_py(data, cookie=init_cookie):
    """
    上架商品
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/admin/products/:id/publish'
    return do_post(url, data, cookie=cookie)


def products_unpublish_py(data, cookie=init_cookie):
    """
    下架商品
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/admin/products/:id/unpublish'
    return do_post(url, data, cookie=cookie)


def products_batch_delete_py(data, cookie=init_cookie):
    """
    批量删除商品
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/admin/products/batch_delete'
    return do_post(url, data, cookie=cookie)


def products_batch_publish_py(data, cookie=init_cookie):
    """
    批量上架商品
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/admin/products/batch_publish'
    return do_post(url, data, cookie=cookie)


def products_batch_unpublish_py(data, cookie=init_cookie):
    """
    批量下架商品
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/admin/products/batch_unpublish'
    return do_post(url, data, cookie=cookie)


def products_query_py(data, cookie=init_cookie):
    """
    检索商品
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/admin/products/query'
    return do_post(url, data, cookie=cookie)


def get_product_detail_py(product_id, cookie=init_cookie):
    """
    通过商品id查询商品详情
    :param product_id:
    :param cookie:
    :return:
    """
    return products_id_get_py(product_id, cookie=cookie)


def add_min_product_py(cookie=init_cookie):
    """
    添加min商品，除必填项（标题、售价、重量）其余不填，保存默认
    :param cookie:
    :return:
    """
    data = copy.deepcopy(product_min_data)
    data['images'] = [{'id': '', 'image': image}]
    return products_post_py(data, cookie=cookie)['content']['product']['id']


def add_max_product_py(cookie=init_cookie):
    """
    添加max商品，即所有可填项都填
    :param cookie:
    :return:
    """
    return add_product_with_conf_py(cookie=cookie)


def add_product_with_conf_py(conf={}, cookie=init_cookie):
    """
    通过conf（dict数据类型）配置来添加产品
    :param conf:
    :param cookie:
    :return:
    """
    data = copy.deepcopy(product_max_data)
    dict_deepupdate(data, conf)
    key_list = conf.keys()
    if 'images' not in key_list:
        data['images'] = [{'id': '', 'image': image}]

    return products_post_py(data, cookie=cookie)['content']['product']['id']


def del_latest_product_py(cookie=init_cookie):
    """
    删除最新商品
    :return: True | False
    """
    product_id = get_latest_productid_py(cookie=cookie)
    return products_delete_py(product_id, cookie=cookie)


def del_all_products_py(cookie=init_cookie):
    """
    删除全部商品
    :return: True | False
    """
    product_ids = get_exist_productsid_py(cookie=cookie)
    return products_batch_delete_py({'ids': product_ids}, cookie=cookie)


def publish_all_products_py(cookie=init_cookie):
    """
    全部商品上线
    :return: True | False
    """
    product_ids = get_exist_productsid_py(cookie=cookie)
    return products_batch_publish_py({'ids': product_ids}, cookie=cookie)


def unpublish_all_products_py(cookie=init_cookie):
    """
    全部商品下线
    :return: True | False
    """
    product_ids = get_exist_productsid_py(cookie=cookie)
    return products_batch_unpublish_py({'ids': product_ids}, cookie=cookie)


def get_all_products_count_py(cookie=init_cookie):
    return products_get_py(cookie=cookie)['content']['count']


def get_latest_productid_py(cookie=init_cookie):
    products_list = products_get_py(cookie=cookie)['content']['products']
    try:
        return products_list[0]['id']
    except Exception as e:
        return 1


def get_exist_productsid_py(cookie=init_cookie):
    """
    返回存在的所有商品id
    :param cookie:
    :return:
    """
    # query_str = copy.deepcopy(query_list_data)
    count = get_all_products_count_py(cookie=cookie)
    products_list = products_get_py({'page': 1, 'per_page': count}, cookie=cookie)['content']['products']
    products_id = []
    for product in products_list:
        products_id.append(product['id'])
    return products_id


def add_max_product_with_sub_py(cookie=init_cookie):
    """
    添加max商品，即所有可填项都填（含子产品）
    :param cookie:
    :return:
    """
    return products_post_py(product_max_data_with_sub, cookie=cookie)['content']['product']['id']


def add_subproduct_with_conf_py(conf={}, cookie=init_cookie):
    """
    通过conf（dict数据类型）配置来添加产品(含子商品)
    :param cookie:
    :return:
    """
    data = copy.deepcopy(product_max_data_with_sub)
    dict_deepupdate(data, conf)
    key_list = conf.keys()
    if 'images' not in key_list:
        data['images'] = [{'id': '', 'image': image}]

    return products_post_py(data, cookie=cookie)['content']['product']['id']


if __name__ == '__main__':
    # print add_min_product_py()
    # conf = {'variants': [{"price": "45", "compare_at_price": "70"}, {"price": "90", "compare_at_price": "710"}]}
    # print add_subproduct_with_conf_py(conf)
    # print get_product_detail_py(add_max_product_py())
    # print add_product_with_conf_py()
    # print del_latest_product_py()
    # print del_all_products_py()
    # print publish_all_products_py()
    # print unpublish_all_products_py()
    # print get_all_products_count_py()
    # print get_latest_productid_py()
    # print len(get_exist_productsid_py())
    for i in range(20):
        conf = {'title': salt_py()}
        print add_product_with_conf_py(conf)

