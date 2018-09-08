# -*- coding:utf-8 -*-

from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def add_store_info(email="171869092@qq.com", telephone="15220581724", cookie=init_cookie):
    """
    添加店铺基础信息
    :param email: 邮箱
    :param telephone: 电话号码
    :return: True | False
    """
    store_rul = home_page_url + "/api/store/update"
    store_id = getStoreId()
    data = {"address": "",
            "city": "",
            "code": "USD",
            "email": email,
            "hour": -11,
            "icon": {"src": "", "path": ""},
            "meta_description": "null",
            "meta_keyword": "null",
            "meta_title": "home",
            "name": datas_domain,
            "seo_id": 0,
            "service_email": email,
            "store_id": store_id,
            "symbol": "$",
            "symbol_left": "$",
            "symbol_right": "null",
            "telephone": telephone,
            "time_zone": Bj_timeZone,
            "url": "",
            "zip": "",
            "_": ""
            }
    res_data = requests.post(url=store_rul, headers={"cookie": cookie['cookie']}, json=data)
    if res_data.status_code == 200 and json.loads(res_data.content)['state'] == 0:
        return True
    else:
        return False


def getStoreId(cookie=init_cookie):
    store_url = home_page_url + "/api/store/info"
    try:
        res = requests.get(url=store_url, headers={"cookie": cookie['cookie']})
        return json.loads(res.content)['data']['store_id']
    except Exception as e:
        print e


def setBjTimeZone(timezone=None, cookie=init_cookie):
    """
    设置时区 ((GMT + 08:00) 北京，香港，台北，新加坡)
    :param timezone: none 设置北京时区 | 设置 美属萨摩亚时区
    :return:
    """
    store_id = getStoreId()
    if timezone is None:
        time_zone = Bj_timeZone
    else:
        time_zone = My_timeZone
    data = {"address": "", "city": "", "currency": "USD", "email": "171869092@qq.com",
            "icon": {"src": "", "path": ""},
            "name": "chen", "service_email": "171869092@qq.com", "store_id": store_id, "telephone": "15220581724",
            "time_zone": time_zone, "zip": "", "zone_id": "-1"}
    url = home_page_url + "/api/store/update"
    try:
        res = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if res.status_code == 200 and json.loads(res.content)['state'] == 0:
            return True
        else:
            return False
    except Exception as e:
        print e
