*** Settings ***
Documentation     税费正常功能测试
Suite Setup       New Test Suite Browser And Login    ${user_default_name}    ${user_default_pwd}    ${user_default_domain}
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        tax
Library           SeleniumLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_shipping.robot

*** Test Cases ***
001 Test No Shipping
    [Documentation]    [测试内容]: 提示设置物流 [预期结果]: 税费页面提示前往物流设置，点击跳转到物流设置页面
    [Tags]    P0
    Go To Tax Price Page
    Comment    跳转到物流设置页面
    Wait And Click Button    ${locator_tax_goto_shipping}
    Wait Until Page Contains    ${content_shipping_tab2}
    Page Should Contain    ${content_shipping_tab1}
