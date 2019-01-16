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
    [Documentation]    C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
    [Tags]    P0    threshold    smoke
    Sleep And Click Element    ${locatorC_productDetail_button_addToCart}
    Sleep And Click Element    ${locatorC_icon_card}
    Wait And Click Element    ${locatorC_cart_button_checkout}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_order}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_address}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_special}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_total}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentMethod}

checkout_002
    [Documentation]    进入checkout界面 显示购买的商品，地址，
    [Tags]    P0    threshold    smoke
    #点击商品预览
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_order}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_locator_address}

checkout_006
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品标题显示正常
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutShipping_text_itemProductTitle}   autotest_title

checkout_008
    [Documentation]    验证checkout shipping页面，订单汇总商品栏，商品数量显示正常 > "1.C端够买商品women5件进入checkout shipping页面,2.查看订单汇总商品栏，商品数量显示" > 商品数量显示为：X5
    [Tags]    P0    threshold    smoke
    #.输入数量
    Wait And Input Text    ${locatorC_productDetail_input_qtyNum}    5
    #,点击立即购买
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemQtyNum}     × 5

checkout_009
    [Documentation]    验证checkout shipping页面，订单汇总商品栏，商品价格显示正常 >"1.C端购买商品women进入checkout shipping页面,2.查看订单汇总商品栏，商品价格显示" > 商品价格显示为：444USD
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_totalPrice}   444.00USD

checkout_014
    [Documentation]    验证checkout shipping页面，subtotal显示正常 > "1.C端购买商品women两件进入checkout shipping页面,2.查看价格详情中subtotal" > subtotal为：444.00USD
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemPrice}    444.00USD

checkout_021
    [Documentation]    验证checkout shipping页面，使用优惠码后，价格详情中会出现discount code并显示优惠价格 > "1.C端购买商品women进入checkout shipping页面，2.使用优惠码AAA001，3.查看价格详情" > 价格详情显示优惠金额
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
	${code}    Create Specific Coupon Code
    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${code}
    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
    Wait Until Page Contains    Discount code

checkout_025
    [Documentation]    验证checkout shipping页面，优惠码输入框中可输入内容 > "1.点击优惠码输入框,2.输入内容：AAA003" > 优惠码输入框中显示输入的内容：AAA003
    [Tags]    P1
    ${num}    Set Variable    AAA003
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    #.在优惠码输入框中输入AAA003
    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${num}
    ${res}    Get Value    ${locatorC_checkoutShipping_input_couponCode}
    Should Be True    '${res}'=='${num}'

checkout_026
    [Documentation]    验证checkout shipping页面，优惠码输入框后apply按钮可点击>"1.C端购买任意商品进入checkout shipping页面,2.优惠码输入框中输入优惠码AAA006,3.点击apply按钮" > 点击后优惠码使用成功，价格详情中显示discount code： - 10.00USD
    [Tags]    P0    threshold
    ${code}    Create Specific Coupon Code
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${code}
    #.点击应用
    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
    #.获取优惠那一栏的值
    Text Of Element Should Be Equal With Wait   dom:document.querySelectorAll("[class='checkout__prices-table-value']")[1]    - 10.00USD

    #门槛无标注，
checkout_027
    [Documentation]    验证checkout shipping页面输入错误的优惠码时，点击apply，会给出对应提示 > 2.优惠码输入框中输入任意内容：..0001,3.点击apply > 优惠码输入框下方出现错误提示
    [Tags]    P1
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ..0001
    #.点击应用
    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
    Wait Until Page Contains    This discount does not exist.

# 已实现，用例有标注
checkout_028
    [Documentation]     验证checkout shipping页面，优惠码输入框中的取消使用优惠码按钮可清空输入框  >  1.输入框中输入本次购买商品可用的优惠码并且点击apply按钮使用   2.点击优惠码输入框中的取消使用按钮
    [Tags]    P0    threshold
    ${code}    Create Specific Coupon Code
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Input Text     ${locatorC_checkoutShipping_input_discountCode}     ${code}
    Wait And Click Element   ${locatorC_checkoutShipping_button_apply}
    #取消优惠码输入框的优惠码
    Wait And Click Element   ${locatorC_checkoutShipping_icon_couponClose}
    Wait Until Page Not Contains Text      This discount does not exist.

checkout_034
    [Documentation]    验证checkout shipping页面，shipping address栏，国家选择框可点击以及国家选择展示 > 1.点击shipping address栏国家选择框 >点击后国家选择框下拉展开，显示所有可选择的国家
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_address_select_country}

