# -*- coding:utf-8 -*-

from do_request import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def file_remove_py(data, cookie=init_cookie):
    """
    删除文件
    :param data:
    :param cookie:
    :return:
    """
    url = home_page_url + "/api/file/remove"
    return do_post(url, data, cookie=cookie)


def file_list_py(query_str={}, cookie=init_cookie):
    """
    获取文件列表信息
    :param cookie:
    :return:
    """
    url = home_page_url + "/api/file/list"
    return do_get(url, query_str, cookie=cookie)


def file_product_list_py(cookie=init_cookie):
    """
    获取product列表信息
    :param cookie:
    :return:
    """
    return file_list_py({'folder': 'product'}, cookie=cookie)


def file_upload_list_py(cookie=init_cookie):
    """
    获取upload列表信息
    :param cookie:
    :return:
    """
    return file_list_py({'folder': 'upload'}, cookie=cookie)


def del_all_product_img_py(cookie=init_cookie):
    """
    删除所有商品图片
    :param data:
    :param cookie:
    :return:
    """
    list01 = file_product_list_py(cookie=cookie)
    files = ''
    for item in list01['content']['data']:
        files += str(item['path']) + ","
    return file_remove_py({'path': files}, cookie=cookie)


def del_all_upload_file_py(cookie=init_cookie):
    """
    删除所有上传文件
    :param data:
    :param cookie:
    :return:
    """
    list01 = file_upload_list_py(cookie=cookie)
    files = ''
    for item in list01['content']['data']:
        files += str(item['path']) + ","
    return file_remove_py({'path': files}, cookie=cookie)


def del_all_file_py(cookie=init_cookie):
    """
    删除所有文件（包含上传文件与商品图片）
    :param data:
    :param cookie:
    :return:
    """
    list01 = file_product_list_py(cookie=cookie)
    list02 = file_upload_list_py(cookie=cookie)
    files = ''
    for item in list01['content']['data']:
        files += str(item['path']) + ","
    for item in list02['content']['data']:
        files += str(item['path']) + ","
    return file_remove_py({'path': files}, cookie=cookie)


if __name__ == '__main__':
    print del_all_file_py()
