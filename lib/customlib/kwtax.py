# -*- coding:utf-8 -*-


from kwshipping import *

reload(sys)
sys.setdefaultencoding('utf-8')


def tax_py(query_str={}, cookie=init_cookie):
    url = home_page_url + '/api/tax'
    return do_get(url, query_str, cookie=cookie)


def tax_refresh_py(data, cookie=init_cookie):
    url = home_page_url + '/api/tax/refresh'
    return do_post(url, data, cookie=cookie)


def add_default_tax_price_py(cookie=init_cookie):
    '''
    添加默认税费（默认税率60%）
    :param cookie:
    :return:
    '''
    create_only_one_shipping_py(cookie=cookie)
    tax_list_data = tax_py(cookie=cookie)['content']

    data = copy.deepcopy(tax_refresh_data)
    data['country_id'] = tax_list_data[0]['country_id']
    tax_info = []
    for tax_data in tax_list_data[0]['zone_list']:
        tax_info.append({'zone_id': tax_data['zone_id'], 'price': tax_data['price']})
    data['tax_info'] = json.dumps(tax_info)

    return tax_refresh_py(data, cookie=cookie)


if __name__ == '__main__':
    print add_default_tax_price_py()
    # add_max_shipping_py()
