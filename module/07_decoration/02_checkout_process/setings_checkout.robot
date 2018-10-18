*** Settings ***
Documentation     结账页设置功能测试
Suite Setup       Checkout Page Suite Setup
Suite Teardown    Checkout Page Suite Teardown
Test Setup        Checkout Page Test Setup
Test Teardown     Teardown Test Case
Force Tags        checkoutPageSetings

Resource        ../../../resources/keywords/kw_common.robot


*** Test cases ***

checkoutPageSetings001
    [Documentation]    测试结账设置界面可正常进入
    [Tags]    P0    threshold   smoke
    
    Wait Until Page Contains Text   顾客权限

checkoutPageSetings003
    [Documentation]    测试结账设置界面保存按钮
    [Tags]    P0    threshold   smoke
    Wait And Click Element  ${locatorB_checkout_label_buyMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmail}
    Sleep   5
    Click Element  ${locatorB_checkout_radio_name}
    Click Element  ${locatorB_checkout_radio_companyNameOptional}
    Click Element  ${locatorB_checkout_radio_emailCodeHidden}
    Wait And Click Element  ${locatorB_checkout_linkBut_generateRefundTreaty}
    Wait And Click Element  ${locatorBcheckout_linkBut_generatePolicy}
    Wait And Click Element  ${locatorB_checkout_linkBut_generateServiceTreaty}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf min_height_245e ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]

checkoutPageSetings005
    [Documentation]    测试结账设置页面编辑保存
    [Tags]    P0    threshold
    Go To Checkout Settings Page
    Wait And Click Element    ${locatorB_checkout_label_loginMembers}
    Wait And Click Element    ${locatorB_checkout_label_customerPhone}
    Wait And Click Element    ${locatorB_setting}
    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?

checkoutPageSetings008
    [Documentation]    测试结账设置顾客权限功能>1.点击不开启会员注册  2.点击保存
    [Tags]    P0    threshold   smoke

    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerPhone}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]

checkoutPageSetings009
     [Documentation]    测试结账设置顾客权限功能>1.点击注册会员与非注册会员均可购买 2.点击保存
     [Tags]    P0    threshold
     Wait And Click Element  ${locatorB_checkout_label_loginMembers}
     Wait And Click Element  ${locatorB_checkout_label_customerPhone}
     Wait Exist And Click Element  ${locatorB_checkout_button_save}
     Wait Until Page Contains Text   设置成功
     Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
     Reload Page And Start Ajax
     Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]

checkoutPageSetings010
     [Documentation]    测试结账设置顾客权限功能>1.点击会员购买  2.点击保存
     [Tags]    P0    threshold
     Go To Checkout Settings Page
     Wait And Click Element  ${locatorB_checkout_label_buyMembers}
     Wait And Click Element  ${locatorB_checkout_label_customerEmailAndPhone}
     Wait Exist And Click Element  ${locatorB_checkout_button_save}
     Wait Until Page Contains Text   设置成功
     Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
     Reload Page And Start Ajax
     Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]

checkoutPageSetings011
    [Documentation]    测试顾客联系方式设置-邮箱联系方式
    [Tags]    P0    threshold   smoke
    Wait And Click Element  ${locatorB_checkout_label_buyMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmail}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf min_height_245e ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]

checkoutPageSetings012
    [Documentation]    测试顾客联系方式设置-手机联系方式
    [Tags]    P0    threshold   smoke
    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerPhone}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf min_height_245e ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]


checkoutPageSetings013
    [Documentation]    测试顾客联系方式设置-手机和邮箱
    [Tags]    P0    threshold   smoke
    Wait And Click Element  ${locatorB_checkout_label_loginMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmailAndPhone}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="radio_btn_cddf min_height_245e ant-radio-button-wrapper ant-radio-button-wrapper-checked"]')[0]


checkoutPageSetings018
    [Documentation]    测试顾客联系方式设置-手机和邮箱-必填项都取消
    [Tags]    P0    threshold   smoke
    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmailAndPhone}
    @{list1}    Wait And Get Items List From Locator    ${locatorB_checkout_checkbox_selected}
    :FOR    ${var}    IN    @{list1}
    \    Wait And Click Element    ${var}
    Wait Until Page Contains Text   手机和邮箱必填其一!


