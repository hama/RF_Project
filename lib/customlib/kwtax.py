# -*- coding:utf-8 -*-


from kwshipping import *

reload(sys)
sys.setdefaultencoding('utf-8')


def tax_py(query_str={}, cookie=init_cookie):
    url = home_page_url + '/api/tax'
    return do_get(url, query_str, cookie=cookie)


def tax_batch_py(data, cookie=init_cookie):
    url = home_page_url + '/api/tax/batch'
    return do_post(url, data, cookie=cookie)


def add_default_tax_price_py(cookie=init_cookie):
    '''
    添加默认税费（默认税率60%）
    :param cookie:
    :return:
    '''
    return set_country_tax_price_py(60, cookie=cookie)


def set_country_tax_price_py(tax_price, cookie=init_cookie):
    '''
    设置国家税费，百分比
    :param tax_price:
    :param cookie:
    :return:
    '''
    create_only_one_shipping_py(cookie=cookie)
    tax_list_data = tax_py(cookie=cookie)['content']
    # data = copy.deepcopy(tax_batch_data)
    data = tax_list_data[0]['tax_rates']
    for i in range(len(data)):
        if data[i]['province_code'] == 'ALL':
            data[i]['tax_rate'] = tax_price
            break
    return tax_batch_py(data, cookie=cookie)


if __name__ == '__main__':
    print add_default_tax_price_py()
    # add_max_shipping_py()
