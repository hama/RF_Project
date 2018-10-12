*** Settings ***
Documentation     Checkout Page keyword
Library           SeleniumLibrary    run_on_failure=NOTHING
Resource          ../variable/var_common.robot
Resource          kw_browser.robot
Resource          kw_common.robot
Library           ${CURDIR}/../../lib/customlib/kwshipping.py
*** keyword ***
Taxprice Page Test Setup
    [Documentation]    初始化物流信息
    [Tags]    P0    threshold   smoke
    #. 调用接口，初始化数据
    kwshipping.del_all_shipping_py




Taxprice New Shipping Information
    [Documentation]    添加物流信息为中国
    [Tags]    P0    threshold   smoke
    #.调用接口.新建物流信息，物流信息为中国
    kwshipping.add_shipping_with_conf_py
    Reload Page And Start Ajax



Taxprice New Shipping China
    [Documentation]    添加物流信息为中国
    kwshipping.add_shipping_py
    Reload Page And Start Ajax








