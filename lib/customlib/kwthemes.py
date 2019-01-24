# -*- coding:utf-8 -*-

from do_request import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def themes_publish_patch_py(theme_id, data, cookie=init_cookie):
    """
    发布主题
    :param theme_id:
    :param data:
    :param cookie:
    :return:
    """
    url = '%s/api/themes/%s/publish' % (home_page_url, theme_id)
    return do_patch(url, data, cookie=cookie)


def themes_default_theme_py(query_str={}, cookie=init_cookie):
    """
    获取当前默认主题
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + "/api/themes/default-theme"
    return do_get(url, query_str, cookie=cookie)


def themes_get_py(query_str={}, cookie=init_cookie):
    """
    个人主题列表
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + "/api/themes"
    return do_get(url, query_str, cookie=cookie)


def get_themes_id_list_py(cookie=init_cookie):
    """
    获取个人主题列表id
    :param cookie:
    :return:
    """
    return [theme['id'] for theme in themes_get_py(cookie=cookie)['content']['data']['themes']]


def change_themes_by_index_py(index, cookie=init_cookie):
    """
    通过下标更改主题
    :param index:
    :param cookie:
    :return:
    """
    return themes_publish_patch_py(get_themes_id_list_py(cookie=cookie)[index], {}, cookie=cookie)


def change_themes_by_name_py(name, cookie=init_cookie):
    """
    通过主题名更改主题
    :param name:
    :param cookie:
    :return:
    """
    default_theme_name = themes_default_theme_py(cookie=cookie)['content']['data']['name']
    if default_theme_name == name:
        return 'default theme is the expected theme, do not need to change.'
    themes_id = \
        [theme['id'] for theme in themes_get_py(cookie=cookie)['content']['data']['themes'] if theme['name'] == name][0]
    return themes_publish_patch_py(themes_id, {}, cookie=cookie)


if __name__ == '__main__':
    # change_themes_by_index_py(1)
    print change_themes_by_name_py('Think Different')
