# -*- coding:utf-8 -*-

from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def addShipping_py(has_other_country=0, cookie=init_cookie):
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
