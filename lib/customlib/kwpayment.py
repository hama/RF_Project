# -*- coding:utf-8 -*-

from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def payment_py(method_is_enable=1, payment_method="cod", cookie=init_cookie):
    """
    支付方式公共方法
    :param method_is_enable:  添加|删除 : 1|0
    :param payment_method:  添加的方式
    :return:  True | False
    """
    changeUrl = home_page_url + "/api/payment/method"
    data = {"method_is_enable": method_is_enable, "payment_method": payment_method}
    res_data = requests.post(url=changeUrl, headers={"cookie": cookie['cookie']}, json=data)

    if res_data.status_code == 200 and json.loads(res_data.content)['state'] == 0:
        return True
    else:
        return False


def add_payment_cod_py():
    """
    添加支付方式 cod
    :return: True | False
    """
    return payment_py()


def del_payment_cod_py():
    """
    删除支付方式 cod
    :return: True | False
    """
    return payment_py(0)


def add_payment_pk_py():
    """
    添加支付方式 paylinks
    :return: True | False
    """
    return payment_py(1, 'credit_card')


def del_payment_pk_py():
    """
    删除支付方式 paylinks
    :return: True | False
    """
    return payment_py(0, 'credit_card')
