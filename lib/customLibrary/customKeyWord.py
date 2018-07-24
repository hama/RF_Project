# -*- coding:utf-8 -*-
import pymysql
import random
import json
import sys
import re
import os
import requests
import time
import argparse
import ConfigParser

reload(sys)
sys.setdefaultencoding('utf-8')


class keyWord(object):
    ROBOT_LIBRARY_SCOPE = "GLOBAL"
    host = "rm-wz9tz4ff2v9t95f9qao.mysql.rds.aliyuncs.com"
    uname = "app"
    pwd = "8rEdunuH@Fe+"
    port = 3306
    dbname = "service"
    str = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    save_str = ""

    rec_email = "ZPiX3lY@g0yP.com"
    rec_keywork = "dianjiang_reset_password"
    db_hotst = "39.108.94.30"
    db_uname = "lansejiebo"
    db_pwd = "lansejiebo@123"
    db_name = "shop_"


    def __init__(self):
        config = ConfigParser.ConfigParser()
        path = os.path.join( os.path.dirname(__file__),'../..')+ '/config/common.ini'
        config.read(path)
        # self.loc = locals()
        self.home_page_url = config.get("common_url", "home_page_url")
        self.datas_contact = config.get("common_account", "datas_contact")
        self.datas_password = config.get("common_account", "datas_password")
        self.datas_username = config.get("common_account", "datas_username")
        self.datas_invite_code = config.get("common_account", "datas_invite_code")

    #.公共登陆方法
    def Login(self,paramts=False):
        x_url = self.home_page_url + "/api/user/login"
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url,headers={},data=datas)
        if res is None or res.status_code != 200:
            return False
        uid = json.loads(res.content)['data']['id']
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])
        if paramts:
            return {"cookie": cookiesx, "uid": uid}
        else:
            return cookiesx


    #.公共获取数据方法
    def commonGetData(self,p_url=''):
        if not p_url:
            p_url = self.home_page_url + "/api/product/search?page=0&limit=20"
        cookiesx = self.Login()
        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        return res_data

    def mykeyword(self, url):
        return url

    def salt(self):
        str = self.str
        newstr = []
        for x in range(7):
            newstr.append(random.choice(str))
            salt = ''.join(newstr)
        saltList = list(salt)
        if saltList[0] in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']:
            saltList[0] = "X"
        salt = ''.join(saltList)

        return salt

    def createStr(self):
        salt = self.salt()
        laststr = []
        for z in range(4):
            laststr.append(random.choice(self.str))
            em = ''.join(laststr)
        emails = "%s@%s.com" % (salt, em)
        self.save_str = emails
        return emails

    # 从数据库获取第一条验证码
    def get_db_verification_code(self, args):
        try:
            conn = pymysql.connect(host=self.host, user=self.uname, password=self.pwd, db=self.dbname, charset="utf8",
                                   port=self.port)
            curs = conn.cursor()
            sql = "SELECT code FROM user_validate WHERE `contact` = '%s' order by create_time desc limit 1" % (args)
            curs.execute(sql)
            res = curs.fetchone()[0]
            return res
        except Exception as e:
            print e

    def selectCodesPwd(self, args):
        try:
            conn = pymysql.connect(host=self.host, user=self.uname, password=self.pwd, db=self.dbname, charset="utf8",
                                   port=self.port)
            curs = conn.cursor()
            sql = "SELECT code FROM user_validate WHERE `contact` = '%s' AND `usage` = '%s'" % (args, self.rec_keywork)

            curs.execute(sql)
            res = curs.fetchone()[0]
            return res
        except Exception as e:
            print e
            # exit()

    def selectProduct(self):
        res_data = self.commonGetData()
        res_list = []
        for i in res_data:
            res_list.append(i['title'])
        return res_list
    def getResult(self, args):
        args = args.encode('unicode-escape').decode('string_escape')
        data = self.selectProduct()
        new_list = []
        for x in data:
            res_str = x.encode('unicode-escape').decode('string_escape')
            res_str = res_str.strip()
            new_list.append(res_str)

        if args in new_list:
            return True
        else:
            return False

    def searchStr(self, args):
        str_ = str(args)
        restr = re.search('\d', str_).group()
        return restr

    def searchStrs(self, args):
        str_ = str(args)
        restr = re.search('\d+', str_).group()
        return restr

    def order_list_str(self, args):
        str_ = str(args)

        restr = re.findall('\d+', str_)
        timelist = ['05', '31']
        for i in timelist:
            if i in restr:
                return True
            else:
                return False

    def order_list_maxmonth_check(self, max, min):
        if max is None or min is None:
            return False
        maxstr_ = str(max)
        minstr_ = str(min)
        re_max = re.findall(r'-(\d+)', maxstr_)
        re_min = re.findall(r'-(\d+)', minstr_)

        if int(re_max[0]) - int(re_min[0]) > 3:
            return False
        else:
            return True



    def remove_user(self, args):
        if args is None:
            return False
        try:
            conn = pymysql.connect(host=self.host, user=self.uname, password=self.pwd, db=self.dbname, charset="utf8",
                                   port=self.port, cursorclass=pymysql.cursors.DictCursor)
            curs = conn.cursor()
            select = "SELECT id FROM `USER` WHERE `cell`= '%s'" % (args)
            curs.execute(select)

            for k in curs.fetchall():
                sql_data = "DELETE FROM `user_domain` WHERE userid = %s" % (k['id'])
                curs.execute(sql_data)

            sql = "DELETE  FROM user_validate WHERE `contact` = '%s'" % (args)
            sql_ = "DELETE  FROM user WHERE `cell` = '%s'" % (args)
            curs.execute(sql)
            curs.execute(sql_)
            conn.commit()
            return True
        except Exception as e:
            print e

    def dictTest(self, **dict_):
        print type(dict_)
        return dict_

    def time(self, args):
        import time

        # 转换成时间数组
        timeArray = time.strptime(args, "%Y-%m-%d %H:%M:%S")
        # 转换成时间戳
        timestamp = time.mktime(timeArray)

        return timestamp

    def getProductCount(self):
        arr = self.selectProduct()
        if arr:
            return len(arr)
        else:
            return 0

    def getFirstProductQuantity(self):
        res_data = self.commonGetData()
        res_list = []
        for i in res_data:
            res_list.append(i['inventory_quantity'])
        return res_list[0]

    def getFirstProductTitle(self):
        res_data = self.commonGetData()
        res_list = []
        for i in res_data:
            res_list.append(i['title'])
        return res_list[0]

    def getProductStatus(self, arg):
        res_data = self.commonGetData()
        res_list = []
        for i in res_data:
            res_list.append(i['status'])

        arg = int(arg)
        return res_list[arg]

    def getProductSku(self, arg):
        res_data = self.commonGetData()
        res_list = []
        for i in res_data:
            res_list.append(i['variants'][0]['sku'])

        arg = int(arg)

        if res_list[arg] == '':
            return -1

        return res_list[arg]

    def selectProductCountByStatus(self, arg):
        if arg:
            arg = int(arg)
        else:
            return 0
        p_url = self.home_page_url + "/api/product/search?status=" + str(arg) + "&page=0&limit=20"
        res_data = self.commonGetData(p_url)
        res_list = []
        for i in res_data:
            res_list.append(i['title'])

        return len(res_list)

    def getProductTagsLength(self, arg):
        res_data = self.commonGetData()
        res_list = []
        t = -1
        for i in res_data:
            t = t + 1
            res_list.append(len(i['tags']))

        arg = int(arg)
        return res_list[arg]
    #.删除商品
    def delFirstProduct(self):
        try:
            cookie = self.Login(True)
            resConn = pymysql.connect(host=self.db_hotst,user=self.db_uname,password=self.db_pwd,db=self.db_name +
                                                                                                    str(cookie['uid']),
                                      charset="utf8",port=self.port,cursorclass=pymysql.cursors.DictCursor)
            curs = resConn.cursor()
            SQL = "SELECT (product_id) FROM `product` order by product_id desc"
            curs.execute(SQL)
            sub = curs.fetchone()['product_id']
            del_url = self.home_page_url + "/api/product/updatestatus"
            del_data = {"product_ids":[str(sub)],"status":-1}
            result = requests.post(url=del_url,headers={'cookie':cookie['cookie']},json=del_data)
            if json.loads(result.content)['state']== 0:
                return True
            else:
                return False
        except Exception as e:
            print e
    #.删除支付方式 paylinks
    def delPaymentPk(self):
        try:
            cookie = self.Login(True)
            del_url = self.home_page_url + "/api/payment/method"
            del_data = {"payment_method":"credit_card","method_is_enable":0}
            res = requests.post(url=del_url,headers={"cookie":cookie},json=del_data)
            if json.loads(res.content)['state'] == 0:
                return True
            else:
                return False
        except Exception as e:
            print e

    # .删除支付方式 paylinks
    def delPaymentCod(self):
        try:
            cookie = self.Login()
            del_url = self.home_page_url + "/api/payment/method"
            del_data = {"payment_method":"cod","method_is_enable":0}
            res = requests.post(url=del_url, headers={"cookie": cookie}, json=del_data)
            if json.loads(res.content)['state'] == 0:
                return True
            else:
                return False
        except Exception as e:
            print e

    # .删除物流方式
    def delShipping(self):
        try:
            cookie = self.Login(True)
            resConn = pymysql.connect(host=self.db_hotst, user=self.db_uname, password=self.db_pwd,
                                      db=self.db_name +
                                         str(cookie[
                                                 'uid']),
                                      charset="utf8", port=self.port, cursorclass=pymysql.cursors.DictCursor)
            curs = resConn.cursor()
            SQL = "select id from shipping where id<>1 order by date_added desc"
            curs.execute(SQL)
            sub = curs.fetchone()['id']
            del_url = self.home_page_url + "/api/shipping/refresh"
            del_data = {"shipping_id":sub,"is_enable":0}
            res = requests.post(url=del_url, headers={"cookie": cookie}, json=del_data)
            if json.loads(res.content)['state'] == 0:
                return True
            else:
                return False
        except Exception as e:
            print e

    def getAllProductCount(self):
        p_url = self.home_page_url + "/api/product/search"
        cookiesx = self.Login()
        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        total = json.loads(sub_list.content)['data']['total']

        return total

    def pageCount(self, total, size):
        total = int(total)
        size = int(size)

        if total % size == 0:
            page = total / size
        else:
            page = (total / size) + 1

        return page

    def validateProductByPageAndSize(self, page, size):
        p_url = self.home_page_url + "/api/product/search?page=" + str(page) + "&limit=" + str(size)
        res_data = self.commonGetData(p_url)
        res_list = []
        for i in res_data:
            res_list.append(i['title'])
        return res_list

    def getCollectionId(self, index):
        p_url = self.home_page_url + "/api/collection/dropdown?page=0&limit=10&key="
        cookiesx = self.Login()
        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['collections']
        index = int(index)

        res_list = []
        for i in res_data:
            res_list.append(i['collection_id'])

        return res_list[index]

    def getImgName(self, img):
        regx = r'\/(\S+)\_'
        data = re.compile(regx)
        img_name = data.findall(img, re.M)

        return img_name[0]

    def getImgName2(self, img):
        regx = r'\/(\S+)\.'
        data = re.compile(regx)
        img_name = data.findall(img, re.M)
        return img_name[0]

    # 注册
    def sign_up(self,datas):
        x_url = self.home_page_url + "/api/user/signup"
        if datas is None:
            self.validate_signup(None)      # 发送验证码
            time.sleep(5)
            datas_vcode = self.get_db_verification_code(self.datas_contact).encode("utf-8")      # 获取验证码
            time.sleep(5)
            datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username,"vcode": datas_vcode,"invite_code": self.datas_invite_code}
            print datas
        res = requests.post(url=x_url,headers={},data=datas)
        if res is None or res.status_code != 200:
            return False
        else:
            return res.content

    # 发送验证码
    def validate_signup(self,datas):
        x_url = self.home_page_url + "/api/user/validate-signup"
        if datas is None:
            datas = {"contact": self.datas_contact, "username": self.datas_username}
            print datas
        res = requests.post(url=x_url,headers={},data=datas)
        if res is None or res.status_code != 200:
            return False
        else:
            return res.content





if __name__ == '__main__':
    # 设置执行入参
    parser = argparse.ArgumentParser(description='manual to this script')
    parser.add_argument('--url', type=str, default = 'http://admin1024.shoplazza.com')
    args = parser.parse_args()
    # 设置用户信息
    random_num = keyWord().salt()
    config = ConfigParser.ConfigParser()
    path = os.path.join( os.path.dirname(__file__),'../..')+ '/config/common.ini'
    config.read(path)
    config.set("common_url", "home_page_url", args.url)
    config.set("common_account", "datas_contact", random_num + "@abctest.com")
    config.set("common_account", "datas_username", random_num)
    config.write(open(path, 'w'))
    # 注册用户
    kw = keyWord()
    kw.sign_up(None)