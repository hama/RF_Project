*** Settings ***
Documentation     测试税费页面登录超时
Suite Setup       New Test Suite Browser And Login    ${testUser1}    ${testUser1Password}    ${testUser1Domain}
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        tax
Library           SeleniumLibrary
Resource          ../../../resources/kw_login.robot
Resource          ../../../resources/kw_browser.robot

*** Test Cases ***
001 Test Session Timeout
    [Documentation]    测试登录超时功能，删除 cookie，弹窗提示重新登录
    [Tags]    P1
    Go To Tax Price Page
    Delete All Cookies
    Click Element    id:test_setting
    Wait Until Page Contains    登录我的店匠商铺
