# -*- coding:utf-8 -*-

from do_request import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def menus_detail_py(data, cookie=init_cookie):
    """
    查询菜单导航详细信息
    :param data:
    :param cookie:
    :return:
    """
    url = home_page_url_admin + "/api/menus/detail"
    return do_post(url, data, cookie=cookie)


def menus_url_list_py(query_str={}, cookie=init_cookie):
    """
    获取菜单列表信息
    :param cookie:
    :return:
    """
    url = home_page_url_admin + "/api/menus/url-list"
    return do_get(url, query_str, cookie=cookie)


def menus_delete_py(data, cookie=init_cookie):
    """
    删除菜单
    :param cookie:
    :return:
    """
    url = home_page_url_admin + "/api/menus/delete"
    return do_post(url, data, cookie=cookie)


def del_all_menus_py(cookie=init_cookie):
    """
    删除所有菜单
    :param cookie:
    :return:
    """
    menus_list = menus_url_list_py()['content']['data']['list']
    for menus in menus_list:
        id = menus['id']
        if id != 'header' and id != 'footer':
            menus_delete_py({'id': id}, cookie=cookie)


if __name__ == '__main__':
    print del_all_menus_py()
