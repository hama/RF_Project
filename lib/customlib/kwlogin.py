# -*- coding:utf-8 -*-

import ConfigParser
import copy
import json
import os
import sys
import time

import pymysql
import requests

reload(sys)
sys.setdefaultencoding('utf-8')


def login_py(**data_config):
    """
    公共登陆方法
    :return: dict
    """
    if (data_config):
        home_page_url = data_config['url']
        shop_urn = data_config['shop_urn']
        datas_contact = data_config['contact']
        datas_password = data_config['password']
        datas_domain = data_config['domain']
    else:
        config = ConfigParser.ConfigParser()
        path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
        config.read(path)

        home_page_url = config.get("common_url", "home_page_url")
        shop_urn = config.get("common_urn", "shop_urn")
        datas_contact = config.get("common_account", "datas_contact")
        datas_password = config.get("common_account", "datas_password")
        datas_domain = config.get("common_account", "datas_domain")
    url = home_page_url + "/api/user/login"

    datas = {"contact": datas_contact, "password": datas_password, "username": datas_domain}
    response = requests.post(url=url, headers={}, data=datas)
    if response is None or response.status_code != 200:
        return False
    # uid为店铺id
    uid = json.loads(response.content)['data']['id']
    cookie = '; '.join(['='.join(item) for item in response.cookies.items()])

    # 添加C端cookie值ADMIN1024SESSID
    myshoplaza_url = 'https://' + datas_domain + shop_urn + "/cart/count"
    cookie = set_c_cookie_py(myshoplaza_url, cookie)

    print {"home_page_url": home_page_url, "datas_contact": datas_contact, "datas_password": datas_password,
           "datas_domain": datas_domain}
    print {"cookie": cookie, "uid": uid}
    return {"cookie": cookie, "uid": uid}


def set_c_cookie_py(url, cookie):
    '''
    通过C对端接口，无登录状态，获取cookie值ADMIN1024SESSID
    :return:
    '''
    try:
        response_data = requests.get(url=url)
        cookie = cookie + '; ' + '; '.join(['='.join(item) for item in response_data.cookies.items()])
        return cookie
    except Exception as e:
        return e


def sign_up_py(**data_config):
    '''
    注册
    :return:
    '''
    if (data_config):
        home_page_url = data_config['home_page_url']
        datas_contact = data_config['datas_contact']
        datas_password = data_config['datas_password']
        datas_domain = data_config['datas_domain']
        datas_invite_code = data_config['datas_invite_code']
        validate_signup_py(**data_config)  # 发送验证码
    else:
        config = ConfigParser.ConfigParser()
        path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
        config.read(path)

        home_page_url = config.get("common_url", "home_page_url")
        datas_contact = config.get("common_account", "datas_contact")
        datas_password = config.get("common_account", "datas_password")
        datas_domain = config.get("common_account", "datas_domain")
        datas_invite_code = config.get("common_account", "datas_invite_code")
        validate_signup_py()  # 发送验证码

    url = home_page_url + "/api/user/signup"

    time.sleep(5)
    datas_vcode = get_latest_vcode_fromdb(datas_contact)  # 获取验证码
    print datas_vcode
    time.sleep(5)
    datas = {"contact": datas_contact, "password": datas_password, "username": datas_domain,
             "vcode": datas_vcode, "invite_code": datas_invite_code}
    print datas
    res = requests.post(url=url, headers={}, data=datas)
    if res is None or res.status_code != 200:
        return False
    else:
        return res.content


def validate_signup_py(**data_config):
    '''
    发送验证码
    :param datas:
    :return:
    '''
    if (data_config):
        home_page_url = data_config['home_page_url']
        datas_contact = data_config['datas_contact']
        datas_domain = data_config['datas_domain']
    else:
        config = ConfigParser.ConfigParser()
        path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
        config.read(path)

        home_page_url = config.get("common_url", "home_page_url")
        datas_contact = config.get("common_account", "datas_contact")
        datas_domain = config.get("common_account", "datas_domain")

    url = home_page_url + "/api/user/validate-signup"
    datas = {"contact": datas_contact, "username": datas_domain}
    res = requests.post(url=url, headers={}, data=datas)
    if res is None or res.status_code != 200:
        return False
    else:
        return res.content


def get_latest_vcode_fromdb(contact, **data_config):
    '''
    从数据库获取最新一条验证码
    :param contact:
    :return:
    '''
    if (data_config):
        db_service_config = data_config['db_service_config']
    else:
        config = ConfigParser.ConfigParser()
        path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
        config.read(path)
        db_service_config = config.get("common_db", "db_service_config")

    try:
        db_config = eval(copy.deepcopy(db_service_config))
        conn = pymysql.connect(**db_config)
        curs = conn.cursor()
        sql = "SELECT code FROM user_validate WHERE `contact` = '%s' order by create_time desc limit 1" % (contact)
        curs.execute(sql)
        res = curs.fetchone()[0]
        return res
    except Exception as e:
        print e
    finally:
        conn.close()


def del_user_fromdb(contact, **data_config):
    '''
    删除用户（!!!!!!-----未删除与用户关联的商铺信息，表结构不清晰-----!!!!!!）
    :param contact: 电话号码/邮箱(模糊查询)
    :return:
    '''
    if (data_config):
        db_service_config = data_config['db_service_config']
    else:
        config = ConfigParser.ConfigParser()
        path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
        config.read(path)
        db_service_config = config.get("common_db", "db_service_config")

    # 过滤无效入参
    if len(contact) == 11 and contact.isdigit():
        target = 'cell'
    elif '@autotest.com' in contact:
        target = 'email'
    else:
        return False
    contact = "%" + contact + "%"

    try:
        db_config = eval(copy.deepcopy(db_service_config))
        db_config['cursorclass'] = pymysql.cursors.DictCursor
        conn = pymysql.connect(**db_config)
        curs = conn.cursor()

        select = "SELECT id FROM `USER` WHERE `%s` LIKE '%s'" % (target, contact)
        curs.execute(select)

        for k in curs.fetchall():
            sql_data = "DELETE FROM `user_domain` WHERE userid = %s" % (k['id'])
            curs.execute(sql_data)

        sql = "DELETE  FROM user_validate WHERE `contact` LIKE '%s'" % (contact)
        sql_ = "DELETE  FROM user WHERE `%s` LIKE '%s'" % (target, contact)
        curs.execute(sql)
        curs.execute(sql_)
        conn.commit()
        return True
    except Exception as e:
        print e
    finally:
        conn.close()
