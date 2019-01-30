*** Settings ***
Documentation     交易设置页面功能测试
Suite Setup       Checkout Page Suite Setup
Suite Teardown    Checkout Page Suite Teardown
Test Setup        Checkout Page Test Setup
Test Teardown     Teardown Test Case
Force Tags        Trade setting_

Resource        ../../../resources/keywords/kw_common.robot


*** Test cases ***
Trade setting_024
    [Documentation]    验证交易规则栏，联系方式选择为手机和邮箱必填时，checkout页面email和phone输入框为必填项
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_radio_contactPhoneOptional}
    Wait And Click Element    ${locatorB_checkout_radio_contactMandatory}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_contactMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_email}    ${Empty}
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_phone}    ${Empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Please enter your email
    Wait Until Page Contains Text    Please enter your phone
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentMethod}

Trade setting_025
    [Documentation]    验证交易规则栏，联系方式选择为选填手机号时，checkout页面phone输入框为选填项， email输入框为必填项
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_radio_contactEmailOptional}
    Wait And Click Element    ${locatorB_checkout_radio_contactPhoneOptional}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_contactPhoneOptional}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_email}    ${Empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Please enter your email
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentMethod}

Trade setting_026
    [Documentation]    验证交易规则栏，联系方式选择为选填邮箱时，checkout页面email输入框为选填项， phone输入框为必填项
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_radio_contactPhoneOptional}
    Wait And Click Element    ${locatorB_checkout_radio_contactEmailOptional}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_contactEmailOptional}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_phone}    ${Empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Please enter your phone
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentMethod}

Trade setting_027
    [Documentation]    验证交易规则栏，联系方式选择为隐藏手机号时，checkout页面不显示phone输入框，email输入框为必填项
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_radio_contactPhoneOptional}
    Wait And Click Element    ${locatorB_checkout_radio_contactPhoneHidden}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_contactPhoneHidden}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_email}    ${Empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Please enter your email
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentMethod}

Trade setting_028
    [Documentation]    验证交易规则栏，联系方式选择为隐藏邮箱时，checkout页面不显示email输入框，phone输入框为必填项
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Go To TradingRules Table
    Wait And Click Element    ${locatorB_checkout_radio_contactPhoneOptional}
    Wait And Click Element    ${locatorB_checkout_radio_contactEmailHidden}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_contactEmailHidden}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_phone}    ${Empty}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Please enter your phone
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentMethod}

Trade setting_032
    [Documentation]    验证退款条约栏，生成系统默认模板按钮可点击
    [Tags]    P0    threshold
    Go To ServiceTerms Table
    Wait And Click Element    ${locatorB_checkout_button_generateRefundTreaty}
    Sleep    2
    ${RefundTreatyText}=    Wait And Get Text    ${locatorB_checkout_textarea_refundTreatyInputBox}
    Should Not Be Empty    ${RefundTreatyText}

Trade setting_034
    [Documentation]    验证退款条约输入框中输入的内容，将展示在checkout页面
    [Tags]    P0    threshold   smoke
    kwcheckout.set_checkout_process_with_conf_py
    Go To ServiceTerms Table
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约文本展示
    Wait And Clear Element Text    ${locatorB_checkout_textarea_policyInputBox}
    Wait And Clear Element Text    ${locatorB_checkout_textarea_refundServiceInputBox}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Wait Until Page Contains Text    退款条约文本展示
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    退款条约文本展示

Trade setting_037
    [Documentation]    验证隐私政策栏，生成系统默认模板按钮可点击
    [Tags]    P0    threshold
    Go To ServiceTerms Table
    Wait And Click Element    ${locatorBcheckout_button_generatePolicy}
    Sleep    2
    ${policyText}=    Wait And Get Text    ${locatorB_checkout_textarea_policyInputBox}
    Should Not Be Empty    ${policyText}

Trade setting_039
    [Documentation]    验证隐私政策输入框中输入的内容，将展示在checkout页面
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Go To ServiceTerms Table
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     隐私政策文本展示
    Wait And Clear Element Text    ${locatorB_checkout_textarea_refundTreatyInputBox}
    Wait And Clear Element Text    ${locatorB_checkout_textarea_refundServiceInputBox}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Wait Until Page Contains Text    隐私政策文本展示
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    隐私政策文本展示

Trade setting_042
    [Documentation]    验证服务条约栏，生成系统默认模板按钮可点击
    [Tags]    P0    threshold
    Go To ServiceTerms Table
    Wait And Click Element    ${locatorB_checkout_button_generateServiceTreaty}
    Sleep    2
    ${ServiceTreatyText}=    Wait And Get Text    ${locatorB_checkout_textarea_refundServiceInputBox}
    Should Not Be Empty    ${ServiceTreatyText}

Trade setting_044
    [Documentation]    验证服务条约输入框中输入的内容，将展示在checkout页面
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Go To ServiceTerms Table
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服务条约文本展示
    Wait And Clear Element Text    ${locatorB_checkout_textarea_refundTreatyInputBox}
    Wait And Clear Element Text    ${locatorB_checkout_textarea_policyInputBox}
    Sleep    2
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Wait And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Contains Text    设置成功
    Reload Page And Start Ajax
    Wait Until Page Contains Text    服务条约文本展示
    Go To First Product C Interface
    Wait And Click Element   ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    服务条约文本展示
