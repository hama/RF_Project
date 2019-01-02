*** Settings ***
Documentation     交易设置页面功能测试
Suite Setup       Checkout Page Suite Setup
Suite Teardown    Checkout Page Suite Teardown
Test Setup        Checkout Page Test Setup
Test Teardown     Teardown Test Case
Force Tags        Trade setting_

Resource        ../../../resources/keywords/kw_common.robot

*** Test cases ***
Trade setting_001
    [Documentation]    测试结账设置界面可正常进入
    [Tags]    P0    threshold
    Go To TradingRules Table
    Wait Until Page Contains Locator    ${locatorB_checkout_button_nav_tradingRules}
    Wait Until Page Contains Locator    ${locatorB_checkout_button_nav_serviceTerms}

Trade setting_003
    [Documentation]    验证交易设置页面，交易规则tab可切换
    [Tags]    P0    threshold
    Go To ServiceTerms Table
    Sleep And Click Element    ${locatorB_checkout_button_nav_tradingRules}
    Wait Until Page Contains Locator    ${locatorB_checkout_button_nav_tradingRules}
    Wait Until Page Contains Locator    ${locatorB_checkout_button_nav_serviceTerms}

Trade setting_004
    [Documentation]    验证交易设置页面，服务条款tab可切换
    [Tags]    P0    threshold
    Go To TradingRules Table
    Sleep And Click Element    ${locatorB_checkout_button_nav_serviceTerms}
    Wait Until Page Contains Locator    ${locatorB_checkout_textarea_refundTreatyInputBox}
    Wait Until Page Contains Locator    ${locatorB_checkout_button_generateRefundTreaty}

Trade setting_005
    [Documentation]    验证交易设置页面，修改内容后可保存
    [Tags]    P0    threshold   smoke
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_label_buyMembers}
    Wait And Click Element    ${locatorB_checkout_radio_name}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}

Trade setting_005
    [Documentation]    测试结账设置页面编辑保存  >  1.修改内容后不保存  2.离开结账设置页面
    [Tags]    P0    threshold
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_label_buyMembers}
    Sleep And Click Element    ${locatorB_overview}
    Wait Alert Should Be Present And Dismiss   页面上有未保存内容，是否确定退出?

Trade setting_006
    [Documentation]    测试结账设置页面编辑保存  >  1.未保存内容退出提示框出现  2.点击确认退出
    [Tags]    P0    threshold
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_label_buyMembers}
    Sleep And Click Element    ${locatorB_overview}
    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?
    Go To Checkout Settings Page
    Element Attribute Should Contain With Wait     ${locatorB_checkout_label_registerMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked

Trade setting_007
    [Documentation]    测试结账设置页面编辑保存  >  1.未保存内容退出提示框出现 2.点击取消
    [Tags]    P1    threshold
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_label_buyMembers}
    Sleep And Click Element    ${locatorB_overview}
    Wait Alert Should Be Present And Dismiss    页面上有未保存内容，是否确定退出?
    Element Attribute Should Contain With Wait     ${locatorB_checkout_label_buyMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked
    Wait Until Page Contains Locator      ${locatorB_checkout_button_save}

# 功能被屏蔽，暂时不测（10.31）
#Trade setting_008
#    [Documentation]    测试结账设置顾客权限功能>1.点击不开启会员注册  2.点击保存
#    [Tags]    P0    threshold   smoke
#    Go To TradingRules Table
#    Wait And Click Element    ${locatorB_checkout_label_notMembers}
#    Go To Information Table
#    Wait And Click Element    ${locatorB_checkout_radio_name}
#    Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
#    Sleep And Click Element  ${locatorB_checkout_button_save}
#    Wait Until Page Contains Text   设置成功
#    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Go To TradingRules Table
#    Element Attribute Should Contain With Wait     ${locatorB_checkout_label_notMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked

Trade setting_009
     [Documentation]    测试结账设置顾客权限功能>1.点击注册会员与非注册会员均可购买 2.点击保存
     [Tags]    P0    threshold
     Go To TradingRules Table
     Wait And Click Element    ${locatorB_checkout_label_registerMembers}
     Element Attribute Should Contain With Wait     ${locatorB_checkout_label_registerMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked
     Reload Page And Start Ajax
     Go To First Product C Interface
     Wait And Click Element    ${locatorC_productDetail_button_buyNow}
     Wait Until Page Contains Text    Shipping Address

Trade setting_010
     [Documentation]    测试结账设置顾客权限功能>1.点击会员购买  2.点击保存
     [Tags]    P0    threshold
     Go To TradingRules Table
     Wait And Click Element    ${locatorB_checkout_label_buyMembers}
     Sleep    2
     Wait And Click Element    ${locatorB_checkout_button_save}
     Wait Until Page Contains Text    设置成功
     Element Attribute Should Contain With Wait     ${locatorB_checkout_label_buyMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked
     Reload Page And Start Ajax
     Go To First Product C Interface
     Wait And Click Element    ${locatorC_productDetail_button_buyNow}
     Wait Until Page Contains Locator    ${locatorC_input_email}

Trade setting_011.1
    [Documentation]       此用例未更新，新增模块--->手机必选
    [Tags]    P0    threshold   smoke
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Go To Information Table
    Wait And Click Element     ${locatorB_checkout_radio_phoneCodeMandatory}
    Sleep And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_phoneCodeMandatory}    class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_phone}    ${Empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Please enter your phone

Trade setting_012.1
    [Documentation]     此用例未更新，新增模块--->手机选填
    [Tags]    P0    threshold   smoke
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Go To Information Table
    Wait And Click Element     ${locatorB_checkout_radio_phoneCodeOptional}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_phoneCodeOptional}    class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_phone}    ${Empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Locator    ${locatorC_checkout_button_completeOrder}

Trade setting_013.1
    [Documentation]    此用例未更新，新增模块-->手机隐藏
    [Tags]    P0    threshold   smoke
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Go To Information Table
    Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
    Sleep And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_phoneCodeHidden}    class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Not Contains Locator    ${locatorC_checkoutShipping_address_input_phone}

#...
# Trade setting_018
#    [Documentation]    测试顾客联系方式设置-手机和邮箱-必填项都取消
#    [Tags]    P0    threshold   smoke
#    Wait And Click Element  ${locatorB_checkout_label_notMembers}
#    Wait And Click Element  ${locatorB_checkout_label_customerEmailAndPhone}
#    @{list1}    Wait And Get Items List From Locator    ${locatorB_checkout_checkbox_selected}
#    :FOR    ${var}    IN    @{list1}
#    \    Wait And Click Element    ${var}
#    Wait Until Page Contains Text   手机和邮箱必填其一!
#...















