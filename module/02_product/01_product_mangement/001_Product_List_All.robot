*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot    # import login keyword
Resource          ../../../resources/browser.robot    # import ajax listener keyword
Resource          ../../../resources/tax_price.robot    # import ajax listener keyword

*** Test Cases ***
Test_Tax_Page_Normal
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-pagination-total-text")[0]
    ${count}    Get Text    dom:document.querySelectorAll(".ant-pagination-total-text")[0]
    Convert To Integer    ${count}
    Log    ${count}
