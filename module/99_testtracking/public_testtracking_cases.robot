*** Settings ***
Resource          ../../resources/keywords/kw_common.robot

*** Variables ***
#${domain}    trackingtest
#${c_url}    https://${domain}.myshoplaza.com
#${referrer_host}    ${domain}.myshoplaza.com
${domain}    xietinghui
${c_url}    https://${domain}.preview.shoplazza.com
${referrer_host}    ${domain}.preview.shoplazza.com
${b_url}    https://${domain}.preview.shoplazza.com/admin

*** Keywords ***
tracking001
    [Documentation]    google、神策、facebook的pageview事件上报
    Sleep    5
    ${all_messages}    get_all_messages
	&{ga_pageview_data}=    Create Dictionary    t=pageview
	&{properties}=    Create Dictionary    $is_first_time=${False}    $title=${domain}    $url=${c_url}
	...    $url_path=/    $referrer_host=${referrer_host}    $referrer=${c_url}
	&{data}=    Create Dictionary    event=$pageview    properties=${properties}
	&{sc_pageview_data}=    Create Dictionary    data=${data}
	&{fb_pageview_data}=    Create Dictionary    ev=PageView
    assert_equal_values_process    ${all_messages}    www.google-analytics.com    ${ga_pageview_data}
    assert_equal_values_process    ${all_messages}    shence.shoplazza    ${sc_pageview_data}
    assert_equal_values_process    ${all_messages}    www.facebook.com    ${fb_pageview_data}

tracking002
    [Documentation]    google、神策、facebook的addtocart事件上报
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
    Sleep    5
	#    获得总数据
    ${all_messages}    get_all_messages
	#    构造真实对比数据
    @{target_messages}    get_messages_filtering_by_url    ${all_messages}    myshoplaza.com/cart/add
	@{request_ids}    get_request_ids_from_messages    ${target_messages}
    &{request_post_data}    network_get_request_post_data    @{request_ids}[0]
    &{response_body_data}    network_get_response_body    @{request_ids}[0]
    ${product_id} =    Set Variable    ${request_post_data.product_id}
    ${variant_id} =    Set Variable    ${request_post_data.variant_id}
    ${product_title} =    lib_utils.get_value_from_dict    ${response_body_data}    data.line_items.${variant_id}.product_title
    ${price} =    lib_utils.get_value_from_dict    ${response_body_data}    data.line_items.${variant_id}.price
    ${quantity} =    Convert To Integer    ${request_post_data.quantity}
    ${entrance} =    Set Variable    product
    ${currency} =    Set Variable    USD
    ${content_type} =    Set Variable    product
    @{product_ids} =    Create List    ${product_id}
    ${content_ids} =    Set Variable    ${product_ids}
    ${content_ids_str} =    lib_utils.convert_json_to_string    ${content_ids}
    &{contents_dict} =    Create Dictionary    id=${product_id}    number=${quantity}    childrenId=${variant_id}
    ...    item_price=${price}    name=${product_title}
    @{contents_list} =    Create List    ${contents_dict}
    ${contents_str} =    lib_utils.convert_json_to_string    ${contents_list}
    ${contents} =    Set Variable    ${contents_str}
	&{ga_addtocard_data}=    Create Dictionary    t=event    ea=add_to_cart    pr1id=${product_id}    dt=${product_title}
    &{properties}=    Create Dictionary    product_id=${product_id}    product_title=${product_title}    price=${price}
    ...    quantity=${quantity}    entrance=${entrance}
	&{data}=    Create Dictionary    event=add_to_cart    properties=${properties}
	&{sc_addtocard_data}=    Create Dictionary    data=${data}
	&{fb_addtocard_data}=    Create Dictionary    ev=AddToCart    cd[value]=444    cd[currency]=${currency}
	...    cd[content_type]=${content_type}    cd[content_ids]=${content_ids_str}    cd[contents]=${contents}
	# 断言
    assert_equal_values_process    ${all_messages}    www.google-analytics.com    ${ga_addtocard_data}
    assert_equal_values_process    ${all_messages}    shence.shoplazza    ${sc_addtocard_data}
    assert_equal_values_process    ${all_messages}    facebook.com    ${fb_addtocard_data}

