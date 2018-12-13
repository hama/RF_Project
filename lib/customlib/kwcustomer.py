# -*- coding:utf-8 -*-

from do_request import *
from raw_data import *
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


def customers_get_py(query_str={}, cookie=init_cookie):
    '''
    用户列表
    :param query_str:
    :param cookie:
    :return:
    '''

    url = '%s/api/admin/customers' % (home_page_url)
    return do_get(url, query_str, cookie=cookie)


def customers_export_py(query_str={}, cookie=init_cookie):
    '''
    导出用户
    :param query_str:
    :param cookie:
    :return:
    '''

    url = '%s/api/admin/customers/export.json' % (home_page_url)
    return do_get(url, query_str, cookie=cookie)


def customers_id_get_py(customer_id, cookie=init_cookie):
    '''
    用户详情
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/customers/%s' % (home_page_url, customer_id)
    return do_get(url, {}, cookie=cookie)


def customers_post_py(data, cookie=init_cookie):
    '''
    创建用户
    :param query_str:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/admin/customers'
    return do_post(url, data, cookie=cookie)


def customers_patch_py(data, customer_id, cookie=init_cookie):
    '''
    修改用户
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/customers/%s' % (home_page_url, customer_id)
    return do_patch(url, data, cookie=cookie)


def customers_delete_py(customer_id, cookie=init_cookie):
    '''
    删除用户
    :param query_str:
    :param cookie:
    :return:
    '''
    url = '%s/api/admin/customers/%s' % (home_page_url, customer_id)
    return do_delete(url, cookie=cookie)


def customers_id_addresses_py(customer_id, cookie=init_cookie):
    '''
    用户地址列表
    :param query_str:
    :param cookie:
    :return:
    '''

    url = '%s/api/admin/customers/%s/addresses' % (home_page_url, customer_id)
    return do_get(url, {}, cookie=cookie)


def customers_id_addresses_id_py(customer_id, addresse_id, cookie=init_cookie):
    '''
    用户地址详情
    :param query_str:
    :param cookie:
    :return:
    '''

    url = '%s/api/admin/customers/%s/addresses/%s' % (home_page_url, customer_id, addresse_id)
    return do_get(url, {}, cookie=cookie)


def customers_import_post_py(data, cookie=init_cookie):
    '''
    导入用户
    :param query_str:
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/admin/customer_imports'
    return do_post(url, data, cookie=cookie)


def customers_import_id_py(import_id, cookie=init_cookie):
    '''
    查询导入状态
    :param query_str:
    :param cookie:
    :return:
    '''

    url = '%s/api/admin/customer_imports/%s' % (home_page_url, import_id)
    return do_get(url, {}, cookie=cookie)


def customers_import_get_py(query_str={}, cookie=init_cookie):
    '''
    查询导入列表
    :param query_str:
    :param cookie:
    :return:
    '''

    url = '%s/api/admin/customer_imports' % (home_page_url)
    return do_get(url, query_str, cookie=cookie)


def del_all_customers_py(cookie=init_cookie):
    """
    删除全部顾客
    :return: True | False
    """
    customer_ids = get_exist_customersid_py(cookie=cookie)
    for customer_id in customer_ids:
        customers_delete_py(customer_id, cookie=cookie)


def get_exist_customersid_py(cookie=init_cookie):
    '''
    返回存在的所有顾客id
    :param cookie:
    :return:
    '''
    count = get_all_customers_count_py(cookie=cookie)
    customers_list = customers_get_py({'page': 1, 'per_page': count}, cookie=cookie)['content']['customers']
    customers_id = []
    for customer in customers_list:
        customers_id.append(customer['id'])
    return customers_id


def get_all_customers_count_py(cookie=init_cookie):
    return customers_get_py(cookie=cookie)['content']['count']


def add_customer_with_conf_py(conf={}, cookie=init_cookie):
    '''
    通过conf（dict数据类型）配置来添加用户
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(customer_data)
    dict_deepupdate(data, conf)
    key_list = conf.keys()
    if 'email' not in key_list:
        data['email'] = salt_py() + '@autotest.com'

    return customers_post_py(data, cookie=cookie)['content']


if __name__ == '__main__':
    # print del_all_customers_py()
    print add_customer_with_conf_py()
