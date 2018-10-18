*** Settings ***
Documentation     Checkout Page keyword
Resource          kw_common.robot

*** keyword ***
Taxprice Page Test Setup
    [Documentation]    初始化物流信息
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #. 调用接口，初始化数据
    kwshipping.add_shipping_with_conf_py
    Go To Tax Page



