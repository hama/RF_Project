*** Settings ***
Documentation     Checkout每个用例使用同一个上架商品,默认物流,COD结账方式
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown
Test Setup        Checkout Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
#checkout_001
#    [Documentation]    C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
#    [Tags]    P0    threshold    smoke
#    Sleep And Click Element    ${locatorC_productDetail_button_addToCart}
#    Sleep And Click Element    ${locatorC_icon_card}
#    Wait And Click Element    ${locatorC_cart_button_checkout}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_order}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_address}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_special}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_total}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentMethod}
#
#checkout_002
#    [Documentation]    进入checkout界面 显示购买的商品，地址，
#    [Tags]    P0    threshold    smoke
#    #点击商品预览
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_order}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_address}
#
#checkout_006
#    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品标题显示正常
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutShipping_text_itemProductTitle}   autotest_title
#
#checkout_008
#    [Documentation]    验证checkout shipping页面，订单汇总商品栏，商品数量显示正常 > "1.C端够买商品women5件进入checkout shipping页面,2.查看订单汇总商品栏，商品数量显示" > 商品数量显示为：X5
#    [Tags]    P0    threshold    smoke
#    #.输入数量
#    Wait And Input Text    ${locatorC_productDetail_input_qtyNum}    5
#    #,点击立即购买
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemQtyNum}     × 5
#
#checkout_009
#    [Documentation]    验证checkout shipping页面，订单汇总商品栏，商品价格显示正常 >"1.C端购买商品women进入checkout shipping页面,2.查看订单汇总商品栏，商品价格显示" > 商品价格显示为：444USD
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_totalPrice}   444.00USD
#
#checkout_014
#    [Documentation]    验证checkout shipping页面，subtotal显示正常 > "1.C端购买商品women两件进入checkout shipping页面,2.查看价格详情中subtotal" > subtotal为：444.00USD
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemPrice}    444.00USD
#
#checkout_021
#    [Documentation]    验证checkout shipping页面，使用优惠码后，价格详情中会出现discount code并显示优惠价格 > "1.C端购买商品women进入checkout shipping页面，2.使用优惠码AAA001，3.查看价格详情" > 价格详情显示优惠金额
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#	${code}    Create Specific Coupon Code
#    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${code}
#    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
#    Wait Until Page Contains    Discount code
#
#checkout_025
#    [Documentation]    验证checkout shipping页面，优惠码输入框中可输入内容 > "1.点击优惠码输入框,2.输入内容：AAA003" > 优惠码输入框中显示输入的内容：AAA003
#    [Tags]    P1
#    ${num}    Set Variable    AAA003
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    #.在优惠码输入框中输入AAA003
#    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${num}
#    ${res}    Get Value    ${locatorC_checkoutShipping_input_couponCode}
#    Should Be True    '${res}'=='${num}'
#
#checkout_026
#    [Documentation]    验证checkout shipping页面，优惠码输入框后apply按钮可点击>"1.C端购买任意商品进入checkout shipping页面,2.优惠码输入框中输入优惠码AAA006,3.点击apply按钮" > 点击后优惠码使用成功，价格详情中显示discount code： - 10.00USD
#    [Tags]    P0    threshold
#    ${code}    Create Specific Coupon Code
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${code}
#    #.点击应用
#    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
#    #.获取优惠那一栏的值
#    Text Of Element Should Be Equal With Wait   dom:document.querySelectorAll("[class='checkout__prices-table-value']")[1]    - 10.00USD
#
#    #门槛无标注，
#checkout_027
#    [Documentation]    验证checkout shipping页面输入错误的优惠码时，点击apply，会给出对应提示 > 2.优惠码输入框中输入任意内容：..0001,3.点击apply > 优惠码输入框下方出现错误提示
#    [Tags]    P1
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ..0001
#    #.点击应用
#    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
#    Wait Until Page Contains    This discount does not exist.
#
## 已实现，用例有标注
#checkout_028
#    [Documentation]     验证checkout shipping页面，优惠码输入框中的取消使用优惠码按钮可清空输入框  >  1.输入框中输入本次购买商品可用的优惠码并且点击apply按钮使用   2.点击优惠码输入框中的取消使用按钮
#    [Tags]    P0    threshold
#    ${code}    Create Specific Coupon Code
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait And Input Text     ${locatorC_checkoutShipping_input_discountCode}     ${code}
#    Wait And Click Element   ${locatorC_checkoutShipping_button_apply}
#    #取消优惠码输入框的优惠码
#    Wait And Click Element   ${locatorC_checkoutShipping_icon_couponClose}
#    Wait Until Page Not Contains Text      This discount does not exist.
#
#checkout_034
#    [Documentation]    验证checkout shipping页面，shipping address栏，国家选择框可点击以及国家选择展示 > 1.点击shipping address栏国家选择框 >点击后国家选择框下拉展开，显示所有可选择的国家
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait And Click Element    ${locatorC_checkoutShipping_address_select_country}
#
#checkout_035
#    [Documentation]    验证checkout shipping页面，shipping address栏，省份选择框可点击以及省份选择展示  > "1.点击国家选择框选择中国,2.点击省份选择框" > 点击后城市选择框下拉展开，显示中国的所有省份
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    China
#    Wait And Click Element    ${locatorC_checkoutShipping_address_select_province}
#
#checkout_037
#    [Documentation]    验证checkout shipping页面，shipping address栏输入正确的信息，可以提交成功 > 输入地址 > 提交成功，页面跳转到支付页面
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains    PAYMENT
#
#checkout_073
#    [Documentation]    验证checkout shipping页面，点击买家留言栏，可展开买家留言输入框 > 1.点击special instruction栏 > 点击后展开买家留言输入框
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait And Click Element    ${locatorC_checkoutShipping_button_specialInstruction}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_input_specialInstruction}
#
#checkout_077
#    [Documentation]    验证checkout shipping页面，买家留言输入框输入的内容，会同步到B端订单详情 > "1.C端发起新订单AAA00111进入checkout shipping页面,2.买家留言输入框中输入内容：请尽快发货,3.完成订单进入B端订单AAA00111详情,4.查看订单详情页面买家留言" > 买家留言内容显示为：请尽快发货
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    #.点击展开留言框
#    Wait And Click Element    ${locatorC_checkoutShipping_button_specialInstruction}
#    Wait And Input Text    ${locatorC_checkoutShipping_input_specialInstruction}    请尽快发货
#    #.点击提交
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains Text   Order summary
#    Go To Home By Url
#    Go To Undeal Order Page
#    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
#    Wait Until Page Contains Text    请尽快发货
#
#checkout_078
#    [Documentation]    验证checkout shipping页面，未选择国家时，shipping delivery栏不显示运费方案  >  1.购买任意商品进入checkout shipping页面  2.不选择国家查看shipping delivery栏
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait Until Page Contains Text    Please enter address first
#
#checkout_093
#    [Documentation]    验证从商品详情页面buy now进入checkout shipping页面后，点击return可返回商品详情页面 > 1.C端进入任意一个商品详情页面 2.buy now进入checkout shipping页面 3.点击return
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait Until Page Contains Text   Order summary
#    Wait And Click Element    ${locatorC_checkoutShipping_button_return}
#    Wait Until Page Contains Locator    ${locatorC_productDetail_button_buyNow}
#
#checkout_094
#    [Documentation]    验证从购物车进入checkout shipping页面后，点击return可返回购物车 > 1.C端将任意商品加入购物车 2.进入购物车点击checkout按钮进入checkout shipping页面 3.点击return
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element   ${locatorC_productDetail_button_addToCart}
#    Sleep And Click Element    ${locatorC_icon_card}
#    Wait And Click Element   ${locatorC_cart_button_checkout}
#    Wait Until Page Contains Text    Order summary
#    #.返回
#    Wait And Click Element  ${locatorC_checkoutShipping_button_return}
#    Wait Until Page Contains Text    Your cart is currently empty.
#
#checkout_096
#    [Documentation]    验证checkout shipping页面，点击payment method按钮可进入支付页面 > 1.shipping address中输入合法内容  2.点击payment method按钮
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    #添加是shipping address
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains Text   Payment method
#
#checkout_098
#    [Documentation]    验证checkout 支付页面，订单汇总，商品栏，商品标题显示正常 > 1.C端购买商品women进入checkout支付页面  2.查看订单汇总，商品栏，商品标题
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    ${productName}=    Get Text    ${locatorC_checkoutShipping_text_itemProductTitle}
#    ${tatalPrice}=    Get Text    ${locatorC_checkoutShipping_text_totalPrice}
#    Add Address Common Step
#	Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#	sleep    10
#    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutPayment_text_itemProductTitle}    ${productName}
#    Text Of Element Should Contain With Wait    ${locatorC_checkoutPayment_text_totalPrice}    ${tatalPrice}
#
#checkout_100
#    [Documentation]   验证checkout 支付页面，订单汇总商品栏，商品数量显示正常 > 1.C端够买商品women5件进入checkout 支付页 2.查看订单汇总商品栏，商品数量显示
#    [Tags]    P0    threshold    smoke
#    Wait And Input Text    ${locatorC_productDetail_input_qtyNum}    5
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#	Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#	Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemQtyNum}     × 5
#
#checkout_101
#    [Documentation]   验证checkout 支付页面，订单汇总商品栏，商品价格显示正常 > 1.C端购买商品women进入checkout 支付页面  2.查看订单汇总商品栏，商品价格显示
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemPrice}   444.00USD
#
#checkout_106
#    [Documentation]   验证checkout 支付页面，subtotal显示正常 > 1.C端购买商品women两件进入checkout 支付页面  2.查看价格详情中subtotal
#    [Tags]    P0    threshold    smoke
#    Wait And Input Text    ${locatorC_productDetail_input_qtyNum}    2
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_subtotalPrice}     888.00USD
#
## discount code不好定位，暂时放着
##checkout_111
##    [Documentation]   验证checkout 支付页面，订单使用优惠码后，价格详情中会显示discount code并显示优惠价格 > 1.C端购买商品women进入checkout shipping页面  2.使用优惠码AAA001  3.进入支付页面查看价格详情
##    [Tags]    P0    threshold    smoke
##    ${code}    Create Specific Coupon Code
##    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
##    Add Address Common Step
##    Wait And Input Text     ${locatorC_checkoutShipping_input_discountCode}     ${code}
##    Wait And Click Element   ${locatorC_checkoutShipping_button_apply}
##    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
##    Text Of Element Should Be Equal With Wait    ${discount code}    - 10.00USD
#
#checkout_114
#    [Documentation]    验证checkout 支付页面，Payment栏，shiP to信息显示正常
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    #添加是shipping address
#    Add Address Common Step
#    Wait And Click Element     ${locatorC_checkoutShipping_button_paymentMethod}
#    Text Of Element Should Contain With Wait    ${locatorC_checkoutPayment_text_shippingDetail}[0]    firstName${SPACE * 2}lastName${SPACE * 2}7654321@autotest.com${SPACE * 2}18899999999
#    Text Of Element Should Contain With Wait    ${locatorC_checkoutPayment_text_shippingDetail}[1]    ${SPACE * 2}addr city Beijing${SPACE * 2}China
#    Text Of Element Should Contain With Wait    ${locatorC_checkoutPayment_text_shippingDetail}[2]    123456 company
#
#
#checkout_121
#    [Documentation]         验证checkout支付页面，return按钮可返回到shipping页面  >  1.点击return按钮
#    [Tags]    P0    threshold
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    #.点 payment menthod  return
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentReturn}
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentReturn}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_firstName}
#
#checkout_125
#    [Documentation]         验证B端收款渠道中没有开启任何支付方式时，checkout 支付页面payment method栏不显示支付方式，并显示提示文案  >  1.B端收款渠道中关闭所有支付方式  2.C端购买商品进入checkout 支付页面 3.查看payment method栏
#    [Tags]    P0    threshold
#    #关闭cod支付方式
#    kwpayment.inactivate_payment_cod_py
#    #关闭credit_card  信用卡支付方式
#    kwpayment.inactivate_payment_credit_card_py
#    Reload Page And Start Ajax
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains Text    Payment method is not available
#    #重新开启cod支付方式
#    kwpayment.activate_payment_cod_py
#
#checkout_126
#    [Documentation]   验证checkout 支付页面，使用COD支付方式可正常支付  >  1.购买商品进入checkout 支付页面  2.选择支付方式COD  3.点击place order按钮
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    #添加是shipping address
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
#    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text   Payment successful!
#
#checkout_132
#    [Documentation]   验证checkout支付页面，使用ipaylinks支付，填写错误的信用卡号时，页面会跳转到支付失败页面 >  1.stripe支付信息中填写信息： 卡号：4111119987834534 有效日期：11/23  安全码：123 邮编：518000 2.点击place order按钮
#    [Tags]    P0    threshold    smoke
#    kwpayment.activate_payment_cod_py
#    kwpayment.activate_payment_credit_card_py
#    Reload Page And Start Ajax
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    #添加是shipping address
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
#    #.信用卡信息填写
#    Add Credit Card Info
#    Wait And Click Element      ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text   Payment failure!
#    #关闭credit_card  信用卡支付方式
#    kwpayment.inactivate_payment_credit_card_py
#
#checkout_170
#    [Documentation]   验证checkout支付页面，billing address栏选择框可点击以及选择项展示  >   1.点击选择框
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
#    #点击billing address栏选择框
#    Wait And Select From List By Label     ${locatorC_checkoutPayment_select_billingAddress}    New billing address
#    #添加Billing address
#    Wait And Input Text     ${locatorC_checkoutPayment_input_firstName}    aven
#    Wait And Input Text     ${locatorC_checkoutPayment_input_lastName}     fang
#    Wait And Input Text     ${locatorC_checkoutPayment_input_address}    南山区
#    Wait And Input Text     ${locatorC_checkoutPayment_input_address1}    中山大学产学研基地
#    Wait And Input Text     ${locatorC_checkoutPayment_input_city}    深圳
#    Wait And Select From List By Label     ${locatorC_checkoutPayment_input_countyCode}    China
#    Wait And Select From List By Label     ${locatorC_checkoutPayment_input_provinceCode}    Beijing
#    Wait And Input Text     ${locatorC_checkoutPayment_input_zip}    518000
#    Wait And Click Element      ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text      Payment successful!
#
#checkout_189
#    [Documentation]   验证checkout支付页面，place order按钮正常  >  1.购买商品进入checkout支付页面  2.选择COD支付   3.点击place order按钮
#    [Tags]    P0    threshold    smoke
#    #添加是shipping address
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
#    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text    Payment successful!
#
#checkout_193
#    [Documentation]   验证payment successful页面，shipping information显示正常  >  1.购买商品进入checkout shipping页面 2.填写信息：first name：Javen last name：fang address：南山区 apartment：中山大学产学研基地 city：深圳 country：China province：广东 postal code：518000 email：dianjiang@shoplazza.com phone：18688886666 company：shoplazza 3.完成订单进入payment successful 页面查看shipping information
#    [Tags]    P0    threshold
#    #添加是shipping address
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
#    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text    Payment successful!
#    Text Of Element Should Contain With Wait    ${locatorC_checkout_text_shippingInformationDetail}[0]    firstName${SPACE * 2}lastName${SPACE * 2}7654321@autotest.com${SPACE * 2}18899999999
#    Text Of Element Should Contain With Wait    ${locatorC_checkout_text_shippingInformationDetail}[1]    addr${SPACE * 2}city${SPACE * 2}Beijing${SPACE * 2}China
#    Text Of Element Should Contain With Wait    ${locatorC_checkout_text_shippingInformationDetail}[2]    123456 company
#    Text Of Element Should Contain With Wait    ${locatorC_checkout_text_shippingInformationDetail}[3]    price_fee
#
#checkout_195
#    [Documentation]   验证payment successful页面，view order按钮可跳转到个人中心订单详情页面  >  1.购买商品进入checkout并完成支付进入payment successful页面  2.点击view order按钮
#    [Tags]    P0    threshold    smoke
#    #添加是shipping address
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
#    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text    Payment successful!
#    Wait And Click Element    ${locatorC_checkout_button_viewOrders}
#    Wait Until Page Contains Text    Order Details
#
#checkout_196
#    [Documentation]   验证payment successful页面，continue shopping按钮可跳转到店铺首页  >  1.购买商品进入checkout并完成支付进入payment successful页面  2.点击continue shopping按钮
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_cash}
#    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text    Payment successful!
#    Wait And Click Element    ${locatorC_checkout_button_continueShopping}
#    Text Of Element Should Contain With Wait    ${locatorC_checkout_homeBanner}    ${user_default_domain}



