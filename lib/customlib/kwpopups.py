# -*- coding:utf-8 -*-

from do_request import *
from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def popups_get_py(query_str={}, cookie=init_cookie):
    """
    获取弹窗列表
    :param data:
    :param cookie:
    :return:
    """
    url = home_page_url_admin + "/api/admin/popups"
    return do_get(url, query_str, cookie=cookie)


def popups_post_py(data, cookie=init_cookie):
    """
    创建一个新的弹窗
    :param data:
    :param cookie:
    :return:
    """
    url = home_page_url_admin + "/api/admin/popups"
    return do_post(url, data, cookie=cookie)


def popups_id_py(popups_id, cookie=init_cookie):
    """
    获取弹窗详情
    :param data:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/popups/%s' % (home_page_url_admin, popups_id)
    return do_get(url, {}, cookie=cookie)


def popups_put_py(data, popups_id, cookie=init_cookie):
    """
    更新弹窗
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/popups/%s' % (home_page_url_admin, popups_id)
    return do_put(url, data, cookie=cookie)


def popups_patch_py(data, popups_id, cookie=init_cookie):
    """
    更新弹窗状态
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/popups/%s' % (home_page_url_admin, popups_id)
    return do_patch(url, data, cookie=cookie)


def popups_delete_py(popups_id, cookie=init_cookie):
    """
    删除弹窗
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/admin/popups/%s' % (home_page_url_admin, popups_id)
    return do_delete(url, cookie=cookie)


def add_popups_with_conf_py(conf={}, cookie=init_cookie):
    """
    通过conf（dict数据类型）配置来添加弹窗活动
    :param conf:
    :param cookie:
    :return:
    """
    data = copy.deepcopy(popups_data)
    dict_deepupdate(data, conf)

    return popups_post_py(data, cookie=cookie)['content']


if __name__ == '__main__':
    pass
