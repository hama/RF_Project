*** Settings ***
Documentation     Ckeckout
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown    # close the browser opened for this test suite
Test Setup        Checkout Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
checkout001
    [Documentation]    C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
    [Tags]    P0    threshold    smoke
    Wait Until Element Is Visible    ${locatorB_checkout_shippingcart_cartBut}
    Page Should Contain Image    dom:document.querySelectorAll("img")[0]
    Page Should Contain Element    dom:document.querySelectorAll("[class*='productdetails-info-title']")[0]

checkout002
    [Documentation]    进入checkout界面 显示购买的商品，地址，
    [Tags]    P0    threshold    smoke
    #点击商品预览
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".addressForm")[0]

checkout006
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品标题显示正常
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Text Of Element Should Be Equal With Wait   dom:document.querySelectorAll('[class*="item-sku-title"]')[0]   autotest_title

checkout_008
    [Documentation]    验证checkout shipping页面，订单汇总商品栏，商品数量显示正常 > "1.C端够买商品women5件进入checkout shipping页面,2.查看订单汇总商品栏，商品数量显示" > 商品数量显示为：X5
    [Tags]    P0    threshold    smoke
    #.输入数量
    Wait And Input Text    dom:document.querySelectorAll(".qty-num")[0]    5
    #,点击立即购买
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Text Of Element Should Be Equal With Wait    dom:document.querySelectorAll("[class*='tem-quantity']")[0]    X5

checkout_009
    [Documentation]    验证checkout shipping页面，订单汇总商品栏，商品价格显示正常 >"1.C端购买商品women进入checkout shipping页面,2.查看订单汇总商品栏，商品价格显示" > 商品价格显示为：444USD
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator        ${locatorC_checkout_shipping_total}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_shipping_total}   $444.00

checkout_014
    [Documentation]    验证checkout shipping页面，subtotal显示正常 > "1.C端购买商品women两件进入checkout shipping页面,2.查看价格详情中subtotal" > subtotal为：$444.00
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Text Of Element Should Be Equal With Wait    dom:document.querySelectorAll("[class='checkout-prices-value']")[0]    $444.00

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


checkout_021
    [Documentation]    验证checkout shipping页面，使用优惠码后，价格详情中会出现discount code并显示优惠价格 > "1.C端购买商品women进入checkout shipping页面，2.使用优惠码AAA001，3.查看价格详情" > 价格详情显示优惠金额
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #.输入优惠码
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    OAA36EC2
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    Wait Until Page Contains    Discount code

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



checkout_025
    [Documentation]    验证checkout shipping页面，优惠码输入框中可输入内容 > "1.点击优惠码输入框,2.输入内容：AAA003" > 优惠码输入框中显示输入的内容：AAA003
    [Tags]    P1
    ${num}    Set Variable    AAA003
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #.在优惠码输入框中输入AAA003
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ${num}
    ${res}    Get Value    ${locatorB_checkout_addressCoupon_ipt}
    Should Be True    '${res}'=='${num}'

checkout_026
    [Documentation]    验证checkout shipping页面，优惠码输入框后apply按钮可点击>"1.C端购买任意商品进入checkout shipping页面,2.优惠码输入框中输入优惠码AAA006,3.点击apply按钮" > 点击后优惠码使用成功，价格详情中显示discount code： - $10.00
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    OAA36EC2
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    #.获取优惠那一栏的值
    Text Of Element Should Be Equal With Wait   dom:document.querySelectorAll(".checkout-prices-value")[1]    - $10.00

checkout_027
    [Documentation]    验证checkout shipping页面输入错误的优惠码时，点击apply，会给出对应提示 > 2.优惠码输入框中输入任意内容：..0001,3.点击apply > 优惠码输入框下方出现错误提示
    [Tags]    P1
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ..0001
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    Wait Until Page Contains    This discount does not exist.

checkout028
    [Documentation]     验证checkout shipping页面，优惠码输入框中的取消使用优惠码按钮可清空输入框  >  1.输入框中输入本次购买商品可用的优惠码并且点击apply按钮使用   2.点击优惠码输入框中的取消使用按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Input Text     ${locatorC_checkout_input_discountCode}     OAA36EC2
    Wait And Click Element   ${locatorC_checkout_submit_apply}
    #取消优惠码输入框的优惠码
    Wait And Click Element   ${locatorC_checkout_submit_couponClose}
    Wait Until Page Not Contains Text      Wait Until Page Not Contains Text

