*** Settings ***
Documentation     收款渠道
Suite Setup       Payment Channel Suite Setup
Suite Teardown    Payment Channel Suite Teardown
Test Setup        Payment Channel Test Setup
Test Teardown     Teardown Test Case
Force Tags        pay
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
#. 已激活用例

pay_001
    [Documentation]    验证收款渠道页面可进入
    [Tags]    P0    threshold   smoke
    Wait Until Page Contains Text    PayPal收款
    Wait Until Page Contains Text    信用卡收款
    Wait Until Page Contains Text    货到付款

pay_024
    [Documentation]    验证信用卡支付栏，可开启当前所选的支付方式
    [Tags]    P0    threshold   smoke
    Credit Card Payment Channel Is Closed
    Go To Payment Channel
    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Element Attribute Should Be Equal With Wait    ${locatorB_pay_switch_creditCardSwitch}    class    ant-switch ant-switch-checked

pay_025
    [Documentation]    验证收款渠道页面，信用卡支付栏，可选择收款渠道ipaylinks
    [Tags]    P0    threshold   smoke
    Credit Card Payment Channel Is Closed
    Wait And Click Element    ${locatorB_pay_link_replacePay}
    Wait And Click Element    ${locatorB_pay_button_paymenChoose}[0]
    Wait Until Page Contains Text    iPayLinks

pay_031
    [Documentation]    验证收款渠道页面，ipaylinks编辑栏，会员号输入框输入正确的内容可保存
    [Tags]    P0    threshold   smoke
    Credit Card Payment Channel Is Closed
    Wait And Click Element     ${locatorB_pay_link_replacePay}
    Wait And Click Element     ${locatorB_pay_button_paymenChoose}[1]
    Sleep And Click Element     ${locatorB_pay_button_creditCardActivation}
    Wait And Click Element     ${locatorB_pay_button_replaceUserCard}
    Wait And Input Text    ${locatorB_pay_input_userCard}    ${empty}
    Wait And Input Text    ${locatorB_pay_input_userCard}    123456
    Wait And Input Text    ${locatorB_pay_input_pwsKey}     ${empty}
    Wait And Input Text    ${locatorB_pay_input_pwsKey}     123456
    Wait And Click Element    ${locatorB_pay_button_bindingMembers}
    Wait Until Page Contains Text     绑定成功

pay_033
    [Documentation]    验证收款渠道页面，ipaylinks编辑栏，绑定会员号后，编辑栏更换会员号按钮可点击
    [Tags]    P0    threshold   smoke
    Credit Card Payment Channel Is Closed
    Wait And Click Element     ${locatorB_pay_link_replacePay}
    Wait And Click Element     ${locatorB_pay_button_paymenChoose}[0]
    Sleep And Click Element     ${locatorB_pay_button_creditCardActivation}
    Wait And Click Element     ${locatorB_pay_button_replaceUserCard}
    Wait Until Page Contains Locator    ${locatorB_pay_input_userCard}
    Wait Until Page Contains Locator    ${locatorB_pay_input_pwsKey}

pay_038
    [Documentation]    验证信用卡支付栏，可选择前海支付渠道
    [Tags]    P0    threshold   smoke
    Credit Card Payment Channel Is Closed
    Wait And Click Element    ${locatorB_pay_link_replacePay}
    Wait And Click Element     ${locatorB_pay_button_paymenChoose}[1]
    Wait Until Page Contains Text     钱海

pay_041
    [Documentation]    验证前海支付栏，编辑页面，账号信息输入正确的内容后可绑定成功
    [Tags]    P0    threshold   smoke
    Credit Card Payment Channel Is Closed
    Wait And Click Element    ${locatorB_pay_link_replacePay}
    Wait And Click Element     ${locatorB_pay_button_paymenChoose}[1]
    Sleep And Click Element     ${locatorB_pay_button_creditCardActivation}
    Wait And Click Element     ${locatorB_pay_button_replaceUserCard}
    Wait And Input Text    ${locatorB_pay_input_account}     123456
    Wait And Input Text    ${locatorB_pay_input_terminal}    123456
    Wait And Input Text    ${locatorB_pay_input_secureCode}    123456
    Wait And Click Element    ${locatorB_pay_button_bindingMembers}
    Wait Until Page Contains Text     绑定成功

pay_049
    [Documentation]    验证信用卡支付栏，可选择stripe支付方式
    [Tags]    P0    threshold   smoke
    Credit Card Payment Channel Is Closed
    Wait And Click Element    ${locatorB_pay_link_replacePay}
    Wait And Click Element     ${locatorB_pay_button_paymenChoose}[3]
    Wait Until Page Contains Text     stripe
    #还原回到，默认状态
    Wait And Click Element    ${locatorB_pay_link_replacePay}
    Wait And Click Element     ${locatorB_pay_button_paymenChoose}[0]

pay_058
    [Documentation]    验证COD支付栏，可开启COD支付
    [Tags]    P0    threshold   smoke
    Sleep    2
    #.判定支付渠道已处于开启状态
    ${class}      Get Element Attribute    ${locatorB_pay_switch_codSwitch}    class
    Run Keyword If    '${class}'=='ant-switch'    Wait And Click Element Then Confirm     ${locatorB_pay_switch_codSwitch}
    Element Attribute Should Be Equal With Wait    ${locatorB_pay_switch_codSwitch}    class    ant-switch ant-switch-checked

pay_062
    [Documentation]    验证COD支付栏编辑页面，COD信息输入正确的内容可保存成功
    [Tags]    P0    threshold   smoke
    Wait And Click Element    ${locatorB_pay_button_deliveryActivation}
    Wait And Input Text    ${locatorB_pay_input_deliveryPayName}     货到付款
    Wait And Input Text    ${locatorB_pay_textarea_deliveryPayInstructions}    支付说明
    Wait And Input Text    ${locatorB_pay_input_deliveryPayWay}    支付指示
    Wait And Click Element    ${locatorB_pay_button_save}
    Wait Until Page Contains Text    保存成功




