# -*- coding:utf-8 -*-
import copy
import datetime

import pymysql
import requests

import kwproduct
from lib.utils import lib_utils
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def get_coupon_data(argv, sub=None, type=None):
    """
    获取优惠券数据
    :arg 1: 进行中 2: 未开始 3: 已结束
    :sub 为None是折扣券，否则就是 代金券
    :type 区分使用所有商品 或者 部分商品 | None: 所有商品
    :return: dict
    """
    # .获取时间
    new_time = getActividadTime(argv)
    code = lib_utils.salt(2) + "TWOES98B" + lib_utils.salt(4)
    code_type = ""
    code_value = 5
    date_added = ""
    date_end = new_time['date_end']
    date_start = new_time['date_start']
    if sub:
        discount_type = 1
    else:
        discount_type = 2
    # discount_type = 1 if sub else discount_type = 2
    is_enable = ""
    limit_num = "1"
    name = "自动化测试" + lib_utils.salt(4)
    product_list = ""
    product_scope = "1"
    progress = ""
    range_type = 1
    range_value = ""
    timezone = ""
    total_num = "5"
    used_num = ""
    return {
        "code": code, "code_type": code_type, "code_value": code_value, "date_added": date_added,
        "date_end": date_end,
        "date_start": date_start, "discount_type": discount_type, "is_enable": is_enable, "limit_num": limit_num,
        "name": name, "product_list": product_list, "product_scope": product_scope, "progress": progress,
        "range_type": range_type, "range_value": range_value, "timezone": timezone, "total_num": total_num,
        "used_num": used_num
    }


def getActividadTime(parments=None):
    """
    获取满减 | 优惠券 公共活动时间参数
    :param parments: 1：活动进行中
    :param parments: 2：活动未开始
    :param parments: 3：活动已结束
    :return: dict
    """
    res_time_data = lib_utils.getTimes()
    if parments == 1:
        return {"date_start": res_time_data['now_times'].strftime('%Y-%m-%d %H:%M:%S'),
                "date_end": res_time_data['beforeTime'].strftime('%Y-%m-%d %H:%M:%S')}
    elif parments == 2:
        return {"date_start": res_time_data['TomorrowTime'].strftime('%Y-%m-%d %H:%M:%S'),
                "date_end": res_time_data['beforeTime'].strftime('%Y-%m-%d %H:%M:%S')}
    else:
        newTime = res_time_data['now_time'] + datetime.timedelta(days=7)
        return {"date_start": res_time_data['now_time'].strftime('%Y-%m-%d %H:%M:%S'),
                "date_end": newTime.strftime('%Y-%m-%d %H:%M:%S')}


def getSubtractionData(argv, type=None):
    """
    获取满减活动参数
    :param argv: 1: 进行中 2: 未开始 3: 已结束
    :param type: 区分使用所有商品 或者 部分商品 | None: 所有商品
    :return: String
    """
    if argv is None: return False
    name = lib_utils.salt()
    new_time = getActividadTime(argv)
    product_id = kwproduct.get_latest_productid()
    range_type = "1"
    if type:
        product_scope = 3
    else:
        product_scope = 1
    incr_count = 1
    product_list = "{\"product\":[{\"product_id\":%s,\"sub_product_id\":[]}]}" % (product_id)
    rule_list = "[{\"range_unit\":\"price\",\"range_value\":\"20\",\"rate_amount\":\"15\",\"rate_shipping\":0}]"
    data = {
        "name": name,
        "date_start": new_time['date_start'],
        "date_end": new_time['date_end'],
        "range_type": range_type,
        "incr_count": incr_count,
        "product_list": product_list,
        "product_scope": product_scope,
        "rule_list": rule_list
    }
    return data


def addActividadCommon(url, datax, type=None):
    """
    添加活动公共方法
    :param url: 请求url
    :param argv: 1: 进行中 2: 未开始 3: 已结束
    :param type: 不为None代表是请求的结束的接口
    :return: True | False
    """
    if url is None: return "参数错误"
    if cookie is None: return "Cookie 未找到"
    try:
        res = requests.post(url=url['add_url'], headers={"cookie": cookie['cookie']}, json=datax)
        if res.status_code != 200: return res.status_code
        # .如果为3,添加成功后请求结束接口
        if type and json.loads(res.content)['data']['id']:
            if "rebate" in url["add_url"]:
                # .满减的
                response = {"rebate_id": json.loads(res.content)['data']['id']}
            else:
                # .优惠券
                response = {"id": json.loads(res.content)['data']['id']}
            res_data = requests.post(url=url['del_url'], headers={"cookie": cookie['cookie']}, json=response)
            if res_data.status_code != 200: return res_data.status_code
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


def add_coupon(argv, sub=None, type=None):
    """
    添加优惠券
    :param argv: 1: 进行中 2: 未开始 3: 已结束
    :param type: 区分使用所有商品 或者 部分商品 | None: 所有商品
    :return: True | False
    """
    if argv is False: return "参数错误"
    par = False
    url = {"add_url": home_page_url + "/api/coupon-code/refresh",
           "del_url": home_page_url + "/api/coupon-code/end"}
    datas = get_coupon_data(int(argv), sub)
    if argv == 3: par = True
    res_data = addActividadCommon(url, datas, par)
    return res_data


def addSubtraction(argv, type=None):
    """
    添加一个某种类型的满减活动
    :param argv: 1: 进行中 2: 未开始 3: 已结束
    :param type: 区分使用所有商品 或者 部分商品 | None: 所有商品
    :return: True | False
    """
    if argv is False: return "参数错误"
    url = {"add_url": home_page_url + "/api/rebate/refresh", "del_url": home_page_url + "/api/rebate/end"}
    datas = getSubtractionData(argv, type)
    par = False
    if argv == 3: par = True
    res_data = addActividadCommon(url, datas, par)
    return res_data


def del_coupon():
    """
    删除优惠券
    :return: True | False
    """
    try:
        db_config = copy.deepcopy(db_shop_config)
        db_config['cursorclass'] = pymysql.cursors.DictCursor
        db_config['db'] = db_config['db'] + str(cookie['uid'])
        conn = pymysql.connect(**db_config)
        curs = conn.cursor()
        SQL = "DELETE FROM coupon_code"
        _SQL = "DELETE FROM coupon_code_product"
        curs.execute(SQL)
        curs.execute(_SQL)
        conn.commit()
        return True
    except Exception as e:
        print e
        return False
    finally:
        conn.close()


def delSubtraction(arvg=None):
    """
    删除一个满减活动 arvg参数为 "all" 删除所有的满减活动
    :param arvg: 区分使用所有商品 或者 部分商品 | None: 所有商品
    :return: True | False
    """
    try:
        db_config = copy.deepcopy(db_shop_config)
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
