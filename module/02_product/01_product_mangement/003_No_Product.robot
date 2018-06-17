*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    1004714019@qq.com    123456    test
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Product_List
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    class:table_null_p___1yzjh
    Page Should Contain    暂无数据
