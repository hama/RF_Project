#-*- coding:utf-8 -*-
import pymysql
import random
import json
import sys
import re
import requests
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
        pass

    def mykeyword(self,url):
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

    def selectCode(self,args):
        try:
            conn = pymysql.connect(host=self.host, user=self.uname, password=self.pwd, db=self.dbname, charset="utf8", port=self.port)
            curs = conn.cursor()
            sql = "SELECT code FROM user_validate WHERE `contact` = '%s' " % (args)
            curs.execute(sql)
            res = curs.fetchone()[0]
            return res
        except Exception as e:
            print e

    def selectCodesPwd(self,args):
        try:
            conn = pymysql.connect(host=self.host, user=self.uname, password=self.pwd, db=self.dbname, charset="utf8", port=self.port)
            curs = conn.cursor()
            sql = "SELECT code FROM user_validate WHERE `contact` = '%s' AND `usage` = '%s'" % (args, self.rec_keywork)

            curs.execute(sql)
            res = curs.fetchone()[0]
            return res
        except Exception as e:
            print e
            exit()

    def selectProduct(self):
        x_url = "http://admin1024.shoplazza.com/api/user/login"
        p_url = "http://admin1024.shoplazza.com/api/product/search?page=0&limit=20"
        datas = {"contact": "18826557090", "password": "147258"}
        res = requests.post(url=x_url,headers={},data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

        uid = json.loads(res.content)['data']['id'] or None

        sub_list = requests.get(url=p_url,headers={"cookie": cookiesx})
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
    def getResult(self,args):
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
    def searchStr(self,args):
        str_ = str(args)
        restr = re.search('\d',str_).group()
        return restr
    def searchStrs(self,args):
        str_ = str(args)
        restr = re.search('\d+',str_).group()
        return restr
    def order_list_str(self,args):
        str_ = str(args)

        restr = re.findall('\d+',str_)
        timelist = ['05','31']
        for i in timelist:
            if i in restr:
                return True
            else:
                return False

    def order_list_maxmonth_check(self,max,min):
        if max is None or min is None:
            return False
        maxstr_ = str(max)
        minstr_ = str(min)
        re_max = re.findall(r'-(\d+)',maxstr_)
        re_min = re.findall(r'-(\d+)',minstr_)

        if int(re_max[0]) - int(re_min[0]) > 3:
            return False
        else:
            return True
    def remove_user(self,args):
        if args is None:return False
        try:
            conn = pymysql.connect(host=self.host, user=self.uname, password=self.pwd, db=self.dbname, charset="utf8", port=self.port,cursorclass = pymysql.cursors.DictCursor)
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

            #.删除domain
            # curs.execute(select)
            # for k in curs.fetchall():
            #     sql_data = "DELETE FROM `user_domain` WHERE userid = %s" %(k['id'])
            #     curs.execute(sql_data)
            #     conn.commit()
            return True
        except Exception as e:
            print e
            exit()
    def dictTest(self,**dict_):
        print type(dict_)
        return dict_


    def time(self, args):
        import time

        # 转换成时间数组
        timeArray = time.strptime(args, "%Y-%m-%d %H:%M:%S")
        # 转换成时间戳
        timestamp = time.mktime(timeArray)

        return  timestamp

    def getProductCount(self):
        arr = self.selectProduct()
        if arr:
            return len(arr)
        else:
            return 0

    def getFirstProductQuantity(self):
        x_url = "http://admin1024.shoplazza.com/api/user/login"
        p_url = "http://admin1024.shoplazza.com/api/product/search?page=0&limit=20"
        datas = {"contact": "18825260804", "password": "18825260804", "username": "diu"}
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
        x_url = "http://admin1024.shoplazza.com/api/user/login"
        p_url = "http://admin1024.shoplazza.com/api/product/search?page=0&limit=20"
        datas = {"contact": "18825260804", "password": "18825260804", "username": "diu"}
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
        x_url = "http://admin1024.shoplazza.com/api/user/login"
        p_url = "http://admin1024.shoplazza.com/api/product/search?page=0&limit=20"
        datas = {"contact": "18825260804", "password": "18825260804", "username": "diu"}
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
        x_url = "http://admin1024.shoplazza.com/api/user/login"
        p_url = "http://admin1024.shoplazza.com/api/product/search?page=0&limit=20"
        datas = {"contact": "18825260804", "password": "18825260804", "username": "diu"}
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

        x_url = "http://admin1024.shoplazza.com/api/user/login"
        p_url = "http://admin1024.shoplazza.com/api/product/search?status=" + str(arg) + "&page=0&limit=20"
        datas = {"contact": "18825260804", "password": "18825260804", "username": "diu"}
        res = requests.post(url=x_url,headers={},data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

        uid = json.loads(res.content)['data']['id'] or None

        sub_list = requests.get(url=p_url,headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        res_list = []
        for i in res_data:
            res_list.append(i['title'])

        return len(res_list)

    def getProductTagsLength(self, arg):
        x_url = "http://admin1024.shoplazza.com/api/user/login"
        p_url = "http://admin1024.shoplazza.com/api/product/search?page=0&limit=20"
        datas = {"contact": "18825260804", "password": "18825260804", "username": "diu"}
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
        x_url = "http://admin1024.shoplazza.com/api/user/login"
        p_url = "http://admin1024.shoplazza.com/api/product/search"
        datas = {"contact": "18825260804", "password": "18825260804", "username": "diu"}
        res = requests.post(url=x_url,headers={},data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

        sub_list = requests.get(url=p_url,headers={"cookie": cookiesx})
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
        x_url = "http://admin1024.shoplazza.com/api/user/login"
        p_url = "http://admin1024.shoplazza.com/api/product/search?page=" + str(page) + "&limit=" + str(size)
        datas = {"contact": "18825260804", "password": "18825260804", "username": "diu"}
        res = requests.post(url=x_url,headers={},data=datas)
        if res is None or res.status_code != 200:
            return res.status_code
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])

        uid = json.loads(res.content)['data']['id'] or None

        sub_list = requests.get(url=p_url,headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        res_list = []
        for i in res_data:
            res_list.append(i['title'])
        return res_list

    def getCollectionId(self, index):
        x_url = "http://admin1024.shoplazza.com/api/user/login"
        p_url = "http://admin1024.shoplazza.com/api/collection/dropdown?page=0&limit=10&key="
        datas = {"contact": "18825260804", "password": "18825260804", "username": "diu"}
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

# def uploadManyProducts():
#     x_url = "http://admin1024.shoplazza.com/api/user/login"
#     p_url = "http://admin1024.shoplazza.com/api/product/add"
#     datas = {"contact": "18825260804", "password": "18825260804", "username": "diu"}
#     res = requests.post(url=x_url, headers={}, data=datas)
#     if res is None or res.status_code != 200:
#         return res.status_code
#     cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])
#
#     data = {"product_type_id":0,"type":None,"vendor_id":0,"vendor":"","images":[],"seo_meta_id":4859,"url":"/products/example-t-shirt8-3-1","handle":"example-t-shirt8-3-1","meta_title":"sdf","meta_description":"fw","meta_keyword":"","update_time":"2018-06-23 20:15:22","create_time":"2018-06-23 20:15:22","published_at":"2018-06-23 20:15:22","title":"Example T-Shirt8","description":"","content":"","brief":"T-Shirt","price":19.99,"price_min":19.99,"price_max":19.99,"price_varies":False,"compare_at_price":24.99,"compare_at_price_min":24.99,"compare_at_price_max":24.99,"compare_at_price_varies":24.99,"status":1,"ex_links":[],"sales":0,"image":{"src":"","alt":""},"featured_image":{"src":"","alt":""},"tags":[],"variants":[{"id":2113,"sku":"example-shirt-s","inventory_management":True,"inventory_quantity":50,"barcode":"","requires_shipping":1,"weight":200,"weight_unit":"g","price":19.99,"compare_at_price":24.99,"off_ratio":20,"taxable":1,"fulfillment":"0","incoming":0,"inventory_policy":"deny","available":True,"url":"/products/example-t-shirt8-3-1?variant=2113","sales":0,"max_buy":50,"image":{"src":"","alt":""},"featured_image":{"src":"","alt":""},"option":[{"product_option_id":2167,"option":"Size","option_value":"S","sort_order":0},{"product_option_id":2168,"option":"Color","option_value":"Black","sort_order":1}],"title":"S/Black","options":["S","Black"],"option1":"S","option2":"Black","ratio":79.99}],"off_ratio":20,"options":["Size","Color"],"options_with_values":[{"name":"Size","values":["S"]},{"name":"Color","values":["Black"]}],"available":True,"has_only_default_variant":False,"selected_or_first_available_variant":{"id":2113,"sku":"example-shirt-s","inventory_management":True,"inventory_quantity":50,"barcode":"","requires_shipping":True,"weight":"200","weight_unit":"g","price":19.99,"compare_at_price":24.99,"off_ratio":20,"taxable":True,"fulfillment":"0","incoming":0,"inventory_policy":"deny","available":True,"url":"/products/example-t-shirt8-3-1?variant=2113","sales":0,"max_buy":50,"image":{"src":"","alt":""},"featured_image":{"src":"","alt":""},"option":[{"product_option_id":2167,"option":"Size","option_value":"S","sort_order":0},{"product_option_id":2168,"option":"Color","option_value":"Black","sort_order":1}],"title":"S/Black","options":["S","Black"],"option1":"S","option2":"Black"},"barcode":""}
#     sub_list = requests.post(url=p_url, headers={"cookie": cookiesx}, data=data)
#
#     print sub_list.status_code
#
# uploadManyProducts()

