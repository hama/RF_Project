*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Force Tags        Subtraction
Resource          ../../resources/kw_browser.robot
Resource          ../../resources/kw_common.robot
Resource          ../../resources/var_subtraction.robot
Library           SeleniumLibrary
Resource          ../../resources/kw_add_order.robot
Resource          ../../resources/kw_order.robot
Resource          ../../resources/kw_products.robot

*** Test Cases ***
subtraction001
    [Documentation]    进入满减活动界面，查看左上角标题
    [Tags]    P0
    Go To Subtraction Page