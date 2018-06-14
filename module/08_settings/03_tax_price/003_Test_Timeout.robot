*** Settings ***
Documentation     测试登录超时
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        tax
Resource          ../../../resources/kw_login.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/var_tax_price.robot

*** Test Cases ***
Test_Session_Timeout
    [Documentation]    登录超时，删除 cookie，弹窗提示重新登录
    [Tags]    P0
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Delete All Cookies
    #Click Element    class:icon_setting___3OCQq
    Wait Until Page Contains    登录我的店匠商铺
