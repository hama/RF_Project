*** Settings ***
Documentation     收款渠道
Suite Setup       Payment Channel Suite Setup
Suite Teardown    Payment Channel Suite Teardown
Test Setup        Payment Channel Test Setup
Test Teardown     Teardown Test Case
Force Tags        pay
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
#. 未激活用例

pay_003
    [Documentation]    验证新账号收款渠道页面，PayPal支付栏，激活按钮可点击
    [Tags]    P0
    Sleep   5
    Wait And Click Element    ${locatorB_pay_button_paypalActivation}
    Focus On New Window
    Sleep   5
    Reload Page
    Location Should Contain With Wait    https://www.paypal.com/

pay_019
    [Documentation]    验证新账号收款渠道页面，点击信用卡支付栏激活按钮，可跳转到信用卡渠道选择页面
    [Tags]    P0
    Wait And Click Element    ${locatorB_pay_button_creditCardActivation}
    Wait Until Page Contains Text    iPayLinks收款
    Wait Until Page Contains Text    钱海收款
    Wait Until Page Contains Text    富汇通收款
    Wait Until Page Contains Text    stripe收款

pay_050
    [Documentation]    验证未激活stripe时，stripe支付栏后面激活按钮可点击
    [Tags]    P0
    Credit Card Payment Channel Is Closed
    Wait And Click Element    ${locatorB_pay_link_replacePay}
    Wait And Click Element    ${locatorB_pay_button_paymenChoose}[3]
    Sleep  2
    Wait And Click Element    ${locatorB_pay_button_creditCardActivation}
    Focus On New Window
    Sleep   5
    Reload Page
    Location Should Contain With Wait    https://connect.stripe.com/oauth/

















