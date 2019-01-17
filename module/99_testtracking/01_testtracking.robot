*** Settings ***
Suite Setup       Tracking Suite Setup
Suite Teardown    Close Test Suite Browser
Test Setup        Tracking Testcase Setup
Test Teardown     Tracking Testcase Teardown
Force Tags        tracking
Resource          ../../resources/keywords/kw_common.robot

*** Variables ***
${domain}    trackingtest
${url}    https://${domain}.myshoplaza.com/
${referrer_host}    ${domain}.myshoplaza.com
#${url}    https://admin.shoplazza.com/

*** Test Cases ***
tracking001
    [Documentation]
    [Tags]
    Sleep    3
    ${all_messages}    get_all_messages
	&{ga_pageview_data}=    Create Dictionary    t=pageview
	&{properties}=    Create Dictionary    $is_first_time=${False}    $title=${domain}    $url=${url}
	...    $url_path=/    $referrer_host=${referrer_host}    $referrer=${url}
	&{data}=    Create Dictionary    event=$pageview    properties=${properties}
	&{sc_pageview_data}=    Create Dictionary    data=${data}
	&{fb_pageview_data}=    Create Dictionary    ev=PageView
    assert_equal_values_process    ${all_messages}    www.google-analytics.com    ${ga_pageview_data}
    assert_equal_values_process    ${all_messages}    shence.shoplazza    ${sc_pageview_data}
    assert_equal_values_process    ${all_messages}    www.facebook.com    ${fb_pageview_data}


tracking002
    [Documentation]
    [Tags]
    Wait And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Wait And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
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
    [Tags]
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
#    Sleep    5
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
#	Sleep    5
	#检查facebook的cartcheckout上报事件
	${all_messages_after}    get_all_messages
	assert_contain_keys_process    ${all_messages_after}    www.facebook.com    ${fb_Cartcheckout_list}

tracking004
    [Documentation]    facebook的"进入detail_buynow次数"事件上报(详情页面的立即购买)
    [Tags]
    Sleep And Click Element    dom:document.querySelectorAll('.btn.btn-primary.featured-product__btn')[0]
    Sleep And Click Element    dom:document.querySelectorAll('[data-click="addToCart"]')[0]
#    Sleep    5
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
#	Sleep    5
	#检查facebook的cartcheckout上报事件
	${all_messages_after}    get_all_messages
	assert_contain_keys_process    ${all_messages_after}    www.facebook.com    ${fb_Cartcheckout_list}

*** Keywords ***
Tracking Suite Setup
	[Documentation]
	Open Test Browser    ${url}
	Open New And Close Other Windows    ${url}

Tracking Testcase Setup
	[Documentation]
	start_listener_on_new_tab
	Reload Page

Tracking Testcase Teardown
	[Documentation]
	Run Keyword If Test Failed    Capture Page Screenshot
	Open New And Close Other Windows    ${url}

