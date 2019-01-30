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
    #添加一个商品包含子商品(color:red、size:min)
    &{dict}=    Create Dictionary    option1=red    option2=min
    @{variants}=    Create List    ${dict}
    &{conf}=    Create Dictionary    variants=${variants}
    kwproduct.add_max_product_with_sub_py
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Wait Until Page Contains Text    color:red
    Wait Until Page Contains Text    size:min

checkout_019
    [Documentation]    验证checkout shipping页面，商品不收取税费时，价格详情中的tax显示为：+ 0.00USD  >  1.C端购买商品women进入checkout shipping页面   2.查看价格详情中tax
    [Tags]    P0    threshold
    #添加一个商品价格为$444,名称：autotest_title,不需要物流
    public_method.create    product    {"title":"autotest_title", "requires_shipping":"False", "variants":[{"price": "444"}]}
    #添加一个价格10 物流
    public_method.create    shipping    {"plans": [{"name": "price_fee", "rule_type": "price", "rate_amount": "10"}]}
    #添加一个为60% 税金
    public_method.setting    tax    [{"tax_rate": 60}]
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Text Of Element Should Be Equal With Wait     ${locatorC_checkoutPayment_text_taxPrice}[2]    + 0.00USD

checkout_080
    [Documentation]    验证checkout shipping页面，购买的商品不需要物流运输时，选择国家后，shipping delivery栏会出现交付虚拟产品的运费方案  >  1.C端购买商品women进入checkout shipping页面  2.选择国家   3.查看shipping delivery栏
    [Tags]    P0    threshold
    #添加一个商品价格为$444,名称：autotest_title,不需要物流
    public_method.create    product    {"title": "autotest_title", "requires_shipping":"False", "variants": [{"price": "444"}]}
    #添加一个价格10 物流
    public_method.create    shipping    {"plans": [{"name": "price_fee", "rule_type": "price", "rate_amount": "10"}]}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait Until Page Contains Text    Delivery for virtual product

checkout_109
    [Documentation]   验证checkout 支付页面，订单详情中tax显示正常  > 1.C端购买商品women 1件进入checkout shipping页面  2.信息填写栏选择国家中国 3.进入支付页面查看价格详情中tax
    [Tags]    P0    threshold    smoke
    #添加一个商品价格为$444,名称：autotest_title
    public_method.create    product    {"title": "autotest_title", "variants": [{"price": "444"}]}
    #添加一个为60% 税金
    public_method.setting    tax    [{"tax_rate": 60}]
    #添加一个价格10 物流
    public_method.create    shipping    {"plans": [{"name": "price_fee", "rule_type": "price", "rate_amount": "10"}]}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutPayment_text_taxPrice}[2]    + 266.40USD

checkout_110
    [Documentation]      验证checkout 支付页面，商品不收取税费时，价格详情中的tax显示为：+ 0.00USD   >  1.C端购买商品women进入checkout 支付页面  2.查看价格详情中tax
    [Tags]    P0    threshold
    #添加一个商品价格为$444,名称：autotest_title，不收税费
    public_method.create    product    {"title": "autotest_title", "taxable":"False", "variants": [{"price": "444"}]}
    #添加一个重量运费为10 物流
    public_method.create    shipping    {"plans": [{"name": "weight_fee", "rule_type": "weight", "rate_amount": "10"}]}
    #添加一个为60% 税金
    public_method.setting    tax    [{"tax_rate": 60}]
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Text Of Element Should Be Equal With Wait     ${locatorC_checkoutPayment_text_taxPrice}[2]    + 0.00USD

checkout_119
    [Documentation]    验证购买不需要物流运输的商品进入支付页面时，shipping method显示为Delivery for virtual product  >  1.C端购买商品women进入checkout 支付页面  2.查看payment栏 shipping method
    [Tags]    P0    threshold
    #添加一个商品价格为$444,名称：autotest_title,不需要物流
    public_method.create    product    {"title": "autotest_title", "requires_shipping":"False", "variants": [{"price": "444"}]}
    #添加一个价格10 物流
    public_method.create    shipping    {"plans": [{"name": "price_fee", "rule_type": "price", "rate_amount": "10"}]}
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Text Of Element Should Contain With Wait    ${locatorC_checkoutPayment_text_shippingMethod}    Delivery for virtual product