# -*- coding:utf-8 -*-

from do_request import *
from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def collections_delete_py(collection_id, cookie=init_cookie):
    '''
    删除商品专辑
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/collections/%s' % (home_page_url, collection_id)
    return do_delete(url, cookie=cookie)


def collections_post_py(data, cookie=init_cookie):
    '''
    创建商品专辑
    :param data:
    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/admin/collections"
    return do_post(url, data, cookie=cookie)


def collections_patch_py(data, collection_id, cookie=init_cookie):
    '''
    修改商品专辑
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/collections/%s' % (home_page_url, collection_id)
    return do_patch(url, data, cookie=cookie)


def collections_get_py(query_str={}, cookie=init_cookie):
    '''
    商品专辑列表
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/collections' % (home_page_url)
    return do_get(url, query_str, cookie=cookie)


def collections_id_get_py(collection_id, cookie=init_cookie):
    '''
    商品专辑详情
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/collections/%s' % (home_page_url, collection_id)
    return do_get(url, {}, cookie=cookie)


def collections_query_py(data, cookie=init_cookie):
    '''
    检索商品专辑
    :param query_str:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/admin/collections/query'
    return do_post(url, data, cookie=cookie)


def add_collection_with_conf_py(conf={}, cookie=init_cookie):
    '''
    通过conf（dict数据类型）配置来添加专辑
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(collecion_data)
    dict_deepupdate(data, conf)
    key_list = conf.keys()
    if 'image' not in key_list:
        data['image'] = image
    if 'title' not in key_list:
        data['title'] = 'autotest_collection_name_' + salt_py()

    return collections_post_py(data, cookie=cookie)['content']['collection']['id']


def add_collection_with_pic_py(cookie=init_cookie):
    '''
    添加含封面的专辑
    :param cookie:
    :return:
    '''

    return add_collection_with_conf_py(cookie=cookie)


def add_collection_without_pic_py(cookie=init_cookie):
    '''
    添加不含封面的专辑
    :param cookie:
    :return:
    '''

    return add_collection_with_conf_py({'image': {'src': '', 'alt': '', 'path': ''}}, cookie=cookie)


def del_latest_collection_py(cookie=init_cookie):
    """
    删除最新专辑
    :return: True | False
    """
    collection_id = get_latest_collectionid_py(cookie=cookie)
    return collections_delete_py(collection_id, cookie=cookie)


def del_all_collections_py(cookie=init_cookie):
    """
    删除全部专辑
    :return: True | False
    """
    collection_ids = get_exist_productsid_py(cookie=cookie)
    for collection_id in collection_ids:
        collections_delete_py(collection_id, cookie=cookie)


def get_all_collections_count_py(cookie=init_cookie):
    return collections_get_py(cookie=cookie)['content']['count']


def get_latest_collectionid_py(cookie=init_cookie):
    # query_str = copy.deepcopy(query_list_data)
    collections_list = collections_get_py(cookie=cookie)['content']['collections']
    try:
        return collections_list[0]['id']
    except Exception as e:
        return 1


def get_exist_productsid_py(cookie=init_cookie):
    # query_str = copy.deepcopy(query_list_data)
    collections_list = collections_get_py(cookie=cookie)['content']['collections']
    collections_id = []
    for collection in collections_list:
        collections_id.append(collection['id'])
    return collections_id


if __name__ == '__main__':
    # add_collection_with_conf_py()
    # time.sleep(2)
    print collections_get_py('f872586b-005d-4999-be78-d5f7c28c0ef6')
    # print get_all_collections_count_py()
    # del_latest_collection_py()
    # del_all_collections_py()
    # del_latest_collections_py(4)
