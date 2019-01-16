*** Settings ***
Documentation     Checkout每个用例使用同一个上架商品,默认物流,COD结账方式
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown
Test Setup        Checkout Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
checkout_093
    [Documentation]    验证从商品详情页面buy now进入checkout shipping页面后，点击return可返回商品详情页面 > 1.C端进入任意一个商品详情页面 2.buy now进入checkout shipping页面 3.点击return
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text   Order summary
    Wait And Click Element    ${locatorC_checkoutShipping_button_return}
    Wait Until Page Contains Locator    ${locatorC_productDetail_button_buyNow}

checkout_094
    [Documentation]    验证从购物车进入checkout shipping页面后，点击return可返回购物车 > 1.C端将任意商品加入购物车 2.进入购物车点击checkout按钮进入checkout shipping页面 3.点击return
    [Tags]    P0    threshold    smoke
    Wait And Click Element   ${locatorC_productDetail_button_addToCart}
    Sleep And Click Element    ${locatorC_icon_card}
    Wait And Click Element   ${locatorC_cart_button_checkout}
    Wait Until Page Contains Text    Order summary
    #.返回
    Wait And Click Element  ${locatorC_checkoutShipping_button_return}
    Wait Until Page Contains Text    Your cart is currently empty.

checkout_096
    [Documentation]    验证checkout shipping页面，点击payment method按钮可进入支付页面 > 1.shipping address中输入合法内容  2.点击payment method按钮
    [Tags]    P0    threshold    smoke
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text   Payment method

checkout_098
    [Documentation]    验证checkout 支付页面，订单汇总，商品栏，商品标题显示正常 > 1.C端购买商品women进入checkout支付页面  2.查看订单汇总，商品栏，商品标题
    [Tags]    P0    threshold    smoke
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    ${productName}=    Wait And Get Text    ${locatorC_checkoutShipping_text_itemProductTitle}
    ${tatalPrice}=    Wait And Get Text    ${locatorC_checkoutShipping_text_totalPrice}
    Add Address Common Step
	Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
	sleep    5
    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutPayment_text_itemProductTitle}    ${productName}
    Text Of Element Should Contain With Wait    ${locatorC_checkoutPayment_text_totalPrice}    ${tatalPrice}

checkout_100
    [Documentation]   验证checkout 支付页面，订单汇总商品栏，商品数量显示正常 > 1.C端够买商品women5件进入checkout 支付页 2.查看订单汇总商品栏，商品数量显示
    [Tags]    P0    threshold    smoke
    Wait And Input Text    ${locatorC_productDetail_input_qtyNum}    5
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
	Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
	Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemQtyNum}     × 5

checkout_101
    [Documentation]   验证checkout 支付页面，订单汇总商品栏，商品价格显示正常 > 1.C端购买商品women进入checkout 支付页面  2.查看订单汇总商品栏，商品价格显示
    [Tags]    P0    threshold    smoke
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    Sleep And Click Element  ${locatorC_productDetail_button_buyNow}
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemPrice}   444.00USD

checkout_106
    [Documentation]   验证checkout 支付页面，subtotal显示正常 > 1.C端购买商品women两件进入checkout 支付页面  2.查看价格详情中subtotal
    [Tags]    P0    threshold    smoke
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    Sleep And Click Element    ${locatorC_productDetail_button_addQuaity}
    Sleep And Click Element    ${locatorC_productDetail_button_buyNow}
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_subtotalPrice}     888.00USD

# discount code不好定位，暂时放着
#checkout_111
#    [Documentation]   验证checkout 支付页面，订单使用优惠码后，价格详情中会显示discount code并显示优惠价格 > 1.C端购买商品women进入checkout shipping页面  2.使用优惠码AAA001  3.进入支付页面查看价格详情
#    [Tags]    P0    threshold    smoke
#    ${code}    Create Specific Coupon Code
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Input Text     ${locatorC_checkoutShipping_input_discountCode}     ${code}
#    Wait And Click Element   ${locatorC_checkoutShipping_button_apply}
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Text Of Element Should Be Equal With Wait    ${discount code}    - 10.00USD

checkout_114
    [Documentation]    验证checkout 支付页面，Payment栏，shiP to信息显示正常
    [Tags]    P0    threshold    smoke
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element     ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    firstName
    Wait Until Page Contains Text    lastName
    Wait Until Page Contains Text    18899999999
    Wait Until Page Contains Text    addr
    Wait Until Page Contains Text    city
    Wait Until Page Contains Text    Beijing
    Wait Until Page Contains Text    China
    Wait Until Page Contains Text    123456
    Wait Until Page Contains Text    company