checkout_034
    [Documentation]    验证checkout shipping页面，shipping address栏，国家选择框可点击以及国家选择展示 > 1.点击shipping address栏国家选择框 >点击后国家选择框下拉展开，显示所有可选择的国家
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_address_select_country}

checkout_035
    [Documentation]    验证checkout shipping页面，shipping address栏，省份选择框可点击以及省份选择展示  > "1.点击国家选择框选择中国,2.点击省份选择框" > 点击后城市选择框下拉展开，显示中国的所有省份
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Wait And Click Element    ${locatorB_checkout_address_select_province}

checkout_037
    [Documentation]    验证checkout shipping页面，shipping address栏输入正确的信息，可以提交成功 > 输入地址 > 提交成功，页面跳转到支付页面
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Contains    PAYMENT

checkout_070
    [Documentation]    验证checkout shipping页面，订阅优惠活动选项可取消勾选  >  1.点击订阅优惠活动选项前小正方形图标
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorC_checkout_address_offersAndDiscounts}


checkout_072
    [Documentation]    验证checkout shipping页面，订阅优惠活动选项可取消勾选  >  1.点击订阅优惠活动选项前小正方形图标
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorC_checkout_address_saveInformation}


checkout_073
    [Documentation]    验证checkout shipping页面，点击买家留言栏，可展开买家留言输入框 > 1.点击special instruction栏 > 点击后展开买家留言输入框
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains    Shipping & Delivery

checkout_077
    [Documentation]    验证checkout shipping页面，买家留言输入框输入的内容，会同步到B端订单详情 > "1.C端发起新订单AAA00111进入checkout shipping页面,2.买家留言输入框中输入内容：请尽快发货,3.完成订单进入B端订单AAA00111详情,4.查看订单详情页面买家留言" > 买家留言内容显示为：请尽快发货
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    #.点击展开留言框
    Wait And Click Element    dom:document.querySelectorAll('[class*="u-lineTitle"]')[0]
    Wait And Input Text    dom:document.querySelectorAll('[name*="customer_note"]')[0]    请尽快发货
    #.点击提交
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Contains Text   Order summary

checkout_078
    [Documentation]    验证checkout shipping页面，未选择国家时，shipping delivery栏不显示运费方案  >  1.购买任意商品进入checkout shipping页面  2.不选择国家查看shipping delivery栏
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Does Not Contain    Please enter a shipping address first

checkout_079
    [Documentation]    验证checkout shipping页面，选择国家后，shipping delivery栏会出现此国家对应的运费方案  >  1.C端购买商品women进入checkout shipping页面  2.选择国家中国  3.查看shipping delivery栏
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait Until Page Contains Locator    ${locatorC_checkout_delivery_shippingLine}

checkout_082
    [Documentation]    验证checkout shipping页面，没有可选择物流方案时，payment method 按钮无法点击 > payment method按钮置灰无法点击
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Does Not Contain    SHIPPING

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


checkout_085
    [Documentation]    验证B端运费方案设置重量范围时，C端购买的商品重量满足此重量范围，checkout shipping页面将展示此运费方案 > 运费方案中显示 重量方案1
    [Tags]    P0    threshold    smoke
    #.先删除物流
    kwshipping.del_all_shipping_py
    #.添加一个重量运费的物流
    kwshipping.add_shipping_py    0    1
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    #.选择中国
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Text Of Element Should Be Equal With Wait   dom:document.querySelectorAll(".fl")[4]    Freight Standard shipping

checkout_087
    [Documentation]    验证B端运费方案设置数量范围时，C端购买的商品数量满足此数量范围，checkout shipping页面将展示此运费方案 > "1.C端购买5件商品进入checkout shipping页面,2.选择国家：中国,3.查看shipping delivery栏运费方案" >运费方案中显示 数量方案1
    [Tags]    P0    threshold    smoke
    #.先删除物流
    kwshipping.del_all_shipping_py
    #.添加一个重量运费的物流
    kwshipping.add_shipping_py    0    2
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    #.选择中国
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Text Of Element Should Be Equal With Wait   dom:document.querySelectorAll(".fl")[4]    Quantity Standard shipping

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

