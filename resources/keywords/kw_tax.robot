*** Settings ***
Documentation     Checkout Page keyword

Resource          ../variable/var_common.robot
Resource          kw_browser.robot
Resource          kw_common.robot
Library           ${CURDIR}/../../lib/customlib/kwshipping.py
*** keyword ***
Taxprice Page Test Setup
    [Documentation]    初始化物流信息
    #. 调用接口，初始化数据
    kwshipping.add_shipping_with_conf_py
    Go To Tax Page



