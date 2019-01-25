*** Settings ***
Documentation     Checkout每个用例使用同一个上架商品,默认物流,COD结账方式
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown
Test Setup        Checkout Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
checkout_098
    [Documentation]    验证checkout页面，未选择国家时，shipping delivery栏不显示运费方案
    [Tags]    P0    threshold
    Sleep And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    Please enter address first

checkout_099
    [Documentation]    验证checkout页面，选择国家后，shipping delivery栏会出现此国家对应的运费方案
    [Tags]    P0    threshold
    Sleep And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    price_fee
#    Wait Until Page Contains Text    quantity_fee
#    Wait Until Page Contains Text    weight_fee

#checkout_126
#    [Documentation]    验证checkout页面，使用ipaylinks可正常支付
#    [Tags]    P0    threshold
#    [Setup]    Go To Payment Channel
#    kwpayment.activate_payment_credit_card_py
#    Select Credit Card Of IpayLinks
#    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
#    Run Keyword If    $class=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
#    Wait And Input Text    ${locatorC_checkout_paymentCard_fristName}    Javen fang
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardEmail}    dianjiang@autotest.com
#    Wait And Input Text    ${locatorC_checkout_paymentCard_phone}    18688886666
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardPostcode}    518000
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardNumber}    4111119987834534
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardDate}    1123
#    Wait And Input Text    ${locatorC_checkout_paymentCard_card_code}    123
#    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text   Payment successful!

checkout_127
    [Documentation]    验证checkout页面，使用ipaylinks支付，填写错误的信用卡号时，页面会跳转到支付失败页面
    [Tags]    P0    threshold
    [Setup]    Go To Payment Channel
    kwpayment.activate_payment_credit_card_py
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
    Wait And Input Text    ${locatorC_checkout_paymentCard_fristName}    Javen fang
    Wait And Input Text    ${locatorC_checkout_paymentCard_cardEmail}    dianjiang@autotest.com
    Wait And Input Text    ${locatorC_checkout_paymentCard_phone}    18688886666
    Wait And Input Text    ${locatorC_checkout_paymentCard_cardPostcode}    518000
    Wait And Input Text    ${locatorC_checkout_paymentCard_cardNumber}    123456789
    Wait And Input Text    ${locatorC_checkout_paymentCard_cardDate}    1123
    Wait And Input Text    ${locatorC_checkout_paymentCard_card_code}    123
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text   Payment failure

checkout_161
    [Documentation]    验证checkout页面，billing address栏选择框可点击以及选择项展示
    [Tags]    P0    threshold
    Sleep And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click ELement    ${locatorC_checkoutPayment_select_billingAddress}
    Wait Until Page Contains Text    Same as shipping address
    Wait Until Page Contains Text    New billing address

checkout_162
    [Documentation]    验证checkout页面，billing address栏选择框可点击以及选择项展示
    [Tags]    P0    threshold
    Sleep And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click ELement    ${locatorC_checkoutPayment_select_billingAddress}
    Wait And Click Element    ${locatorC_checkoutPayment_select_newBillingAddress}
    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_input_firstName}
    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_input_lastName}

checkout_163
    [Documentation]    验证checkout页面，billing address填写正确的信息，可完成支付
    [Tags]    P0    threshold
    Sleep And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click ELement    ${locatorC_checkoutPayment_select_billingAddress}
    Wait And Click Element    ${locatorC_checkoutPayment_select_newBillingAddress}
    Add Singel New Billing Address Step
    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text   Payment successful!

checkout_184
    [Documentation]    验证checkout页面，买家留言输入框输入的内容，会同步到B端订单详情
    [Tags]    P0    threshold
    Sleep And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_specialInstruction}
    Wait And Input Text    ${locatorC_checkoutShipping_input_specialInstruction}    请尽快发货
    sleep    10
    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Go To    https://admin.shoplazza.com/order/_dealing
    Focus On New Window
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Sleep    2
    Select Window    title=${title1}
    Go To Dealing Order Page
    Reload Page And Start Ajax
    Sleep And Click Element    ${locatorB_orderDealing_text_firstOrder_orderNum}
    Wait Until Page Contains Text    请尽快发货