checkout_121
    [Documentation]         验证checkout支付页面，return按钮可返回到shipping页面  >  1.点击return按钮
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    #.点 payment menthod  return
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentReturn}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentReturn}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_firstName}

checkout_125
    [Documentation]         验证B端收款渠道中没有开启任何支付方式时，checkout 支付页面payment method栏不显示支付方式，并显示提示文案  >  1.B端收款渠道中关闭所有支付方式  2.C端购买商品进入checkout 支付页面 3.查看payment method栏
    [Tags]    P0    threshold
    #关闭cod支付方式
    kwpayment.inactivate_payment_cod_py
    #关闭credit_card  信用卡支付方式
    kwpayment.inactivate_payment_credit_card_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Payment method is not available
    #重新开启cod支付方式
    kwpayment.activate_payment_cod_py

checkout_126
    [Documentation]   验证checkout 支付页面，使用COD支付方式可正常支付  >  1.购买商品进入checkout 支付页面  2.选择支付方式COD  3.点击place order按钮
    [Tags]    P0    threshold    smoke
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text   Payment successful!

checkout_132
    [Documentation]   验证checkout支付页面，使用ipaylinks支付，填写错误的信用卡号时，页面会跳转到支付失败页面 >  1.stripe支付信息中填写信息： 卡号：4111119987834534 有效日期：11/23  安全码：123 邮编：518000 2.点击place order按钮
    [Tags]    P0    threshold    smoke
    kwpayment.activate_payment_cod_py
    kwpayment.activate_payment_credit_card_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
    #.信用卡信息填写
    Add Credit Card Info
    Wait And Click Element      ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text   Payment failure
    #关闭credit_card  信用卡支付方式
    kwpayment.inactivate_payment_credit_card_py

checkout_170
    [Documentation]   验证checkout支付页面，billing address栏选择框可点击以及选择项展示  >   1.点击选择框
    [Tags]    P0    threshold    smoke
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
    #点击billing address栏选择框
    Wait And Select From List By Label     ${locatorC_checkoutPayment_select_billingAddress}    New billing address
    #添加Billing address
    Add New Billing Address Step
    Sleep And Click Element      ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text      Payment successful!

checkout_189
    [Documentation]   验证checkout支付页面，place order按钮正常  >  1.购买商品进入checkout支付页面  2.选择COD支付   3.点击place order按钮
    [Tags]    P0    threshold    smoke
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    #添加是shipping address
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!

checkout_193
    [Documentation]   验证payment successful页面，shipping information显示正常  >  1.购买商品进入checkout shipping页面 2.填写信息：first name：Javen last name：fang address：南山区 apartment：中山大学产学研基地 city：深圳 country：China province：广东 postal code：518000 email：dianjiang@autotest.com phone：18688886666 company：shoplazza 3.完成订单进入payment successful 页面查看shipping information
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    #添加是shipping address
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    ${shipping_method_name}=    Wait And Get Text    ${locatorC_checkoutShipping_text_listShippingAndDeliveryName}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!
    Text Of Element Should Contain With Wait    ${locatorC_checkout_text_shippingInformationDetail}[0]    firstName${SPACE * 2}lastName${SPACE * 4}18899999999
    Text Of Element Should Contain With Wait    ${locatorC_checkout_text_shippingInformationDetail}[1]    addr${SPACE * 2}city${SPACE * 2}Beijing${SPACE * 2}China
    Text Of Element Should Contain With Wait    ${locatorC_checkout_text_shippingInformationDetail}[2]    123456 company
    Text Of Element Should Contain With Wait    ${locatorC_checkout_text_shippingInformationDetail}[3]    ${shipping_method_name}

checkout_195
    [Documentation]   验证payment successful页面，view order按钮可跳转到个人中心订单详情页面  >  1.购买商品进入checkout并完成支付进入payment successful页面  2.点击view order按钮
    [Tags]    P0    threshold    smoke
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    #添加是shipping address
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!
    Wait And Click Element    ${locatorC_checkout_button_viewOrders}
    Wait Until Page Contains Text    Order Details

checkout_196
    [Documentation]   验证payment successful页面，continue shopping按钮可跳转到店铺首页  >  1.购买商品进入checkout并完成支付进入payment successful页面  2.点击continue shopping按钮
    [Tags]    P0    threshold    smoke
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!
    Wait And Click Element    ${locatorC_checkout_button_continueShopping}
    Text Of Element Should Contain With Wait    ${locatorC_checkout_homeBanner}    ${user_default_domain}