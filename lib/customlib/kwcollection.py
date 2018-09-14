# -*- coding:utf-8 -*-

from variable import *
from raw_data import *

reload(sys)
sys.setdefaultencoding('utf-8')


def getCollectionId_py(index, cookie=init_cookie):
    p_url = home_page_url + "/api/collection/dropdown?page=0&limit=10&key="
    sub_list = requests.get(url=p_url, headers={"cookie": cookie['cookie']})
    res_data = json.loads(sub_list.content)['data']['collections']
    index = int(index)

    res_list = []
    for i in res_data:
        res_list.append(i['collection_id'])

    return res_list[index]


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