checkout_035
    [Documentation]    验证checkout shipping页面，shipping address栏，省份选择框可点击以及省份选择展示  > "1.点击国家选择框选择中国,2.点击省份选择框" > 点击后城市选择框下拉展开，显示中国的所有省份
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    China
    Wait And Click Element    ${locatorC_checkoutShipping_address_select_province}

#checkout_037
#    [Documentation]    验证checkout shipping页面，shipping address栏输入正确的信息，可以提交成功 > 输入地址 > 提交成功，页面跳转到支付页面
#    [Tags]    P0    threshold    smoke
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains    PAYMENT

checkout_073
    [Documentation]    验证checkout shipping页面，点击买家留言栏，可展开买家留言输入框 > 1.点击special instruction栏 > 点击后展开买家留言输入框
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Click Element    ${locatorC_checkoutShipping_button_specialInstruction}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_input_specialInstruction}

checkout_077
    [Documentation]    验证checkout shipping页面，买家留言输入框输入的内容，会同步到B端订单详情 > "1.C端发起新订单AAA00111进入checkout shipping页面,2.买家留言输入框中输入内容：请尽快发货,3.完成订单进入B端订单AAA00111详情,4.查看订单详情页面买家留言" > 买家留言内容显示为：请尽快发货
    [Tags]    P0    threshold    smoke
    kwcheckout.set_checkout_process_with_conf_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    #.点击展开留言框
    Wait And Click Element    ${locatorC_checkoutShipping_button_specialInstruction}
    Wait And Input Text    ${locatorC_checkoutShipping_input_specialInstruction}    请尽快发货
    #.点击提交
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Wait Until Page Contains Text   Order summary
    Go To Home By Url
    Go To Undeal Order Page
    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
    Wait Until Page Contains Text    请尽快发货

checkout_078
    [Documentation]    验证checkout shipping页面，未选择国家时，shipping delivery栏不显示运费方案  >  1.购买任意商品进入checkout shipping页面  2.不选择国家查看shipping delivery栏
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    Please enter address first