checkout093
    [Documentation]    验证从商品详情页面buy now进入checkout shipping页面后，点击return可返回商品详情页面 > 1.C端进入任意一个商品详情页面 2.buy now进入checkout shipping页面 3.点击return
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Text   Order summary
    Wait And Click Element  ${locator_checkout_button_checkoutBack}
    Wait Until Page Contains Locator    ${locatorB_checkout_by_now_btn}

checkout094
    [Documentation]    验证从购物车进入checkout shipping页面后，点击return可返回购物车 > 1.C端将任意商品加入购物车 2.进入购物车点击checkout按钮进入checkout shipping页面 3.点击return
    [Tags]    P0    threshold    smoke
    Wait And Click Element  ${locatorB_checkout_product_addToCart}
    Wait And Click Element  ${locatorB_checkout_shippingcart_cartBut}
    Wait And Click Element  ${locatorB_checkout_submit_shippingCart}
    Wait Until Page Contains Text    Order summary
    #.返回
    Wait And Click Element  ${locatorC_checkout_paymentCard_return}
    Wait Until Page Contains Text    Shopping Cart

checkout096
    [Documentation]    验证checkout shipping页面，点击payment method按钮可进入支付页面 > 1.shipping address中输入合法内容  2.点击payment method按钮
    [Tags]    P0    threshold    smoke
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Contains Text   Order summary

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

checkout098
    [Documentation]    验证checkout 支付页面，订单汇总，商品栏，商品标题显示正常 > 1.C端购买商品women进入checkout支付页面  2.查看订单汇总，商品栏，商品标题
    [Tags]    P0    threshold    smoke
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Text   autotest_title

checkout100
    [Documentation]   验证checkout 支付页面，订单汇总商品栏，商品数量显示正常 > 1.C端够买商品women5件进入checkout 支付页 2.查看订单汇总商品栏，商品数量显示
    [Tags]    P0    threshold    smoke
    Wait And Input Text  ${locatorC_checkout_input_checkNum}     5
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_prices_itemQuantity}   X5

checkout101
    [Documentation]   验证checkout 支付页面，订单汇总商品栏，商品价格显示正常 > 1.C端购买商品women进入checkout 支付页面  2.查看订单汇总商品栏，商品价格显示
    [Tags]    P0    threshold    smoke
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_prices_itemPrice}   $444.00

checkout106
    [Documentation]   验证checkout 支付页面，subtotal显示正常 > 1.C端购买商品women两件进入checkout 支付页面  2.查看价格详情中subtotal
    [Tags]    P0    threshold    smoke
    Wait And Input Text  ${locatorC_checkout_input_checkNum}     2
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_prices_total}     $888.00


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

checkout109
    [Documentation]   验证checkout 支付页面，订单详情中tax显示正常  > 1.C端购买商品women 1件进入checkout shipping页面  2.信息填写栏选择国家中国 3.进入支付页面查看价格详情中tax
    [Tags]    P0    threshold    smoke
    #初始化物流信息
    kwshipping.del_all_shipping_py
    kwshipping.add_shipping_with_conf_py
    #创建60的税费
    kwtax.add_default_tax_price_py
    #添加是shipping address
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    #.选择中国
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    #查看商品扣除60%税费后的金额
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_shipping_total}    $710.40


checkout111
    [Documentation]   验证checkout 支付页面，订单使用优惠码后，价格详情中会显示discount code并显示优惠价格 > 1.C端购买商品women进入checkout shipping页面  2.使用优惠码AAA001  3.进入支付页面查看价格详情
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Input Text     ${locatorC_checkout_input_discountCode}     OAA36EC2
    Wait And Click Element   ${locatorC_checkout_submit_apply}
    Text Of Element Should Be Equal With Wait   dom:document.querySelectorAll(".checkout-prices-value")[1]     - $10.00


checkout112
    [Documentation]   验证checkout 支付页面，订单使用优惠码后，价格详情中会显示discount code并显示优惠价格 > 1.C端购买商品women进入checkout shipping页面  2.使用优惠码AAA001  3.进入支付页面查看价格详情
    [Tags]    P0    threshold    smoke
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Input Text     ${locatorC_checkout_input_discountCode}     FMOH3K23
    Wait And Click Element   ${locatorC_checkout_submit_apply}
    Text Of Element Should Be Equal With Wait       ${locatorC_checkout_prices_shippingValue}     - $20.00

