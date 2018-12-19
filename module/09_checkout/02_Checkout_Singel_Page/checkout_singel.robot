*** Settings ***
Documentation     Checkout每个用例使用同一个上架商品,默认物流,COD结账方式
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown
Test Setup        Checkout Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
checkout_001
    [Documentation]    验证从cart可进入checkout页面
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_productDetail_button_addToCart}
    Wait And Click Element    ${locatorC_icon_card}
    Wait And Click Element    ${locatorC_cart_button_checkout}
    Wait Until Page Contains Text    Shipping Address
    Wait Until Page Contains Text    Shipping & Delivery
    Wait Until Page Contains Text    Payment method

checkout_002
    [Documentation]    验证从商品详情页面可进入checkout页面
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    Shipping Address
    Wait Until Page Contains Text    Shipping & Delivery
    Wait Until Page Contains Text    Payment method

checkout_004
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品标题显示正常
    [Tags]    P0    threshold
    Sleep    2
    ${title}=    Wait And Get Text    ${locatorC_orderDetail_text_productTitle}
    ${price1}=    Wait And Get Text    ${locatorC_orderDetail_text_productPrice}
    ${price}=    Evaluate    u"${price1}".strip('$')
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Text Of Element Should Contain With Wait    ${locatorC_checkoutShipping_locator_order}    ${title}
    Text Of Element Should Contain With Wait    ${locatorC_checkoutShipping_locator_order}    ${price}

checkout_006
    [Documentation]    验证checkout页面，订单汇总商品栏，商品数量显示正常
    [Tags]    P0    threshold
    :FOR    ${ONE}    IN RANGE    4
    \    Wait And Click Element    ${locatorC_orderDetail_icon_addProductNum}
    Value Of Element Should Be Equal With Wait    ${locatorC_orderDetail_text_ProductNum}    5
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Text Of Element Should Contain With Wait    ${locatorC_checkoutShipping_locator_order}    × 5

checkout_007
    [Documentation]    验证checkout页面，订单汇总商品栏，商品价格显示正常
    [Tags]    P0    threshold
    Sleep    2
    ${price1}=    Wait And Get Text    ${locatorC_orderDetail_text_productPrice}
    ${price}=    Evaluate    u"${price1}".strip('$')
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Text Of Element Should Contain With Wait    ${locatorC_checkoutShipping_locator_order}    ${price}

checkout_012
    [DOcumentation]    验证checkout页面，subtotal显示正常
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_orderDetail_icon_addProductNum}
    Value Of Element Should Be Equal With Wait    ${locatorC_orderDetail_text_ProductNum}    2
    ${price1}=    Wait And Get Text    ${locatorC_orderDetail_text_productPrice}
    ${price2}=    Evaluate    u"${price1}".strip('$')
    ${price}=    Convert To Number    ${price2}
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    ${totalPrice1}=   Evaluate   ${price} * 2
    ${totalPrice}=    Evaluate    u"${totalPrice1}".strip('.0')
    Text Of Element Should Contain With Wait    ${locatorC_checkout_prices_shippingValue}[0]    ${totalPrice}

checkout_019
    [Documentation]    验证checkout页面，使用优惠码后，价格详情中会出现discount code并显示优惠价格
    [Tags]    P0    threshold
    ${getCode}=    Create Specific Coupon Code
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${getCode}
    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_prices_shippingValue}[1]    - 10.00USD

checkout_024
    [Documentation]    验证checkout页面，优惠码输入框后apply按钮可点击
    [Tags]    P0    threshold
    ${getCode}=    Create Specific Coupon Code
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${getCode}
    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
    Wait Until Page Contains Text    The ${getCode} has been applied
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_prices_shippingValue}[1]    - 10.00USD

checkout_026
    [Documentation]    验证checkout页面，优惠码输入框中的取消使用优惠码按钮可清空输入框
    [Tags]    P0    threshold
    ${getCode}=    Create Specific Coupon Code
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${getCode}
    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
    Wait Until Page Contains Text    The ${getCode} has been applied
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_prices_shippingValue}[1]    - 10.00USD
    Wait And Click Element    ${locatorC_checkoutShipping_icon_couponClose}
    Value Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_input_couponCode}    ${Empty}

checkout_033
    [Documentation]    验证checkout页面，shipping address栏，国家选择框可点击以及国家选择展示
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Sleep And Click Element    ${locatorC_checkoutShipping_address_select_country}
    Wait Until Page Contains Text    China

checkout_034
    [Documentation]    验证checkout页面，shipping address栏，省份选择框可点击以及省份选择展示
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Sleep And Click Element    ${locatorC_checkoutShipping_address_select_province}
    Wait Until Page Contains Text    Beijing

checkout_085
    [Documentation]    验证C端未登录个人中心，B端结账流程联系方式选择为需要填写邮箱时，C端checkout页面contact email栏会显示两个选择项，使用收货邮箱以及添加新邮箱
    [Tags]    P0    threshold
    [Setup]    Go To Checkout Settings Page
    Sleep    2
    Sleep And Click Element    ${locatorB_checkout_radio_emailCodeOptional}
    Sleep And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Sleep And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_label_NewcontactEamil}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_label_SamecontactEamil}

checkout_087
    [Documentation]    验证checkout页面contact email栏same as shipping email above可勾选
    [Tags]    P0    threshold
    [Setup]    Go To Checkout Settings Page
    Sleep    2
    Sleep And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Sleep And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_checkoutShipping_label_NewcontactEamil}
    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    12345678@qq.com
    Wait And Click Element    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Wait Until Page Not Contains Text    12345678@qq.com

