*** Settings ***
Documentation     checkout 公共方法
Resource          kw_common.robot

*** keywords ***
Checkout Suite Setup
    [Documentation]    布置开始执行用例环境
    Login With Default User
    #初始化物流环境
    kwshipping.del_all_shipping_py
    kwproduct.add_launched_product_py
    kwcheckout.set_checkout_process_py
    #.开启pc优化
    kwcheckout.start_pc_show_py    1
    #激活COD货到付款方式
    kwpayment.activate_payment_cod_py

Checkout Suite Teardown
    [Documentation]    每个用例执行结束步骤
    Close Test Suite Browser
    #还原初始化环境
    kwshipping.del_all_shipping_py
    kwshipping.add_shipping_with_conf_py

Checkout Case Setup
    [Documentation]    每个用例执行开始步骤
    kwshipping.add_shipping_with_conf_py
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Select Window    New

Add Address Common Step
    [Documentation]    添加地址公共部分
    Wait And Input Text    ${locatorB_checkout_address_first_name}    123
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    Wait And Input Text    ${locatorB_checkout_address_city}    深圳
    Wait And Input Text    ${locatorB_checkout_address_add}    深圳123
    Wait And Input Text    ${locatorB_checkout_address_zip}    123456
    Wait And Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Wait And Input Text    ${locatorB_checkout_address_phone}    123456789
    Wait And Input Text    ${locatorB_checkout_address_company}    123456789

Add Credit Card Info
	[Documentation]    添加信用卡公共部分
	Wait And Input Text    ${locatorB_checkout_creditCard_input_name}    aaaaa
	Wait And Input Text    ${locatorB_checkout_creditCard_input_email}    123456@zz.xx
	Wait And Input Text    ${locatorB_checkout_creditCard_input_phone}    123456789
	Wait And Input Text    ${locatorB_checkout_creditCard_input_post}    0000
	Wait And Input Text    ${locatorB_checkout_creditCard_input_number}    43231123123123
	Wait And Input Text    ${locatorB_checkout_creditCard_input_expireDate}    1231
	Wait And Input Text    ${locatorB_checkout_creditCard_input_securityCode}    123



