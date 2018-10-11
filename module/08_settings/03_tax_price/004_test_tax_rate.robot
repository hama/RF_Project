*** Settings ***
Documentation     税费设置功能测试
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Test Setup        Taxprice Page Test Setup
Test Teardown     Teardown Test Case
Force Tags        checkoutPageSetings


Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_tax_price.robot
Resource          ../../../resources/variable/var_shipping.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_shipping.robot
Resource          ../../../resources/keywords/kw_tax_rate.robot
Resource          ../../../resources/variable/var_tax_rate.robot


Library           SeleniumLibrary    run_on_failure=NOTHING

*** Test Cases ***

ShippingTaxRate001
    [Documentation]    测试税金界面可以正常进入
    [Tags]    P0    threshold   smoke
    Go To Tax Page

ShippingTaxRate005
    [Documentation]    测试在物流中添加的国家会显示在税金列表中
    [Tags]    P0    threshold   smoke
    Go To Shipping Page
    Sleep  2
    Wait And Click Element  ${locatorB_shipping_button_btn}
    #.添加一个物流信息
    Taxprice New Shipping Information
    Sleep  5
    Go To Tax Page
    Wait Until Page Contains Text   中国

ShippingTaxRate011
    [Documentation]    测试税金界面运费设置按钮
    [Tags]    P0    threshold   smoke
    Go To Tax Page

    #.添加一个物流信息
    Taxprice New Shipping Information

    Sleep  4
    Wait And Click Element  ${locatorB_taxPrice_button_logisticsSet}
    Wait Until Page Contains Locator  ${locatorB_taxPrice_div_logisticsProviders}

ShippingTaxRate012
    [Documentation]    测试国家栏后面的开启关闭按钮正常
    [Tags]    P0    threshold   smoke
    Go To Tax Page

    #.添加一个物流信息
    Taxprice New Shipping Information

    Sleep   4
    Click Element  ${locatorB_taxPrice_span_closeAndOpen}
    Wait Until Page Contains Text   设置成功

ShippingTaxRate017
    [Documentation]    测试城市税金设置
    [Tags]    P0    threshold   smoke
    Go To Tax Page

    #.添加一个物流信息
    Taxprice New Shipping Information

    Sleep  4
    Wait And Click Element  ${locatorB_taxPrice_i_setUp}

    Wait Until Page Contains Text   国家税率

