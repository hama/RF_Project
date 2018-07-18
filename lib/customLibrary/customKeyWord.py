# -*- coding:utf-8 -*-
# import pymysql
import random
import json
import sys
import re
import os
# import requests
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
        print
        self.datas_contact = config.get("common_account", "datas_contact")
        self.datas_password = config.get("common_account", "datas_password")
        self.datas_username = config.get("common_account", "datas_username")

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

    def selectCode(self, args):
        try:
            conn = pymysql.connect(host=self.host, user=self.uname, password=self.pwd, db=self.dbname, charset="utf8",
                                   port=self.port)
            curs = conn.cursor()
            sql = "SELECT code FROM user_validate WHERE `contact` = '%s' " % (args)
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
            exit()

    def selectProduct(self):
        x_url = self.home_page_url + "/api/user/login"
        p_url = self.home_page_url + "/api/product/search?page=0&limit=20"
        datas = {"contact": self.datas_contact, "password": self.datas_password}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

        uid = json.loads(res.content)['data']['id'] or None

        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        res_list = []
        for i in res_data:
            res_list.append(i['title'])
        return res_list
        # res_data = requests.get(url=p_url)
        # if res_data is None or res_data.status_code != 200:
        #     return
        # self.db_name = self.db_name + uid
        # conn = pymysql.connect(host=self.db_hotst,user=self.db_uname,password=self.db_pwd,db=self.db_name,charset="utf8",port=self.port)
        # curs = conn.cursor()
        # sql = "SELECT count(*) FROM product "
        # curs.execute(sql)
        # counts = curs.fetchone()
        # return counts

    def getResult(self, args):
        args = args.encode('unicode-escape').decode('string_escape')

        data = self.selectProduct()
        new_list = []
        for x in data:
            res_str = x.encode('unicode-escape').decode('string_escape')
            res_str = res_str.strip()
            new_list.append(res_str)
        print args
        print new_list
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
        if args is None: return False
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

            # .删除domain
            # curs.execute(select)
            # for k in curs.fetchall():
            #     sql_data = "DELETE FROM `user_domain` WHERE userid = %s" %(k['id'])
            #     curs.execute(sql_data)
            #     conn.commit()
            return True
        except Exception as e:
            print e
            exit()

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
        x_url = self.home_page_url + "/api/user/login"
        p_url = self.home_page_url + "/api/product/search?page=0&limit=20"
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

        uid = json.loads(res.content)['data']['id'] or None

        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        res_list = []
        for i in res_data:
            res_list.append(i['inventory_quantity'])
        return res_list[0]

    def getFirstProductTitle(self):
        x_url = self.home_page_url + "/api/user/login"
        p_url = self.home_page_url + "/api/product/search?page=0&limit=20"
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

        uid = json.loads(res.content)['data']['id'] or None

        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        res_list = []
        for i in res_data:
            res_list.append(i['title'])
        return res_list[0]

    def getProductStatus(self, arg):
        x_url = self.home_page_url + "/api/user/login"
        p_url = self.home_page_url + "/api/product/search?page=0&limit=20"
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])
        uid = json.loads(res.content)['data']['id'] or None
        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        res_list = []
        for i in res_data:
            res_list.append(i['status'])

        arg = int(arg)
        return res_list[arg]

    def getProductSku(self, arg):
        x_url = self.home_page_url + "/api/user/login"
        p_url = self.home_page_url + "/api/product/search?page=0&limit=20"
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])
        uid = json.loads(res.content)['data']['id'] or None
        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
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

        x_url = self.home_page_url + "/api/user/login"
        p_url = self.home_page_url + "/api/product/search?status=" + str(arg) + "&page=0&limit=20"
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

        uid = json.loads(res.content)['data']['id'] or None

        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        res_list = []
        for i in res_data:
            res_list.append(i['title'])

        return len(res_list)

    def getProductTagsLength(self, arg):
        x_url = self.home_page_url + "/api/user/login"
        p_url = self.home_page_url + "/api/product/search?page=0&limit=20"
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])
        uid = json.loads(res.content)['data']['id'] or None
        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        res_list = []

        t = -1
        for i in res_data:
            t = t + 1
            res_list.append(len(i['tags']))

        arg = int(arg)
        return res_list[arg]

    def getAllProductCount(self):
        x_url = self.home_page_url + "/api/user/login"
        p_url = self.home_page_url + "/api/product/search"
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

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
        x_url = self.home_page_url + "/api/user/login"
        p_url = self.home_page_url + "/api/product/search?page=" + str(page) + "&limit=" + str(size)
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

        uid = json.loads(res.content)['data']['id'] or None

        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        res_list = []
        for i in res_data:
            res_list.append(i['title'])
        return res_list

    def getCollectionId(self, index):
        x_url = self.home_page_url + "/api/user/login"
        p_url = self.home_page_url + "/api/collection/dropdown?page=0&limit=10&key="
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

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
