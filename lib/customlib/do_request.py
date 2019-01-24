# -*- coding:utf-8 -*-
import json
import logging
import sys
import time

import requests

from variable import home_urn, shop_urn

reload(sys)
sys.setdefaultencoding('utf-8')


def do_post(url, data, cookie):
    try:
        if isinstance(cookie, dict):
            cookie = get_cookie(url, cookie)
        response_data = requests.post(url=url, headers={"cookie": cookie}, json=data)
        return_data = {}
        logging.info(url + '\nstatus_code:\n' + str(response_data.status_code) + '\nrequest_data:\n' + str(
            data) + '\nresponse_data:\n' + response_data.content)
        if response_data.content == '':
            return_data['content'] = response_data.content
        else:
            return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def do_put(url, data, cookie):
    try:
        if isinstance(cookie, dict):
            cookie = get_cookie(url, cookie)
        response_data = requests.put(url=url, headers={"cookie": cookie}, json=data)
        return_data = {}
        logging.info(url + '\nstatus_code:\n' + str(response_data.status_code) + '\nrequest_data:\n' + str(
            data) + '\nresponse_data:\n' + response_data.content)
        if response_data.content == '':
            return_data['content'] = response_data.content
        else:
            return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def do_get(url, query_str, cookie):
    try:
        # 加入查询前等待时长
        if isinstance(cookie, dict):
            cookie = get_cookie(url, cookie)
        time.sleep(0.2)
        response_data = requests.get(url=url, headers={"cookie": cookie}, params=query_str)
        return_data = {}
        logging.info(url + '\nstatus_code:\n' + str(response_data.status_code) + '\nrequest_data:\n' + str(
            query_str) + '\nresponse_data:\n' + response_data.content)
        if response_data.content == '':
            return_data['content'] = response_data.content
        else:
            return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def do_patch(url, data, cookie):
    try:
        if isinstance(cookie, dict):
            cookie = get_cookie(url, cookie)
        response_data = requests.patch(url=url, headers={"cookie": cookie}, json=data)
        return_data = {}
        logging.info(url + '\nstatus_code:\n' + str(response_data.status_code) + '\nrequest_data:\n' + str(
            data) + '\nresponse_data:\n' + response_data.content)
        if response_data.content == '':
            return_data['content'] = response_data.content
        else:
            return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def do_delete(url, cookie):
    try:
        if isinstance(cookie, dict):
            cookie = get_cookie(url, cookie)
        response_data = requests.delete(url=url, headers={"cookie": cookie})
        return_data = {}
        logging.info(
            url + '\nstatus_code:\n' + str(response_data.status_code) + '\nresponse_data:\n' + response_data.content)
        if response_data.content == '':
            return_data['content'] = response_data.content
        else:
            return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def get_cookie(url, cookie):
    if home_urn in url:
        return cookie['b_cookie']
    elif shop_urn in url:
        return cookie['c_cookie']
