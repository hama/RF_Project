# -*- coding:utf-8 -*-


from kwshipping import *

reload(sys)
sys.setdefaultencoding('utf-8')


def tax_py(query_str={}, cookie=init_cookie):
    """
    获取税费列表
    :param query_str:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/tax'
    return do_get(url, query_str, cookie=cookie)


def tax_patch_py(data, tax_id, cookie=init_cookie):
    """
    更新税费状态
    :param query_str:
    :param cookie:
    :return:
    """
    url = '%s/api/tax/%s' % (home_page_url, tax_id)
    return do_patch(url, data, cookie=cookie)


def tax_batch_py(data, cookie=init_cookie):
    """
    批量更新税费
    :param data:
    :param cookie:
    :return:
    """
    url = home_page_url + '/api/tax/batch'
    return do_put(url, data, cookie=cookie)


def add_default_tax_price_py(cookie=init_cookie):
    """
    添加默认税费（默认税率60%）
    :param cookie:
    :return:
    """
    return set_country_tax_price_py(60, cookie=cookie)


def open_tax_price_by_id_py(tax_id, cookie=init_cookie):
    """
    开启指定税费
    :param cookie:
    :return:
    """
    return tax_patch_py({"status": "open"}, tax_id, cookie=cookie)


def close_tax_price_by_id_py(tax_id, cookie=init_cookie):
    """
    关闭指定税费
    :param cookie:
    :return:
    """
    return tax_patch_py({"status": "close"}, tax_id, cookie=cookie)


def set_country_tax_price_py(tax_price, cookie=init_cookie):
    """
    设置国家税费，百分比
    :param tax_price:
    :param cookie:
    :return:
    """
    create_only_one_shipping_py(cookie=cookie)
    tax_list_data = tax_py(cookie=cookie)['content']
    tax_rates = tax_list_data[0]['tax_rates']
    for tax_rate in tax_rates:
        if tax_rate['province_code'] == 'ALL':
            tax_rate['tax_rate'] = tax_price
            data = [tax_rate]
            break
    return tax_batch_py(data, cookie=cookie)


def set_tax_with_conf_py(conf=[], cookie=init_cookie):
    """

    :param conf:
    :param cookie:
    :return:
    """
    data = copy.deepcopy(tax_batch_data)
    param_data = []
    template_data = copy.deepcopy(data[0])
    for item in conf:
        dict_deepupdate(template_data, item)
        param_data.append(template_data)
        template_data = copy.deepcopy(data[0])

    return tax_batch_py(param_data, cookie=cookie)


if __name__ == '__main__':
    # print close_tax_price_by_id_py('235863')
    print add_default_tax_price_py()
    # add_shipping_with_conf_py()