tracking003
    [Documentation]    facebook的"进入Cartcheckout次数"事件上报(购物车的结账)
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
    Sleep    5
	#    获得总数据
    ${all_messages_before}    get_all_messages
	#    构造真实对比数据
    @{target_messages}    get_messages_filtering_by_url    ${all_messages_before}    myshoplaza.com/cart/add
	@{request_ids}    get_request_ids_from_messages    ${target_messages}
    &{request_post_data}    network_get_request_post_data    @{request_ids}[0]
    &{response_body_data}    network_get_response_body    @{request_ids}[0]
    ${variant_id} =    Set Variable    ${request_post_data.variant_id}
    ${productPrice} =    lib_utils.get_value_from_dict    ${response_body_data}    data.line_items.${variant_id}.price
    ${price}=    Evaluate    u"${productPrice}".strip('.00')
    ${currency} =    Set Variable    USD
    ${content_category}=    Set Variable    detail_buynow
    ${product_id} =    Set Variable    ${request_post_data.product_id}
    ${quantity} =    Set Variable    ${request_post_data.quantity}
    &{list}=    Create Dictionary    id=${product_id}    number=${quantity}    item_price=${productPrice}
    @{contents}=    Create List    ${list}
	&{fb_Cartcheckout_data}=    Create Dictionary    ev=InitiateCheckout    cd[value]=${price}    cd[currency]=${currency}
	...    cd[content_name]=${Empty}    cd[content_category]=${content_category}    cd[content_ids]=[]    cd[contents]=${contents}   cd[num_items]=${quantity}
	@{fb_Cartcheckout_list}=    Create List    ${fb_Cartcheckout_data}
	#进入cart页面
	Sleep    3
	Sleep And Click Element    dom:document.querySelectorAll('[href="/cart"]')[1]
	Sleep And Click Element    dom:document.querySelectorAll('[data-track="checkout-submit"]')[0]
	Sleep    5
	#检查facebook的cartcheckout上报事件
	${all_messages_after}    get_all_messages
	assert_contain_keys_process    ${all_messages_after}    www.facebook.com    ${fb_Cartcheckout_list}

tracking004
    [Documentation]    facebook的"进入detail_buynow次数"事件上报(详情页面的立即购买)
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
    Sleep    5
	#    获得总数据
    ${all_messages_before}    get_all_messages
	#    构造真实对比数据
    @{target_messages}    get_messages_filtering_by_url    ${all_messages_before}    myshoplaza.com/cart/add
	@{request_ids}    get_request_ids_from_messages    ${target_messages}
    &{request_post_data}    network_get_request_post_data    @{request_ids}[0]
    &{response_body_data}    network_get_response_body    @{request_ids}[0]
    ${variant_id} =    Set Variable    ${request_post_data.variant_id}
    ${productPrice} =    lib_utils.get_value_from_dict    ${response_body_data}    data.line_items.${variant_id}.price
    ${price}=    Evaluate    u"${productPrice}".strip('.00')
    ${currency} =    Set Variable    USD
    ${content_category}=    Set Variable    Cart_checkout
    ${product_id} =    Set Variable    ${request_post_data.product_id}
    ${quantity} =    Set Variable    ${request_post_data.quantity}
    &{list}=    Create Dictionary    id=${product_id}    number=${quantity}    item_price=${productPrice}
    @{contents}=    Create List    ${list}
	&{fb_Cartcheckout_data}=    Create Dictionary    ev=InitiateCheckout    cd[value]=${price}    cd[currency]=${currency}
	...    cd[content_name]=${Empty}    cd[content_category]=${content_category}    cd[content_ids]=[]    cd[contents]=${contents}   cd[num_items]=${quantity}
	@{fb_Cartcheckout_list}=    Create List    ${fb_Cartcheckout_data}
	#进入buy now页面
	Sleep    3
	Sleep And Click Element    dom:document.querySelectorAll('[data-click="submit"]')[0]
	Sleep    5
	#检查facebook的cartcheckout上报事件
	${all_messages_after}    get_all_messages
	assert_contain_keys_process    ${all_messages_after}    www.facebook.com    ${fb_Cartcheckout_list}

