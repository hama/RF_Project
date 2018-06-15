*** Settings ***
Documentation     税费正常功能测试
Suite Setup       New Test Suite Browser And Login    ${testUser1}    ${testUser1Password}    ${testUser1Domain}
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        tax
Library           SeleniumLibrary
Resource          ../../../resources/kw_login.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_shipping.robot
Resource          ../../../resources/var_tax_price.robot

*** Variables ***
${tax_page}       http://admin1024.shoplazza.com/taxPrice    # 税费页面URL

*** Test Cases ***
001 Test No Shipping
    [Documentation]    [测试内容]: 提示设置物流 [预期结果]: 税费页面提示前往物流设置，点击跳转到物流设置页面
    [Tags]    P0
    Go To Tax Price Page
    Comment    跳转到物流设置页面
    Click Button    ${tax_shipping_setting}
    Wait Until Page Contains    ${tax_shipping_setting_msg}
    Page Should Contain    ${tax_shipping_setting_title}
