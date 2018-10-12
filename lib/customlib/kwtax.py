# -*- coding:utf-8 -*-


from kwshipping import *

reload(sys)
sys.setdefaultencoding('utf-8')


# . 添加其他国家税费
def add_other_tax_price_py(parameter,cookie=init_cookie):
    """
    添加其他国家税费
    :parameter: 设置的税率
    :return:  True | False
    """
    # .删除物流
    #del_all_shipping_py()
    # 添加其他国家
    shipping_id = add_shipping_py(0)
    print shipping_id
    tax_url = home_page_url + "/api/tax/refresh"
    data = {"country_id": "44", "country_price": str(parameter), "tax_info": '[{"zone_id":701,"price":""}]'}
    res_data = requests.post(url=tax_url, headers={"cookie": cookie['cookie']}, json=data)
    if res_data.status_code == 200 and json.loads(res_data.content)['state'] == 0 and shipping_id:
        return True
    else:
        return False


# print add_other_tax_price_py(70)