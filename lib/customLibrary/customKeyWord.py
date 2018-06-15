#-*- coding:utf-8 -*-
import pymysql
import random
import json
import sys
import re
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
        import requests

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
