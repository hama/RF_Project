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
    Wait Until Page Contains Locator    ${locatorB_checkout_button_nav_tradingRules}

checkoutPageSetings003
    [Documentation]    测试结账设置界面保存按钮
    [Tags]    P0    threshold   smoke
    Wait And Click Element    ${locatorB_checkout_label_buyMembers}
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    #.点击收货信息元素
    Wait And Click Element    ${locatorB_checkout_radio_name}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}

checkoutPageSetings005
    [Documentation]    测试结账设置页面编辑保存  >  1.修改内容后不保存  2.离开结账设置页面
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_label_buyMembers}
    Sleep And Click Element    ${locatorB_overview}
    Wait Alert Should Be Present And Dismiss   页面上有未保存内容，是否确定退出?

checkoutPageSetings006
    [Documentation]    测试结账设置页面编辑保存  >  1.未保存内容退出提示框出现  2.点击确认退出
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_label_buyMembers}
    Sleep And Click Element    ${locatorB_overview}
    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?
    Go To Checkout Settings Page
    Element Attribute Should Contain With Wait     ${locatorB_checkout_label_registerMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked

checkoutPageSetings007
    [Documentation]    测试结账设置页面编辑保存  >  1.未保存内容退出提示框出现 2.点击取消
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_checkout_label_buyMembers}
    Sleep And Click Element    ${locatorB_overview}
    Wait Alert Should Be Present And Dismiss    页面上有未保存内容，是否确定退出?
    Element Attribute Should Contain With Wait     ${locatorB_checkout_label_buyMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked
    Wait Until Page Contains Locator      ${locatorB_checkout_button_save}

# 功能被屏蔽，暂时不测（10.31）
#checkoutPageSetings008
#    [Documentation]    测试结账设置顾客权限功能>1.点击不开启会员注册  2.点击保存
#    [Tags]    P0    threshold   smoke
#    Wait And Click Element    ${locatorB_checkout_label_notMembers}
#    Wait And Click Element    ${locatorB_checkout_button_nav_information}
#    Wait And Click Element    ${locatorB_checkout_radio_name}
#    Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
#    Sleep And Click Element  ${locatorB_checkout_button_save}
#    Wait Until Page Contains Text   设置成功
#    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Wait And Click Element    ${locatorB_checkout_button_nav_tradingRules}
#    Element Attribute Should Contain With Wait     ${locatorB_checkout_label_notMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked

checkoutPageSetings009
     [Documentation]    测试结账设置顾客权限功能>1.点击注册会员与非注册会员均可购买 2.点击保存
     [Tags]    P0    threshold
     Wait And Click Element    ${locatorB_checkout_label_registerMembers}
     Wait And Click Element    ${locatorB_checkout_button_nav_information}
     Wait And Click Element    ${locatorB_checkout_radio_name}
     Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
     Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
     Sleep And Click Element    ${locatorB_checkout_button_save}
     Wait Until Page Contains Text   设置成功
     Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
     Reload Page And Start Ajax
     Wait And Click Element    ${locatorB_checkout_button_nav_tradingRules}
     Element Attribute Should Contain With Wait     ${locatorB_checkout_label_registerMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked

checkoutPageSetings010
     [Documentation]    测试结账设置顾客权限功能>1.点击会员购买  2.点击保存
     [Tags]    P0    threshold
     Wait And Click Element    ${locatorB_checkout_label_buyMembers}
     Wait And Click Element    ${locatorB_checkout_button_nav_information}
     Wait And Click Element    ${locatorB_checkout_radio_name}
     Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
     Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
     Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
     Wait Exist And Click Element     ${locatorB_checkout_button_save}
     Wait Until Page Contains Text    设置成功
     Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
     Reload Page And Start Ajax
     Wait And Click Element    ${locatorB_checkout_button_nav_tradingRules}
     Element Attribute Should Contain With Wait     ${locatorB_checkout_label_buyMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked

checkoutPageSetings011.1
    [Documentation]       此用例未更新，新增模块
    [Tags]    P0    threshold   smoke
    Wait And Click Element     ${locatorB_checkout_label_registerMembers}
    Wait And Click Element     ${locatorB_checkout_button_nav_information}
    Wait And Click Element     ${locatorB_checkout_radio_name}
    Wait And Click Element     ${locatorB_checkout_radio_companyNameHidden}
    Wait And Click Element     ${locatorB_checkout_radio_emailCodeMandatory}
    #手机必选
    Wait And Click Element     ${locatorB_checkout_radio_phoneCodeMandatory}
    Sleep And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_phoneCodeMandatory}    class    ant-radio-wrapper ant-radio-wrapper-checked

checkoutPageSetings012.1
    [Documentation]     此用例未更新，新增模块
    [Tags]    P0    threshold   smoke
    Wait And Click Element     ${locatorB_checkout_label_registerMembers}
    Wait And Click Element     ${locatorB_checkout_button_nav_information}
    Wait And Click Element     ${locatorB_checkout_radio_name}
    Wait And Click Element     ${locatorB_checkout_radio_companyNameHidden}
    Wait And Click Element     ${locatorB_checkout_radio_emailCodeOptional}
    #手机选填
    Wait And Click Element     ${locatorB_checkout_radio_phoneCodeOptional}
    Wait Exist And Click Element     ${locatorB_checkout_button_save}
    Wait Until Page Contains Text    设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_phoneCodeOptional}    class    ant-radio-wrapper ant-radio-wrapper-checked

checkoutPageSetings013.1
    [Documentation]    此用例未更新，新增模块
    [Tags]    P0    threshold   smoke
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_name}
    Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeHidden}
    #手机选填
    Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
    Sleep And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_phoneCodeHidden}    class    ant-radio-wrapper ant-radio-wrapper-checked