checkout113
    [Documentation]   验证checkout 支付页面，订单使用优惠码后，价格详情中会显示discount code并显示优惠价格 > 1.C端购买商品women进入checkout shipping页面  2.使用优惠码AAA001  3.进入支付页面查看价格详情
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Input Text     ${locatorC_checkout_input_discountCode}     OAA36EC2
    Wait And Click Element   ${locatorC_checkout_submit_apply}
    Add Address Common Step
    Sleep    2
    Text Of Element Should Be Equal With Wait   ${locatorC_checkout_prices_shippingValue}   - $10.00
    Text Of Element Should Be Equal With Wait   ${locatorC_checkout_shipping_total}     $434.00


checkout114
    [Documentation]   验证checkout 支付页面，payment栏，ship to信息显示正常  >  1.购买商品进入checkout shipping页面2.填写信息：first name：Javenlast name：fangaddress：南山区apartment：中山大学产学研基地city：深圳country：Chinaprovince：广东postal code：518000email：dianjiang@shoplazza.comphone：18688886666company：shoplazza3.进入支付页面查看ship to信息
    [Tags]    P0    threshold    smoke
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element      ${locatorC_checkout_shipping_submitCheckout}
    ${firstName}    Get Value   ${locatorB_checkout_address_first_name}
    Wait And Click Element     ${locatorB_checkout_submit_btn_s}
    Wait Until Page Contains Text    ${firstName}


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


checkout120
    [Documentation]         验证checkout支付页面，payment栏，change按钮可返回到shipping页面  >  1.点击payment栏的change按钮
    [Tags]    P0    threshold
    #激活COD货到付款方式
    kwpayment.activate_payment_cod_py
    #初始化物流信息
    kwshipping.del_all_shipping_py
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"44","zone_ids":"-1"}]
    ...    shipping_name=shipping_yunfei
    kwshipping.add_shipping_with_conf_py    ${conf}
    #添加是shipping address
    Sleep    2
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国   运费价格10
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Locator    ${locatorC_checkout_payment_cashOnDelivery}
    Wait And Click Element    ${locatorC_checkout_payment_cashOnDelivery}
    Wait And Click Element    ${locatorC_checkout_paymentCard_change}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}

checkout121
    [Documentation]         验证checkout支付页面，return按钮可返回到shipping页面  >  1.点击return按钮
    [Tags]    P0    threshold
    #激活COD货到付款方式
    kwpayment.activate_payment_cod_py
    #添加是shipping address
    Sleep    2
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国   运费价格10
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Locator    ${locatorC_checkout_payment_cashOnDelivery}
    Wait And Click Element    ${locatorC_checkout_payment_cashOnDelivery}
    Wait And Click Element    ${locatorC_checkout_paymentCard_return}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_first_name}

checkout125
    [Documentation]         验证B端收款渠道中没有开启任何支付方式时，checkout 支付页面payment method栏不显示支付方式，并显示提示文案  >  1.B端收款渠道中关闭所有支付方式  2.C端购买商品进入checkout 支付页面 3.查看payment method栏
    [Tags]    P0    threshold
    #关闭cod支付方式
    kwpayment.inactivate_payment_cod_py
    #关闭credit_card  信用卡支付方式
    kwpayment.inactivate_payment_credit_card_py
    #添加是shipping address
    Sleep    2
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国   运费价格10
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Text    Payment method
    #重新开启cod支付方式
    kwpayment.activate_payment_cod_py

checkout126
    [Documentation]   验证checkout 支付页面，使用COD支付方式可正常支付  >  1.购买商品进入checkout 支付页面  2.选择支付方式COD  3.点击place order按钮
    [Tags]    P0    threshold    smoke
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait And Click Element    ${locatorC_checkout_payment_cashOnDelivery}
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Text   Payment successful!


checkout132
    [Documentation]   验证checkout支付页面，使用ipaylinks支付，填写错误的信用卡号时，页面会跳转到支付失败页面 >  1.stripe支付信息中填写信息： 卡号：4111119987834534 有效日期：11/23  安全码：123 邮编：518000 2.点击place order按钮
    [Tags]    P0    threshold    smoke
    #激活COD货到付款方式
    kwpayment.activate_payment_cod_py
    #. 信用卡支付方式
    kwpayment.activate_payment_credit_card_py
    #添加是shipping address
    Sleep    2
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

    #关闭信用卡
    #关闭credit_card  信用卡支付方式
    kwpayment.inactivate_payment_credit_card_py


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


