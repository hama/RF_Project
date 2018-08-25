*** Settings ***
Suite Setup       Open Test Browser    ${home_page}
Suite Teardown    Close Test Suite Browser
#Test Setup
Test Teardown     Teardown Test Case
Force Tags        logout
Library           SeleniumLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/var_login.robot
Resource          ../../../resources/kw_login.robot


*** Test Cases ***
logout001
    [Documentation]     退出登录成功
    [Tags]    P0
    Wait And Input Text     ${locatorB_login_input_account}    ${user_default_name}
    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Element    ${locatorB_order}
    Logout
    Wait Until Page Contains Text    登录我的店匠店铺
