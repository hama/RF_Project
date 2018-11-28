# -*- coding:utf-8 -*-
import datetime
import hashlib
import os
import random
import re
import sys
import time
import uuid

import oss2
import requests

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


def get_certain_date_py():
    """
    获取指点的date数据(用于营销模块)
    :return: dict
    """
    current_date_data = datetime.datetime.now()
    current_date = current_date_data.strftime('%Y-%m-%d %H:%M:%S')
    yesterday_date = (current_date_data - datetime.timedelta(days=1)).strftime('%Y-%m-%d %H:%M:%S')
    tomorrow_date = (current_date_data + datetime.timedelta(days=1)).strftime('%Y-%m-%d %H:%M:%S')
    todayBeforeYesterday_date = (current_date_data - datetime.timedelta(days=2)).strftime('%Y-%m-%d %H:%M:%S')
    todayAfterTomorrow_date = (current_date_data + datetime.timedelta(days=2)).strftime('%Y-%m-%d %H:%M:%S')

    return {
        "current_date": current_date,
        "yesterday_date": yesterday_date,
        "tomorrow_date": tomorrow_date,
        "todayBeforeYesterday_date": todayBeforeYesterday_date,
        "todayAfterTomorrow_date": todayAfterTomorrow_date
    }


def compare_time_py(format_time1, format_time2):
    """
    将格式化时间，转换为时间戳，比较大小
    :return:
    timestamp1 > timestamp2 返回正数
    timestamp1 = timestamp2 返回0
    timestamp1 < timestamp2 返回负数
    """
    timestamp1 = time.mktime(time.strptime(format_time1, "%Y-%m-%d %H:%M:%S"))
    timestamp2 = time.mktime(time.strptime(format_time2, "%Y-%m-%d %H:%M:%S"))
    return timestamp1 - timestamp2


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


# json_data = {'a':{'a1':'a1','a2':'a2'}}
# json_conf = {'a':{'a1':'b1'}}
def dict_deepupdate(json_data, json_conf):
    '''
    深度更新
    通过遍历，把json_conf中的内容，更新至json_data中
    :param json_data:
    :param json_conf:
    :return:
    '''
    if isinstance(json_conf, dict):
        for key, values in json_conf.items():
            if isinstance(values, dict):
                dict_deepupdate(json_data[key], values)
            elif isinstance(values, list):
                # 1、json_data不包含key,直接赋值
                # 2、values中都为str/unicode类型的数据,直接赋值
                # 3、json_data[key]列表为空,直接赋值
                if key not in json_data \
                        or len(json_data[key]) == 0 \
                        or isinstance(values[0], str) \
                        or isinstance(values[0], unicode):
                    json_data[key] = values
                    continue
                # 确保raw_data与conf_data元素个数匹配
                values_num = len(values)
                list_num = len(json_data[key])
                if list_num > values_num:
                    for i in range(list_num - values_num):
                        json_data[key].pop()
                elif list_num < values_num:
                    for i in range(values_num - list_num):
                        json_data[key].append(json_data[key][0])
                # 给对应key赋值
                for i in range(len(values)):
                    dict_deepupdate(json_data[key][i], values[i])
            else:
                json_data[key] = values


if __name__ == '__main__':
    time1 = time.strftime("%Y%m%d%H%M%S", time.localtime())
    # time.sleep(3)
    # time2 = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    print time1
    # print compare_time_py(time1, time2)
    # dict.update(dict2)
    json_data = {'a': {'a1': 'a1', 'a2': 'a2'}, 'b': [123], 'c': {'c1': [456]}}
    # json_conf = {'a': {'a1': 'b1'}, 'c': {'c1': 'nb'},'d':'ddd'}
    # json_conf = {}
    # dict_deepupdate(json_data, json_conf)

    print get_certain_date_py()
