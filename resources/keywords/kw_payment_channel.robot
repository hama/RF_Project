*** Settings ***
Resource          kw_common.robot

*** keyword ***
Payment Channel Suite Setup
    kwpayment.activate_payment_credit_card_py
    Login With Default User

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
     ${class}=    Run Keyword If    '${status}'=='True'    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
     Run Keyword If    $class=='ant-switch ant-switch-checked'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
     Sleep    5
     Wait And Click Element    ${locatorB_pay_link_replacePay}
     Wait And Click Element    ${locatorB_pay_creditCard_button_ipaylinks}
     Wait Until Page Contains Text    信用卡收款
     Wait And Click Element    ${locatorB_pay_button_creditCardActivation}
     Wait And Click Element    ${locatorB_pay_button_changeNum}
     ${is_changeButton}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_pay_button_changeNum}
     Run Keyword If    '${is_changeButton}'=='True'    Run Keywords    Wait And Input Text  ${locatorB_pay_input_userCard}  10000009446    AND    Wait And Input Text  ${locatorB_pay_input_pwsKey}  ${locatorB_pay_input_pwsKeyText}  AND    Wait And Click Element  ${locatorB_pay_button_bindingMembers}    AND  Wait Until Page Not Contains Locator  ${locatorB_pay_button_bindingMembers}

Select Credit Card Of OceanPayment
    [Documentation]    信用卡选择 钱海 收款方式
    Sleep    2
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_pay_switch_creditCardSwitch}
    ${class}=    Run Keyword If    '${status}'=='True'    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    $class=='ant-switch ant-switch-checked'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Sleep    5
    Wait And Click Element    ${locatorB_pay_link_replacePay}
    Wait And Click Element     ${locatorB_pay_creditCard_button_oceanpayment}
    Wait Until Page Contains Text    信用卡收款
    Wait And Click Element    ${locatorB_pay_button_creditCardActivation}
    ${is_changeButton}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_pay_button_changeNum}
    Run Keyword If    '${is_changeButton}'=='False'    Run Keywords    Wait And Input Text  ${locatorB_pay_input_account}  150260    AND    Wait And Input Text  ${locatorB_pay_input_terminal}  15026001    AND    Wait And Input Text  ${locatorB_pay_input_secureCode}  12345678    AND    Wait And Click Element  ${locatorB_pay_button_bindingMembers}    AND  Wait Until Page Not Contains Locator  ${locatorB_pay_button_bindingMembers}
    ...    else    Wait And Click Element    ${locatorB_pay_button_creditCardActivation}

Select Credit Card Of Stripe
    [Documentation]    信用卡选择 stripe 收款方式
    Sleep    2
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_pay_switch_creditCardSwitch}
    ${class}=    Run Keyword If    '${status}'=='True'    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    $class=='ant-switch ant-switch-checked'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Sleep    5
    Wait And Click Element    ${locatorB_pay_link_replacePay}
    Wait And Click Element     ${locatorB_pay_creditCard_button_stripe}
    Wait Until Page Contains Text     信用卡收款


