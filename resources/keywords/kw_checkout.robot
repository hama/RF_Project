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
    kwshipping.create_only_one_shipping_py
    kwcheckout.set_checkout_process_with_conf_py
    #添加一个商品价格为$444,名称：autotest_title
    public_method.create    product    {"title": "autotest_title","variants": [{"price": "444"}]}
    #激活COD货到付款方式
    kwpayment.activate_payment_cod_py
    kwcheckout.set_single_page_checkout_process_py

Checkout Suite Teardown
    [Documentation]    每个用例执行结束步骤
    #还原初始化环境
    kwshipping.del_all_shipping_py
    kwproduct.del_all_products_py
    Close Test Suite Browser

Checkout Case Setup
    [Documentation]    每个用例执行开始步骤
    kwcheckout.set_single_page_checkout_process_py
    Sleep    5
    Go To First Product C Interface

Checkout2 Case Setup
    [Documentation]    每个用例执行开始步骤
    kwcheckout.set_single_page_checkout_process_py
    kwshipping.del_all_shipping_py
    Sleep    5
    Go To First Product C Interface

Checkout3 Case Setup
    [Documentation]    每个用例执行开始步骤
    kwcheckout.set_single_page_checkout_process_py
    kwproduct.del_all_products_py
    kwshipping.del_all_shipping_py

Checkout2 Child Case Setup
    kwcheckout.set_single_page_checkout_process_py
    kwshipping.del_all_shipping_py
#    kwproduct.add_max_product_py

Add Address Common Step
    [Documentation]    添加地址公共部分
    Sleep    2
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_firstName}    firstName
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_lastName}    lastName
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_addr}    addr
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_city}    city
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    China
    Sleep    1
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_province}    Beijing
    Sleep    1
    ${statuscode}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_select_code}
    Run Keyword If    '${statuscode}'=='True'    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_code}     (+86) China
    Sleep    1
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_postalCode}    123456
    ${statusPhone}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_phone}
    Run Keyword If    '${statusPhone}'=='True'    Wait And Input Text    ${locatorC_checkoutShipping_address_input_phone}    18899999999
    ${statusemail}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_email}
    Run Keyword If    '${statusemail}'=='True'    Wait And Input Text    ${locatorC_checkoutShipping_address_input_email}    7654321@autotest.com
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Run Keyword If    '${status}'=='False'    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    1234567@autotest.com
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_company}    company
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_apartment}    apartment
    Sleep    2

Add Address SepCommon Step
    [Documentation]    添加地址公共部分
    Sleep    2
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_firstName}    Javen
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_lastName}    fang
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_addr}    南山区
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_city}    深圳
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_country}    China
    Sleep    1
    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_province}    Guangdong
    Sleep    1
    ${statuscode}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_select_code}
    Run Keyword If    '${statuscode}'=='True'    Wait And Select From List By Label    ${locatorC_checkoutShipping_address_select_code}     (+86) China
    Sleep    1
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_postalCode}    518000
    ${statusPhone}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_phone}
    Run Keyword If    '${statusPhone}'=='True'    Wait And Input Text    ${locatorC_checkoutShipping_address_input_phone}    18688886666
    ${statusemail}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_address_input_email}
    Run Keyword If    '${statusemail}'=='True'    Wait And Input Text    ${locatorC_checkoutShipping_address_input_email}    dianjiang@autotest.com
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_checkoutShipping_label_SamecontactEamil}
    Run Keyword If    '${status}'=='False'    Wait And Input Text    ${locatorC_checkoutShipping_input_contactEmail}    dianjiang@autotest.com
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_company}    shoplazza
    Wait And Input Text    ${locatorC_checkoutShipping_address_input_apartment}    中山大学产学研基地
    Sleep    2

Add New Billing Address Step
    Sleep    2
    Wait And Input Text    ${locatorC_checkoutPayment_input_firstName}    javen
    Wait And Input Text    ${locatorC_checkoutPayment_input_lastName}    fang
    Wait And Input Text    ${locatorC_checkoutPayment_input_address}    南山区
    Wait And Input Text    ${locatorC_checkoutPayment_input_address1}    中山大学产学研基地
    Wait And Input Text    ${locatorC_checkoutPayment_input_city}    深圳
    Wait And Select From List By Label    ${locatorC_checkoutPayment_input_countyCode}    China
    Sleep    1
    Wait And Select From List By Label    ${locatorC_checkoutPayment_input_provinceCode}    Guangdong
    Sleep    1
    Wait And Input Text    ${locatorC_checkoutPayment_input_zip}    518000

Add Singel New Billing Address Step
    Sleep    2
    Wait And Input Text    ${locatorC_checkoutPayment_input_firstName}[1]    javen
    Wait And Input Text    ${locatorC_checkoutPayment_input_lastName}[1]    fang
    Wait And Input Text    ${locatorC_checkoutPayment_input_address}[1]    南山区
    Wait And Input Text    ${locatorC_checkoutPayment_input_address1}[1]    中山大学产学研基地
    Wait And Input Text    ${locatorC_checkoutPayment_input_city}[1]    深圳
    Wait And Select From List By Label    ${locatorC_checkoutPayment_input_countyCode}    China
    Sleep    2
    Wait And Select From List By Label    ${locatorC_checkoutPayment_input_provinceCode}    Guangdong
    Sleep    2
    Wait And Input Text    ${locatorC_checkoutPayment_input_zip}[1]    518000

Add Credit Card Info
	[Documentation]    添加信用卡公共部分
	Sleep    2
	Wait And Input Text    ${locatorC_checkout_paymentCard_fristName}    aaaaa
	Wait And Input Text    ${locatorC_checkout_paymentCard_cardEmail}    123456@autotest.com
	Wait And Input Text    ${locatorC_checkout_paymentCard_phone}     123456789
	Wait And Input Text    ${locatorC_checkout_paymentCard_cardPostcode}    0000
	Wait And Input Text    ${locatorC_checkout_paymentCard_cardNumber}    43231123123123
	Wait And Input Text    ${locatorC_checkout_paymentCard_cardDate}    1231
	Wait And Input Text    ${locatorC_checkout_paymentCard_card_code}     123
	Sleep    2

Create Specific Coupon Code
	[Documentation]    添加一个 优惠规则为满50减10USD 优惠码
	Sleep    2
	${code}    get_coupon_code_random_code_py
	&{dict}=    Create Dictionary    value=10    greater_than_or_equal_to=50
	@{list}=    Create List    ${dict}
    &{conf} =    Create Dictionary    code=${code}    value_type=fixed_amount    prerequisite_quantity_range=${None}
    ...    prerequisite_subtotal_range=${list}
    add_doing_coupon_code_py    ${conf}
    [Return]    ${code}

