*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/kw_login.robot    
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Validate_Normal_Page
    #验证商品抓取页面跳转
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #商品抓取按钮
    Wait Until Page Contains Element    dom:document.querySelectorAll(".crawling___1s2i9")[0]
    Click Element    dom:document.querySelectorAll(".crawling___1s2i9")[0]
    #验证抓取页面
    Wait Until Page Contains Element    dom:document.querySelectorAll(".header_left___3RMen")[0].querySelectorAll("span")[0]
    ${name}    Get Text    dom:document.querySelectorAll(".header_left___3RMen")[0].querySelectorAll("span")[0]
    Should Be Equal As Strings    ${name}    商品抓取
