*** Settings ***
Documentation     税费设置功能测试
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Test Setup        Taxprice Page Test Setup
Test Teardown     Teardown Test Case
Force Tags        tax
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_tax.robot
Resource          ../../../resources/variable/var_shipping.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_shipping.robot
Resource          ../../../resources/keywords/kw_tax.robot

*** Test Cases ***

taxPrice001
    [Documentation]    测试税金界面可以正常进入
    [Tags]    P0    threshold   smoke
    Go To Tax Page
    加一个判断元素

taxPrice005
    [Documentation]    测试在物流中添加的国家会显示在税金列表中
    [Tags]    P0    threshold   smoke
    Wait Until Page Contains Text   中国
    Wait Until Page Contains Text   China

taxPrice011
    [Documentation]    测试税金界面运费设置按钮
    [Tags]    P0    threshold   smoke
    Wait And Click Element  ${locatorB_taxPrice_button_shippingSet}
    Wait Until Page Contains Locator  ${locatorB_taxPrice_icon_shippingVender}

taxPrice012
    [Documentation]    测试国家栏后面的开启关闭按钮正常
    [Tags]    P0    threshold   smoke
    Click Element  ${locatorB_taxPrice_switch_list}[0]
    Wait Until Page Contains Text   设置成功
    判断是否真的按钮转换了
    Wait Until Page Contains Locator  ${locatorB_taxPrice_icon_shippingVender}
    class="ant-switch ant-switch-checked"

taxPrice017
    [Documentation]    测试城市税金设置
    [Tags]    P0    threshold   smoke
    Wait And Click Element    ${locatorB_taxPrice_icon_set}
    Wait Until Page Contains Text   国家税率

