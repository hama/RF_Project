# -*- coding:utf-8 -*-
import datetime
import hashlib
import os
import oss2
import random
import re
import requests
import sys
import time
import uuid

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


def compare_time_py(format_time1, format_time2):
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



def upload_oss_py(urlex, name='', extension='', timeout_second=30):
    """
    上传图片到阿里云
    :param urlex: url
    :param name: 名字
    :param extension: 扩充信息
    :param timeout_second: 超时时间
    :return: tuple
    """
    aliyun = {
        "accessKeyId": "LTAIpvmId6CBlCH8",
        "accessKeySecret": "RkrFrAmixqlS5su065AgVzFa9OXb9w",
        "bucket": "shoplazza",
        "endPoint": "oss-cn-shenzhen.aliyuncs.com"
    }

    auth = oss2.Auth(aliyun['accessKeyId'], aliyun['accessKeySecret'])
    bucket = oss2.Bucket(auth, aliyun['endPoint'], aliyun['bucket'])
    if not urlex:
        return False
    tmp_file = '/tmp/' + str(uuid.uuid1())
    try:
        r = requests.get(urlex, stream=True, timeout=timeout_second)
        if r.status_code > 399:
            return False
        with open(tmp_file, 'wb') as f:
            for chunk in r.iter_content(chunk_size=1024):
                if chunk:  # filter out keep-alive new chunks
                    f.write(chunk)
        md5_file = md5_py(tmp_file)
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
                s3key = str(s3key).replace('SS2', 'jpg')

        with open(tmp_file, 'rb') as f:
            bucket.put_object(s3key, f)
        return (s3key, size_file)
        # return (s3key, size_file)
    except Exception as e:
        print e
    finally:
        try:
            os.remove(tmp_file)
        except Exception as e:
            print e
            return False
