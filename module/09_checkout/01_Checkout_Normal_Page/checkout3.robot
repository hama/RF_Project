*** Settings ***
Documentation     Ckeckout
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown    # close the browser opened for this test suite
#Test Setup        Checkout Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***

checkout_007
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品子产品显示正常 > "1.C端购买商品women的子款式：blue XXL,2.进入checkout shipping页面,3.查看订单汇总商品栏子产品" > "子产品显示为：,color：blue,size：XXL"
    [Tags]    P0    threshold    smoke
    # 删除全部商品
    kwproduct.del_all_products_py
    #添加一个待自产品的商品 子商品
    kwproduct.add_max_product_with_sub_py
    #进入商品详情步骤
    Go To First Product C Interface
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Text    Color:red
    Wait Until Page Contains Text    Size:min

checkout_019
    [Documentation]    验证checkout shipping页面，商品不收取税费时，价格详情中的tax显示为：+ $0.00  >  1.C端购买商品women进入checkout shipping页面   2.查看价格详情中tax
    [Tags]    P0    threshold
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #.添加一个不要物流费的商品
    &{conf}=   Create Dictionary
    ...    requires_shipping=0
    kwproduct.add_product_with_conf_py   ${conf}
    #进入商品详情步骤
    Go To First Product C Interface
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Wait And Select From List By Label     ${locatorC_checkout_inputText_countyCode}    China
    Wait And Select From List By Label     ${locatorC_checkout_inputText_provinceCode}    上海
    Text Of Element Should Be Equal With Wait     ${locatorC_checkout_shipping_preferential}    + $0.00
    #商品的初始化
    kwproduct.del_all_products_py


checkout_080
    [Documentation]    验证checkout shipping页面，购买的商品不需要物流运输时，选择国家后，shipping delivery栏会出现交付虚拟产品的运费方案  >  1.C端购买商品women进入checkout shipping页面  2.选择国家   3.查看shipping delivery栏
    [Tags]    P0    threshold
     #.初始化物流信息
    kwshipping.del_all_shipping_py
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"45","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    kwshipping.add_shipping_with_conf_py    ${conf}
    #.添加一个不收税费的商品
    &{conf}=   Create Dictionary
    ...    settax=0
    kwproduct.add_product_with_conf_py   ${conf}
    #进入商品详情步骤
    Go To First Product C Interface
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait Until Page Contains Locator    ${locatorC_checkout_delivery_shippingLine}

checkout_109
    [Documentation]   验证checkout 支付页面，订单详情中tax显示正常  > 1.C端购买商品women 1件进入checkout shipping页面  2.信息填写栏选择国家中国 3.进入支付页面查看价格详情中tax
    [Tags]    P0    threshold    smoke
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #.添加一个默认运费的物流
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"45","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    kwshipping.add_shipping_with_conf_py    ${conf}
    #创建60的税费
    kwtax.add_default_tax_price_py
    Go To First Product C Interface
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    #.选择中国
    Wait And Select From List By Label     ${locatorC_checkout_inputText_countyCode}    China
    Wait And Select From List By Label     ${locatorC_checkout_inputText_provinceCode}    Beijing
    #查看商品扣除60%税费后的金额
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_shipping_total}    $710.40

checkout_110
    [Documentation]      验证checkout 支付页面，商品不收取税费时，价格详情中的tax显示为：+ $0.00   >  1.C端购买商品women进入checkout 支付页面  2.查看价格详情中tax
    [Tags]    P0    threshold
    #.先删除物流
    kwshipping.del_all_shipping_py
    #.添加一个重量运费的物流
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"45","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    kwshipping.add_shipping_with_conf_py    ${conf}
    #.添加一个不收税费的商品
    &{conf}=   Create Dictionary
    ...    settax=0
    kwproduct.add_product_with_conf_py   ${conf}
    #进入商品详情步骤
    Go To First Product C Interface
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_delivery_shippingLine}
    Text Of Element Should Be Equal With Wait     ${locatorC_checkout_shipping_preferential}    + $0.00

checkout_119
    [Documentation]    验证购买不需要物流运输的商品进入支付页面时，shipping method显示为Delivery for virtual product  >  1.C端购买商品women进入checkout 支付页面  2.查看payment栏 shipping method
    [Tags]    P0    threshold
    #初始化物流信息
    kwshipping.del_all_shipping_py
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"45","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    kwshipping.add_shipping_with_conf_py    ${conf}
    #.添加一个不需要物流的商品
    &{conf}=   Create Dictionary
    ...    requires_shipping=0
    kwproduct.add_product_with_conf_py   ${conf}
    #进入商品详情步骤
    Go To First Product C Interface
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait Until Page Contains Locator    ${locatorC_checkout_delivery_shippingLine}
