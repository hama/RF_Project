# -*- coding:utf-8 -*-
import base64
import json
import time
from urllib import unquote

from urlunshort import resolve

import PyChromeDevTools


class cdpkeywords():
    ROBOT_LIBRARY_SCOPE = 'Global'

    def __init__(self):
        self.chrome = None

    def create_chrome_instance(self):
        """
            创建chrome实例
        :return:
        """
        self.chrome = PyChromeDevTools.ChromeInterface()

    def enable_network(self):
        """
            启动network
        :return:
        """
        self.chrome.Network.enable()

    def get_all_messages(self):
        """
            获取所有监听的信息
        :return:
        """
        time.sleep(0.2)
        all_messages = self.chrome.pop_messages()
        print 'the count of all requests:\n' + str(len(all_messages))
        # print json.dumps(all_messages)
        return all_messages

    def start_listener_on_new_tab(self):
        """
            在最新页面中开启监听
        :return:
        """
        if self.chrome == None:
            self.create_chrome_instance()
        self.connect_new_tab()
        self.enable_network()

    def connect_new_tab(self):
        """
            连接新创建的tab页，从而对其实施操作
        :return:
        """
        self.chrome.get_tabs()
        self.chrome.connect_targetID(self.chrome.tabs[0]['id'])

    def network_get_response_body(self, request_id):
        """
            获取请求返回body
        :return:
        """
        time.sleep(0.2)
        response_body = None
        for i in range(5):
            if not response_body:
                response_body = self.chrome.Network.getResponseBody(requestId=request_id)
            else:
                break
        if isinstance(response_body, dict):
            return json.loads(response_body['result']['body'])
        else:
            return response_body

    def network_get_request_post_data(self, request_id):
        """
            获取post请求data
        :return:
        """
        time.sleep(0.2)
        post_data = None
        for i in range(5):
            if not post_data:
                post_data = self.chrome.Network.getRequestPostData(requestId=request_id)
            else:
                break
        request_data_dict = request_data_str_to_dict(post_data['result']['postData'])
        return request_data_dict

    def get_request_ids_from_messages(self, messages):
        """

        :param messages:
        :return:
        """
        request_ids = []
        for message in messages:
            if 'requestId' in message['params']:
                request_ids.append(message['params']['requestId'])
        return list(set(request_ids))

    def get_messages_filtering_by_method(self, messages, method):
        """
            通过method筛选信息
        :param messages:
        :param method:
        :return:
        """
        taget_messages = []
        for m in messages:
            if "method" in m and m["method"] == method:
                try:
                    taget_messages.append(m)
                except:
                    pass
        return taget_messages

    def get_messages_filtering_by_url(self, messages, url):
        """
            通过url筛选信息
        :param messages:
        :param url:
        :return:
        """
        taget_messages = []
        for m in messages:
            if "method" in m and \
                    (m["method"] == "Network.requestWillBeSent" and url in m["params"]['request']['url'] or \
                     m["method"] == "Network.responseReceived" and url in m["params"]['response']['url']):
                try:
                    taget_messages.append(m)
                except:
                    pass
        return taget_messages

    def get_request_messages_by_url(self, messages, url):
        """
            通过url，筛选包含request请求的信息
        :param messages:
        :param url:
        :return:
        """
        messages = self.get_messages_filtering_by_method(messages, 'Network.requestWillBeSent')
        return self.get_messages_filtering_by_url(messages, url)

    def get_request_data_list(self, messages):
        """
            获取原始的请求数据列表
        :param messages:
        :return:
        """
        request_data_list = []
        for message in messages:
            request_url = message['params']['request']['url']
            if '?' not in request_url:
                continue
            request_data_list.append(message['params']['request']['url'].split('?')[1])
        return request_data_list

    def get_decoded_request_data(self, request_data):
        """
            获取解码之后的请求数据
        :param request_data:
        :return:
        """
        request_data_dict = request_data_str_to_dict(request_data)
        for key, value in request_data_dict.items():
            if key == 'data':
                request_data_dict[key] = json.loads(decode_base64(unquote(value)))
            else:
                request_data_dict[key] = unquote(value)
        return request_data_dict

    def get_decoded_request_data_list(self, request_data_list):
        """
            获取解码之后的请求数据列表
        :param request_data_list:
        :return:
        """
        request_data_dict_list = []
        for request_data in request_data_list:
            request_data_dict_list.append(self.get_decoded_request_data(request_data))
        return request_data_dict_list

    def assert_contain_keys(self, request_data_dict_list, data):
        """
            断言request_data_dict_list中是否有元素包含data的所有key
        :param request_data_dict_list:
        :param data:
        :return:
            fulfill_num:满足条件的个数
            fulfill_data:满足条件的数据
        """
        fulfill_num = 0
        fulfill_data = []
        for request_data_dict in request_data_dict_list:
            if dict_contain_keys(request_data_dict, data) != False:
                fulfill_data.append(request_data_dict)
                fulfill_num += 1
        return {'fulfill_num': fulfill_num, 'fulfill_data': fulfill_data}

    def assert_equal_values(self, request_data_dict_list, data):
        """
            断言request_data_dict_list中是否有元素包含data的所有key，且被包含key的值都相等
        :param request_data_dict_list:
        :param data:
        :return:
            fulfill_num:满足条件的个数
            fulfill_data:满足条件的数据
        """
        fulfill_num = 0
        fulfill_data = []
        for request_data_dict in request_data_dict_list:
            if dict_equal_values(request_data_dict, data) != False:
                fulfill_data.append(request_data_dict)
                fulfill_num += 1
        return {'fulfill_num': fulfill_num, 'fulfill_data': fulfill_data}

    # def assert_contain_keys(self, request_data_dict_list, data):
    #     """
    #         断言request_data_dict_list中是否有元素包含data的所有key
    #     :param request_data_dict_list:
    #     :param data:
    #     :return:
    #         fulfill_num:满足条件的个数
    #         fulfill_data:满足条件的数据
    #     """
    #     data_len = len(data)
    #     fulfill_num = 0
    #     fulfill_data = []
    #     for request_data_dict in request_data_dict_list:
    #         data_key_count = 0
    #         for key in data:
    #             if not request_data_dict.has_key(key):
    #                 break
    #             data_key_count += 1
    #         if data_key_count == data_len:
    #             fulfill_data.append(request_data_dict)
    #             fulfill_num += 1
    #     return {'fulfill_num': fulfill_num, 'fulfill_data': fulfill_data}

    # def assert_equal_values(self, request_data_dict_list, data):
    #     """
    #         断言request_data_dict_list中是否有元素包含data的所有key，且被包含key的值都相等
    #     :param request_data_dict_list:
    #     :param data:
    #     :return:
    #         fulfill_num:满足条件的个数
    #         fulfill_data:满足条件的数据
    #     """
    #     # fulfill_num_contain_keys = self.assert_contain_keys(request_data_dict_list, data)['fulfill_num']
    #     fulfill_data_contain_keys = self.assert_contain_keys(request_data_dict_list, data)['fulfill_data']
    #     fulfill_num = 0
    #     fulfill_data = []
    #     data_len = len(data)
    #     for fulfill_data_contain_key in fulfill_data_contain_keys:
    #         data_key_count = 0
    #         for key in data:
    #             if fulfill_data_contain_key[key] != data[key]:
    #                 break
    #             data_key_count += 1
    #         if data_key_count == data_len:
    #             fulfill_data.append(fulfill_data_contain_key)
    #             fulfill_num += 1
    #     return {'fulfill_num': fulfill_num, 'fulfill_data': fulfill_data}
    #     # else:
    #     #     raise Exception('is not exist special data')

    def assert_contain_keys_process(self, messages, url, data):
        """
            断言request_data_dict_list中是否有元素包含data的所有key，流程（作为关键字，用于robot）
        :param messages:
        :param url:
        :param data:
        :return:
        """
        target_messages = self.get_request_messages_by_url(messages, url)
        request_data = self.get_request_data_list(target_messages)
        decoded_request_data_list = self.get_decoded_request_data_list(request_data)
        expected_data = self.assert_contain_keys(decoded_request_data_list, data)
        if expected_data['fulfill_num'] > 0:
            print 'data:\n' + json.dumps(data)
            print 'expected_data:\n' + json.dumps(expected_data)
        else:
            print 'url:\n' + url
            print '\ndata:\n' + json.dumps(data)
            print '\ntarget_messages:\n' + json.dumps(target_messages)
            print '\ndecoded_request_data_list:\n' + json.dumps(decoded_request_data_list)
            raise Exception('there is no fulfill data')

    def assert_equal_values_process(self, messages, url, data):
        """
            断言request_data_dict_list中是否有元素包含data的所有key，且被包含key的值都相等，流程（作为关键字，用于robot）
        :param messages:
        :param url:
        :param data:
        :return:
        """
        target_messages = self.get_request_messages_by_url(messages, url)
        request_data = self.get_request_data_list(target_messages)
        decoded_request_data_list = self.get_decoded_request_data_list(request_data)
        expected_data = self.assert_equal_values(decoded_request_data_list, data)
        if expected_data['fulfill_num'] > 0:
            print 'data:\n' + json.dumps(data)
            print '\nexpected_data:\n' + json.dumps(expected_data)
        else:
            print 'url:\n' + url
            print '\ndata:\n' + json.dumps(data)
            print '\ntarget_messages:\n' + json.dumps(target_messages)
            print '\ndecoded_request_data_list:\n' + json.dumps(decoded_request_data_list)
            raise Exception('there is no fulfill data')

