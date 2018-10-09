# -*- coding:utf-8 -*-

from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def collection_dropdown_py(query_str, cookie=init_cookie):
    url = home_page_url + '/api/collection/dropdown'
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


def collection_add_py(data, cookie=init_cookie):
    url = home_page_url + "/api/collection/add"

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


def collection_updatestatus_py(collection_list, status, cookie=init_cookie):
    """
    更改专辑状态
    :param collection_list:
    :param status: -1 = 删除专辑（非数据库）
    :return:
    """
    exist_collections_id = get_exist_productsid_py()
    if isinstance(collection_list, str) and collection_list == 'all':
        collection_list = exist_collections_id
    elif isinstance(collection_list, int):
        num = collection_list
        collection_list = exist_collections_id[:num]

    url = home_page_url + "/api/collection/updatestatus"
    data = {"collection_ids": collection_list, "status": status}
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


def add_collection_with_conf_py(conf={}, cookie=init_cookie):
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
        data['url'] = '/collections/' + conf['title']
    if 'image' in key_list and conf['image'] == 'yes':
        data['image'] = image
    elif 'images' in key_list and conf['image'] == 'no':
        del data['image']
    else:
        data['image'] = image

    return collection_add_py(data, cookie)['content']['data']['collection_id']


def add_collection_with_pic_py(cookie=init_cookie):
    '''
    添加含封面的专辑
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(collecion_data)
    data['image'] = image

    return collection_add_py(data, cookie)['content']['data']['collection_id']


def add_collection_without_pic_py(cookie=init_cookie):
    '''
    添加不含封面的专辑
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(collecion_data)
    del data['image']

    return collection_add_py(data, cookie)['content']['data']['collection_id']


def del_latest_collection_py(cookie=init_cookie):
    """
    删除最新专辑
    :return: True | False
    """
    collection_updatestatus_py(1, -1, cookie)


def del_latest_collections_py(num, cookie=init_cookie):
    """
    删除最新专辑s
    :param num:
    :param cookie:
    :return:
    """
    collection_updatestatus_py(num, -1, cookie)


def del_all_collections_py(cookie=init_cookie):
    """
    删除全部专辑
    :return: True | False
    """
    collection_updatestatus_py('all', -1, cookie)


def get_all_collections_count_py():
    return collection_dropdown_py({})['content']['data']['total']


def get_latest_collectionid_py():
    query_str = copy.deepcopy(query_list_data)
    collections_list = collection_dropdown_py(query_str)['content']['data']['collections']
    try:
        return int(collections_list[0]['collection_id'])
    except Exception as e:
        return 1


def get_exist_productsid_py():
    query_str = copy.deepcopy(query_list_data)
    collections_list = collection_dropdown_py(query_str)['content']['data']['collections']
    collections_id = []
    for collection in collections_list:
        collections_id.append(collection['collection_id'])
    return collections_id


if __name__ == '__main__':
    # add_collection_without_pic_py()
    print get_all_collections_count_py()
    # del_latest_collection_py()
    # del_all_collections_py()
    # del_latest_collections_py(4)
