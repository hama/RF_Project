*** Settings ***
Suite Setup       Service Order Suite Setup
Suite Teardown    Service Order Suite Teardown
Test Setup        Service Order Case Setup
Test Teardown     Teardown Test Case
Force Tags        Service Order
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
order_group003
    [Tags]    group
    #检查点
    Check P0 Point From order013
    Check P0 Point From order014
    Check P0 Point From order015

order_group004
    [Tags]    group
    #检查点
    Check P0 Point From order020
    Check P0 Point From order021

order_group006
    [Tags]    group
    #检查点
    Check P0 Point From order025
    Check P0 Point From order027
    Check P0 Point From order028

order_group007
    [Tags]    group
    #前置条件
    kworder.add_deading_order_with_finished_status_py
    Go To Dealing Order Page
    Reload Page And Start Ajax
    Sleep    2
    Sleep And Click Element    ${locatorB_orderDealing_text_firstOrder_orderNum}
    Wait And Click Element Then Cancel    ${locatorB_orderDetail_button_postSale}
    Go To Customer Service Order Page
    Reload Page And Start Ajax
    Sleep    2
    #检查点
    Check P0 Point From order035
    Check P0 Point From order036