checkout_088
    [Documentation]    验证checkout页面contact email栏new email可勾选
    [Tags]    P0    threshold
    [Setup]    Go To Checkout Settings Page
    Sleep    2
    Sleep And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Sleep And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Wait And Click Element    ${locatorC_checkoutShipping_label_NewcontactEamil}
    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    12345678@qq.com
    Value Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_input_contactEmail}    12345678@qq.com

checkout_092
    [Documentation]    验证checkout页面contact email栏勾选new email后，new email后的输入框输入正确的内容可提交成功
    [Tags]    P0    threshold
    [Setup]    Go To Checkout Settings Page
    Sleep    2
    Sleep And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Sleep And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Reload Page And Start Ajax
    Sleep And Click Element    ${locatorC_checkoutShipping_label_NewcontactEamil}
    Add Address Common Step
    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    dianjiang@shoplazza.com
    Sleep And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!

checkout_096
    [Documentation]    验证C端未登录个人中心，B端结账流程联系方式选择需要填写手机时，C端checkout页面contact email栏contact email输入框输入正确的内容可提交成功
    [Tags]    P0    threshold
    [Setup]    Go To Checkout Settings Page
    Sleep    2
    Sleep And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If    '${status}'=='True'    Run Keywords    Sleep And Click Element    ${locatorB_checkout_button_save}    AND    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Reload Page And Start Ajax
    Sleep And Click Element    ${locatorC_checkoutShipping_label_NewcontactEamil}
    Add Address Common Step
    Sleep And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!

checkout_098
    [Documentation]    验证checkout页面，未选择国家时，shipping delivery栏不显示运费方案
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    Please enter address first

checkout_099
    [Documentation]    验证checkout页面，选择国家后，shipping delivery栏会出现此国家对应的运费方案
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    price_fee
    Wait Until Page Contains Text    quantity_fee
    Wait Until Page Contains Text    weight_fee

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
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardEmail}    dianjiang@shoplazza.com
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
    Sleep    2
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
    Wait And Input Text    ${locatorC_checkout_paymentCard_fristName}    Javen fang
    Wait And Input Text    ${locatorC_checkout_paymentCard_cardEmail}    dianjiang@shoplazza.com
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
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Sleep And Click ELement    ${locatorC_checkoutPayment_select_billingAddress}
    Wait Until Page Contains Text    Same as shipping address
    Wait Until Page Contains Text    New billing address

checkout_162
    [Documentation]    验证checkout页面，billing address栏选择框可点击以及选择项展示
    [Tags]    P0    threshold
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Sleep And Click ELement    ${locatorC_checkoutPayment_select_billingAddress}
    Wait And Click Element    ${locatorC_checkoutPayment_select_newBillingAddress}
    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_input_firstName}
    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_input_lastName}

checkout_163
    [Documentation]    验证checkout页面，billing address填写正确的信息，可完成支付
    [Tags]    P0    threshold
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Sleep And Click ELement    ${locatorC_checkoutPayment_select_billingAddress}
    Wait And Click Element    ${locatorC_checkoutPayment_select_newBillingAddress}
    Add Singel New Billing Address Step
    Sleep And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Sleep    2
    Wait Until Page Contains Text   Payment successful!

checkout_185
    [Documentation]    验证从商品详情页面buy now进入checkout页面后，点击return可返回商品详情页面
    [Tags]    P0    threshold
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_return}
    Wait Until Page Contains Locator    ${locatorC_productDetail_button_addToCart}
    Wait Until Page Contains Locator    ${locatorC_productDetail_button_buyNow}

checkout_186
    [Documentation]     验证从购物车进入checkout页面后，点击return可返回购物车
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_productDetail_button_addToCart}
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
    Sleep    2
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约测试文本
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     a
    Press Key    ${locatorB_checkout_textarea_policyInputBox}    ${keybord_delete}
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服
    Press Key    ${locatorB_checkout_textarea_refundServiceInputBox}    ${keybord_delete}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    退款条约测试文本

checkout_191
    [Documentation]    验证checkout页面底部privacy policy按钮可点击以及内容展示
    [Tags]    P0   threshold
    [Setup]    Go To Checkout Settings Page
    Go To ServiceTerms Table
    Sleep    2
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     a
    Press Key    ${locatorB_checkout_textarea_refundTreatyInputBox}    ${keybord_delete}
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     隐私政策测试文本
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     退
    Press Key    ${locatorB_checkout_textarea_refundServiceInputBox}    ${keybord_delete}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    隐私政策测试文本

checkout_193
    [Documentation]    验证checkout页面底部terms of service按钮可点击以及内容展示
    [Tags]    P0    threshold
    [Setup]    Go To Checkout Settings Page
    Go To ServiceTerms Table
    Sleep    2
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     a
    Press Key    ${locatorB_checkout_textarea_refundTreatyInputBox}    ${keybord_delete}
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     a
    Press Key    ${locatorB_checkout_textarea_policyInputBox}    ${keybord_delete}
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服务条约测试文本
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    服务条约测试文本

checkout_197
    [Documentation]    验证payment successful页面，shipping information显示正常
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Sleep And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!
    Wait Until Page Contains Text    Javen
    Wait Until Page Contains Text    fang
    Wait Until Page Contains Text    dianjiang@shoplazza.com
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
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Sleep And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!
    Sleep    2
    Wait And Click Element    ${locatorC_checkout_button_viewOrders}
    Wait Until Page Contains Text    Order Details

checkout_200
    [Documentation]    验证payment successful页面，continue shopping按钮可跳转到店铺首页
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Sleep And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!
    Sleep    2
    Wait And Click Element    ${locatorC_checkout_button_continueShopping}
    Wait Until Page Contains Text    We Offer Free Shipping Worldwide.





