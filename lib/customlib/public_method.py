# -*- coding:utf-8 -*-

import kwcollection
import kwshipping
import kwrebate
import kwcustomer
import kwpopups
import kworder
import kwcoupon
import kwcomment
import kwproduct
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def create(module_name, conf={}, cookie=init_cookie):
    """

    :param module_name:
    :param conf:
    :param cookie:
    :return:
    """
    if 'product' in module_name:
        return kwproduct.add_product_with_conf_py(conf, cookie=cookie)
    elif 'collection' in module_name:
        return kwcollection.add_collection_with_conf_py(conf, cookie=cookie)
    elif 'comment' in module_name:
        return kwcomment.add_comment_with_conf_py(conf, cookie=cookie)
    elif 'coupon' in module_name:
        return kwcoupon.add_coupon_code_with_conf_py(conf, cookie=cookie)
    elif 'customer' in module_name:
        return kwcustomer.add_customer_with_conf_py(conf, cookie=cookie)
    elif 'deading_order' in module_name:
        return kworder.add_deading_order_with_conf_py(conf, cookie=cookie)
    elif 'deading_order' in module_name:
        return kworder.add_service_order_with_conf_py(conf, cookie=cookie)
    elif 'undeal_order' in module_name:
        return kworder.add_undeal_order_with_product_py(cookie=cookie)
    elif 'popups' in module_name:
        return kwpopups.add_popups_with_conf_py(conf, cookie=cookie)
    elif 'rebate' in module_name:
        return kwrebate.add_rebate_with_conf_py(conf, cookie=cookie)
    elif 'shipping' in module_name:
        return kwshipping.add_shipping_with_conf_py(conf, cookie=cookie)
    elif 'shipping_merchant' in module_name:
        return kwshipping.add_shipping_merchant_with_conf_py(conf, cookie=cookie)
