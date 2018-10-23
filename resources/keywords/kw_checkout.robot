*** Settings ***
Documentation     checkout 公共方法
Resource          kw_common.robot

*** keywords ***
Checkout Suite Setup
    [Documentation]    布置开始执行用例环境
    Login With Default User
    #初始化物流环境
    kwshipping.del_all_shipping_py
    kwproduct.del_all_products_py
    kwshipping.add_shipping_with_conf_py
    kwproduct.add_launched_product_py
    kwcheckout.set_checkout_process_py
    #.开启pc优化
    kwcheckout.start_pc_show_py    1
    #激活COD货到付款方式
    kwpayment.activate_payment_cod_py

Checkout Suite Teardown
    [Documentation]    每个用例执行结束步骤
    #还原初始化环境
    kwshipping.del_all_shipping_py
    kwshipping.add_shipping_with_conf_py
    kwproduct.del_all_products_py
    Close Test Suite Browser

Checkout Case Setup
    [Documentation]    每个用例执行开始步骤
    Go To First Product C Interface


Add Address Common Step
    [Documentation]    添加地址公共部分
    Wait And Input Text    ${locatorB_checkout_address_first_name}    123
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Wait And Input Text    ${locatorB_checkout_address_add}    深圳123
    Wait And Input Text    ${locatorB_checkout_address_city}    深圳
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Wait And Select From List By Label    ${locatorB_checkout_address_select_province}    Beijing
    Wait And Input Text    ${locatorB_checkout_address_zip}    123456
    Wait And Select From List By Label    ${locatorC_checkout_address_Code}     (+86) China
    Wait And Input Text    ${locatorB_checkout_address_phone}    15820406699
    Wait And Input Text    ${locatorB_checkout_address_email1}   19988565@qq.com
    Wait And Input Text    ${locatorB_checkout_address_email}    9988565@qq.com
    Sleep    4

Add Credit Card Info
	[Documentation]    添加信用卡公共部分
	Wait And Input Text    ${locatorC_checkout_paymentCard_fristName}    aaaaa
	Wait And Input Text    ${locatorC_checkout_paymentCard_cardEmail}    123456@zz.xx
	Wait And Input Text    ${locatorC_checkout_paymentCard_phone}     123456789
	Wait And Input Text    ${locatorC_checkout_paymentCard_cardPostcode}    0000
	Wait And Input Text    ${locatorC_checkout_paymentCard_cardNumber}    43231123123123
	Wait And Input Text    ${locatorC_checkout_paymentCard_cardDate}    1231
	Wait And Input Text    ${locatorC_checkout_paymentCard_card_code}     123
	Sleep    2

Create Specific Coupon Code
	[Documentation]    添加信用卡公共部分
	${code}    get_coupon_code_random_code_py
    &{conf} =    Create Dictionary
    ...    code=${code}
    ...    discount_type=1
    ...    range_type=2
    ...    range_value=50
    ...    code_value=10
    add_doing_coupon_code_py    ${conf}
    [Return]    ${code}

Go To First Product C Interface
	Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Select Window    New