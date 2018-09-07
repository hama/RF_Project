# -*- coding:utf-8 -*-

import requests

from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def getCollectionId(index):
    p_url = home_page_url + "/api/collection/dropdown?page=0&limit=10&key="
    sub_list = requests.get(url=p_url, headers={"cookie": cookie['cookie']})
    res_data = json.loads(sub_list.content)['data']['collections']
    index = int(index)

    res_list = []
    for i in res_data:
        res_list.append(i['collection_id'])

    return res_list[index]