checkout170
    [Documentation]   验证checkout支付页面，billing address栏选择框可点击以及选择项展示  >   1.点击选择框
    [Tags]    P0    threshold    smoke
    #添加是shipping address
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国   运费价格10
    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait And Click Element    ${locatorC_checkout_payment_cashOnDelivery}
    #点击billing address栏选择框
    Wait And Click Element    ${locatorC_checkout_select_billingAddress}
    Wait And Select From List By Index     ${locatorC_checkout_select_billingAddress}    1
    #添加Billing address
    Wait And Input Text     ${locatorC_checkout_inputText_firstName}    aven
    Wait And Input Text     ${locatorC_checkout_inputText_lastName}     fang
    Wait And Input Text     ${locatorC_checkout_inputText_address}    南山区
    Wait And Input Text     ${locatorC_checkout_inputText_address1}    中山大学产学研基地
    Wait And Input Text     ${locatorC_checkout_inputText_city}    深圳
    Wait And Select From List By Label     ${locatorC_checkout_inputText_countyCode}    China
    Wait And Select From List By Label     ${locatorC_checkout_inputText_provinceCode}    广东
    Wait And Input Text     ${locatorC_checkout_inputText_zip}    518000
    Wait And Click Element      ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Text      Payment successful!

checkout189
    [Documentation]   验证checkout支付页面，place order按钮正常  >  1.购买商品进入checkout支付页面  2.选择COD支付   3.点击place order按钮
    [Tags]    P0    threshold    smoke
    #添加是shipping address
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait And Click Element    ${locatorC_checkout_payment_cashOnDelivery}
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Text    Payment successful!

checkout193
    [Documentation]   验证payment successful页面，shipping information显示正常  >  1.购买商品进入checkout shipping页面 2.填写信息：first name：Javen last name：fang address：南山区 apartment：中山大学产学研基地 city：深圳 country：China province：广东 postal code：518000 email：dianjiang@shoplazza.com phone：18688886666 company：shoplazza 3.完成订单进入payment successful 页面查看shipping information
    [Tags]    P0    threshold
    #添加是shipping address
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国
    #添加是shipping address
    Wait And Input Text    ${locatorB_checkout_address_first_name}    Javen
    Wait And Input Text    ${locatorB_checkout_address_last_name}    fang
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}     China
    Wait And Select From List By Label    ${locatorB_checkout_address_select_province}     广东
    Wait And Input Text    ${locatorB_checkout_address_city}    深圳
    Wait And Input Text    ${locatorB_checkout_address_add}    南山区
    Wait And Input Text    ${locatorB_checkout_address_zip}    518000
    Wait And Input Text    ${locatorB_checkout_address_email}    1dianjiang@shoplazza.com
    Wait And Input Text    ${locatorB_checkout_address_phone}    18688886666
    Wait And Input Text    ${locatorB_checkout_address_company}    shoplazza
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Text    深圳


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

checkout195
    [Documentation]   验证payment successful页面，view order按钮可跳转到个人中心订单详情页面  >  1.购买商品进入checkout并完成支付进入payment successful页面  2.点击view order按钮
    [Tags]    P0    threshold    smoke
    #添加是shipping address
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国
    #添加是shipping address
    Add Address Common Step
    Sleep    2
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait And Click Element    ${locatorC_checkout_payment_cashOnDelivery}
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Text      Payment successful!
    Wait And Click Element    ${locatorC_checkout_link_viewOrders}
    Wait Until Page Contains Locator    ${locatorC_checkout_link_orderList}

checkout196
    [Documentation]   验证payment successful页面，continue shopping按钮可跳转到店铺首页  >  1.购买商品进入checkout并完成支付进入payment successful页面  2.点击continue shopping按钮
    [Tags]    P0    threshold    smoke
    #添加是shipping address
    Wait And Click Element  ${locatorB_checkout_by_now_btn}
    #.选择中国
    #添加是shipping address
    Add Address Common Step
    Sleep    2
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait And Click Element    ${locatorC_checkout_payment_cashOnDelivery}
    Wait And Click Element    ${locatorC_checkout_shipping_submitCheckout}
    Wait Until Page Contains Text      Payment successful!
    Wait And Click Element    ${locatorC_checkout_link_continueShopping}
    Wait Until Page Contains Locator    ${locatorC_checkout_homeBanner}





   