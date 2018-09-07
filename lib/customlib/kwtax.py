# -*- coding:utf-8 -*-


from kwshipping import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


# . 添加其他国家税费
def add_other_tax_price():
    """
    添加其他国家税费
    :return:  True | False
    """
    # .删除物流
    delShipping()
    # 添加其他国家
    add_shipping = addShipping(1)
    tax_url = home_page_url + "/api/tax/refresh"
    data = {"country_id": "-1", "country_price": "1", "tax_info": '[{"zone_id":-1,"price":"1"}]'}
    res_data = requests.post(url=tax_url, headers={"cookie": cookie['cookie']}, json=data)
    if res_data.status_code == 200 and json.loads(res_data.content)['state'] == 0 and add_shipping == True:
        return True
    else:
        return False
