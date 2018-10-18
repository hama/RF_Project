*** Settings ***
Documentation     Ckeckout
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown    # close the browser opened for this test suite
Test Setup        Checkout Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
checkout_015
    [Documentation]    验证checkout shipping页面，价格详情中，shipping显示正常 >  shipping显示为：$10
    [Tags]    P0    threshold    smoke
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #添加一个价格10 物流
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    ...    shipping_plan=[{"name":"frg","shipping_method":"price","range_min":"0.00","range_max":-1,"rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_prices_shippingValue}    + $10.00

checkout_018
    [Documentation]    验证checkout shipping页面，订单详情中tax显示正常 >
    [Tags]    P0    threshold    smoke
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #添加一个价格10 物流
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    kwshipping.add_shipping_with_conf_py    ${conf}
    #创建60的税费
    kwtax.add_default_tax_price_py
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_shipping_total}   $710.40


checkout019
    [Documentation]    验证checkout shipping页面，商品不收取税费时，价格详情中的tax显示为：+ $0.00  >  1.C端购买商品women进入checkout shipping页面   2.查看价格详情中tax
    [Tags]    P0    threshold
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #.添加一个不要物流费的商品
    &{conf}=   Create Dictionary
    ...    requires_shipping=0
    kwproduct.add_product_with_conf_py   ${conf}
    #进入商品详情步骤
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Select Window    New
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Text Of Element Should Be Equal With Wait     ${locatorC_checkout_shipping_preferential}    + $0.00

checkout_024
    [Documentation]    验证checkout shipping页面，total显示正常 > "1.C端购买商品进入checkout shipping页面,2.信息填写栏选择国家 中国,3.选择物流方案：方案1,4.使用优惠码AAA001,5.此订单价格为：,,subtotal：$50.00,shipping：+ $2.00,discount code：- $10.00,tax: + $25.00,6.查看价格详情total"
    [Tags]    P0    threshold    smoke          #后面再做调整
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #添加一个价格10 物流
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    ...    shipping_plan=[{"name":"frg","shipping_method":"price","range_min":"0.00","range_max":-1,"rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    #.添加一个物流为中国百分之60的税金
    kwtax.add_default_tax_price_py
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    OAA36EC2
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_shipping_total}    $710.40

checkout080
    [Documentation]    验证checkout shipping页面，购买的商品不需要物流运输时，选择国家后，shipping delivery栏会出现交付虚拟产品的运费方案  >  1.C端购买商品women进入checkout shipping页面  2.选择国家   3.查看shipping delivery栏
    [Tags]    P0    threshold
     #.初始化物流信息
    kwshipping.del_all_shipping_py
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    kwshipping.add_shipping_with_conf_py    ${conf}
    #.添加一个不收税费的商品
    &{conf}=   Create Dictionary
    ...    settax=0
    #进入商品详情步骤
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Select Window    New
    kwproduct.add_product_with_conf_py   ${conf}
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait Until Page Contains Locator    ${locatorC_checkout_delivery_shippingLine}

checkout_083
    [Documentation]    验证B端运费方案设置价格范围时，C端购买的商品价格满足此价格范围，checkout shipping页面将展示此运费方案 > 运费方案中显示：价格方案1
    [Tags]    P0    threshold    smoke
    #.先删除物流
    kwshipping.del_all_shipping_py
    #.创建运费方案0  中国方案  运费价格0
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    ...    shipping_plan=[{"name":"frg","shipping_method":"price","range_min":"0.00","range_max":-1,"rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #.选择中国
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Text Of Element Should Be Equal With Wait   dom:document.querySelectorAll(".fl")[4]    price_fee

checkout090
    [Documentation]    验证B端运费方案中，勾选免运费时，checkout shipping页面，运费栏显示的运费价格为$0.00 >1.B端物流方案中添加物流物流，国家：中国，运费：运费1 不限价格 免运费2.C端购买任意商品进入checkout shipping页面 3.国家选择中国4.查看shipping delivery栏运费
    [Tags]    P0    threshold    smoke
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #.创建运费方案0  中国方案  运费价格0
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    ...    shipping_plan=[{"name":"frg","shipping_method":"price","range_min":"0.00","range_max":-1,"rate_amount":"0.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    Sleep  5
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #.选择中国
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Text Of Element Should Be Equal With Wait   ${locatorC_checkout_shipping_delivery}    $0.00

checkout097
    [Documentation]    验证checkout shipping页面，选择没有省份的国家后，点击payment method可以跳转到支付页面 > 1.shipping address中选择国家Bouvet Island  2.其他输入框输入合法内容 3.点击payment method按钮
    [Tags]    P0    threshold    smoke
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #创建物流方案中已添加国家：Bouvet Island
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"29","zone_ids":"-1"}]
    ...    shipping_name=autotest_shipping001
    kwshipping.add_shipping_with_conf_py    ${conf}
    Sleep    2
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #添加是shipping address
    Wait And Input Text    ${locatorB_checkout_address_first_name}    123
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    Bouvet Island
    Wait And Input Text    ${locatorB_checkout_address_city}    Island
    Wait And Input Text    ${locatorB_checkout_address_add}    Island123
    Wait And Input Text    ${locatorB_checkout_address_zip}    123456
    Wait And Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Wait And Input Text    ${locatorB_checkout_address_phone}    123456789
    Wait And Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Contains Text   Order summary

checkout107
    [Documentation]   验证checkout 支付页面，价格详情中，shipping显示正常  > 1.C端购买商品进入checkout shipping页面  2.填写购买人信息，国家选择：中国  3.选择运费：方案0  4.进入支付页面查看价格详情中shippinga
    [Tags]    P0    threshold    smoke
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #.创建运费方案0  中国方案  运费价格10
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    ...    shipping_plan=[{"name":"frg","shipping_method":"price","range_min":"0.00","range_max":-1,"rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    #添加是shipping address
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    #.选择中国   运费价格10
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Text Of Element Should Be Equal With Wait   ${locatorC_checkout_prices_shippingValue}    + $10.00

checkout110
    [Documentation]      验证checkout 支付页面，商品不收取税费时，价格详情中的tax显示为：+ $0.00   >  1.C端购买商品women进入checkout 支付页面  2.查看价格详情中tax
    [Tags]    P0    threshold
    #初始化物流信息
    kwshipping.del_all_shipping_py
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    kwshipping.add_shipping_with_conf_py    ${conf}
    #.添加一个不收税费的商品
    &{conf}=   Create Dictionary
    ...    settax=0
    kwproduct.add_product_with_conf_py   ${conf}
    #进入商品详情步骤
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Select Window    New
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_delivery_shippingLine}
    Text Of Element Should Be Equal With Wait     ${locatorC_checkout_shipping_preferential}    + $0.00

checkout118
    [Documentation]   验证checkout 支付页面，payment栏，shipping method显示正常  >  1.购买商品进入checkout shipping页面  2.选择运费方案：运费1   3.进入支付页面查看payment栏，shipping methoda
    [Tags]    P0    threshold    smoke
    #初始化物流环境
    kwshipping.del_all_shipping_py
    #.创建运费方案1  中国方案  运费价格10
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    ...    shipping_plan=[{"name":"frg","shipping_method":"price","range_min":"0.00","range_max":-1,"rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    Sleep    2
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Text Of Element Should Be Equal With Wait   ${locatorC_checkout_shipping_price}     $10.00
    Wait And Click Element      ${locatorC_checkout_shipping_submitCheckout}
    Text Of Element Should Be Equal With Wait   ${locatorC_checkout_payment_shippingMethoda}     + $10.00


checkout119
    [Documentation]    验证购买不需要物流运输的商品进入支付页面时，shipping method显示为Delivery for virtual product  >  1.C端购买商品women进入checkout 支付页面  2.查看payment栏 shipping method
    [Tags]    P0    threshold
    #初始化物流信息
    kwshipping.del_all_shipping_py
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    kwshipping.add_shipping_with_conf_py    ${conf}
    #.添加一个不需要物流的商品
    &{conf}=   Create Dictionary
    ...    requires_shipping=0
    kwproduct.add_product_with_conf_py   ${conf}
    #进入商品详情步骤
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Select Window    New
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait Until Page Contains Locator    ${locatorC_checkout_delivery_shippingLine}

checkout163
    [Documentation]   验证checkout页面，stripe支付信息中输入错误的信用卡号时，订单会支付失败  >  1.stripe支付信息中填写信息： 卡号：4111119987834534 有效日期：11/23  安全码：123 邮编：518000 2.点击place order按钮
    [Tags]    P0    threshold    smoke
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #创建一个中国的物流信息
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    ...    shipping_plan=[{"name":"frg","shipping_method":"price","range_min":"0.00","range_max":-1,"rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    #激活COD货到付款方式
    kwpayment.activate_payment_cod_py
    #.激活stripe 信用卡支付方式
    kwpayment.activate_payment_credit_card_py
    #添加是shipping address
    Sleep    5
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait And Click Element    ${locatorC_checkout_payment_creditCard}
    #.信用卡信息填写
    Add Credit Card Info
    Wait And Click Element      ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Text   Payment failure!
    #关闭credit_card  信用卡支付方式
    kwpayment.inactivate_payment_credit_card_py

checkout168
    [Documentation]   验证checkout支付页面，billing address栏选择框可点击以及选择项展示  >   1.点击选择框
    [Tags]    P0    threshold    smoke
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #.创建运费方案0  中国方案  运费价格10
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    ...    shipping_plan=[{"name":"frg","shipping_method":"price","range_min":"0.00","range_max":-1,"rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    #添加是shipping address
    Sleep    2
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国   运费价格10
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait And Click Element    ${locatorC_checkout_payment_cashOnDelivery}
    #点击billing address栏选择框
    Wait And Click Element    ${locatorC_checkout_select_billingAddress}
    Wait And Select From List By index     ${locatorC_checkout_select_billingAddress}    1

checkout169
    [Documentation]  验证checkout支付页面，选择new billing address之后，选择框下方会出现信息填写栏  >  1.点击选择框   2.选择new billing address
    [Tags]    P0    threshold
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #.创建运费方案0  中国方案  运费价格10
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    ...    shipping_plan=[{"name":"frg","shipping_method":"price","range_min":"0.00","range_max":-1,"rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    #添加是shipping address
    Sleep    2
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国   运费价格10
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait And Click Element    ${locatorC_checkout_payment_cashOnDelivery}
    #点击billing address栏选择框
    Wait And Click Element    ${locatorC_checkout_select_billingAddress}
    Wait Until Page Contains Locator     ${locatorC_checkout_select_billingAddress}    1

checkout194
    [Documentation]   验证payment successful页面，物流方案显示正常  >  1.购买商品进入checkout shipping页面  2.国家选择中国，物流方案选择：方案1 3.完成订单进入payment successful页面  4.查看物流方案
    [Tags]    P0    threshold    smoke
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #.创建运费方案0  中国方案  运费价格10
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    ...    shipping_plan=[{"name":"方案1","shipping_method":"price","range_min":"0.00","range_max":-1,"rate_amount":"10.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]
    kwshipping.add_shipping_with_conf_py    ${conf}
    #添加是shipping address
    Sleep    2
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国   运费价格10
    #添加是shipping address
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Text   方案1
