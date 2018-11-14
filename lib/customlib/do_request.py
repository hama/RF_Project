# -*- coding:utf-8 -*-
import json
import logging
import sys

import requests

from variable import home_page_url, shop_urn

reload(sys)
sys.setdefaultencoding('utf-8')


def do_post(url, data, cookie):
    try:
        response_data = requests.post(url=url, headers={"cookie": get_cookie(url, cookie)}, json=data)
        return_data = {}
        logging.info(url + '\nrequest_data:' + str(data) + '\nresponse_data:' + response_data.content)
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
        response_data = requests.get(url=url, headers={"cookie": get_cookie(url, cookie)}, params=query_str)
        return_data = {}
        logging.info(url + '\nrequest_data:' + str(query_str) + '\nresponse_data:' + response_data.content)
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
        response_data = requests.patch(url=url, headers={"cookie": get_cookie(url, cookie)}, json=data)
        return_data = {}
        logging.info(url + '\nrequest_data:' + str(data) + '\nresponse_data:' + response_data.content)
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
        response_data = requests.delete(url=url, headers={"cookie": get_cookie(url, cookie)})
        return_data = {}
        logging.info(url + '\nresponse_data:' + response_data.content)
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def get_cookie(url, cookie):
    if home_page_url in url:
        return cookie['b_cookie']
    elif shop_urn in url:
        return cookie['c_cookie']
