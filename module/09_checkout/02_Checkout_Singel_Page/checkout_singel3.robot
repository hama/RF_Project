*** Settings ***
Documentation     Checkout每个用例使用的商品,物流,结账方式都为自定义
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown    # close the browser opened for this test suite
Test Setup        Checkout3 Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
checkout_016
    [Documentation]    验证checkout页面，订单详情中tax显示正常
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwshipping.add_price_fee_shipping_py
    kwtax.add_default_tax_price_py
    kwrebate.end_all_rebates_py
    Go To First Product C Interface
    Reload Page And Start Ajax
    Sleep    2
    ${price1}=    Wait And Get Text    ${locatorC_orderDetail_text_productPrice}
    ${price2}=    Evaluate    u"${price1}".strip('$')
    ${price}=    Convert To Number    ${price2}
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    ${TaxNum}=   Evaluate   ${price} * 0.6
    Add Address Common Step
    Text Of Element Should Contain With Wait    ${locatorC_checkout_prices_shippingValue}[2]    ${TaxNum}0USD

checkout_017
    [Documentation]    验证checkout页面，商品不收取税费时，价格详情中的tax显示为：+ $0.00
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwshipping.add_price_fee_shipping_py
    kwtax.set_country_tax_price_py    0
    kwrebate.end_all_rebates_py
    Go To First Product C Interface
    Reload Page And Start Ajax
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Text Of Element Should Contain With Wait    ${locatorC_checkout_prices_shippingValue}[2]    + 0.00USD

checkout_021
    [Documentation]    验证checkout页面，购买的商品参加了满减活动时，价格详情中会显示discount和优惠的价格
    [Tags]    P0    threshold
    kwrebate.end_all_rebates_py
    kwshipping.add_price_fee_shipping_py
    kwproduct.add_max_product_py
    Go To Subtraction Page
    Sleep    2
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Go To First Product C Interface
    Reload Page And Start Ajax
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Text Of Element Should Contain With Wait    ${locatorC_checkout_prices_shippingValue}[1]    - 20.00USD

checkout_022
    [Documentation]    验证checkout页面，total显示正常
    [Tags]    P0    threshold
    kwrebate.end_all_rebates_py
    kwproduct.add_max_product_py
    &{dict}=    Create Dictionary    name=方案0    rate_amount=2
    @{plans}=    Create List    ${dict}
    &{conf}=    Create Dictionary    plans=${plans}
    kwshipping.add_price_fee_shipping_py    ${conf}
    kwtax.set_country_tax_price_py    50
    Go To Subtraction Page
    Sleep    2
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Input Text    ${locatorB_subtractionNew_input_cutPrice}     10
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Go To First Product C Interface
    Sleep    2
    ${price1}=    Wait And Get Text    ${locatorC_orderDetail_text_productPrice}
    ${price}=    Evaluate    u"${price1}".strip('$')
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Text Of Element Should Contain With Wait    ${locatorC_checkout_prices_shippingValue}[0]    ${price}
    Text Of Element Should Contain With Wait    ${locatorC_checkout_prices_shippingValue}[1]    - 10.00USD
    Text Of Element Should Contain With Wait    ${locatorC_checkout_prices_shippingValue}[2]    + 2.00USD
    Text Of Element Should Contain With Wait    ${locatorC_checkout_prices_shippingValue}[3]    + 217.00USD
    Text Of Element Should Contain With Wait    ${locatorC_checkoutShipping_locator_total}    653.00USD

checkout_039
    [Documentation]    验证checkout页面，shipping address栏输入正确的信息，可以提交成功
    [Tags]    P0    threshold
    kwpayment.activate_payment_cod_py
    kwproduct.add_max_product_py
    kwshipping.add_price_fee_shipping_py
    Reload Page And Start Ajax
    Go To Payment Channel
    Sleep    2
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_pay_switch_creditCardSwitch}
    ${class}=    Run Keyword If    '${status}'=='True'    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    $class=='ant-switch ant-switch-checked'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!

checkout_100
    [Documentation]    验证checkout页面，购买的商品不需要物流运输时，选择国家后，shipping delivery栏会出现交付虚拟产品的运费方案
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwshipping.add_price_fee_shipping_py
    Go To Product Management Page
    Reload Page And Start Ajax
    Sleep    2
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    Wait And Click Element    ${locatorB_productsNew_button_productShipping}
    Sleep And Click Element    ${locatorB_productsNew_button_NextStep}
    Sleep And Click Element    ${locatorB_productsNew_button_save}
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Wait Until Page Contains Text    Delivery for virtual product