#周莉编写
checkout_099
    [Documentation]    验证checkout 支付页面，订单汇总，商品栏，商品子产品显示正常
    [Tags]    P0
    kwproduct.del_all_products_py
    kwproduct.add_max_product_with_sub_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
	Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
	Wait Until Page Contains Text    Color:
	Wait Until Page Contains Text    Size:

checkout_110
    [Documentation]    验证checkout 支付页面，商品不收取税费时，价格详情中的tax显示为：+ $0.00
    [Tags]    P0
    kwtax.set_country_tax_price_py    0
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutPayment_text_taxPrice}    + 0.00USD

#checkout_111
#    [Documentation]    验证checkout 支付页面，订单使用优惠码后，价格详情中会显示discount code并显示优惠价格
#    [Tags]    P0
#    [Setup]    Go To Coupon Page
#    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
#    Add Default Coupon Code Textrobot
#    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    优惠码AAA001
#    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
#    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
#    Wait And Input Text    ${locatorB_couponCodeNew_text_input_preferential}    50
#    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discount}    10
#    Wait And Click Element    ${locatorB_button_save00}
#    ${getCode}=    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_couponCode}
#    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
#    Go To First Product C Interface
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${getCode}
#    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
#    Wait Until Page Contains Text    - 10.00USD

checkout_124
    [Documentation]    验证checkout支付页面，支付方式显示正常
    [Tags]    P0
    kwpayment.activate_payment_cod_py
    kwpayment.activate_payment_credit_card_py
    Reload Page And Start Ajax
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text    Credit Card
    Wait Until Page Contains Text    Cash on delivery

