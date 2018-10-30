# -*- coding:utf-8 -*-

from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def del_coupon_fromdb(cookie=init_cookie):
    """
    删除优惠券
    :return: True | False
    """
    try:
        db_config = copy.deepcopy(db_shop_config)
        db_config['cursorclass'] = pymysql.cursors.DictCursor
        db_config['db'] = db_config['db'] + str(cookie['uid'])
        conn = pymysql.connect(**db_config)
        curs = conn.cursor()
        SQL = "DELETE FROM coupon_code"
        _SQL = "DELETE FROM coupon_code_product"
        curs.execute(SQL)
        curs.execute(_SQL)
        conn.commit()
        return True
    except Exception as e:
        print e
        return False
    finally:
        conn.close()


def delSubtraction_fromdb(arvg=None, cookie=init_cookie):
    """
    删除一个满减活动 arvg参数为 "all" 删除所有的满减活动
    :param arvg: 区分使用所有商品 或者 部分商品 | None: 所有商品
    :return: True | False
    """
    try:
        db_config = copy.deepcopy(db_shop_config)
        db_config['cursorclass'] = pymysql.cursors.DictCursor
        db_config['db'] = db_config['db'] + str(cookie['uid'])
        conn = pymysql.connect(**db_config)

        curs = conn.cursor()
        if arvg == 'all':
            SQL = "DELETE FROM rebate"
        else:
            SQL = "DELETE FROM rebate  ORDER BY id DESC LIMIT 1"
        curs.execute(SQL)
        conn.commit()
        return True
    except Exception as e:
        print e
        return False
    finally:
        conn.close()
