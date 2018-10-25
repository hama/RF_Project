*** Settings ***
Documentation     Checkout Page keyword
Resource          kw_common.robot

*** keyword ***
Taxprice Page Suite Setup
    [Documentation]    初始化物流信息
    Login With Default User
    kwshipping.del_all_shipping_py
    #.添加一个的商品
    &{conf}=   Create Dictionary
    kwproduct.add_product_with_conf_py   ${conf}
    kwshipping.add_shipping_with_conf_py

Taxprice Page Suite Teardown
    [Documentation]
    Close Test Suite Browser

Taxprice Page Test Setup
	Go To Tax Page