checkout_130
    [Documentation]    验证checkout支付页面，选择ipaylinks支付时，支付方式栏下方会展开显示支付信息填写栏
    [Tags]    P0
    [Setup]    Go To Payment Channel
    kwpayment.activate_payment_credit_card_py
    Select Credit Card Of IpayLinks
    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    $class=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
    Wait Until Page Contains Text    Select Credit and Debit Card

#checkout_131
#    [Documentation]    验证checkout支付页面，使用ipaylinks可正常支付
#    [Tags]    P0
#    [Setup]    Go To Payment Channel
#    kwpayment.activate_payment_credit_card_py
#    Select Credit Card Of IpayLinks
#    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
#    Run Keyword If    $class=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
#    Wait And Input Text    ${locatorC_checkout_paymentCard_fristName}    Ting jack
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardEmail}    fan-da@zenmax.com
#    Wait And Input Text    ${locatorC_checkout_paymentCard_phone}    18688886666
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardPostcode}    518000
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardNumber}    4111119987834534
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardDate}    1124
#    Wait And Input Text    ${locatorC_checkout_paymentCard_card_code}    869
#    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text   Payment successful!

checkout_133
    [Documentation]    验证checkout支付页面，ipaylinks支付信息会同步shipping页面填写的name，email，phone，postal code
    [Tags]    p0
    [Setup]    Go To Payment Channel
    kwpayment.activate_payment_credit_card_py
    Select Credit Card Of IpayLinks
    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    $class=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
    Value Of Element Should Be Equal With Wait    ${locatorC_checkout_paymentCard_fristName}    Javen fang
    Value Of Element Should Be Equal With Wait    ${locatorC_checkout_paymentCard_cardEmail}    dianjiang@shoplazza.com
    Value Of Element Should Be Equal With Wait    ${locatorC_checkout_paymentCard_phone}    18688886666
    Value Of Element Should Be Equal With Wait    ${locatorC_checkout_paymentCard_cardPostcode}    518000

