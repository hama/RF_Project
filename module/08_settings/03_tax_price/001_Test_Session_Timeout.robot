*** Settings ***
Documentation     测试税费页面登录超时
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        tax
Library           SeleniumLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot

*** Test Cases ***
001 Test Session Timeout
    [Documentation]    测试登录超时功能，删除 cookie，弹窗提示重新登录
    [Tags]    P1
    Go To Tax Price Page
    Delete All Cookies
    Wait And Click Element    ${locatorB_setting}
    Page Should Contain    登录我的店匠商铺
