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


class Login():

    def __init__(self, **data_config):

        config = ConfigParser.ConfigParser()
        path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
        config.read(path)

        self.home_page_url = config.get("common_url", "home_page_url")
        self.shop_urn = config.get("common_urn", "shop_urn")
        self.datas_contact = config.get("common_account", "datas_contact")
        self.datas_password = config.get("common_account", "datas_password")
        self.datas_domain = config.get("common_account", "datas_domain")
        self.datas_invite_code = config.get("common_account", "datas_invite_code")
        self.db_service_config = config.get("common_db", "db_service_config")

        key_list = data_config.keys()
        if 'home_page_url' in key_list:
            self.home_page_url = data_config['home_page_url']
        if 'shop_urn' in key_list:
            self.shop_urn = data_config['shop_urn']
        if 'contact' in key_list:
            self.datas_contact = data_config['contact']
        if 'password' in key_list:
            self.datas_password = data_config['password']
        if 'domain' in key_list:
            self.datas_domain = data_config['domain']
        if 'datas_invite_code' in key_list:
            self.datas_invite_code = data_config['datas_invite_code']
        if 'db_service_config' in key_list:
            self.db_service_config = data_config['db_service_config']

    def login_b_py(self):
        """
        公共登陆方法
        :return: dict
        """
        url = self.home_page_url + "/api/user/login"

        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_domain}
        response_data = requests.post(url=url, headers={}, data=datas)
        if response_data is None or response_data.status_code != 200:
            return False
        # uid为店铺id
        uid = json.loads(response_data.content)['data']['id']
        cookie = '; '.join(['='.join(item) for item in response_data.cookies.items()])

        print "login_data:" + str({"url": self.home_page_url, "contact": self.datas_contact,
                                   "password": self.datas_password,
                                   "username": self.datas_domain, "uid": uid})
        print "login_b_cookie:" + str(cookie)
        return cookie

    def login_c_py(self):
        '''
        通过C对端接口，无登录状态，获取cookie值ADMIN1024SESSID
        :return:
        '''
        url = 'https://' + self.datas_domain + self.shop_urn + "/cart/count"
        response_data = requests.get(url=url)
        cookie = '; '.join(['='.join(item) for item in response_data.cookies.items()])
        print "login_c_cookie:" + str(cookie)
        return cookie

    def sign_up_py(self):
        '''
        注册
        :return:
        '''
        self.validate_signup_py()

        url = self.home_page_url + "/api/user/signup"

        time.sleep(5)
        datas_vcode = self.get_latest_vcode_fromdb(self.datas_contact)  # 获取验证码
        time.sleep(5)
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_domain,
                 "vcode": datas_vcode, "invite_code": self.datas_invite_code}
        print "sign_up_data:" + str(datas)
        response_data = requests.post(url=url, headers={}, data=datas)
        if response_data is None or response_data.status_code != 200:
            return False
        else:
            return response_data.content

    def validate_signup_py(self):
        '''
        发送验证码
        :param datas:
        :return:
        '''

        url = self.home_page_url + "/api/user/validate-signup"
        datas = {"contact": self.datas_contact, "username": self.datas_domain}
        response_data = requests.post(url=url, headers={}, data=datas)
        if response_data is None or response_data.status_code != 200:
            return False
        else:
            return response_data.content

    def get_latest_vcode_fromdb(self, contact):
        '''
        从数据库获取最新一条验证码
        :param contact:
        :return:
        '''
        try:
            db_config = eval(copy.deepcopy(self.db_service_config))
            print "db_config_data:" + str(db_config)
            db_config['connect_timeout'] = 30
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

    # 自动化不从数据库中删除数据
    # def del_user_fromdb(contact, **data_config):
    #     '''
    #     删除用户（!!!!!!-----未删除与用户关联的商铺信息，表结构不清晰-----!!!!!!）
    #     :param contact: 电话号码/邮箱(模糊查询)
    #     :return:
    #     '''
    #     if (data_config):
    #         db_service_config = data_config['db_service_config']
    #     else:
    #         config = ConfigParser.ConfigParser()
    #         path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
    #         config.read(path)
    #         db_service_config = config.get("common_db", "db_service_config")
    #
    #     # 过滤无效入参
    #     if len(contact) == 11 and contact.isdigit():
    #         target = 'cell'
    #     elif '@autotest.com' in contact:
    #         target = 'email'
    #     else:
    #         return False
    #     contact = "%" + contact + "%"
    #
    #     try:
    #         db_config = eval(copy.deepcopy(db_service_config))
    #         db_config['cursorclass'] = pymysql.cursors.DictCursor
    #         conn = pymysql.connect(**db_config)
    #         curs = conn.cursor()
    #
    #         select = "SELECT id FROM `USER` WHERE `%s` LIKE '%s'" % (target, contact)
    #         curs.execute(select)
    #
    #         for k in curs.fetchall():
    #             sql_data = "DELETE FROM `user_domain` WHERE userid = %s" % (k['id'])
    #             curs.execute(sql_data)
    #
    #         sql = "DELETE  FROM user_validate WHERE `contact` LIKE '%s'" % (contact)
    #         sql_ = "DELETE  FROM user WHERE `%s` LIKE '%s'" % (target, contact)
    #         curs.execute(sql)
    #         curs.execute(sql_)
    #         conn.commit()
    #         return True
    #     except Exception as e:
    #         print e
    #     finally:
    #         conn.close()
