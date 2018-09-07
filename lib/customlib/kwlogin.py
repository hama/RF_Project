# -*- coding:utf-8 -*-

import copy
import time

import pymysql
import requests

from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def login():
    """
    公共登陆方法
    :return: dict
    """
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


def sign_up():
    '''
    注册
    :return:
    '''
    x_url = home_page_url + "/api/user/signup"
    validate_signup(None)  # 发送验证码
    time.sleep(5)
    datas_vcode = get_latest_vcode_fromdb(datas_contact).encode("utf-8")  # 获取验证码
    time.sleep(5)
    datas = {"contact": datas_contact, "password": datas_password, "username": datas_domain,
             "vcode": datas_vcode, "invite_code": datas_invite_code}
    print datas
    res = requests.post(url=x_url, headers={}, data=datas)
    if res is None or res.status_code != 200:
        return False
    else:
        return res.content


def validate_signup(datas):
    '''
    发送验证码
    :param datas:
    :return:
    '''
    x_url = home_page_url + "/api/user/validate-signup"
    if datas is None:
        datas = {"contact": datas_contact, "username": datas_domain}
        print datas
    res = requests.post(url=x_url, headers={}, data=datas)
    if res is None or res.status_code != 200:
        return False
    else:
        return res.content


def get_latest_vcode_fromdb(contact):
    '''
    从数据库获取最新一条验证码
    :param contact:
    :return:
    '''
    try:
        db_config = copy.deepcopy(db_service_config)
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


def del_user_fromdb(contact):
    '''
    删除用户（!!!!!!-----未删除与用户关联的商铺信息，表结构不清晰-----!!!!!!）
    :param contact: 电话号码/邮箱(模糊查询)
    :return:
    '''
    # 过滤无效入参
    if len(contact) == 11 and contact.isdigit():
        target = 'cell'
    elif '@abctest.com' in contact:
        target = 'email'
    else:
        return False
    contact = "%" + contact + "%"

    try:
        db_config = copy.deepcopy(db_service_config)
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