tracking005
    [Documentation]    ga的cart页面"checkout"上报事件
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
    Sleep    5
    #获得总数据
    ${all_messages_before}    get_all_messages
    #构造真实对比数据
    @{target_messages}    get_messages_filtering_by_url    ${all_messages_before}    myshoplaza.com/cart/add
	@{request_ids}    get_request_ids_from_messages    ${target_messages}
    &{request_post_data}    network_get_request_post_data    @{request_ids}[0]
    &{response_body_data}    network_get_response_body    @{request_ids}[0]
    ${product_id} =    Set Variable    ${request_post_data.product_id}
    ${variant_id} =    Set Variable    ${request_post_data.variant_id}
    ${product_title} =    lib_utils.get_value_from_dict    ${response_body_data}    data.line_items.${variant_id}.product_title
    &{ga_Cartcheckout_data}=    Create Dictionary    ea=begin_checkout    pr1id=${product_id}    pr1nm=${product_title}
    @{ga_Cartcheckout_list}=    Create List    ${ga_Cartcheckout_data}
    Sleep    3
    Sleep And Click Element    dom:document.querySelectorAll('[href="/cart"]')[1]
	Sleep And Click Element    dom:document.querySelectorAll('[data-track="checkout-submit"]')[0]
	#获得总数据
    ${all_messages_after}    get_all_messages
    #检查
    assert_equal_values_process    ${all_messages_after}    www.google-analytics.com    ${ga_Cartcheckout_list}

tracking006
    [Documentation]    sc的cart页面"checkout"上报事件
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[href="/cart"]')[1]
    Sleep And Click Element    dom:document.querySelectorAll('[data-track="checkout-submit"]')[0]
    #获得总数据
    ${all_messages}    get_all_messages
    #构造真实对比数据
    ${current_url_one}=    Get Location
    ${current_url_two}=    Evaluate    u"${current_url_one}".strip('https://trackingtest.myshoplaza.com/checkout/')
    ${order_id}=    Evaluate    u"${current_url_two}".strip('?step=contact_information')
    ${referrer}=    Set Variable    ${c_url}/cart
    &{properties}=    Create Dictionary    referrer=${referrer}    order_id=${order_id}
    &{data}=    Create Dictionary    event=begin_checkout    properties=${properties}
    &{sc_Cartcheckout_data}=    Create Dictionary    data=${data}
    @{sc_Cartcheckout_list}=    Create List    ${sc_Cartcheckout_data}
    assert_equal_values_process    ${all_messages}    shence.shoplazza    ${sc_Cartcheckout_list}

tracking007
    [Documentation]    google、神策、facebook的填写支付信息上报事件
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
    Sleep    5
	#    获得总数据
    ${all_messages_one}    get_all_messages
	#    构造真实对比数据
    @{target_messages_one}    get_messages_filtering_by_url    ${all_messages_one}    myshoplaza.com/cart/add
	@{request_ids_one}    get_request_ids_from_messages    ${target_messages_one}
    &{request_post_data}    network_get_request_post_data    @{request_ids_one}[0]
    &{response_body_data}    network_get_response_body    @{request_ids_one}[0]
    ${product_id} =    Set Variable    ${request_post_data.product_id}
    ${variant_id} =    Set Variable    ${request_post_data.variant_id}
    ${product_title} =    lib_utils.get_value_from_dict    ${response_body_data}    data.line_items.${variant_id}.product_title
    ${price} =    lib_utils.get_value_from_dict    ${response_body_data}    data.line_items.${variant_id}.price
    ${quantity} =    Convert To Integer    ${request_post_data.quantity}
    Sleep    2
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="submit"]')[0]
    Add Address SepCommon Step
    Sleep And Click Element    dom:document.querySelectorAll('[class*="btn btn-checkout-primary"]')[0]
    Add Credit Card Info
    Sleep And Click Element    dom:document.querySelectorAll('[class*="btn btn-checkout-primary"]')[0]
    Sleep    2
    ${all_messages_two}    get_all_messages
    ${current_url_one}=    Get Location
    ${current_url_two}=    Evaluate    u"${current_url_one}".strip('https://trackingtest.myshoplaza.com/checkout/')
    ${order_id}=    Evaluate    u"${current_url_two}".strip('?step=checkout_result')
    #ga上报数据
    &{ga_payment_data}=    Create Dictionary    ea=checkout_progress    pr1id=${product_id}    pr1nm=${product_title}
    @{ga_payment_list}=    Create List    ${ga_payment_data}
    #sc上报数据
    ${target_url}=    Set Variable    trackingtest.myshoplaza.com/api/checkout/payments/pay
