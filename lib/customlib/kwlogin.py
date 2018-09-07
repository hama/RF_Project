# -*- coding:utf-8 -*-

import ConfigParser
import json
import os
import sys

import requests

reload(sys)
sys.setdefaultencoding('utf-8')


def login(**login_conf):
    """
    公共登陆方法
    :return: dict
    """
    if (login_conf):
        home_page_url = login_conf['url']
        datas_contact = login_conf['contact']
        datas_password = login_conf['password']
        datas_domain = login_conf['username']
    else:
        config = ConfigParser.ConfigParser()
        path = os.path.join(os.path.dirname(__file__), '../..') + '/config/common.ini'
        config.read(path)

        home_page_url = config.get("common_url", "home_page_url")
        datas_contact = config.get("common_account", "datas_contact")
        datas_password = config.get("common_account", "datas_password")
        datas_domain = config.get("common_account", "datas_domain")

    x_url = home_page_url + "/api/user/login"

    datas = {"contact": datas_contact, "password": datas_password, "username": datas_domain}
    res = requests.post(url=x_url, headers={}, data=datas)
    if res is None or res.status_code != 200:
        return False
    # uid为店铺id
    uid = json.loads(res.content)['data']['id']
    cookie = '; '.join(['='.join(item) for item in res.cookies.items()])
    print {"cookie": cookie, "uid": uid}
    return {"cookie": cookie, "uid": uid}
