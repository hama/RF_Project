# -*- coding:utf-8 -*-

from variable import *
from lib_utils import *

reload(sys)
sys.setdefaultencoding('utf-8')


def add_store_info_py(email="171869092@qq.com", telephone="15220581724", cookie=init_cookie):
    """
    添加店铺基础信息
    :param email: 邮箱
    :param telephone: 电话号码
    :return: True | False
    """
    store_rul = home_page_url + "/api/store/update"
    store_id = getStoreId_py()
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


def getStoreId_py(cookie=init_cookie):
    store_url = home_page_url + "/api/store/info"
    try:
        res = requests.get(url=store_url, headers={"cookie": cookie['cookie']})
        return json.loads(res.content)['data']['store_id']
    except Exception as e:
        print e


def setBjTimeZone_py(timezone=None, cookie=init_cookie):
    """
    设置时区 ((GMT + 08:00) 北京，香港，台北，新加坡)
    :param timezone: none 设置北京时区 | 设置 美属萨摩亚时区
    :return:
    """
    store_id = getStoreId_py()
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

def get_store_name():
    """
    获取店铺名称
    :return String
    """
    return datas_domain

def add_upfiles(cookie=init_cookie):
    xesurl = [
        "https://cdn.shoplazza.com/8679b2d0ef7e8fdfc40d55ea7cb3afaf.jpg",
        "https://cn.cdn.shoplazza.com/9ea1104b6d57568f7cbdc26acceac636_120x.png",
        "https://cn.cdn.shoplazza.com/903ac3fb9874d0205a4f57b5d8d8fc83_120x.jpg",
        "https://cn.cdn.shoplazza.com/cc4e7e3cf5c2c74015aa066ccb3a749e_120x.jpg",
        "https://cn.cdn.shoplazza.com/9a584cee9dafe895db37690b4a496b0c_120x.jpg",
        "https://cn.cdn.shoplazza.com/1ffeeee8db55923fcaa6d5335c100b72_120x.jpg",
        "https://cn.cdn.shoplazza.com/6e44a173114571839369ea8fb6bfb051_120x.jpg",
        "https://cn.cdn.shoplazza.com/d3791dc515f331dd3e2f8fa4a8ecead9_120x.jpg",
        "https://cn.cdn.shoplazza.com/86e0e2c52f93f8d6379fc0afa32b533d_120x.jpg",
        "https://cn.cdn.shoplazza.com/f30f237f5f503af0dd2065c73d14b5b1_120x.jpg",
        "https://cn.cdn.shoplazza.com/805560f8f588fc3cb1a51c624c9bfdef_120x.jpg",
        "https://cn.cdn.shoplazza.com/ebb8ae40c06dbe63b1289c401b4113ce_120x.jpg",
        "https://cn.cdn.shoplazza.com/e2dbf39279e4288e26e99b6c5dbabf18_120x.jpg",
        "https://cn.cdn.shoplazza.com/4c886309601369614a6076cc3498d28a_120x.jpg",
        "https://cn.cdn.shoplazza.com/fd1c540b3b98847715d50b9f6a56e2f0_120x.jpg",
        "https://cn.cdn.shoplazza.com/596ef100dd32994d6a4ee264e24d87cc_120x.jpg",
        "https://cn.cdn.shoplazza.com/a9084264810d94098af65f1865346dfe_120x.jpg",
        "https://cn.cdn.shoplazza.com/602b1740a95bc6c366363e872ae97ad3_120x.jpg",
        "https://cn.cdn.shoplazza.com/ec25f527fcfdf30b124643a6759d47ee_120x.jpg",
        "https://cn.cdn.shoplazza.com/cbab6ecbf32e609792da070f8db55ace_120x.jpg",
        "https://cn.cdn.shoplazza.com/50e771d94fd585bedf8f4a72e8cf2a87_120x.jpg",
        "https://cn.cdn.shoplazza.com/cd82c3da6fa3236a48ea121cfe29df29_120x.jpg",
        "https://cn.cdn.shoplazza.com/b5667f5cac43201c5a5ed870742372bc_120x.jpg",
        "https://cn.cdn.shoplazza.com/dd671e14dba3e69b9113f809328b3ec6_120x.jpg",
        "https://cn.cdn.shoplazza.com/258b68775fecc850f9b0e7e084b46875_120x.jpg",
        "https://cn.cdn.shoplazza.com/3c016ae12683eb95c63f5f093029efa3_120x.jpg",
        "https://cn.cdn.shoplazza.com/c7f736b2dfb0a0faf1599b77147ef211_120x.jpg",
        "https://cn.cdn.shoplazza.com/1e084889e40972c7aff4733fcf504eb8_120x.jpg",
        "https://cn.cdn.shoplazza.com/9de2e3e7a6b1d361f3598b492d743c50_120x.jpg",
        "https://cn.cdn.shoplazza.com/27f82e94807b3bc652c2a8fa2c6e64de_120x.jpg"
    ]
    try:
        for x in xesurl:
            img = upload_oss_py(x)
            res_url = home_page_url + "/api/file/info"
            data = {"filename":"aa","folder":"product","height":"1125","size":img[1],"type":"image/jpeg","url":img[0],"width":"750"}
            xx = requests.post(url=res_url,headers={"cookie":cookie['cookie']},json=data)
            print xx.text
            if xx.status_code != 200:
                return False
        return True
    except Exception as e:
        print e
        return False

def del_upfiles(cookie=init_cookie):
    
    del_url = home_page_url + "/api/file/remove"
    res_list = []
    lst_url = home_page_url + "/api/file/list?folder=product&page=1&limit=50"
    #.请求列表的数据
    new_str = ""
    res = requests.get(url=lst_url,headers={"cookie":cookie['cookie']})
    for x in json.loads(res.content)['data']:
        # res_list.append(str(x['path']))
        new_str += str(x['path']) + ","
    #.请求删除接口
    try:
        res_data = requests.post(url=del_url,headers={"cookie":cookie['cookie']},json={"path":new_str})
        if json.loads(res_data.content)['state'] != 0:
            return False
        return True
    except Exception as e:
        print e
        return False