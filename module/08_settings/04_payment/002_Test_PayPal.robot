*** Settings ***
Documentation     Test payment price page ui.
Suite Setup       New Test Suite Browser And Login    1004714019@qq.com    123456    test
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot    # import login keyword
Resource          ../../../resources/browser.robot    # import ajax listener keyword

*** Test Cases ***
Test_PayPal
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    Click Element    //*[@id="9$Menu"]/li[4]/a
    Sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-tabs-tab")[1]
    Click Element    dom:document.querySelectorAll(".ant-tabs-tab")[1]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".paySetting_setting___1lGiv")[0]
    Click Element    dom:document.querySelectorAll(".paySetting_setting___1lGiv")[0]
