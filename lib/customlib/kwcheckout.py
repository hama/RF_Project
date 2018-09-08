# -*- coding:utf-8 -*-

from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def set_checkout_step(customer_name=None, customer_contact=None,cookie=init_cookie):
    """
    设置checkout结账流程的-地址-姓名输入的模式
    :param customer_name: 1= 名字 2=姓 ／ 名
    :param customer_contact: 1= 邮箱 2= 手机 3 = 邮箱／手机
    :return: True | False
    """
    set_url = home_page_url + "/api/checkout/save"
    if customer_name == None or str(customer_name) == "": customer_name = 1
    if customer_contact == None or str(customer_contact) == "": customer_contact = 3
    customer_name = int(str(customer_name))
    customer_contact = int(str(customer_contact))

    data = {
        "company_setting": 2,
        "customer_authority": 2,
        "customer_contact": customer_contact,
        "customer_email": 1,
        "customer_name": customer_name,
        "customer_phone": 2,
        "postcode_setting": 1,
        "privacy_policy": "",
        "refund_policy": "",
        "server_policy": ""
    }
    try:
        res_data = requests.post(url=set_url, headers={"cookie": cookie['cookie']}, json=data)
        if res_data.status_code == 200 and json.loads(res_data.content)['state'] == 0:
            return True
        else:
            return False
    except Exception as e:
        print e
