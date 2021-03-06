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


def change_certain_themes_by_name_py(certain_home_page_url, name, cookie=init_cookie):
    """
    通过主题名更改主题（暂时使用，只用于数据上报测试）
    :param certain_home_page_url: 指定home_page_url
    :param name:
    :param cookie:
    :return:
    """

    url0 = certain_home_page_url + "/api/themes/default-theme"
    url1 = certain_home_page_url + "/api/themes"
    default_theme_name = do_get(url0, {}, cookie=cookie)['content']['data']['name']
    if default_theme_name == name:
        return 'default theme is the expected theme, do not need to change.'
    themes_id = \
        [theme['id'] for theme in do_get(url1, {}, cookie=cookie)['content']['data']['themes'] if theme['name'] == name][0]
    url2 = '%s/api/themes/%s/publish' % (certain_home_page_url, themes_id)
    return do_patch(url2, {}, cookie=cookie)


if __name__ == '__main__':
    # change_themes_by_index_py(1)
    login = Login()
    # login_url=https://accounts1024.shoplazza.com    home_page_url=${b_url}
    # ...    contact=17665076519    password=123456    domain=homer
    # dict_aa = {'login_url':'https://accounts1024.shoplazza.com','contact':'17665076519','password':'123456','domain':'homer'}
    cookie = login.login_b_py(
        **{'home_page_url': 'https://trackingtest.myshoplaza.com/admin', 'login_url': 'https://accounts.shoplazza.com',
           'contact': 'trackingtest@autotest.com', 'password': '123456', 'domain': 'trackingtest'})
    # print change_themes_by_name_py('Think Different', cookie)
    print change_certain_themes_by_name_py('https://trackingtest.myshoplaza.com/admin', 'Think Different', cookie)
    # print change_themes_by_name_py('Think Different')
