*** Settings ***
Resource          kw_common.robot

*** keyword ***
Payment Channel Suite Setup
    [Documentation]    初始化物流信息
    Login With Default User


Payment Channel Suite Teardown
    [Documentation]
    Close Test Suite Browser

Payment Channel Test Setup
	Go To Payment Channel


#.判定信用卡支付渠道是否已经被关闭

Credit Card Payment Channel Is Closed
    [Documentation]      #.判定支付渠道已处于关闭状态
    Sleep    2
    ${class}      Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    '${class}'=='ant-switch ant-switch-checked'    Wait And Click Element Then Confirm     ${locatorB_pay_switch_creditCardSwitch}
    Sleep    2


