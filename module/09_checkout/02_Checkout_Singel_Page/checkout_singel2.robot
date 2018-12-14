*** Settings ***
Documentation     Checkout每个用例使用同一个上架商品,不同的物流,COD结账方式
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown    # close the browser opened for this test suite
Test Setup        Checkout2 Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
checkout_013
    [Documentation]    验证checkout页面，价格详情中，shipping显示正常
    [Tags]    P0    threshold
    &{dict}=    Create Dictionary    name=方案0
    @{plans}=    Create List    ${dict}
    &{conf}=    Create Dictionary    plans=${plans}
    kwshipping.add_price_fee_shipping_py    ${conf}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    方案0
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_prices_shippingValue}[1]    + 10.00USD

checkout_036
    [Documentation]    验证checkout页面，国家选择印尼时，City输入框会变为选择框
    [Tags]    P0    threshold
    kwshipping.add_ID_price_fee_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    Indonesia
    Sleep    1
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_province}    Aceh
    Sleep    1
    Wait Until Page Not Contains Locator    ${locatorC_checkoutShipping_address_input_city}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_select_city}

checkout_037
    [Documentation]    验证checkout页面，国家选择印尼时，会多出一个地区输入框
    [Tags]    P0    threshold
    kwshipping.add_ID_price_fee_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    Indonesia
    Sleep    1
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_area}

checkout_102
    [Documentation]    验证checkout页面，没有可选择物流方案时，complete order 按钮无法点击
    [Tags]    P0
    [Setup]    Checkout2 Child Case Setup
    &{dict}=    Create Dictionary    name=方案3    rule_range_min=100.00    rule_range_max=600.00
    @{plans}=    Create List    ${dict}
    &{conf}=    Create Dictionary    plans=${plans}
    kwshipping.add_price_fee_shipping_py    ${conf}
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    Fill In Required Items When Create Product
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    10
    Sleep And Click Element    ${locatorB_productsNew_button_save}
    Go To First Product C Interface
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Not Contains Text    方案3
    Wait Until Page Contains Text    Shipping method is not available
    Wait And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Locator    ${locatorC_checkoutPayment_button_completeOrder}

checkout_103
    [Documentation]    验证B端运费方案设置价格范围时，C端购买的商品价格满足此价格范围，checkout页面将展示此运费方案
    [Tags]    P0    threshold
    [Setup]    Checkout2 Child Case Setup
    &{dict}=    Create Dictionary    name=价格方案1    rule_range_min=20.00    rule_range_max=60.00
    @{plans}=    Create List    ${dict}
    &{conf}=    Create Dictionary    plans=${plans}
    kwshipping.add_price_fee_shipping_py    ${conf}
    Reload Page And Start Ajax
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    Fill In Required Items When Create Product
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    30
    Sleep And Click Element    ${locatorB_productsNew_button_save}
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    价格方案1

checkout_105
    [DOcumentation]    验证B端运费方案设置重量范围时，C端购买的商品重量满足此重量范围，checkout页面将展示此运费方案
    [Tags]    P0    threshold
    [Setup]    Checkout2 Child Case Setup
    &{dict}=    Create Dictionary    name=重量方案1    rule_range_min=20.00    rule_range_max=60.00
    @{plans}=    Create List    ${dict}
    &{conf}=    Create Dictionary    plans=${plans}
    kwshipping.add_weight_fee_shipping_py    ${conf}
    Reload Page And Start Ajax
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    Fill In Required Items When Create Product
    Wait And Input Text    ${locatorB_productsNew_input_weight}    30
    Sleep And Click Element    ${locatorB_productsNew_button_save}
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    重量方案1

checkout_107
    [DOcumentation]    验证B端运费方案设置数量范围时，C端购买的商品数量满足此数量范围，checkout页面将展示此运费方案
    [Tags]    P0    threshold
    &{dict}=    Create Dictionary    name=数量方案1    rule_range_min=3    rule_range_max=9
    @{plans}=    Create List    ${dict}
    &{conf}=    Create Dictionary    plans=${plans}
    kwshipping.add_quantity_fee_shipping_py    ${conf}
    Reload Page And Start Ajax
    :FOR    ${ONE}    IN RANGE    4
    \    Wait And Click Element    ${locatorC_orderDetail_icon_addProductNum}
    Sleep And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    数量方案1

