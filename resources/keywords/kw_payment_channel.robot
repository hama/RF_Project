*** Settings ***
Resource          kw_common.robot

*** keyword ***
Payment Channel Suite Setup
    Login With Default User
    kwpayment.activate_payment_credit_card_py


Payment Channel Suite Teardown
    Close Test Suite Browser


Payment Channel Test Setup
	Go To Payment Channel
	Select Credit Card Of IpayLinks

Payment Channel Test Teardown
    Select Credit Card Of IpayLinks
    Teardown Test Case


Select Credit Card Of IpayLinks
    [Documentation]    信用卡选择 ipaylinks 收款方式
     Sleep    2
     ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_pay_switch_creditCardSwitch}
     ${class}=    Run Keyword If    '${status}'=='True'    Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
     Run Keyword If    $class=='ant-switch ant-switch-checked'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
     Sleep    5
     Wait And Click Element    ${locatorB_pay_link_replacePay}
     Wait And Click Element    ${locatorB_pay_creditCard_button_ipaylinks}
     Wait Until Page Contains Text    iPayLinks

Select Credit Card Of OceanPayment
    [Documentation]    信用卡选择 钱海 收款方式
    Sleep    2
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_pay_switch_creditCardSwitch}
    ${class}=    Run Keyword If    '${status}'=='True'    Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    $class=='ant-switch ant-switch-checked'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Sleep    5
    Wait And Click Element    ${locatorB_pay_link_replacePay}
    Wait And Click Element     ${locatorB_pay_creditCard_button_oceanpayment}
    Wait Until Page Contains Text     钱海

Select Credit Card Of Stripe
    [Documentation]    信用卡选择 stripe 收款方式
    Sleep    2
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_pay_switch_creditCardSwitch}
    ${class}=    Run Keyword If    '${status}'=='True'    Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    $class=='ant-switch ant-switch-checked'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Sleep    5
    Wait And Click Element    ${locatorB_pay_link_replacePay}
    Wait And Click Element     ${locatorB_pay_creditCard_button_stripe}
    Wait Until Page Contains Text     stripe


