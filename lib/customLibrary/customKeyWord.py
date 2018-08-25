# -*- coding:utf-8 -*-
import ConfigParser
import argparse
import copy
import datetime
import json
import os
import random
import sys
import time
import multiprocessing
import oss2
import hashlib
import boto3
import uuid
import pymysql
import requests

reload(sys)
sys.setdefaultencoding('utf-8')


class keyWord(object):
    ROBOT_LIBRARY_SCOPE = "GLOBAL"
    # 北京时区
    Bj_timeZone = "+0800"
    # 美属萨摩亚时区
    My_timeZone = "-1100"
    db_service_config = \
        {
            'host': 'rm-wz9tz4ff2v9t95f9qao.mysql.rds.aliyuncs.com',
            'port': 3306,
            'user': 'app',
            'password': '8rEdunuH@Fe+',
            'db': 'service',
            'charset': 'utf8'
        }
    db_shop_config = \
        {
            'host': '39.108.94.30',
            'port': 3306,
            'user': 'lansejiebo',
            'password': 'lansejiebo@123',
            'db': 'shop_',
            'charset': 'utf8'
        }

    def __init__(self):
        config = ConfigParser.ConfigParser()
        path = os.path.join(os.path.dirname(__file__), '../..') + '/config/common.ini'
        config.read(path)
        # self.loc = locals()
        self.home_page_url = config.get("common_url", "home_page_url")
        self.datas_contact = config.get("common_account", "datas_contact")
        self.datas_password = config.get("common_account", "datas_password")
        self.datas_username = config.get("common_account", "datas_username")
        self.datas_invite_code = config.get("common_account", "datas_invite_code")

    # .公共登陆方法
    def Login(self):
        x_url = self.home_page_url + "/api/user/login"
        datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username}
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return False
        # uid为店铺id
        uid = json.loads(res.content)['data']['id']
        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])
        return {"cookie": cookiesx, "uid": uid}

    # .公共获取数据方法
    def commonGetData(self, p_url=''):
        if not p_url:
            p_url = self.home_page_url + "/api/product/search?page=0&limit=20"
        cookiesx = self.Login()['cookie']
        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['products']
        return res_data

    def salt(self, size=7):
        '''
        构造一窜只有数字与字母的随机数，且首位不为数字
        :param size:
        :return:
        '''
        seed = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        newstr = []
        for x in range(size):
            newstr.append(random.choice(seed))
            salt = ''.join(newstr)
        saltList = list(salt)
        if saltList[0] in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']:
            saltList[0] = "X"
        salt = ''.join(saltList)

        return salt

    def get_reset_pwd_vcode_fromdb(self, contact_data):
        '''
        从数据库获取重置密码的验证码
        :param contact_data:
        :return:
        '''
        try:
            db_config = copy.deepcopy(self.db_service_config)
            conn = pymysql.connect(**db_config)
            curs = conn.cursor()
            sql = "SELECT code FROM user_validate WHERE `contact` = '%s' AND `usage` = 'dianjiang_reset_password'" % (
                contact_data)

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
    #. md5加密方法
    def md5(self,fname):
        hash_md5 = hashlib.md5()
        with open(fname, "rb") as f:
            for chunk in iter(lambda: f.read(4096), b""):
                hash_md5.update(chunk)
        return hash_md5.hexdigest()
    #. 添加商品
    def addProducts(self):
        #.获取图片
        imgs = self.upload_oss(self.img)[0]
        path_img = "//cn.cdn.shoplazza.com/" + self.upload_oss(self.img)[0]
        #.获取cookie
        cookie = self.Login()
        data = {
            "barcode":"",
            "brief":"自动化测试",
            "compare_at_price":1000,
            "has_only_default_variant":True,
            "images":[{"lastModified": "1520929852000", "lastModifiedDate": "2018-03-13T08:30:52.000Z","name":imgs,"originFileObj":{"uid":"rc-upload-1535093594875-2"},"path":imgs,"percent":"100.00","status":"done","type":"image/jpeg","uid":"rc-upload-1535093594875-2","url":path_img}],
            "meta_description":"",
            "meta_keyword":"",
            "meta_title": "自动化测试",
            "price":99,
            "status":1,
            "title":"自动化测试",
            "url":"/products/自动化测试",
            "variants":[{"barcode":"","compare_at_price":1000,"inventory_management":"","inventory_policy":"","inventory_quantity":"","price":99,"requires_shipping":"","sku":"","taxable":"","weight":"","weight_unit":"kg"}]
        }
        try:
            resData = requests.post(url=self.addProUrl,headers={"cookie":cookie},json=data)
            if resData.status_code == 200 and json.loads(resData.content)['state'] == 0:
                print resData.content
                return True
            else:
                print resData.content
                return False

        except Exception as e:
            return e



    #. 上传图片到阿里云
    def upload_oss(self,urlex, name='', extension='', timeout_second = 30):
        auth = oss2.Auth(self.aliyun['accessKeyId'], self.aliyun['accessKeySecret'])
        bucket = oss2.Bucket(auth, self.aliyun['endPoint'], self.aliyun['bucket'])
        if not urlex:
            return False
        tmp_file = '/tmp/' + str(uuid.uuid1())
        try:
            r = requests.get(urlex, stream=True, timeout=timeout_second)
            if r.status_code > 399:
                return False
            with open(tmp_file, 'wb') as f:
                for chunk in r.iter_content(chunk_size=1024):
                    if chunk: # filter out keep-alive new chunks
                        f.write(chunk)
            md5_file = self.md5(tmp_file)
            size_file = os.stat(tmp_file).st_size
            s3key = name
            if not s3key:
                if not extension:
                    extension = urlex.split('.')[-1].split('?')[0]
                    if len(extension) > 5:
                        extension = ""
                if extension:
                    s3key = md5_file + '.' + extension
                else:
                    s3key = md5_file
                if s3key.endswith('.SS2'):
                    s3key = str(s3key).replace('SS2','jpg')

            with open(tmp_file, 'rb') as f:
                bucket.put_object(s3key, f)
            return (s3key, size_file)
        except Exception as e:
            print e
        finally:
            try:
                os.remove(tmp_file)
            except Exception as e:
                print e
        return False
        

    # .删除商品
    def delFirstProduct(self):
        try:
            cookie = self.Login()
            db_config = copy.deepcopy(self.db_shop_config)
            db_config['cursorclass'] = pymysql.cursors.DictCursor
            db_config['db'] = db_config['db'] + str(cookie['uid'])
            conn = pymysql.connect(**db_config)
            curs = conn.cursor()
            SQL = "SELECT (product_id) FROM `product` order by product_id desc"
            curs.execute(SQL)
            sub = curs.fetchone()['product_id']
            del_url = self.home_page_url + "/api/product/updatestatus"
            del_data = {"product_ids": [str(sub)], "status": -1}
            result = requests.post(url=del_url, headers={'cookie': cookie['cookie']}, json=del_data)
            if json.loads(result.content)['state'] == 0:
                return True
            else:
                return False
        except Exception as e:
            print e
        finally:
            conn.close()

    # .删除支付方式 paylinks
    def delPaymentPk(self):
        try:
            cookie = self.Login()['cookie']
            del_url = self.home_page_url + "/api/payment/method"
            del_data = {"payment_method": "credit_card", "method_is_enable": 0}
            res = requests.post(url=del_url, headers={"cookie": cookie}, json=del_data)
            if json.loads(res.content)['state'] == 0:
                return True
            else:
                return False
        except Exception as e:
            print e

    # .删除支付方式 paylinks
    def delPaymentCod(self):
        try:
            cookie = self.Login()['cookie']
            del_url = self.home_page_url + "/api/payment/method"
            del_data = {"payment_method": "cod", "method_is_enable": 0}
            res = requests.post(url=del_url, headers={"cookie": cookie}, json=del_data)
            if json.loads(res.content)['state'] == 0:
                return True
            else:
                return False
        except Exception as e:
            print e

    # .添加中国物流
    def addShipping(self):
        cookie = self.Login()['cookie']
        add_url = self.home_page_url + "/api/shipping/refresh"
        add_data = {
            'shipping_name': '自动化测试添加物流',
            'shipping_area': '[{"country_id":"44","zone_ids":"-1"}]',
            'has_other_country': 0,
            'shipping_plan': '[{"name":"Standard shipping","shipping_method":"price","range_min":0,'
                             '"range_max":-1,"rate_amount":0,"payment_list":"cod;online;custom;credit_card",'
                             '"desc":"","range_unit":"g"}]'
        }

        try:
            add_res = requests.post(url=add_url, headers={"cookie": cookie}, json=add_data)
            if json.loads(add_res.content)['state'] == 0:
                return True
            else:
                return False
        except Exception as e:
            print e

    # .删除物流方式
    def delShipping(self):
        try:
            cookie = self.Login()
            db_config = copy.deepcopy(self.db_shop_config)
            db_config['cursorclass'] = pymysql.cursors.DictCursor
            db_config['db'] = db_config['db'] + str(cookie['uid'])
            conn = pymysql.connect(**db_config)
            curs = conn.cursor()
            SQL = "select id from shipping where id<>1 order by date_added desc"
            curs.execute(SQL)
            sub = curs.fetchone()['id']
            del_url = self.home_page_url + "/api/shipping/refresh"
            del_data = {"shipping_id": sub, "is_enable": 0}
            res = requests.post(url=del_url, headers={"cookie": cookie}, json=del_data)
            if json.loads(res.content)['state'] == 0:
                return True
            else:
                return False
        except Exception as e:
            print e
        finally:
            conn.close()

    def getAllProductCount(self):
        p_url = self.home_page_url + "/api/product/search"
        cookiesx = self.Login()['cookie']
        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        total = json.loads(sub_list.content)['data']['total']

        return total

    def getCollectionId(self, index):
        p_url = self.home_page_url + "/api/collection/dropdown?page=0&limit=10&key="
        cookiesx = self.Login()['cookie']
        sub_list = requests.get(url=p_url, headers={"cookie": cookiesx})
        res_data = json.loads(sub_list.content)['data']['collections']
        index = int(index)

        res_list = []
        for i in res_data:
            res_list.append(i['collection_id'])

        return res_list[index]

    def sign_up(self, datas):
        '''
        注册
        :param datas:
        :return:
        '''
        x_url = self.home_page_url + "/api/user/signup"
        if datas is None:
            self.validate_signup(None)  # 发送验证码
            time.sleep(5)
            datas_vcode = self.get_db_verification_code(self.datas_contact).encode("utf-8")  # 获取验证码
            time.sleep(5)
            datas = {"contact": self.datas_contact, "password": self.datas_password, "username": self.datas_username,
                     "vcode": datas_vcode, "invite_code": self.datas_invite_code}
            print datas
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return False
        else:
            return res.content

    def validate_signup(self, datas):
        '''
        发送验证码
        :param datas:
        :return:
        '''
        x_url = self.home_page_url + "/api/user/validate-signup"
        if datas is None:
            datas = {"contact": self.datas_contact, "username": self.datas_username}
            print datas
        res = requests.post(url=x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return False
        else:
            return res.content

    def get_latest_vcode_fromdb(self, contact):
        '''
        从数据库获取最新一条验证码
        :param contact:
        :return:
        '''
        try:
            db_config = copy.deepcopy(self.db_service_config)
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

    def del_user_fromdb(self, contact):
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
            db_config = copy.deepcopy(self.db_service_config)
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

    def getProductId(self):
        return self.commonGetData()[0]['id']

    # .获取满减活动时间参数,
    # @parments: 1：活动进行中
    # @parments: 2：活动未开始
    def getSubtractionTime(self, parments=None):
        now_time = datetime.datetime.now()
        now_times = now_time - datetime.timedelta(days=1)
        TomorrowTime = now_time + datetime.timedelta(days=1)
        beforeTime = now_time + datetime.timedelta(days=10)
        if parments:
            return {"date_start": now_times.strftime('%Y-%m-%d %H:%M:%S'), "date_end": beforeTime.strftime('%Y-%m-%d '
                                                                                                           '%H:%M:%S')}
        else:
            return {"date_start": TomorrowTime.strftime('%Y-%m-%d %H:%M:%S'),
                    "date_end": beforeTime.strftime('%Y-%m-%d %H:%M:%S')}

    # . 获取满减活动参数
    # @parments:-----1: 进行中
    # @parments:-----2: 未开始
    # @parments:-----3: 已结束
    # @ type: 区分使用所有商品 或者 部分商品 | None: 所有商品
    def getSubtractionData(self, argv, type=None):
        if argv is None: return False
        name = self.salt()
        product_id = self.getProductId()
        nowTime = datetime.datetime.now()
        newTime = nowTime + datetime.timedelta(days=7)
        date_start = nowTime.strftime('%Y-%m-%d %H:%M:%S')
        date_end = newTime.strftime('%Y-%m-%d %H:%M:%S')
        range_type = "1"
        if type:
            product_scope = 3
        else:
            product_scope = 1
        incr_count = 1
        product_list = "{\"product\":[{\"product_id\":%s,\"sub_product_id\":[]}]}" % (product_id)
        rule_list = "[{\"range_unit\":\"price\",\"range_value\":\"20\",\"rate_amount\":\"15\",\"rate_shipping\":0}]"
        if argv == 1:
            new_time = self.getSubtractionTime(True)
            date_start = new_time['date_start']
            date_end = new_time['date_end']
        elif argv == 2:
            new_time = self.getSubtractionTime()
            date_start = new_time['date_start']
            date_end = new_time['date_end']
        else:
            pass
        data = {
            "name": name,
            "date_start": date_start,
            "date_end": date_end,
            "range_type": range_type,
            "incr_count": incr_count,
            "product_list": product_list,
            "product_scope": product_scope,
            "rule_list": rule_list
        }
        return data

    # . 添加一个某种类型的满减活动
    # @parments:-----1: 进行中
    # @parments:-----2: 未开始
    # @parments:-----3: 已结束
    def addSubtraction(self, argv, type=None):
        if argv is None: return False
        argv = int(argv)
        url = self.home_page_url + "/api/rebate/refresh"
        del_url = self.home_page_url + "/api/rebate/end"
        cookies = self.Login()['cookie']
        if cookies is None: return False
        datax = self.getSubtractionData(argv, type)
        try:
            res = requests.post(url=url, headers={"cookie": cookies}, json=datax)
            if res.status_code != 200:
                return res.status_code
            # .如果为3,添加成功后请求结束接口
            if argv == 3 and json.loads(res.content)['data']['id']:
                rebate_id = {"rebate_id": json.loads(res.content)['data']['id']}
                res_data = requests.post(url=del_url, headers={"cookie": cookies}, json=rebate_id)
                if res_data.status_code != 200:
                    return res_data.status_code
                if json.loads(res_data.content)['state'] == 0:
                    return True
                else:
                    return False
            else:
                if json.loads(res.content)['state'] == 0:
                    return True
                else:
                    return False
        except Exception as e:
            print e

    # . 删除一个满减活动 arvg参数为 "all" 删除所有的满减活动
    def delSubtraction(self, arvg=None):
        try:
            cookie = self.Login()
            db_config = copy.deepcopy(self.db_shop_config)
            db_config['cursorclass'] = pymysql.cursors.DictCursor
            db_config['db'] = db_config['db'] + str(cookie['uid'])
            conn = pymysql.connect(**db_config)

            curs = conn.cursor()
            if arvg == 'all':
                SQL = "DELETE FROM rebate"
            else:
                SQL = "DELETE FROM rebate  ORDER BY id DESC LIMIT 1"
            curs.execute(SQL)
            conn.commit()
            return True
        except Exception as e:
            print e
            return False
        finally:
            conn.close()

    # . 设置时区 ((GMT + 08:00) 北京，香港，台北，新加坡) timezone : none 设置北京时区 | 设置 美属萨摩亚时区
    def setBjTimeZone(self, timezone=None):
        cookie = self.Login()['cookie']
        store_id = self.getStoreId()
        if timezone is None:
            time_zone = self.Bj_timeZone
        else:
            time_zone = self.My_timeZone
        data = {"address": "", "city": "", "currency": "USD", "email": "171869092@qq.com",
                "icon": {"src": "", "path": ""},
                "name": "chen", "service_email": "171869092@qq.com", "store_id": store_id, "telephone": "15220581724",
                "time_zone": time_zone, "zip": "", "zone_id": "-1"}
        url = self.home_page_url + "/api/store/update"
        try:
            res = requests.post(url=url, headers={"cookie": cookie}, json=data)
            if res.status_code == 200 and json.loads(res.content)['state'] == 0:
                return True
            else:
                return False
        except Exception as e:
            print e

    def getStoreId(self):
        cookie = self.Login()['cookie']
        store_url = self.home_page_url + "/api/store/info"
        try:
            res = requests.get(url=store_url, headers={"cookie": cookie})
            return json.loads(res.content)['data']['store_id']
        except Exception as e:
            print e


if __name__ == '__main__':
    # 设置执行入参
    parser = argparse.ArgumentParser(description='manual to this script')
    parser.add_argument('--url', type=str, default='http://admin1024.shoplazza.com')
    args = parser.parse_args()
    # 设置用户信息
    random_num = keyWord().salt()
    config = ConfigParser.ConfigParser()
    path = os.path.join(os.path.dirname(__file__), '../..') + '/config/common.ini'
    config.read(path)
    config.set("common_url", "home_page_url", args.url)
    config.set("common_account", "datas_contact", random_num + "@abctest.com")
    config.set("common_account", "datas_username", random_num)
    config.write(open(path, 'w'))
    # 注册用户
    kw = keyWord()
    kw.sign_up(None)