#checkout_113(点击运费方案中的"保存"按钮无效)
#    [Documentation]    验证checkout页面，所选的运费方案有首重续重时，价格计算正常
#    [Tags]    P0    threshold
#    &{dict}=    Create Dictionary    name=重量方案1    rule_range_min=20.00    rule_range_max=60.00    rule_range_unit=kg
#    @{plans}=    Create List    ${dict}
#    &{conf}=    Create Dictionary    plans=${plans}
#    kwshipping.add_weight_fee_shipping_py    ${conf}
#    kwproduct.add_max_product_py
#    Go To Shipping Page
#    Reload Page And Start Ajax
#    Sleep    2
#    Edit Default Weight Shipping
#    Wait And Click Element   ${locatorB_button_save00}
#    Go To Product Management Page
#    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
#    Fill In Required Items When Create Product
#    Wait And Input Text    ${locatorB_productsNew_input_weight}    30
#    Sleep And Click Element    ${locatorB_productsNew_button_save}
#    Go To First Product C Interface
#    Sleep    2
#    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
#    Add Address Common Step
#    Wait Until Page Contains Text    重量方案1
#    Wait Until Page Contains Text    $50.00

checkout_202
    [Documentation]    验证payment failure页面，cancel order按钮可点击
    [Tags]    P0    threshold
    kwpayment.activate_payment_credit_card_py
    kwproduct.add_max_product_py
    kwshipping.add_price_fee_shipping_py
    Go To Payment Channel
    Sleep    2
    Select Credit Card Of IpayLinks
    kwpayment.activate_payment_credit_card_py
    Reload Page And Start Ajax
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Add Credit Card Info
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment failure
    Wait And Click Element    ${locatorC_checkout_button_cancelOrder}
    Wait Until Page Contains Text    We Offer Free Shipping Worldwide

checkout_203
    [Documentation]    验证payment failure页面，pay again按钮可点击
    [Tags]    P0    threshold
    kwpayment.activate_payment_credit_card_py
    kwproduct.add_max_product_py
    kwshipping.add_price_fee_shipping_py
    Go To Payment Channel
    Sleep    2
    Select Credit Card Of IpayLinks
    kwpayment.activate_payment_credit_card_py
    Reload Page And Start Ajax
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Add Credit Card Info
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment failure
    Wait And Click Element    ${locatorC_checkout_button_payAgain}
    Wait Until Page Contains Text    Payment method
    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_button_completeOrder}

checkout_205
    [Documentation]    验证pay Again页面，shipping to显示正常
    [Tags]    P0    threshold
    kwpayment.activate_payment_credit_card_py
    kwproduct.add_max_product_py
    kwshipping.add_price_fee_shipping_py
    Go To Payment Channel
    Sleep    2
    Select Credit Card Of IpayLinks
    kwpayment.activate_payment_credit_card_py
    Reload Page And Start Ajax
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Add Credit Card Info
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment failure
    Wait And Click Element    ${locatorC_checkout_button_payAgain}
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

checkout_206
    [Documentation]    验证pay Again页面，shipping method显示正常
    [Tags]    P0    threshold
    kwpayment.activate_payment_credit_card_py
    kwproduct.add_max_product_py
    kwshipping.add_price_fee_shipping_py
    Reload Page And Start Ajax
    Go To Payment Channel
    Select Credit Card Of IpayLinks
    kwpayment.activate_payment_credit_card_py
    Reload Page And Start Ajax
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Add Credit Card Info
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment failure
    Wait And Click Element    ${locatorC_checkout_button_payAgain}
    Wait Until Page Contains Text    price_fee

checkout_211
    [Documentation]    验证B端交易设置中结账页形式选择单结账页时，C端进入checkout页面，checkout为单页面结账形式
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwshipping.add_price_fee_shipping_py
    Go To Checkout Settings Page
    Reload Page And Start Ajax
    Sleep    2
    ${class}=    Wait And Get Element Attribute    ${locatorB_checkout_label_singelPayment}    class
    Run Keyword If    '${class}'=='radio_btn_cddf ant-radio-button-wrapper'    Run Keywords    Wait And Click Element    ${locatorB_checkout_label_singelPayment}    And    Wait And Click Element    ${locatorB_checkout_button_save}
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    Order summary
    Wait Until Page Contains Text    Shipping Address
    Wait Until Page Contains Text    Contact Email
    Wait Until Page Contains Text    Shipping & Delivery
    Wait Until Page Contains Text    Payment method
    Wait Until Page Contains Text    Billing Address
    Wait Until Page Contains Text    Special Instruction
    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_button_completeOrder}

checkout_212
    [Documentation]    验证B端交易设置中结账页形式选择双结账页时，C端进入checkout页面，checkout为双页面结账形式
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwshipping.add_price_fee_shipping_py
    Go To Checkout Settings Page
    Reload Page And Start Ajax
    Sleep    2
    ${class}=    Wait And Get Element Attribute    ${locatorB_checkout_label_doublePayment}    class
    Run Keyword If    '${class}'=='radio_btn_cddf ant-radio-button-wrapper'    Run Keywords    Wait And Click Element    ${locatorB_checkout_label_doublePayment}    AND    Wait And Click Element    ${locatorB_checkout_button_save}
    Go To First Product C Interface
    Sleep    2
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    Order summary
    Wait Until Page Contains Text    Shipping Address
    Wait Until Page Contains Text    Contact Email
    Wait Until Page Contains Text    Shipping & Delivery
    Wait Until Page Contains Text    Special Instruction
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_button_paymentMethod}
