# -*- coding:utf-8 -*-
import datetime
import hashlib
import random
import time
import re
import sys

reload(sys)
sys.setdefaultencoding('utf-8')


def salt_py(size=7):
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


def searchStr_py(args):
    """
    正则匹配数字
    :param args:
    :return: String
    """
    str_ = str(args)
    restr = re.search('\d', str_).group()
    return restr


def searchStrs_py(args):
    """
    正则匹配所有非符号字符
    :param args:
    :return: String
    """
    str_ = str(args)
    restr = re.search('\d+', str_).group()
    return restr


# . md5加密方法
def md5_py(fname):
    hash_md5 = hashlib.md5()
    with open(fname, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()


def getTimes_py():
    """
    获取添加满减|优惠券 活动的公共时间
    :return: dict
    """
    now_time = datetime.datetime.now()
    now_times = now_time - datetime.timedelta(days=1)
    TomorrowTime = now_time + datetime.timedelta(days=1)
    beforeTime = now_time + datetime.timedelta(days=10)
    return {
        "now_time": now_time,
        "now_times": now_times,
        "TomorrowTime": TomorrowTime,
        "beforeTime": beforeTime
    }

def compare_time_py(format_time1,format_time2):
    """
    将格式化时间，转换为时间戳，比较大小
    :return:
    """
    timestamp1 = time.mktime(time.strptime(format_time1, "%Y-%m-%d %H:%M:%S"))
    timestamp2 = time.mktime(time.strptime(format_time2, "%Y-%m-%d %H:%M:%S"))
    if timestamp1 > timestamp2:
        return 'gt'
    elif timestamp1 < timestamp2:
        return 'lt'
    elif timestamp1 == timestamp2:
        return 'eq'