checkout_110
    [Documentation]    验证B端运费方案中，勾选免运费时，checkout页面，运费栏显示的运费价格为$0.00
    [Tags]    P0    threshold
    &{dict}=    Create Dictionary    name=运费1    rate_amount=0
    @{plans}=    Create List    ${dict}
    &{conf}=    Create Dictionary    plans=${plans}
    kwshipping.add_price_fee_shipping_py    ${conf}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    运费1
    Wait Until Page Contains Text    $0.00

checkout_111
    [Documentation]    验证B端运费方案中，设置运费价格时，checkout页面，运费栏运费价格显示对应的价格
    [Tags]    P0    threshold
    &{dict}=    Create Dictionary    name=运费1    rate_amount=6
    @{plans}=    Create List    ${dict}
    &{conf}=    Create Dictionary    plans=${plans}
    kwshipping.add_price_fee_shipping_py    ${conf}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    运费1
    Wait Until Page Contains Text    $6.00

checkout_119
    [Documentation]    验证checkout页面，选择物流方案后，payment method栏支付方式显示正常
    [Tags]    P0    threshold
    kwshipping.add_shipping_with_conf_py
    kwpayment.activate_payment_cod_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    Cash on delivery

checkout_121
    [Documentation]    验证checkout页面，使用COD支付方式可正常支付
    [Tags]    P0    threshold
    [Setup]    Checkout2 Child Case Setup
    Go To Payment Channel
    kwshipping.add_shipping_with_conf_py
    kwpayment.activate_payment_cod_py
    Sleep    2
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_pay_switch_creditCardSwitch}
    ${class}=    Run Keyword If    '${status}'=='True'    Wait And Get Element Attribute    ${locatorB_pay_switch_creditCardSwitch}    class
    Run Keyword If    $class=='ant-switch ant-switch-checked'    Wait And Click Element Then Confirm    ${locatorB_pay_switch_creditCardSwitch}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!

checkout_160
    [Documentation]    验证所选的物流方案不支持COD时，payment method栏会隐藏COD支付
    [Tags]    P0    threshold
    [Setup]    Checkout2 Child Case Setup
    &{dict}=    Create Dictionary    name=方案1
    @{plans}=    Create List    ${dict}
    &{conf}=    Create Dictionary    plans=${plans}
    kwshipping.add_price_fee_shipping_py    ${conf}
    Go To Shipping Page
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_shipping_button_EidtShipping}
    Wait And Click Element    ${locatorB_priceSettings_icon_EidtShipping}
    ${class}=    Wait And Get Element Attribute    ${locatorB_priceSettings_checkbox_supportCOD}    class
    Run Keyword If    '${class}'=='ant-checkbox ant-checkbox-checked'    Run Keywords    Wait And Click Element    ${locatorB_priceSettings_checkbox_supportCOD}    AND    Wait And Click Element   ${locatorB_priceSettings_button_popUpsave}
    ...    AND    Sleep And Click Element     ${locatorB_button_save00}    AND    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Not Contains Text    Cash on Delivery
    Wait until Page Contains Text    Payment method is not available

checkout_198
    [Documentation]    验证payment successful页面，物流方案显示正常
    [Tags]    P0    threshold
    &{dict}=    Create Dictionary    name=方案1
    @{plans}=    Create List    ${dict}
    &{conf}=    Create Dictionary    plans=${plans}
    kwshipping.add_price_fee_shipping_py    ${conf}
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address SepCommon Step
    Sleep And Click Element    ${locatorC_checkoutPayment_button_completeOrder}
    Wait Until Page Contains Text    Payment successful!
    Wait Until Page Contains Text    方案1





