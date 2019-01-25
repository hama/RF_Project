# -*- coding:utf-8 -*-

import ConfigParser
import copy
import json
import os
import sys
import time

import pymysql
import requests
from bs4 import BeautifulSoup

reload(sys)
sys.setdefaultencoding('utf-8')


class Login():
    ROBOT_LIBRARY_SCOPE = 'Global'

    def __init__(self, **data_config):

        config = ConfigParser.ConfigParser()
        path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
        config.read(path)

        self.login_url = config.get("common_url", "login_url")
        self.shop_urn = config.get("common_urn", "shop_urn")
        self.home_urn = config.get("common_urn", "home_urn")
        self.contact = config.get("common_account", "contact")
        self.password = config.get("common_account", "password")
        self.domain = config.get("common_account", "domain")
        self.invite_code = config.get("common_account", "invite_code")
        self.db_service_config = config.get("common_db", "db_service_config")
        self.home_page_url = 'https://' + self.domain + self.home_urn
        self.myshoplaza_url = 'https://' + self.domain + self.shop_urn

        key_list = data_config.keys()
        if 'login_url' in key_list:
            self.login_url = data_config['login_url']
        if 'home_page_url' in key_list:
            self.home_page_url = data_config['home_page_url']
        if 'myshoplaza_url' in key_list:
            self.myshoplaza_url = data_config['myshoplaza_url']
        if 'shop_urn' in key_list:
            self.shop_urn = data_config['shop_urn']
        if 'home_urn' in key_list:
            self.home_urn = data_config['home_urn']
        if 'contact' in key_list:
            self.contact = data_config['contact']
        if 'password' in key_list:
            self.password = data_config['password']
        if 'domain' in key_list:
            self.domain = data_config['domain']
        if 'invite_code' in key_list:
            self.invite_code = data_config['invite_code']
        if 'db_service_config' in key_list:
            self.db_service_config = data_config['db_service_config']

    def login_b_py(self, **data_config):
        """
        公共登陆方法
        :return: dict
        """
        headers = {"Content-Type": "application/json"}
        data = self.create_data(**data_config)
        print data
        url0 = data['login_url'] + "/api/user/actions/login"

        datas = {"contact": data['contact'], "password": data['password'], "domain": data['domain']}
        response_data0 = requests.post(url=url0, headers=headers, data=json.dumps(datas))
        redirect = response_data0.headers['x-redirect']
        url1 = data['login_url'] + redirect
        response_data1 = requests.get(url=url1, headers=headers)
        code = BeautifulSoup(response_data1.text, "html.parser").img["src"].split("code=")[1]
        url2 = '{}/api/servicelogin?code={}'.format(data['home_page_url'], code)
        response_data = requests.get(url=url2, headers=headers)

        if response_data is None or response_data.status_code != 200:
            return False
        # uid为店铺id
        # uid = json.loads(response_data.content)['data']['id']
        cookie = '; '.join(['='.join(item) for item in response_data.cookies.items()])

        print "login_data:" + str({"url": data['home_page_url'], "contact": data['contact'],
                                   "password": data['password'],
                                   "username": data['domain']})
        print "login_b_cookie:" + str(cookie)
        return cookie

    def login_c_py(self, **data_config):
        """
        通过C对端接口，无登录状态，获取cookie值ADMIN1024SESSID
        :return:
        """
        data = self.create_data(**data_config)
        url = 'https://' + data['domain'] + data['shop_urn'] + "/cart/count"
        response_data = requests.get(url=url)
        cookie = '; '.join(['='.join(item) for item in response_data.cookies.items()])
        print "login_c_cookie:" + str(cookie)
        return cookie

    def sign_up_py(self, **data_config):
        """
        注册
        :return:
        """
        headers = {"Content-Type": "application/json"}
        data = self.create_data(**data_config)
        self.validate_signup_py(**data_config)

        url = data['login_url'] + "/api/user/signup"

        time.sleep(5)
        datas_vcode = self.get_latest_vcode_fromdb(data['contact'])  # 获取验证码
        time.sleep(5)
        datas = {"contact": data['contact'], "password": data['password'], "username": data['domain'],
                 "vcode": datas_vcode, "invite_code": data['invite_code']}
        print "sign_up_data:" + str(datas)
        response_data = requests.post(url=url, headers=headers, data=datas)
        if response_data is None or response_data.status_code != 200:
            return False
        else:
            return response_data.content

    def validate_signup_py(self, **data_config):
        """
        发送验证码
        :param datas:
        :return:
        """
        headers = {"Content-Type": "application/json"}
        data = self.create_data(**data_config)
        url = data['login_url'] + "/api/user/actions/validate-signup"
        datas = {"contact": data['contact']}
        response_data = requests.post(url=url, headers=headers, data=datas)
        # print "validate_signup_py:" + str(datas)
        # print "/api/user/validate-signup: "+response_data.content
        if response_data is None or response_data.status_code != 200:
            return False
        else:
            return response_data.content

    def get_latest_vcode_fromdb(self, contact, **data_config):
        """
        从数据库获取最新一条验证码
        :param contact:
        :return:
        """
        data = self.create_data(**data_config)
        try:
            db_config = eval(copy.deepcopy(data['db_service_config']))
            print "db_config_data:" + str(db_config)
            db_config['connect_timeout'] = 30
            conn = pymysql.connect(**db_config)
            # print "get_latest_vcode_fromdb: "+str(conn)
            curs = conn.cursor()
            sql = "SELECT code FROM user_validate WHERE `contact` = '%s' order by create_time desc limit 1" % (contact)
            curs.execute(sql)
            res = curs.fetchone()[0]
            return res
        except Exception as e:
            print e
        finally:
            conn.close()

    def create_data(self, **data_config):
        key_list = data_config.keys()
        data = {}
        if 'login_url' in key_list:
            data['login_url'] = data_config['login_url']
        else:
            data['login_url'] = self.login_url
        if 'home_page_url' in key_list:
            data['home_page_url'] = data_config['home_page_url']
        else:
            data['home_page_url'] = self.home_page_url
        if 'myshoplaza_url' in key_list:
            data['myshoplaza_url'] = data_config['myshoplaza_url']
        else:
            data['myshoplaza_url'] = self.myshoplaza_url
        if 'shop_urn' in key_list:
            data['shop_urn'] = data_config['shop_urn']
        else:
            data['shop_urn'] = self.shop_urn
        if 'home_urn' in key_list:
            data['home_urn'] = data_config['home_urn']
        else:
            data['home_urn'] = self.home_urn
        if 'contact' in key_list:
            data['contact'] = data_config['contact']
        else:
            data['contact'] = self.contact
        if 'password' in key_list:
            data['password'] = data_config['password']
        else:
            data['password'] = self.password
        if 'domain' in key_list:
            data['domain'] = data_config['domain']
        else:
            data['domain'] = self.domain
        if 'invite_code' in key_list:
            data['invite_code'] = data_config['invite_code']
        else:
            data['invite_code'] = self.invite_code
        if 'db_service_config' in key_list:
            data['db_service_config'] = data_config['db_service_config']
        else:
            data['db_service_config'] = self.db_service_config
        return data

    # 自动化不从数据库中删除数据
    # def del_user_fromdb(contact, **data_config):
    #     """
    #     删除用户（!!!!!!-----未删除与用户关联的商铺信息，表结构不清晰-----!!!!!!）
    #     :param contact: 电话号码/邮箱(模糊查询)
    #     :return:
    #     """
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

if __name__ == '__main__':
    # change_themes_by_index_py(1)
    login = Login()
    # print login.login_b_py()
    print login.sign_up_py()