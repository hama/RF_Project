*** Settings ***
Documentation     结账页设置功能测试
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Test Setup        Checkout Page Test Setup
Test Teardown     Teardown Test Case
Force Tags      checkoutPageSetings

Resource        ../../../resources/keywords/kw_common.robot
Resource        ../../../resources/keywords/kw_setings_page.robot
Resource        ../../../resources/variable/var_common.robot
Resource        ../../../resources/variable/var_setings_page.robot
Resource        ../../../resources/keywords/kw_browser.robot

*** Variables ***



*** Test cases ***

checkoutPageSetings001
    [Documentation]    测试结账设置界面可正常进入
    [Tags]    P0    threshold   smoke
    Go To Checkout Settings Page
    Wait Until Page Contains Text   顾客权限

checkoutPageSetings003
    [Documentation]    测试结账设置界面保存按钮
    [Tags]    P0    threshold   smoke
    Go To Checkout Settings Page

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

checkoutPageSetings008
    [Documentation]    测试结账设置顾客权限功能
    [Tags]    P0    threshold   smoke
    Go To Checkout Settings Page

    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerPhone}


    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功

checkoutPageSetings011
    [Documentation]    测试顾客联系方式设置-邮箱联系方式
    [Tags]    P0    threshold   smoke
    Go To Checkout Settings Page

    Wait And Click Element  ${locatorB_checkout_label_buyMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmail}

    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功

checkoutPageSetings012
    [Documentation]    测试顾客联系方式设置-手机联系方式
    [Tags]    P0    threshold   smoke
    Go To Checkout Settings Page

    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerPhone}

    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功

checkoutPageSetings013
    [Documentation]    测试顾客联系方式设置-手机和邮箱
    [Tags]    P0    threshold   smoke
    Go To Checkout Settings Page

    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmailAndPhone}

    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功

checkoutPageSetings018
    [Documentation]    测试顾客联系方式设置-手机和邮箱-必填项都取消
    [Tags]    P0    threshold   smoke
    Go To Checkout Settings Page

    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmailAndPhone}

    @{list1}    Wait And Get Items List From Locator    ${locatorB_checkout_checkbox_selected}
    :FOR    ${var}    IN    @{list1}
    \    Wait And Click Element    ${var}
    Wait Until Page Contains Text   手机和邮箱必填其一!

#    ${attr}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_checkout_span_phoneMandatory}   5
#    Run Keyword If    '${attr}'=='False'    Wait And Click Element    ${locatorB_checkout_span_phoneMandatory}
#    Run Keyword If    '${attr}'=='False'    Sleep    2
#    ...    ELSE   Wait And Click Element      ${locatorB_checkout_span_phoneMandatorySelected}
#
#    ${attr1}    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_checkout_span_emailMandatory}    5
#        Run Keyword If    '${attr1}'=='False'    Wait And Click Element    ${locatorB_checkout_span_emailMandatory}
#        Run Keyword If    '${attr1}'=='False'    Sleep    2
#        ...    ELSE    Wait And Click Element    ${locatorB_checkout_span_emailMandatorySelected}
#
#
#    Wait Until Page Contains Text   手机和邮箱必填其一!

    #Wait Until Page Contains Text   手机和邮箱必填其一!

checkoutPageSetings021
    [Documentation]    测试顾客信息设置-点击姓和名分开
    [Tags]    P0    threshold   smoke
    Go To Checkout Settings Page

    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmail}

#    Sleep   3
    Sleep And Click Element  ${locatorB_checkout_radio_surnameAndName}

    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功

checkoutPageSetings029
    [Documentation]    测试顾客信息设置-输入退款条约
    [Tags]    P0    threshold   smoke
    Go To Checkout Settings Page

    Wait And Click Element  ${locatorB_checkout_label_notMembers}
    Wait And Click Element  ${locatorB_checkout_label_customerEmail}

#    Sleep   3
    Sleep And Click Element  ${locatorB_checkout_radio_surnameAndName}

    Wait And Input Text  ${locatorB_checkout_textarea_refundTreatyInputBox}     ${locatorB_checkout_generateRefundTreaty}

    Wait Exist And Click Element  ${locatorB_checkout_button_save}
    Wait Until Page Contains Text   设置成功