checkout_157
    [Documentation]    验证checkout 支付页面，选择ocean支付后，点击place order按钮会弹出支付确认弹窗
    [Tags]    P0
    [Setup]    Go To Payment Channel
    kwpayment.activate_payment_credit_card_py
    Select Credit Card Of OceanPayment
    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    '${class}'=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Go To First Product C Interface
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Go To    https://secure.oceanpayment.com/paymentpages/web/pay.html
    Focus On New Window
    Wait Until Page Contains Text    Order Details
    Wait Until Page Contains Text    PAYMENT DETAILS

checkout_198
    [Documentation]    验证payment failure页面，cancel order按钮可点击
    [Tags]    P0
    [Setup]    Go To Payment Channel
    kwpayment.activate_payment_credit_card_py
    Select Credit Card Of IpayLinks
    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    $class=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
    Wait And Input Text    ${locatorC_checkout_paymentCard_cardNumber}    4111119987830000
    Wait And Input Text    ${locatorC_checkout_paymentCard_cardDate}    1123
    Wait And Input Text    ${locatorC_checkout_paymentCard_card_code}    123
    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text   Payment failure!
    Wait And Click Element    ${locatorC_checkout_button_cancelOrder}
    Text Of Element Should Contain With Wait    ${locatorC_checkout_homeBanner}    ${user_default_domain}

