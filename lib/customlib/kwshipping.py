# -*- coding:utf-8 -*-

from raw_data import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def add_shipping_py(has_other_country=0, cookie=init_cookie):
    """
    添加中国物流
    :param has_other_country: 0 = 普通国家 | 1 = 其他国家
    :return: True | False
    """
    add_url = home_page_url + "/api/shipping/refresh"
    if has_other_country != 0: has_other_country = 1
    add_data = {
        'shipping_name': '自动化测试添加物流',
        'shipping_area': '[{"country_id":"44","zone_ids":"-1"}]',
        'has_other_country': has_other_country,
        'shipping_plan': '[{"name":"Standard shipping","shipping_method":"price","range_min":0,'
                         '"range_max":-1,"rate_amount":0,"payment_list":"cod;online;custom;credit_card",'
                         '"desc":"","range_unit":"g"}]'
    }
    try:
        add_res = requests.post(url=add_url, headers={"cookie": cookie['cookie']}, json=add_data)
        if json.loads(add_res.content)['state'] == 0:
            return True
        else:
            return False
    except Exception as e:
        print e


def delShipping_py(cookie=init_cookie):
    """
    删除物流方式
    :return: True | False
    """
    try:
        db_config = copy.deepcopy(db_shop_config)
        db_config['cursorclass'] = pymysql.cursors.DictCursor
        db_config['db'] = db_config['db'] + str(cookie['uid'])
        conn = pymysql.connect(**db_config)
        curs = conn.cursor()
        SQL = "select id from shipping where id<>1 order by date_added desc"
        curs.execute(SQL)
        sub = curs.fetchone()['id']
        del_url = home_page_url + "/api/shipping/refresh"
        del_data = {"shipping_id": sub, "is_enable": 0}
        res = requests.post(url=del_url, headers={"cookie": cookie['cookie']}, json=del_data)
        if json.loads(res.content)['state'] == 0:
            return True
        else:
            return False
    except Exception as e:
        print e
    finally:
        conn.close()


def shipping_refresh_py(data, cookie=init_cookie):
    url = home_page_url + "/api/shipping/refresh"
    try:
        response_data = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data
    except Exception as e:
        return e


def shipping_list_py(cookie=init_cookie):
    '''
    查询物流列表信息
    :param cookie:
    :return:
    '''
    url = home_page_url + '/api/shipping/list'
    try:
        response_data = requests.get(url=url, headers={"cookie": cookie['cookie']})
        return_data = {}
        return_data['content'] = json.loads(response_data.content)
        if response_data.status_code == 200:
            return_data['result'] = 'success'
        else:
            return_data['result'] = 'fail'
        return return_data

    except Exception as e:
        return e


def add_shipping_with_conf_py(conf={}, cookie=init_cookie):
    data = copy.deepcopy(shipping_data)
    dict_deepupdate(data, conf)
    # key_list = conf.keys()
    # if 'shipping_name' in key_list:
    #     data['shipping_name'] = conf['shipping_name']
    # if 'shipping_area' in key_list:
    #     data['shipping_area'] = conf['shipping_area']
    # if 'shipping_plan' in key_list:
    #     data['shipping_plan'] = conf['shipping_plan']
    # if 'has_other_country' in key_list:
    #     data['has_other_country'] = conf['has_other_country']
    if data['has_other_country'] == 1:
        data['shipping_area'] = []

    return shipping_refresh_add_py(data, cookie)['content']['data']['shipping_id']


def shipping_refresh_add_py(data, cookie=init_cookie):
    '''
    添加物流
    :param data:
    :param cookie:
    :return:
    '''
    return shipping_refresh_py(data, cookie)


def shipping_refresh_del_py(shipping_id, cookie=init_cookie):
    '''
    删除物流
    :param shipping_id:
    :param cookie:
    :return:
    '''
    data = {"shipping_id": shipping_id, "is_enable": 0}
    return shipping_refresh_py(data, cookie)


def add_max_shipping_py(cookie=init_cookie):
    '''
    添加max物流，即所有可填项都填
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(shipping_data)
    return shipping_refresh_add_py(data, cookie)


def del_all_shipping_py(cookie=init_cookie):
    """
    删除全部物流方案
    :return: True | False
    """
    data = shipping_list_py()
    if data['result'] != 'success' or data['content']['state'] != 0:
        return {'result': 'success', 'content': 'shipping had been deleted'}
    shipping_list_data = shipping_list_py()['content']['data']
    for shipping_data in shipping_list_data:
        return shipping_refresh_del_py(shipping_data['shipping_id'], cookie)


if __name__ == '__main__':
    print shipping_list_py()
    print del_all_shipping_py()
    print add_max_shipping_py()
    # addShipping_py()