#    ${number}=    Set Variable
    ${url_path_one}=        Evaluate    u"${current_url_one}".strip('https://trackingtest.myshoplaza.com')
    ${url_path}=    Evaluate    u"${url_path_one}".strip('?step=checkout_result')
	&{properties}=    Create Dictionary    order_id=${order_id}    target_url=${target_url}   number=${Empty}    $url=${current_url_one}
	...    $title=${domain}    $url_path=${url_path}
	&{data}=    Create Dictionary    event=add_payment_info    properties=${properties}
	&{sc_payment_data}=    Create Dictionary    data=${data}
	@{sc_payment_list}=    Create List    ${sc_payment_data}
	#fb上报数据
	&{contents}=    Create Dictionary    id=${product_id}    number=${quantity}    item_price=${price}
	&{fb_payment_data}=    Create Dictionary    ev=AddPaymentInfo    value=${price}    currency=USD    content_category=[]
	...    content_ids=[]    contents=${contents}
	@{fb_payment_list}=    Create List    ${fb_payment_data}
	#检查
    assert_equal_values_process    ${all_messages_two}    www.google-analytics.com    ${ga_payment_list}
    assert_equal_values_process    ${all_messages_two}    shence.shoplazza    ${sc_payment_list}
    assert_equal_values_process    ${all_messages_two}    www.facebook.com    ${fb_payment_list}

tracking008
    [Documentation]    facebook —》进入checkout_result 且是成功页面的次数 -》上报事件
    [Tags]
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
    Sleep    5
    #获得总数据
    ${all_messages_before}    get_all_messages
    #构造真实对比数据
    @{target_messages}    get_messages_filtering_by_url    ${all_messages_before}    myshoplaza.com/cart/add
	@{request_ids}    get_request_ids_from_messages    ${target_messages}
    &{request_post_data}    network_get_request_post_data    @{request_ids}[0]
    &{response_body_data}    network_get_response_body    @{request_ids}[0]
    ${product_id} =    Set Variable    ${request_post_data.product_id}
    ${variant_id} =    Set Variable    ${request_post_data.variant_id}
    ${product_title} =    lib_utils.get_value_from_dict    ${response_body_data}    data.line_items.${variant_id}.product_title
    ${productPrice} =    lib_utils.get_value_from_dict    ${response_body_data}    data.line_items.${variant_id}.price
    ${price}=    Evaluate    u"${productPrice}".strip('.00')
    ${quantity} =    Set Variable    ${request_post_data.quantity}
    ${currency} =    Set Variable    USD
    ${content_type}=    Set Variable    product
    &{list}=    Create Dictionary    id=${product_id}    number=${quantity}    item_price=${productPrice}
    @{contents}=    Create List    ${list}
    &{fb_paymentsuccessful_data}=    Create Dictionary    ev=Purchase    cd[content_type]=Purchase    cd[value]=${price}
    ...    cd[currency]=${currency}    cd[content_name]=${Empty}    content_ids=[]    cd[contents]=${contents}    num_items=${quantity}
    @{fb_paymentsuccessful_list}=    Create List    ${fb_paymentsuccessful_data}
    #完成订单
    Sleep    5
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="submit"]')[0]
    Add Address SepCommon Step
    Sleep And Click Element    dom:document.querySelectorAll('[class*="btn btn-checkout-primary"]')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[class*="btn btn-checkout-primary"]')[0]
    #获得总数据
    ${all_messages_after}    get_all_messages
    #检查
    assert_equal_values_process    ${all_messages_after}    www.facebook.com    ${fb_paymentsuccessful_list}

