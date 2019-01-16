*** Settings ***
Documentation     Checkout每个用例使用的商品,物流,结账方式都为自定义
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown    # close the browser opened for this test suite
Test Setup        Checkout3 Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
checkout_007
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品子产品显示正常 > "1.C端购买商品women的子款式：blue XXL,2.进入checkout shipping页面,3.查看订单汇总商品栏子产品" > "子产品显示为：,color：blue,size：XXL"
    [Tags]    P0    threshold    smoke
    #添加一个待自产品的商品 子商品
    kwproduct.add_max_product_with_sub_py
    #进入商品详情步骤
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    color:red
    Wait Until Page Contains Text    size:min

checkout_019
    [Documentation]    验证checkout shipping页面，商品不收取税费时，价格详情中的tax显示为：+ 0.00USD  >  1.C端购买商品women进入checkout shipping页面   2.查看价格详情中tax
    [Tags]    P0    threshold
    #.添加一个不要物流费的商品
    &{conf}=   Create Dictionary
    ...    taxable=${False}
    kwproduct.add_product_with_conf_py   ${conf}
    kwshipping.add_shipping_with_conf_py
    Sleep    1
    kwtax.add_default_tax_price_py
    #进入商品详情步骤
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_select_country}
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_lastName}    345
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    China
    Sleep    1
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_province}    Beijing
    Sleep    1
    Text Of Element Should Be Equal With Wait     ${locatorC_checkoutPayment_text_taxPrice}[2]    + 0.00USD

checkout_080
    [Documentation]    验证checkout shipping页面，购买的商品不需要物流运输时，选择国家后，shipping delivery栏会出现交付虚拟产品的运费方案  >  1.C端购买商品women进入checkout shipping页面  2.选择国家   3.查看shipping delivery栏
    [Tags]    P0    threshold
    #.添加一个不收税费的商品
    &{conf}=   Create Dictionary
    ...    requires_shipping=${False}
    kwproduct.add_product_with_conf_py   ${conf}
    kwshipping.add_shipping_with_conf_py
    #进入商品详情步骤
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    Delivery for virtual

checkout_109
    [Documentation]   验证checkout 支付页面，订单详情中tax显示正常  > 1.C端购买商品women 1件进入checkout shipping页面  2.信息填写栏选择国家中国 3.进入支付页面查看价格详情中tax
    [Tags]    P0    threshold    smoke
    kwproduct.add_product_with_conf_py
    kwshipping.add_shipping_with_conf_py
    Sleep    1
    kwtax.add_default_tax_price_py
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutPayment_text_taxPrice}[2]    + 266.40USD

checkout_110
    [Documentation]      验证checkout 支付页面，商品不收取税费时，价格详情中的tax显示为：+ 0.00USD   >  1.C端购买商品women进入checkout 支付页面  2.查看价格详情中tax
    [Tags]    P0    threshold
    #.添加一个重量运费的物流
    kwshipping.add_shipping_with_conf_py
    Sleep    1
    kwtax.add_default_tax_price_py
    &{conf}=   Create Dictionary
    ...    taxable=${False}
    kwproduct.add_product_with_conf_py   ${conf}
    #进入商品详情步骤
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Sleep    2
    Text Of Element Should Be Equal With Wait     ${locatorC_checkoutPayment_text_taxPrice}[2]    + 0.00USD

checkout_119
    [Documentation]    验证购买不需要物流运输的商品进入支付页面时，shipping method显示为Delivery for virtual product  >  1.C端购买商品women进入checkout 支付页面  2.查看payment栏 shipping method
    [Tags]    P0    threshold
    kwcheckout.set_checkout_process_with_conf_py
    kwshipping.add_shipping_with_conf_py
    &{conf}=   Create Dictionary
    ...    requires_shipping=${False}
    kwproduct.add_product_with_conf_py   ${conf}
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Text Of Element Should Contain With Wait    ${locatorC_checkoutPayment_text_shippingMethod}    Delivery for virtual product