##周莉编写
#checkout_099
#    [Documentation]    验证checkout 支付页面，订单汇总，商品栏，商品子产品显示正常
#    [Tags]    P0
#    kwproduct.del_all_products_py
#    kwproduct.add_max_product_with_sub_py
#    Reload Page And Start Ajax
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#	Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#	Wait Until Page Contains Text    Color:
#	Wait Until Page Contains Text    Size:
#
#checkout_110
#    [Documentation]    验证checkout 支付页面，商品不收取税费时，价格详情中的tax显示为：+ $0.00
#    [Tags]    P0
#    kwtax.set_country_tax_price_py    0
#    Reload Page And Start Ajax
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutPayment_text_taxPrice}    + 0.00USD
#
##checkout_111
##    [Documentation]    验证checkout 支付页面，订单使用优惠码后，价格详情中会显示discount code并显示优惠价格
##    [Tags]    P0
##    [Setup]    Go To Coupon Page
##    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
##    Add Default Coupon Code Textrobot
##    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    优惠码AAA001
##    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
##    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
##    Wait And Input Text    ${locatorB_couponCodeNew_text_input_preferential}    50
##    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discount}    10
##    Wait And Click Element    ${locatorB_button_save00}
##    ${getCode}=    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_couponCode}
##    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
##    Go To First Product C Interface
##    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
##    Add Address Common Step
##    Wait And Input Text    ${locatorC_checkoutShipping_input_couponCode}    ${getCode}
##    Wait And Click Element    ${locatorC_checkoutShipping_button_couponApply}
##    Wait Until Page Contains Text    - 10.00USD
#
#checkout_124
#    [Documentation]    验证checkout支付页面，支付方式显示正常
#    [Tags]    P0
#    kwpayment.activate_payment_cod_py
#    kwpayment.activate_payment_credit_card_py
#    Reload Page And Start Ajax
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains Text    Credit Card
#    Wait Until Page Contains Text    Cash on delivery
#
#checkout_130
#    [Documentation]    验证checkout支付页面，选择ipaylinks支付时，支付方式栏下方会展开显示支付信息填写栏
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
#    Wait Until Page Contains Text    Select Credit and Debit Card
#
##checkout_131
##    [Documentation]    验证checkout支付页面，使用ipaylinks可正常支付
##    [Tags]    P0
##    [Setup]    Go To Payment Channel
##    kwpayment.activate_payment_credit_card_py
##    Select Credit Card Of IpayLinks
##    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
##    Run Keyword If    $class=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
##    Reload Page And Start Ajax
##    Go To First Product C Interface
##    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
##    Add Address Common Step
##    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
##    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
##    Wait And Input Text    ${locatorC_checkout_paymentCard_fristName}    Ting jack
##    Wait And Input Text    ${locatorC_checkout_paymentCard_cardEmail}    fan-da@autotest.com
##    Wait And Input Text    ${locatorC_checkout_paymentCard_phone}    18688886666
##    Wait And Input Text    ${locatorC_checkout_paymentCard_cardPostcode}    518000
##    Wait And Input Text    ${locatorC_checkout_paymentCard_cardNumber}    4111119987834534
##    Wait And Input Text    ${locatorC_checkout_paymentCard_cardDate}    1124
##    Wait And Input Text    ${locatorC_checkout_paymentCard_card_code}    869
##    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
##    Wait Until Page Contains Text   Payment successful!
#
#checkout_133
#    [Documentation]    验证checkout支付页面，ipaylinks支付信息会同步shipping页面填写的name，email，phone，postal code
#    [Tags]    p0
#    [Setup]    Go To Payment Channel
#    kwpayment.activate_payment_credit_card_py
#    Select Credit Card Of IpayLinks
#    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
#    Run Keyword If    $class=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
#    Value Of Element Should Be Equal With Wait    ${locatorC_checkout_paymentCard_fristName}    Javen fang
#    Value Of Element Should Be Equal With Wait    ${locatorC_checkout_paymentCard_cardEmail}    dianjiang@autotest.com
#    Value Of Element Should Be Equal With Wait    ${locatorC_checkout_paymentCard_phone}    18688886666
#    Value Of Element Should Be Equal With Wait    ${locatorC_checkout_paymentCard_cardPostcode}    518000
#
#checkout_157
#    [Documentation]    验证checkout 支付页面，选择ocean支付后，点击place order按钮会弹出支付确认弹窗
#    [Tags]    P0
#    [Setup]    Go To Payment Channel
#    kwpayment.activate_payment_credit_card_py
#    Select Credit Card Of OceanPayment
#    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
#    Run Keyword If    '${class}'=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
#    Go To First Product C Interface
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
#    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Go To    https://secure.oceanpayment.com/paymentpages/web/pay.html
#    Focus On New Window
#    Wait Until Page Contains Text    Order Details
#    Wait Until Page Contains Text    PAYMENT DETAILS
#
#checkout_198
#    [Documentation]    验证payment failure页面，cancel order按钮可点击
#    [Tags]    P0
#    [Setup]    Go To Payment Channel
#    kwpayment.activate_payment_credit_card_py
#    Select Credit Card Of IpayLinks
#    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
#    Run Keyword If    $class=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardNumber}    4111119987830000
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardDate}    1123
#    Wait And Input Text    ${locatorC_checkout_paymentCard_card_code}    123
#    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text   Payment failure!
#    Wait And Click Element    ${locatorC_checkout_button_cancelOrder}
#    Text Of Element Should Contain With Wait    ${locatorC_checkout_homeBanner}    ${user_default_domain}
#
#checkout_199
#    [Documentation]    验证payment failure页面，pay again按钮可点击
#    [Tags]    P0
#    [Setup]    Go To Payment Channel
#    kwpayment.activate_payment_credit_card_py
#    Select Credit Card Of IpayLinks
#    ${class}=    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
#    Run Keyword If    $class=='ant-switch'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element  ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutPayment_icon_bankCard}
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardNumber}    4111119987830000
#    Wait And Input Text    ${locatorC_checkout_paymentCard_cardDate}    1123
#    Wait And Input Text    ${locatorC_checkout_paymentCard_card_code}    123
#    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
#    Wait Until Page Contains Text   Payment failure!
#    Wait And Click Element    ${locatorC_checkout_button_payAgain}
#    Wait Until Page Contains Text   Order summary
#    Wait Until Page Contains Text    Payment
#
#checkout_202
#    [Documentation]    验证B端结账流程中退款条约输入内容后，C端shipping页面和payment页面会底部会显示refund policy按钮
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Go To ServiceTerms Table
#    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约测试文本
#    Sleep And Click Element    ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
#
#checkout_203
#    [Documentation]    验证checkout shipping页面和payment页面底部refund policy按钮可点击以及内容展示
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Go To ServiceTerms Table
#    Wait And Input Text     ${locatorB_checkout_textarea_refundTreatyInputBox}     退款条约测试文本123
#    Sleep And Click Element    ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
#    Wait Until Page Contains Text    退款条约测试文本123
#
#checkout_204
#    [Documentation]    验证B端结账流程中隐私政策输入内容后，C端shipping页面和payment页面会底部会显示privacy policy按钮
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
#    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     隐私政策测试文本
#    Sleep And Click Element    ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
#
#checkout_205
#    [Documentation]    验证checkout shipping页面和payment页面底部privacy policy按钮可点击以及内容展示
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
#    Wait And Input Text     ${locatorB_checkout_textarea_policyInputBox}     隐私政策测试文本123
#    Sleep And Click Element    ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
#    Wait Until Page Contains Text    隐私政策测试文本123
#
#checkout_206
#    [Documentation]    验证B端结账流程中服务条约输入内容后，C端shipping页面和payment页面会底部会显示terms of service按钮
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
#    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服务条约测试文本
#    Sleep And Click Element    ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_li_TextPolicy}
#
#checkout_207
#    [Documentation]    验证checkout shipping页面和payment页面底部terms of service按钮可点击以及内容展示
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Wait And Click Element      ${locatorB_checkout_button_nav_serviceTerms}
#    Wait And Input Text     ${locatorB_checkout_textarea_refundServiceInputBox}     服务条约测试文本123
#    Sleep And Click Element    ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait And Click Element    ${locatorC_checkoutShipping_li_TextPolicy}
#    Wait Until Page Contains Text    服务条约测试文本123
#
#checkout_219
#    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为必填时，C端checkout shipping页面contact email栏会显示两个选择项，使用收货邮箱以及添加新邮箱
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Go To Information Table
#    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
#    Sleep And Click Element    ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait Until Page Contains Text    Same as shipping email above
#    Wait Until Page Contains Text    New email
#
#checkout_220
#    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为必填时，C端checkout shipping页面contact email栏same as shipping email above可勾选
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Go To Information Table
#    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
#    Wait And Click Element    ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait And Click Element    ${locatorC_checkoutShipping_label_NewcontactEamil}
#    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    12345678@autotest.com
#    Wait And Click Element    ${locatorC_checkoutShipping_label_SamecontactEamil}
#    Wait Until Page Not Contains Text    12345678@autotest.com
#
#checkout_221
#    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为必填时，C端checkout shipping页面contact email栏new email可勾选
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Go To Information Table
#    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
#    Sleep And Click Element    ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait And Click Element    ${locatorC_checkoutShipping_label_SamecontactEamil}
#    Wait And Click Element    ${locatorC_checkoutShipping_label_NewcontactEamil}
#    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    12345678@autotest.com
#    Value Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_input_contactEmail}    12345678@autotest.com
#
#checkout_225
#    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为必填时，C端checkout shipping页面contact email栏勾选new email后，new email后的输入框输入正确的内容
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Go To Information Table
#    Wait And Click Element    ${locatorB_checkout_radio_emailCodeMandatory}
#    Sleep And Click Element    ${locatorB_checkout_button_save}
#    Reload Page And Start Ajax
#    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeMandatory}   class    ant-radio-wrapper ant-radio-wrapper-checked
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait And Click Element    ${locatorC_checkoutShipping_label_NewcontactEamil}
#    Add Address SepCommon Step
#    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    12345678@autotest.com
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_button_completeOrder}
#
#checkout_227
#    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为选填，C端checkout shipping页面contact email栏只显示一个邮箱输入框
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Go To Information Table
#    Wait And Click Element    ${locatorB_checkout_radio_emailCodeOptional}
#    Reload Page And Start Ajax
#    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeOptional}   class    ant-radio-wrapper ant-radio-wrapper-checked
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Wait Until Page Not Contains Locator    ${locatorC_checkoutShipping_label_SamecontactEamil}
#    Wait Until Page Not Contains Locator    ${locatorC_checkoutShipping_label_NewcontactEamil}
#
#checkout_230
#    [Documentation]    验证C端未登录个人中心，B端结账流程收货信息中邮箱为选填，C端checkout shipping页面contact email栏contact email输入框输入正确的内容可提交成功
#    [Tags]    P0
#    [Setup]    Go To Checkout Settings Page
#    Go To Information Table
#    Wait And Click Element    ${locatorB_checkout_radio_emailCodeOptional}
#    Reload Page And Start Ajax
#    Element Attribute Should Contain With Wait     ${locatorB_checkout_radio_emailCodeOptional}   class    ant-radio-wrapper ant-radio-wrapper-checked
#    Go To First Product C Interface
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address SepCommon Step
#    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    dianjiang@autotest.com
#    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
#    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_button_completeOrder}








   