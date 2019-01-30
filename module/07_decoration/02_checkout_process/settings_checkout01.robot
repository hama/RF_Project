*** Settings ***
Documentation     交易设置页面功能测试
Suite Setup       Checkout Page Suite Setup
Suite Teardown    Checkout Page Suite Teardown
Test Setup        Checkout Page Test Setup
Test Teardown     Teardown Test Case
Force Tags        Trade setting

Resource        ../../../resources/keywords/kw_common.robot

*** Test cases ***
Trade setting_001
    [Documentation]    验证可进入交易设置页面
    [Tags]    P0    threshold
    Go To TradingRules Table
    Wait Until Page Contains Locator    ${locatorB_checkout_button_nav_tradingRules}
    Wait Until Page Contains Locator    ${locatorB_checkout_button_nav_serviceTerms}

Trade setting_003
    [Documentation]    验证交易设置页面，交易规则tab可切换
    [Tags]    P0    threshold
    Go To ServiceTerms Table
    Wait And Click Element    ${locatorB_checkout_button_nav_tradingRules}
    Wait Until Page Contains Locator    ${locatorB_checkout_button_nav_tradingRules}
    Wait Until Page Contains Locator    ${locatorB_checkout_button_nav_serviceTerms}

Trade setting_004
    [Documentation]    验证交易设置页面，服务条款tab可切换
    [Tags]    P0    threshold
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_button_nav_serviceTerms}
    Wait Until Page Contains Locator    ${locatorB_checkout_textarea_refundTreatyInputBox}
    Wait Until Page Contains Locator    ${locatorB_checkout_button_generateRefundTreaty}

Trade setting_005
    [Documentation]    验证交易设置页面，修改内容后可保存
    [Tags]    P0    threshold
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_label_buyMembers}
    Wait And Click Element    ${locatorB_checkout_radio_name}
    Wait And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功
    Wait Until Page Not Contains Locator      ${locatorB_checkout_button_save}

Trade setting_011
     [Documentation]    验证交易规则栏设置为注册会员与非注册会员均可购买时，C端未登录个人中心可购买商品
     [Tags]    P0    threshold
     Go To TradingRules Table
     Wait And Click Element    ${locatorB_checkout_label_registerMembers}
     Sleep    2
     ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
     Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
     Element Attribute Should Contain With Wait     ${locatorB_checkout_label_registerMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked
     Reload Page And Start Ajax
     Go To First Product C Interface
     Wait And Click Element    ${locatorC_productDetail_button_buyNow}
     Wait Until Page Contains Text    Shipping Address

Trade setting_012
     [Documentation]    验证交易规则栏设置为会员购买时，C端未登录个人中心在商品详情页面点击buy now时，会跳转到个人中心登录页面
     [Tags]    P0    threshold
     Go To TradingRules Table
     Wait And Click Element    ${locatorB_checkout_label_buyMembers}
     Sleep    2
     ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
     Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
     Element Attribute Should Contain With Wait     ${locatorB_checkout_label_buyMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked
     Reload Page And Start Ajax
     Go To First Product C Interface
     Wait And Click Element    ${locatorC_productDetail_button_buyNow}
     Wait Until Page Contains Locator    ${locatorC_input_email}

Trade setting_013
     [Documentation]    验证交易规则栏设置为会员购买时，C端未登录个人中心在购物车点击checkout时，会跳转到个人中心登录页面
     [Tags]    P0    threshold
     Go To TradingRules Table
     Wait And Click Element    ${locatorB_checkout_label_buyMembers}
     Sleep    2
     ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
     Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
     Element Attribute Should Contain With Wait     ${locatorB_checkout_label_buyMembers}    class    ant-radio-button-wrapper ant-radio-button-wrapper-checked
     Reload Page And Start Ajax
     Go To First Product C Interface
     Wait And Click Element    ${locatorC_productDetail_button_addToCart}
     Wait And Click Element    ${locatorC_icon_card}
     Sleep And Click Element    ${locatorC_cart_button_checkout}
     Wait Until Page Contains Locator    ${locatorC_input_email}

Trade setting_017
    [Documentation]    验证B端交易设置中结账页形式选择单结账页时，C端进入checkout页面，checkout为单页面结账形式
    kwcheckout.set_single_page_checkout_process_py
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_label_singelPayment}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Element Attribute Should Contain With Wait     ${locatorB_checkout_label_singelPayment}    class    radio_btn_cddf ant-radio-button-wrapper ant-radio-button-wrapper-checked
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    Order summary
    Wait Until Page Contains Text    Shipping Address
    Wait Until Page Contains Text    Contact Email
    Wait Until Page Contains Text    Shipping & Delivery
    Wait Until Page Contains Text    Payment method
    Wait Until Page Contains Text    Billing Address
    Wait Until Page Contains Text    Special Instruction
#    Execute Javascript     document.querySelectorAll('[id="billing-form"] + div [type="submit"]')[0].scrollIntoView()
#    Sleep    1
#    Wait Until Page Contains Locator    ${locatorC_checkout_button_completeOrder}

Trade setting_018
    [Documentation]    验证B端交易设置中结账页形式选择双结账页时，C端进入checkout页面，checkout为双页面结账形式
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_label_registerMembers}
    Wait And Click Element    ${locatorB_checkout_label_doublePayment}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Element Attribute Should Contain With Wait     ${locatorB_checkout_label_doublePayment}    class    radio_btn_cddf ant-radio-button-wrapper ant-radio-button-wrapper-checked
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    Order summary
    Wait Until Page Contains Text    Shipping Address
    Wait Until Page Contains Text    Contact Email
    Wait Until Page Contains Text    Shipping & Delivery
    Wait Until Page Contains Text    Special Instruction
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentMethod}

Trade setting_019
    [Documentation]    验证交易规则栏，姓名格式选择为 姓名时，checkout shipping页面姓名只有一个输入框
    [Tags]    P0    threshold
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_radio_name}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_name}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_onlyName}

Trade setting_020
    [Documentation]    验证交易规则栏，姓名格式选择为 姓、名分开填写时，checkout shipping页面姓名分开两个输入框填写
    [Tags]    P0    threshold
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_radio_surnameAndName}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_surnameAndName}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_firstName}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_lastName}

Trade setting_021
    [Documentation]    验证交易规则栏，公司名选择为 必填时，checkout shipping页面的company输入框为必填项
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_radio_companyNameMandatory}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_companyNameMandatory}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_company}     ${empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Please enter your company

Trade setting_022
    [Documentation]    验证交易规则栏，公司名选择为 选填时，checkout shipping页面的company输入框为选填项
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_radio_companyNameOptional}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_companyNameOptional}    class    ant-radio-wrapper ant-radio-wrapper-checked
    #.进入C端checkout shipping界面验证
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_company}     ${empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Locator    ${locatorC_checkout_button_completeOrder}

Trade setting_023
    [Documentation]    验证交易规则栏，公司名选择为隐藏时，checkout shipping页面不显示company输入框
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_radio_companyNameHidden}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_companyNameHidden}    class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Not Contains Locator    ${locatorC_checkoutShipping_address_input_company}















