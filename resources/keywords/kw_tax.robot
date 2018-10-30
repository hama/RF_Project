*** Settings ***
Documentation     Checkout Page keyword
Resource          kw_common.robot

*** keyword ***
Taxprice Page Suite Setup
    [Documentation]    初始化物流信息
    Login With Default User
    kwcheckout.set_checkout_process_py
    kwshipping.del_all_shipping_py
    kwproduct.add_product_with_conf_py
    kwshipping.add_shipping_with_conf_py

Taxprice Page Suite Teardown
    [Documentation]
    Close Test Suite Browser

Taxprice Page Test Setup
	Go To Tax Page

