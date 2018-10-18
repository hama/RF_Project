# -*- coding:utf-8 -*-

from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def cart_add_py(query_str={}, cookie=init_cookie):
    '''
    加入购物车
    '''
    url = myshoplaza_url + "/cart/add"
    return do_get(url, query_str, cookie=cookie)
