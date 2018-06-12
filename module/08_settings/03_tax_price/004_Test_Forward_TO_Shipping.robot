*** Settings ***
Documentation     测试: 从税费页面点击物流设置跳转到物流页面
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot
Resource          ../../../resources/browser.robot
Resource          ../../../resources/tax_price.robot

*** Test Cases ***
Test_Forward_To_Shipping
    [Documentation]    测试: 从税费页面点击物流设置跳转到物流页面
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    # using xpath temporary(should be instead by element id)
    Assign Id To Element    xpath://ul[@id="9$Menu"]//li[4]    tax_price_btn
    Wait Until Element Is Visible    id:tax_price_btn
    Click Element    id:tax_price_btn
    Wait Until Page Contains    ${tax_price_setting}
    sleep    2
    log    测试页面基本内容
    Page Should Contain    ${tax_page_country}
    Page Should Contain    ${tax_page_country_price}
    Page Should Contain    ${tax_page_location}
    Page Should Contain    ${tax_page_operation}
    Page Should Contain    ${tax_page_tips}
    log    点击设置按钮，跳转到物流设置
    Click Button    tag:button
    Wait Until Page Contains    ${tax_shipping_setting_title}
    Page Should Contain    ${tax_shipping_tab1}
    Page Should Contain    ${tax_shipping_tab1}
