# -*- coding:utf-8 -*-

import kwcheckout
import kwcollection
import kwcomment
import kwcoupon
import kwcustomer
import kwfilemanagement
import kwmenus
import kworder
import kwpayment
import kwpopups
import kwproduct
import kwrebate
import kwshipping
import kwstore
import kwtax
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def create(module_name, conf={}, cookie=init_cookie):
    """
    创建的统一入口
    :param module_name:
    :param conf:
    :param cookie:
    :return:
    """
    if isinstance(conf, str):
        conf = json.loads(conf)
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
    elif 'service_order' in module_name:
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


def setting(module_name, conf={}, cookie=init_cookie):
    """
    设置的统一入口
    :param module_name:
    :param conf:
    :param cookie:
    :return:
    """
    if isinstance(conf, str):
        conf = json.loads(conf)
    if 'checkout_process' in module_name:
        return kwcheckout.set_checkout_process_with_conf_py(conf, cookie=cookie)
    elif 'payment' in module_name:
        if conf['payment_method'] == 'cod':
            if conf['status'] == 'open':
                return kwpayment.activate_payment_cod_py(cookie=cookie)
            if conf['status'] == 'close':
                return kwpayment.inactivate_payment_cod_py(cookie=cookie)
        if conf['payment_method'] == 'credit_card':
            if conf['status'] == 'open':
                return kwpayment.activate_payment_credit_card_py(cookie=cookie)
            if conf['status'] == 'close':
                return kwpayment.inactivate_payment_credit_card_py(cookie=cookie)
    elif 'store' in module_name:
        return kwstore.set_store_info_with_conf_py(conf, cookie=cookie)
    elif 'tax' in module_name:
        if isinstance(conf, dict):
            conf = []
        return kwtax.set_tax_with_conf_py(conf, cookie=cookie)


def delete(module_name, conf={}, cookie=init_cookie):
    """
    删除的统一入口
    :param module_name:
    :param conf:
    :param cookie:
    :return:
    """
    if isinstance(conf, str):
        conf = json.loads(conf)
    if 'collection' in module_name:
        if conf['scope'] == 'all':
            return kwcollection.del_all_collections_py(cookie=cookie)
        elif conf['scope'] == 'certain':
            return kwcollection.collections_delete_py(conf['data'], cookie=cookie)
    elif 'comment' in module_name:
        if conf['scope'] == 'all':
            return kwcomment.del_all_comments_py(cookie=cookie)
        elif conf['scope'] == 'certain':
            return kwcomment.comments_delete_py(conf['data'], cookie=cookie)
    elif 'customer' in module_name:
        if conf['scope'] == 'all':
            return kwcustomer.del_all_customers_py(cookie=cookie)
        elif conf['scope'] == 'certain':
            return kwcustomer.customers_delete_py(conf['data'], cookie=cookie)
    elif 'filemanagement' in module_name:
        if conf['scope'] == 'all':
            return kwfilemanagement.del_all_file_py(cookie=cookie)
        elif conf['scope'] == 'upload_file':
            return kwfilemanagement.del_all_upload_file_py(cookie=cookie)
        elif conf['scope'] == 'product_img':
            return kwfilemanagement.del_all_product_img_py(cookie=cookie)
    elif 'menus' in module_name:
        if conf['scope'] == 'all':
            return kwmenus.del_all_menus_py(cookie=cookie)
        elif conf['scope'] == 'certain':
            return kwmenus.menus_delete_py(conf['data'], cookie=cookie)
    elif 'product' in module_name:
        if conf['scope'] == 'all':
            return kwproduct.del_all_products_py(cookie=cookie)
        elif conf['scope'] == 'certain':
            return kwproduct.products_batch_delete_py(conf['data'], cookie=cookie)
    elif 'shipping_merchant' in module_name:
        if conf['scope'] == 'all':
            return kwshipping.del_all_shipping_merchant_py(cookie=cookie)
        elif conf['scope'] == 'certain':
            return kwshipping.shipping_merchant_delete_py(conf['data'], cookie=cookie)
    elif 'shipping' in module_name:
        if conf['scope'] == 'all':
            return kwshipping.del_all_shipping_py(cookie=cookie)
        elif conf['scope'] == 'certain':
            return kwshipping.shippings_delete_py(conf['data'], cookie=cookie)