def request_data_str_to_dict(request_data):
    """
        请求数据str转dict
    :param request_data:
    :return:
    """
    request_data_dict = {}
    items_str_list = request_data.split('&')
    for item_str in items_str_list:
        map_str = item_str.split('=')
        request_data_dict[map_str[0]] = unquote(map_str[1])
    # print json.dumps(request_data_dict)
    return request_data_dict


def dict_contain_keys(raw_data, contrast_data):
    """
    深度查看raw_data中是否全包含contrast_data的keys
    :param raw_data: 原数据
    :param contrast_data: 对比数据
    :return:
    """
    if isinstance(contrast_data, dict):
        for key, values in contrast_data.items():
            if key not in raw_data:
                return False
            else:
                if isinstance(values, dict):
                    if dict_contain_keys(raw_data[key], values) == False:
                        return False
                elif isinstance(values, list):
                    # 确保raw_data与contrast_data元素个数匹配
                    values_num = len(values)
                    list_num = len(raw_data[key])
                    if list_num < values_num:
                        raise Exception('contrast data too large: exceeds raw data')
                    # 对比更深一层
                    for i in range(len(values)):
                        if dict_contain_keys(raw_data[key][i], values[i]) == False:
                            return False


def dict_equal_values(raw_data, contrast_data):
    """
    深度查看raw_data中是否全包含contrast_data的keys，且对应values值相等
    :param raw_data: 原数据
    :param contrast_data: 对比数据
    :return:
    """
    if isinstance(contrast_data, dict):
        for key, values in contrast_data.items():
            if key not in raw_data:
                return False
            else:
                if isinstance(values, dict):
                    if dict_equal_values(raw_data[key], values) == False:
                        return False
                elif isinstance(values, list):
                    # 确保raw_data与contrast_data元素个数匹配
                    values_num = len(values)
                    list_num = len(raw_data[key])
                    if list_num < values_num:
                        raise Exception('contrast data too large: exceeds raw data')
                    # 对比更深一层
                    for i in range(len(values)):
                        if dict_contain_keys(raw_data[key][i], values[i]) == False:
                            return False
                else:
                    if raw_data[key] != values:
                        return False


def decode_base64(data):
    """Decode base64, padding being optional.

    :param data: Base64 data as an ASCII byte string
    :returns: The decoded byte string.

    """
    missing_padding = len(data) % 4
    if missing_padding:
        data += '=' * (4 - missing_padding)
    return base64.b64decode(data)




if __name__ == '__main__':
    cdp = cdpkeywords()
    cdp.start_listener_on_new_tab()
    cdp.chrome.Page.enable()
    cdp.chrome.Page.navigate(url="https://trackingtest.myshoplaza.com/")
    time.sleep(3)
    all_messages = cdp.get_all_messages()
    target_messages = cdp.get_request_messages_by_url(all_messages, "www.google-analytics.com")
    # target_messages = cdp.get_request_messages_by_url(all_messages, "shence.shoplazza")
    request_data = cdp.get_request_data_list(target_messages)
    decoded_request_data_list = cdp.get_decoded_request_data_list(request_data)
    print json.dumps(decoded_request_data_list)
    data00 = {"ea": "view_item_list", "gtm": "2oubc0", "vp": "1440x720", "de": "UTF-8", "_v": "j72", "t": "event"}
    print json.dumps(cdp.assert_contain_keys(decoded_request_data_list, data00))
