*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot    # import login keyword
Resource          ../../../resources/browser.robot    # import ajax listener keyword
Resource          ../../../resources/tax_price.robot    # import ajax listener keyword

*** Test Cases ***
Test_Session_Timeout
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Delete All Cookies
    Wait Until Page Contains    登录我的店匠商铺