checkout_199
    [Documentation]    验证payment failure页面，pay again按钮可点击
    [Tags]    P0
    [Setup]    Go To Payment Channel
    kwpayment.activate_payment_credit_card_py
    Select Credit Card Of IpayLinks
    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    $class=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
    Wait And Input Text    ${locatorC_checkout_paymentCard_cardNumber}    4111119987830000
    Wait And Input Text    ${locatorC_checkout_paymentCard_cardDate}    1123
    Wait And Input Text    ${locatorC_checkout_paymentCard_card_code}    123
    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text   Payment failure!
    Wait And Click Element    ${locatorC_checkout_button_payAgain}
    Wait Until Page Contains Text   Order summary
    Wait Until Page Contains Text    Payment

checkout_202
    [Documentation]    验证B端结账流程中退款条约输入内容后，C端shipping页面和payment页面会底部会显示refund policy按钮
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element    ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约测试文本
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}

checkout_203
    [Documentation]    验证checkout shipping页面和payment页面底部refund policy按钮可点击以及内容展示
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element    ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约测试文本123
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    退款条约测试文本123

checkout_204
    [Documentation]    验证B端结账流程中隐私政策输入内容后，C端shipping页面和payment页面会底部会显示privacy policy按钮
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     隐私政策测试文本
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}