#...
# checkoutPageSetings018
#    [Documentation]    测试顾客联系方式设置-手机和邮箱-必填项都取消
#    [Tags]    P0    threshold   smoke
#    Wait And Click Element  ${locatorB_checkout_label_notMembers}
#    Wait And Click Element  ${locatorB_checkout_label_customerEmailAndPhone}
#    @{list1}    Wait And Get Items List From Locator    ${locatorB_checkout_checkbox_selected}
#    :FOR    ${var}    IN    @{list1}
#    \    Wait And Click Element    ${var}
#    Wait Until Page Contains Text   手机和邮箱必填其一!
#...

checkoutPageSetings021
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.姓名格式勾选姓名时点击姓、名分开填写  2.点击保存
    [Tags]    P0    threshold   smoke
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    #.姓名 分开写
    Wait And Click Element    ${locatorB_checkout_radio_surnameAndName}
    Wait And Click Element    ${locatorB_checkout_radio_companyNameMandatory}
    Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
    Sleep And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_surnameAndName}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Sleep    2
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_firstName}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_lastName}
    #Add Address Common Step
    #Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}


checkoutPageSetings022
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.姓名格式勾选姓、名分开填写时点击姓名  2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    #.姓名
    Wait And Click Element    ${locatorB_checkout_radio_name}
    Wait And Click Element    ${locatorB_checkout_radio_companyNameMandatory}
    Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
    Sleep And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_name}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_onlyName}

checkoutPageSetings023
    [Documentation]    测试顾客信息设置-.1.公司名点击必填 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_surnameAndName}
    #。公司名
    Wait And Click Element    ${locatorB_checkout_radio_companyNameMandatory}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_companyNameMandatory}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_company}     ${empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Please enter your company


checkoutPageSetings024
    [Documentation]    测试顾客信息设置-.1.公司名点击选填 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_surnameAndName}
    #。公司名选填
    Wait And Click Element    ${locatorB_checkout_radio_companyNameOptional}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_companyNameOptional}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    #Go To First Product C Interface
    #Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    #Add Address Common Step
    #Wait And Input Text    ${locatorC_checkoutShipping_address_input_company}     ${empty}
    #Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    #Wait Until Page Not Contains Text    Please enter your company


checkoutPageSetings025
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.公司名点击隐藏 2.点击保存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_surnameAndName}
    #。公司名 隐藏
    Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_companyNameHidden}    class    ant-radio-wrapper ant-radio-wrapper-checked

checkoutPageSetings026.1
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.邮件编码点击必填 2.点击保存      此用例邮件编码为我换成邮件
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_surnameAndName}
    Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    #邮箱必填
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked

checkoutPageSetings027.1
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.邮件编码点击选填  2.点击保存      此用例邮件编码为我换成邮件
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_surnameAndName}
    Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    #邮箱选填
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeOptional}
    Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeOptional}   class    ant-radio-wrapper ant-radio-wrapper-checked

checkoutPageSetings028.1
    [Documentation]    测试顾客信息设置-点击姓和名分开.1.邮件编码点击隐藏 2.点击保存      此用例邮件编码为我换成邮件
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_surnameAndName}
    Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    #邮箱隐藏
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeHidden}
    Wait And Click Element    ${locatorB_checkout_radio_phoneCodeHidden}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeHidden}   class    ant-radio-wrapper ant-radio-wrapper-checked

checkoutPageSetings029
    [Documentation]    测试顾客信息设置-输入退款条约
    [Tags]    P0    threshold   smoke
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约内容
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_checkout_button_nav_serviceTerms}
    Wait Until Page Contains Text    退款条约内容

checkoutPageSetings030
    [Documentation]    测试顾客信息设置-输入隐私政策
    [Tags]    P0    threshold
    Sleep    2
    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     隐私政策内容
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_checkout_button_nav_serviceTerms}
    Wait Until Page Contains Text    隐私政策内容

checkoutPageSetings031
    [Documentation]    测试顾客信息设置-输入服务条约
    [Tags]    P0    threshold
    Sleep    2
    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服务条约内容
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_checkout_button_nav_serviceTerms}
    Wait Until Page Contains Text    服务条约内容















