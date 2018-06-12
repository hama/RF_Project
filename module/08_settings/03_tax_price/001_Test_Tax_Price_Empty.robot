*** Settings ***
Documentation     测试内容: 用户未设置税费时，页面提示前往物流设置，并可跳转到物流设置页面
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        tax    # tag for tax price case
Resource          ../../../resources/shoplaza_login.robot
Resource          ../../../resources/browser.robot
Resource          ../../../resources/tax_price.robot

*** Test Cases ***
Test_Tax_Empty
    [Documentation]    税费界面应该不包含实际设置，仅提示前往设置物流
    [Tags]    P0    # P0 级别的用例
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    # using xpath temporary(should be instead by element id)
    Assign Id To Element    xpath://ul[@id="9$Menu"]//li[4]    tax_price_btn
    Wait Until Element Is Visible    id:tax_price_btn
    Click Element    id:tax_price_btn
    Wait Until Page Contains    ${tax_shipping_setting}
    # 跳转到物流设置页面
    Click Button    ${tax_shipping_setting}
    Wait Until Page Contains    ${tax_shipping_setting_msg}
    Page Should Contain    ${tax_shipping_setting_title}
