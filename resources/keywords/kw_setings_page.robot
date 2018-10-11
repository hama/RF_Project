*** Settings ***
Documentation     Checkout Page keyword
Library           SeleniumLibrary    run_on_failure=NOTHING
Resource          ../variable/var_setings_page.robot
Resource          ../variable/var_common.robot
Resource          kw_browser.robot
Resource          kw_common.robot
Library           ${CURDIR}/../../lib/customlib/kwcheckout.py
*** keyword ***
Checkout Page Test Setup
    [Documentation]    测试结账设置界面保存按钮
    [Tags]    P0    threshold   smoke
    #. 调用接口，初始化数据
    kwcheckout.set_checkout_process_py