checkoutPageSetings021
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.姓名格式勾选姓名时点击姓、名分开填写  2.点击保存
    [Tags]    P0    threshold   smoke
    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmail}
    Sleep And Click Element  ${locatorB_checkout_radio_surnameAndName}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[0]

checkoutPageSetings022
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.姓名格式勾选姓、名分开填写时点击姓名  2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element  ${locatorB_checkout_label_buyMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmail}
    Sleep And Click Element  ${locatorB_checkout_radio_surnameAndName}
    Wait Exist And Click Element  ${locatorB_checkout_radio_name}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[0]

checkoutPageSetings023
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.公司名点击必填 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element  ${locatorB_checkout_label_buyMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmailAndPhone}
    Sleep And Click Element  ${locatorB_checkout_radio_surnameAndName}
    Wait Exist And Click Element  ${locatorB_checkout_radio_name}
    Wait Exist And Click Element  ${locatorB_checkout_radio_companyNameMandatory}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[1]

checkoutPageSetings024
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.公司名点击必填 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element  ${locatorB_checkout_label_buyMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmailAndPhone}
    Sleep And Click Element  ${locatorB_checkout_radio_surnameAndName}
    Wait Exist And Click Element  ${locatorB_checkout_radio_name}
    Wait Exist And Click Element  ${locatorB_checkout_radio_companyNameOptional}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[1]

checkoutPageSetings025
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.公司名点击隐藏 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_text_customerRights}
    Wait And Click Element    ${locatorB_checkout_label_customerEmailAndPhone}
    Sleep And Click Element    ${locatorB_checkout_radio_surnameAndName}
    Wait Exist And Click Element    ${locatorB_checkout_radio_name}
    Wait Exist And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text    设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[1]

checkoutPageSetings026
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.邮件编码点击必填 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_text_customerRights}
    Wait And Click Element    ${locatorB_checkout_label_customerEmailAndPhone}
    Sleep And Click Element    ${locatorB_checkout_radio_surnameAndName}
    Wait Exist And Click Element    ${locatorB_checkout_radio_name}
    Wait Exist And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    Wait Exist And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    Wait Exist And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text    设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[1]

checkoutPageSetings027
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.邮件编码点击选填  2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_text_customerRights}
    Wait And Click Element    ${locatorB_checkout_label_customerEmailAndPhone}
    Sleep And Click Element    ${locatorB_checkout_radio_surnameAndName}
    Wait Exist And Click Element    ${locatorB_checkout_radio_name}
    Wait Exist And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    Wait Exist And Click Element    ${locatorB_checkout_radio_emailCodeOptional}
    Wait Exist And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text    设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[1]

checkoutPageSetings028
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.邮件编码点击隐藏 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_text_customerRights}
    Wait And Click Element    ${locatorB_checkout_label_customerEmailAndPhone}
    Sleep And Click Element    ${locatorB_checkout_radio_surnameAndName}
    Wait Exist And Click Element    ${locatorB_checkout_radio_name}
    Wait Exist And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    Wait Exist And Click Element    ${locatorB_checkout_radio_emailCodeHidden}
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text    设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="ant-radio-wrapper ant-radio-wrapper-checked"]')[1]

checkoutPageSetings029
    [Documentation]    测试顾客信息设置-输入退款条约
    [Tags]    P0    threshold   smoke
    Wait And Click Element      ${locatorB_checkout_label_notMembers}
    Wait And Click Element      ${locatorB_checkout_label_customerEmail}
    Sleep And Click Element     ${locatorB_checkout_radio_surnameAndName}
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="btn_wrapper_bdca"]')[0]

checkoutPageSetings030
    [Documentation]    测试顾客信息设置-输入隐私政策
    [Tags]    P0    threshold
    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmail}
    Sleep And Click Element  ${locatorB_checkout_radio_surnameAndName}
    Wait And Input Text  ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}      隐私政策
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="btn_wrapper_bdca"]')[1]

checkoutPageSetings031
    [Documentation]    测试顾客信息设置-输入服务条约
    [Tags]    P0    threshold
    Wait And Click Element      ${locatorB_checkout_label_notMembers}
    Wait And Click Element      ${locatorB_checkout_label_customerEmail}
    Sleep And Click Element     ${locatorB_checkout_radio_surnameAndName}
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}      隐私政策
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}      服务条约
    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class*="btn_wrapper_bdca"]')[2]




