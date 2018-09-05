*** Settings ***
Documentation     Ckeckout Page Check
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        Checkout
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/variable/var_tax_price.robot
Resource          ../../../resources/variable/var_products.robot
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_products.robot
Resource          ../../../resources/keywords/kw_shipping.robot
Resource          ../../../resources/keywords/kw_checkout.robot
Resource          ../../../resources/variable/var_checkout.robot
Library           customLibrary

*** Test Case ***
checkout172
    [Documentation]     1.选择一个价格为0.99$的商品购买2.checkout界面选择没有设置税率的国家3.checkout界面选择运费价格为0的物流4.submit进入选择支付方式界面 进入支付界面时，只显示除信用卡渠道外其他的支付方式，不显示信用卡渠道
    [Tags]    P0
    Add Payment    #.添加支付方式
    Add Custom Products    0.99
    Checkout Common Setp
    Wait And Click Element    ${locator_checkout_by_now_btn}
    Wait And Click Element    ${locator_checkout_submit_btn_s}
    Wait And Click Element    ${locator_checkout_address_save_checkout_btn}
    Add Address Common Setp    # 添加地址公共部分
    Wait And Click Element    ${locator_checkout_address_save_address_btn}
    Wait And Click Element    ${locator_checkout_address_save_checkout_btn}
    Page Should Not Contain Element    ${locator_checkout_payment_ipaylinks_elm}

checkout173
    [Documentation]    1.选择一个价格为1$的商品购买2.checkout界面选择没有设置税率的国家3.选择运费价格为0的物流4.submit进入选择支付方式界面 进入支付界面，显示信用卡渠道及其他B端已开启的支付方式
    [Tags]    P0
    Add Custom Products    1
    Checkout Common Setp
    Wait And Click Element    ${locator_checkout_by_now_btn}
    Wait And Click Element    ${locator_checkout_submit_btn_s}
    Wait And Click Element    ${locator_checkout_address_save_checkout_btn}
    Add Address Common Setp    # 添加地址公共部分
    Wait And Click Element    ${locator_checkout_address_save_address_btn}
    Wait And Click Element    ${locator_checkout_address_save_checkout_btn}
    Page Should Contain Element    ${locator_checkout_payment_ipaylinks_elm}

checkout175
    [Documentation]    1. 选择一个价格为0.1$的商品购买2.checkout添加运费以及税费并且总价不超过1$3.submit进入支付界面    进入支付界面时，只显示除信用卡渠道外其他的支付方式，不显示信用卡渠道
    [Tags]    P0
    Add Custom Products    0.99
    Add Cod Payment
    Checkout Common Setp
    Wait And Click Element    ${locator_checkout_by_now_btn}
    Wait And Click Element    ${locator_checkout_submit_btn_s}
    Wait And Click Element    ${locator_checkout_address_save_checkout_btn}
    Add Address Common Setp    # 添加地址公共部分
    Wait And Click Element    ${locator_checkout_address_save_address_btn}
    Wait And Click Element    ${locator_checkout_address_save_checkout_btn}
    Page Should Contain Element    ${locator_checkout_payment_cod_elm}

checkout176
    [Documentation]    1. 选择一个价格为0.1$的商品购买 2.checkout添加运费以及税费并且总价超过1$3.submit进入支付界面    进入支付界面，显示信用卡渠道及其他B端已开启的支付方式
    [Tags]    P0
    Add Payment
    Add Cod Payment
    Checkout Common Setp
    Wait And Click Element    ${locator_checkout_by_now_btn}
    Wait And Click Element    ${locator_checkout_submit_btn_s}
    Wait And Click Element    ${locator_checkout_address_save_checkout_btn}
    Add Address Common Setp    # 添加地址公共部分
    Wait And Click Element    ${locator_checkout_address_save_address_btn}
    Wait And Click Element    ${locator_checkout_address_save_checkout_btn}
    Page Should Contain Element    ${locator_checkout_payment_cod_elm}
    Page Should Contain Element    ${locator_checkout_payment_ipaylinks_elm}
