# -*- coding:utf-8 -*-

from do_request import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def admin_customers_address_settings_py(data, cookie=init_cookie):
    '''

    :param cookie:
    :return:
    '''
    url = home_page_url + "/api/admin/customers/address_settings"
    return do_patch(url, data, cookie=cookie)