checkout_205
    [Documentation]    验证checkout shipping页面和payment页面底部privacy policy按钮可点击以及内容展示
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     隐私政策测试文本123
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    隐私政策测试文本123

checkout_206
    [Documentation]    验证B端结账流程中服务条约输入内容后，C端shipping页面和payment页面会底部会显示terms of service按钮
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服务条约测试文本
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}

checkout_207
    [Documentation]    验证checkout shipping页面和payment页面底部terms of service按钮可点击以及内容展示
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服务条约测试文本123
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
    Wait Until Page Contains Text    服务条约测试文本123

checkout_219
    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为必填时，C端checkout shipping页面contact email栏会显示两个选择项，使用收货邮箱以及添加新邮箱
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    Same as shipping email above
    Wait Until Page Contains Text    New email

checkout_220
    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为必填时，C端checkout shipping页面contact email栏same as shipping email above可勾选
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    Wait And Click Element    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_label_NewcontactEamil}
    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    12345678@qq.com
    Wait And Click Element    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Wait Until Page Not Contains Text    12345678@qq.com

checkout_221
    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为必填时，C端checkout shipping页面contact email栏new email可勾选
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Wait And Click Element    ${locatorC_checkoutShipping_label_NewcontactEamil}
    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    12345678@qq.com
    Value Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_input_contactEmail}    12345678@qq.com

checkout_225
    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为必填时，C端checkout shipping页面contact email栏勾选new email后，new email后的输入框输入正确的内容
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
    Sleep And Click Element    ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_label_NewcontactEamil}
    Add Address SepCommon Step
    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    12345678@qq.com
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_button_completeOrder}

checkout_227
    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为选填，C端checkout shipping页面contact email栏只显示一个邮箱输入框
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeOptional}
    ${is_exist}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If   '${is_exist}'=='True'    Wait And Click Element     ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeOptional}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Not Contains Locator    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Wait Until Page Not Contains Locator    ${locatorC_checkoutShipping_label_NewcontactEamil}

checkout_230
    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为选填，C端checkout shipping页面contact email栏contact email输入框输入正确的内容可提交成功
    [Tags]    P0
    [Setup]    Go To Checkout Settings Page
    Wait And Click Element    ${locatorB_checkout_button_nav_information}
    Wait And Click Element    ${locatorB_checkout_radio_emailCodeOptional}
    ${is_exist}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_checkout_button_save}
    Run Keyword If   '${is_exist}'=='True'    Wait And Click Element     ${locatorB_checkout_button_save}
    Reload Page And Start Ajax
    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeOptional}   class    ant-radio-wrapper ant-radio-wrapper-checked
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    dianjiang@shoplazza.com
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_button_completeOrder}








   