tracking009
    [Documentation]    ga —》进入checkout_result 且是成功页面的次数 -》上报事件
    [Tags]
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="submit"]')[0]
    Add Address SepCommon Step
    Sleep And Click Element    dom:document.querySelectorAll('[class*="btn btn-checkout-primary"]')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-method="cod"]')[1]
    Sleep And Click Element    dom:document.querySelectorAll('[class*="btn btn-checkout-primary"]')[0]
    #获得总数据
    ${all_messages}    get_all_messages
    #构造真实对比数据
    ${current_url_one}=    Get Location
    ${current_url_two}=    Evaluate    u"${current_url_one}".strip('https://trackingtest.myshoplaza.com/checkout/')
    ${order_id}=    Evaluate    u"${current_url_two}".strip('?step=checkout_result')
    &{ga_paymentsuccessful_data}=    Create Dictionary    ea=purchase    ti=${order_id}
    @{ga_paymentsuccessful_list}=    Create List    ${ga_paymentsuccessful_data}
    #检查
    assert_equal_values_process    ${all_messages}    www.google-analytics.com    ${ga_paymentsuccessful_list}

tracking010
    [Documentation]    sc —》进入checkout_result 且是成功页面的次数 -》上报事件
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="submit"]')[0]
    Add Address SepCommon Step
    Sleep And Click Element    dom:document.querySelectorAll('[class*="btn btn-checkout-primary"]')[0]
    #获得总数据
    ${all_messages}    get_all_messages
    #构造真实对比数据
    &{sc_paymentsuccessful_data}=    Create Dictionary    event=place_order
    @{sc_paymentsuccessful_list}=    Create List    ${sc_paymentsuccessful_data}
    assert_equal_values_process    ${all_messages}    shence.shoplazza    ${sc_paymentsuccessful_list}

tracking011
    [Documentation]    google、神策、facebook -》点击搜索的次数 -》上报事件
    Sleep And Click Element    dom:document.querySelectorAll('[class*="sep-font sep-font-search-thin"]')[1]
    Wait And Input Text    dom:document.querySelectorAll('[class*="form-control header__search-input "]')[0]    auto\n
    Sleep    3
    ${search_word}=    Wait And Get Value    dom:document.querySelectorAll('[class*="form-control search__input "]')[0]
    #获得总数据
    ${all_messages}    get_all_messages
    #构造真实对比数据
    ${has_result}=   Evaluate    True
    ${value}=    Set Variable    0.01
    ${currency}=    Set Variable    USD
    ${content_category}=    Set Variable    search
    &{properties}=    Create Dictionary    key_word=${search_word}    has_result=${has_result}
    &{data}=    Create Dictionary    event=product_search    properties=${properties}
    &{sc_scSearch_data}=    Create Dictionary    data=${data}
    @{sc_scSearch_list}=    Create List    ${sc_scSearch_data}
    &{ga_gaSearch_data}=    Create Dictionary    ea=search
    @{ga_gaSearch_list}=    Create List    ${ga_gaSearch_data}
    &{fb_fbSearch_data}=    Create Dictionary    ev=Search    cd[value]=${value}    cd[currency]=${currency}
    ...    cd[content_category]=${content_category}    cd[content_ids]=[]    cd[contents]=
    @{fb_fbSearch_list}=    Create List    ${fb_fbSearch_data}
    assert_equal_values_process    ${all_messages}    shence.shoplazza    ${sc_scSearch_list}
    assert_equal_values_process    ${all_messages}    www.google-analytics.com    ${ga_gaSearch_list}
    assert_equal_values_process    ${all_messages}    www.facebook.com    ${fb_fbSearch_list}


#Tracking Suite Setup
#	[Documentation]
#	Open Test Browser    ${c_url}
#	Open New And Close Other Windows    ${c_url}

Tracking Testcase Setup
	[Documentation]
	start_listener_on_new_tab
	Reload Page

Tracking Testcase Teardown
	[Documentation]
	Run Keyword If Test Failed    Capture Page Screenshot
	Open New And Close Other Windows    ${c_url}

