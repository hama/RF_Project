# -*- coding:utf-8 -*-

from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def collection_dropdown_py(api='/api/collection/dropdown?page=0&limit=20&key=', cookie=init_cookie):
    """
    公共获取collection数据方法
    :param p_url: url
    :return: dict
    """
    p_url = home_page_url + api
    ret_data = requests.get(url=p_url, headers={"cookie": cookie['cookie']})
    return ret_data.content


def add_collection_py(data, cookie=init_cookie):
    url = home_page_url + "/api/collection/add"

    try:
        resData = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if resData.status_code == 200 and json.loads(resData.content)['state'] == 0:
            return True
        else:
            return False

    except Exception as e:
        return e


def collection_updatestatus_py(collection_list, status, cookie=init_cookie):
    """
    更改专辑状态
    :param collection_list:
    :param status: -1 = 删除专辑（非数据库）
    :return:
    """
    latest_collection_id = get_latest_collectionid_py()
    if isinstance(collection_list, str) and collection_list == 'all':
        collection_list = range(1, latest_collection_id + 1)
    elif isinstance(collection_list, int):
        num = collection_list
        collection_list = range(latest_collection_id + 1 - num, latest_collection_id + 1)
    collection_list = map(str, collection_list)

    url = home_page_url + "/api/collection/updatestatus"
    data = {"collection_ids": collection_list, "status": status}
    try:
        resData = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if resData.status_code == 200 and json.loads(resData.content)['state'] == 0:
            return True
        else:
            return False

    except Exception as e:
        return e


def add_collection_with_conf_py(conf, cookie=init_cookie):
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

    add_collection_py(data, cookie)


def add_collection_with_pic_py(cookie=init_cookie):
    '''
    添加含封面的专辑
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(collecion_data)
    data['image'] = image

    add_collection_py(data, cookie)


def add_collection_without_pic_py(cookie=init_cookie):
    '''
    添加不含封面的专辑
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(collecion_data)
    del data['image']

    add_collection_py(data, cookie)


def del_first_collection_py(cookie=init_cookie):
    """
    删除首个专辑
    :return: True | False
    """
    collection_updatestatus_py(1, -1, cookie)


def del_latest_collection_py(num, cookie=init_cookie):
    """
    删除最新专辑
    :param num:
    :param cookie:
    :return:
    """
    collection_updatestatus_py(num, -1, cookie)


def del_all_collection_py(cookie=init_cookie):
    """
    删除全部专辑
    :return: True | False
    """
    collection_updatestatus_py('all', -1, cookie)


def get_latest_collectionid_py():
    collections_list = json.loads(collection_dropdown_py())['data']['collections']
    try:
        return int(collections_list[0]['collection_id'])
    except Exception as e:
        return 1


if __name__ == '__main__':
    # add_collection_without_pic_py()
    add_collection_with_pic_py()
    # del_first_collection_py()