checkout_185
    [Documentation]    验证从商品详情页面buy now进入checkout页面后，点击return可返回商品详情页面
    [Tags]    P0    threshold
    Sleep And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_return}
    Wait Until Page Contains Locator    ${locatorC_productDetail_button_addToCart}
    Wait Until Page Contains Locator    ${locatorC_productDetail_button_buyNow}

checkout_186
    [Documentation]     验证从购物车进入checkout页面后，点击return可返回购物车
    [Tags]    P0    threshold
    Sleep And Click Element    ${locatorC_productDetail_button_addToCart}
    Wait And Click Element    ${locatorC_icon_card}
    Wait And Click Element    ${locatorC_cart_button_checkout}
    Wait And Click Element    ${locatorC_checkoutShipping_button_return}
    Wait Until Page Contains Text    Shopping Cart
    Wait Until Page Contains Text    Your cart is currently empty.

checkout_189
    [Documentation]    验证checkout页面底部refund policy按钮可点击以及内容展示
    [Tags]    P0    threshold
    [Setup]    Go To Checkout Settings Page
    Go To ServiceTerms Table
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约测试文本
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     a
    Press Key    ${locatorB_checkout_textarea_policyInputBox}    ${keybord_delete}
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服
    Press Key    ${locatorB_checkout_textarea_refundServiceInputBox}    ${keybord_delete}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
    Sleep And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    退款条约测试文本

checkout_191
    [Documentation]    验证checkout页面底部privacy policy按钮可点击以及内容展示
    [Tags]    P0   threshold
    [Setup]    Go To Checkout Settings Page
    Go To ServiceTerms Table
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     a
    Press Key    ${locatorB_checkout_textarea_refundTreatyInputBox}    ${keybord_delete}
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     隐私政策测试文本
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     退
    Press Key    ${locatorB_checkout_textarea_refundServiceInputBox}    ${keybord_delete}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Sleep And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    隐私政策测试文本

checkout_193
    [Documentation]    验证checkout页面底部terms of service按钮可点击以及内容展示
    [Tags]    P0    threshold
    [Setup]    Go To Checkout Settings Page
    Go To ServiceTerms Table
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     a
    Press Key    ${locatorB_checkout_textarea_refundTreatyInputBox}    ${keybord_delete}
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     a
    Press Key    ${locatorB_checkout_textarea_policyInputBox}    ${keybord_delete}
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服务条约测试文本
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Sleep And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    服务条约测试文本

checkout_197
    [Documentation]    验证payment successful页面，shipping information显示正常
    [Tags]    P0    threshold
    Sleep And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    ${status}=    Run Keyword And Return Status    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Run Keyword If    '${status}'=='True'    Sleep And Click Element    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Sleep And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!
    Wait Until Page Contains Text    Javen
    Wait Until Page Contains Text    fang
    Wait Until Page Contains Text    18688886666
    Wait Until Page Contains Text    中山大学产学研基地
    Wait Until Page Contains Text    南山区
    Wait Until Page Contains Text    深圳
    Wait Until Page Contains Text    Guangdong
    Wait Until Page Contains Text    China
    Wait Until Page Contains Text    518000
    Wait Until Page Contains Text    shoplazza

checkout_199
    [Documentation]    验证payment successful页面，view order按钮可跳转到个人中心订单详情页面
    [Tags]    P0    threshold
    Sleep And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    ${status}=    Run Keyword And Return Status    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Run Keyword If    '${status}'=='True'    Sleep And Click Element    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!
    Sleep    2
    Wait And Click Element    ${locatorC_checkout_button_viewOrders}
    Wait Until Page Contains Text    Order Details

checkout_200
    [Documentation]    验证payment successful页面，continue shopping按钮可跳转到店铺首页
    [Tags]    P0    threshold
    Sleep And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    ${status}=    Run Keyword And Return Status    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Run Keyword If    '${status}'=='True'    Sleep And Click Element    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!
    Sleep    2
    Wait And Click Element    ${locatorC_checkout_button_continueShopping}
    Wait Until Page Contains Text    We Offer Free Shipping Worldwide.
