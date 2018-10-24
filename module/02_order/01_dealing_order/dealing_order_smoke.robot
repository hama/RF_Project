*** Settings ***
Suite Setup       Dealing Order Suite Setup
Suite Teardown    Dealing Order Suite Teardown
Test Setup        Dealing Order Case Setup
Test Teardown     Teardown Test Case
Force Tags        Order
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
order002
	[Documentation]     验证在菜单栏点击订单时，默认选中并进入订单的第一个子菜单：待处理订单
    [tags]    P0    threshold    smoke
    ${text00}    Wait And Get Text    ${locatorB_orderDealing_button_toDeliver}
    Should Be Equal    ${text00}    待发货

order009
    [Documentation]     验证C端购买商品选择COD支付方式，并且提交成功后会在B端待处理订单中生成新订单
    [tags]    P0    threshold    smoke
    ${count00}    kworder.get_dealing_order_count_py
    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${count01}    kworder.get_dealing_order_count_py
	${difference}    Evaluate    ${count01}-${count00}
	Should Be Equal    ${difference}    ${1}

order015
    [Documentation]     验证待处理订单列表中，可通过切换tab查看未发货的订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    kworder.add_deading_order_with_some_delivered_status_py
    kworder.add_deading_order_with_all_delivered_status_py
    Reload Page And Start Ajax
    Select To Deliver Dealing Order Tag
    ${text00} =    Sleep And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[0]
    ${text01} =    Sleep And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[1]
    Should Be Equal    ${text00}    部分发货
    Should Be Equal    ${text01}    待发货

order016
    [Documentation]     验证待处理订单列表中，可通过切换tab查看已发货的订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_all_delivered_status_py
    kworder.add_deading_order_with_some_finished_status_py
    kworder.add_deading_order_with_some_delivered_status_py
    Reload Page And Start Ajax
    Select Delivered Dealing Order Tag
    ${text00} =    Sleep And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[0]
    ${text01} =    Sleep And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[1]
    Should Be Equal    ${text00}    部分完成
    Should Be Equal    ${text01}    全部发货

order017
    [Documentation]     验证待处理订单列表中，可通过切换tab查看已完成的订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_all_delivered_status_py
    kworder.add_deading_order_with_finished_status_py
    Reload Page And Start Ajax
    Select Finished Dealing Order Tag
    ${text00} =    Sleep And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[0]
    Should Be Equal    ${text00}    全部完成

order039
    [Documentation]     验证待处理订单列表中，订单编号显示为checkout发起订单时的订单编号
    [tags]    P0    threshold    smoke
    ${count00}    kworder.get_dealing_order_count_py
    ${order_token}    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${count01}    kworder.get_dealing_order_count_py
	${difference}    Evaluate    ${count01}-${count00}
	Should Be Equal    ${difference}    ${1}
	${order_num00}    kworder.get_latest_dealing_order_num_py
	${order_num01}    kworder.get_order_num_by_order_token_py    ${order_token}
	Should Be Equal    ${order_num00}    ${order_num01}

order040
    [Documentation]     验证待处理订单列表中，订单栏日期显示为在checkout生成订单的时间
    [tags]    P0    threshold    smoke
    ${order_token}    kworder.add_dealing_order_with_products_py
	# 创建订单的时间戳
    ${createtime1}    Get Time
    Reload Page And Start Ajax
    ${tmptime} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_date}
    ${createtime2} =    Convert Date    ${tmptime}    result_format=%Y-%m-%d %H:%M:%S
    # 通过订单号，判断是否创建了一个新的订单
	${order_num00}    kworder.get_latest_dealing_order_num_py
	${order_num01}    kworder.get_order_num_by_order_token_py    ${order_token}
	Should Be Equal    ${order_num00}    ${order_num01}
	${result} =    lib_utils.compare_time_py    ${createtime1}    ${createtime2}
	${status} =    Evaluate    0<${result}<10
	Should Be Equal    '${status}'    'True'

order041
    [Documentation]     验证待处理订单列表中，订单栏顾客姓名显示为在checkout下单时填写的顾客姓名
    [tags]    P0    threshold    smoke
    &{shipping_address} =    Create Dictionary
    ...    first_name=auto
    ...    last_name=test
    &{place_order_conf} =    Create Dictionary
    ...    shipping_address=&{shipping_address}
    &{conf} =    Create Dictionary
    ...    place_order_conf=&{place_order_conf}
    kworder.add_deading_order_with_conf_py    ${conf}
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_receiverName}
	Should Be Equal    ${text}    auto test

order042
    [Documentation]     验证待处理订单列表中，订单使用COD支付时，支付方式显示为：COD
    [tags]    P0    threshold    smoke
    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_paymentMethod}
	Should Be Equal    ${text}    COD支付

order046
    [Documentation]     验证在C端使用COD完成支付的订单，在待处理订单列表中的支状态显示为：待支付
    [tags]    P0    threshold    smoke
    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_paymentStatus}
	Should Be Equal    ${text}    待支付

order047
    [Documentation]     验证已经完成支付的新订单，待处理订单列表中，物流状态显示为：待发货
    [tags]    P0    threshold    smoke
    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_shippingStatus}
	Should Be Equal    ${text}    待发货

order052
    [Documentation]     验证订单未确认收货前，待处理订单列表中订单住状态显示为：进行中
    [tags]    P0    threshold    smoke
    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_orderStatus}
	Should Be Equal    ${text}    进行中

order055
    [Documentation]     验证待处理订单列表中，未发货栏下含有搜索框：支付方式、支付状态、物流状态
    [tags]    P0    threshold    smoke
    Select To Deliver Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_paymentMethod}
    ${text01} =    Wait And Get Text    ${locatorB_orderDealing_text_financialStatus}
    ${text02} =    Wait And Get Text    ${locatorB_orderDealing_text_shippingStatus}
	Should Be Equal    ${text00}    支付方式
	Should Be Equal    ${text01}    支付状态
	Should Be Equal    ${text02}    物流状态

order065
    [Documentation]     验证待处理订单列表，已发货栏下含有搜索框：支付方式、支付状态、物流状态
    [tags]    P0    threshold    smoke
    Select Delivered Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_paymentMethod}
    ${text01} =    Wait And Get Text    ${locatorB_orderDealing_text_financialStatus}
    ${text02} =    Wait And Get Text    ${locatorB_orderDealing_text_shippingStatus}
    Should Be Equal    ${text00}    支付方式
    Should Be Equal    ${text01}    支付状态
    Should Be Equal    ${text02}    物流状态

order085
    [Documentation]     验证待处理订单列表，未发货栏下，只显示未发货和部分发货的订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    kworder.add_deading_order_with_some_delivered_status_py
    kworder.add_deading_order_with_all_delivered_status_py
    kworder.add_deading_order_with_some_finished_status_py
    kworder.add_deading_order_with_finished_status_py
    Reload Page And Start Ajax
    Select To Deliver Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[0]
    ${text01} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[1]
    Should Be Equal    ${text00}    部分发货
    Should Be Equal    ${text01}    待发货

order087
    [Documentation]     验证待处理订单列表，已发货栏下，只显示全部发货和部分完成的订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    kworder.add_deading_order_with_some_delivered_status_py
    kworder.add_deading_order_with_all_delivered_status_py
    kworder.add_deading_order_with_some_finished_status_py
    kworder.add_deading_order_with_finished_status_py
    Reload Page And Start Ajax
    Select Delivered Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[0]
    ${text01} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[1]
    Should Be Equal    ${text00}    部分完成
    Should Be Equal    ${text01}    全部发货

order088
    [Documentation]     验证待处理订单列表，已完成栏下，只显示已完成订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    kworder.add_deading_order_with_some_delivered_status_py
    kworder.add_deading_order_with_all_delivered_status_py
    kworder.add_deading_order_with_some_finished_status_py
    kworder.add_deading_order_with_finished_status_py
    Reload Page And Start Ajax
    Select Finished Dealing Order Tag
    ${text00} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_orderStatus}
    Should Be Equal    ${text00}    已完成

order147
    [Documentation]     验证从订单列表，点击订单可进入订单详情页面
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Wait Until Page Contains Text    返回订单列表

order148
    [Documentation]     验证待处理订单列表中的订单详情页面，左上角返回按钮可返回到待处理订单列表
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Wait Until Page Contains Text    返回订单列表
    Wait And Click Element    ${locatorB_icon_back}
    Wait Until Page Contains Locator    ${locatorB_orderDealing_items_listOrder}

order150
    [Documentation]     验证订单详情中，左上角显示文本为本订单的订单编号
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Sleep    2    # 需要等待数据加载
    ${order_num01}    Wait And Get Text    ${locatorB_orderDetail_text_orderNum}
    ${order_num00}    kworder.get_latest_dealing_order_num_py
	Should Be Equal    ${order_num00}    ${order_num01}

order160
    [Documentation]     验证使用COD完成支付的订单，订单详情中显示的支付状态为待支付
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_all_delivered_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Sleep    2    # 需要等待数据加载
    Wait Until Page Contains Locator    ${locatorB_orderDetail_tag_payWaiting}

order163
    [Documentation]     验证新订单，订单详情页面的物流状态显示为：未发货
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Wait Until Page Contains Locator    ${locatorB_orderDetail_tag_shipWaiting}

order174
    [Documentation]     验证订单详情页面，商品栏标题显示为本次购买的商品标题
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_listProductName}[0]    autotest_title

order177
    [Documentation]     验证订单详情页面，商品栏，sku可正常显示
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_firstProductSku}    SKU: autotest_sku

order178
    [Documentation]     验证订单详情页面，商品栏，供应商可正常显示
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_firstProductVendor}    供应商: autotest_vendor

order179
    [Documentation]     验证订单详情页面，商品单价及数量显示正常
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_firstProductPriceAndNum}    444.00 USD x 1

order180
    [Documentation]     验证订单详情页面，商品栏，单个商品总价显示正常
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_firstProductSumPrice}    444.00 USD

order181
    [Documentation]     验证新生成的订单，订单详情页面，商品栏，单个商品的物流状态显示为：待发货
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_tag_firstProduct_shipPartiallyFinished}    待发货

order192
    [Documentation]     验证C端使用COD支付后，订单详情页面的支付方式显示为：COD
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_payway}    COD

order199
    [Documentation]     验证订单详情页面，收货人信息栏，编辑按钮可点击
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Wait And Click Element    ${locatorB_icon_edit}
    Wait Until Page Contains Locator    ${locatorB_button_save00}

order227
    [Documentation]     验证订单详情页面，去发货按钮可点击
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_some_delivered_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Wait And Click Element    ${locatorB_orderDetail_button_toDelivery}
    Wait Until Page Contains Text    选择发货商品

order235
    [Documentation]     验证订单详情页面，添加运单弹窗，收货地址栏可展开
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_some_delivered_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Wait And Click Element    ${locatorB_orderDetail_button_toDelivery}
    Wait And Click Element    ${locatorB_orderDetail_arrow_toExpand}[1]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationLastName}    姓：lastname
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationName}    名：firstname
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationPhone}    电话：18888888888
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationEmail}    邮箱：12345@shippingaddress.com
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationCountry}    国家：China
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationProvince}    省份：Beijing
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationCity}    城市：city
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationStreet}    街道：address
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationApartment}    寓所：address1
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationCompany}    公司：company
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationCode}    邮编：00000

order275
    [Documentation]     验证订单详情，物流状态栏，商品发货后点击取消发货再点击确认取消按钮，将会取消本次发货
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
    Wait And Click Element    ${locatorB_orderDetail_button_toDelivery}
    Wait And Click Element    ${locatorB_button_canecl}
    Wait Until Page Contains Locator    ${locatorB_orderDetail_button_toDelivery}
    Wait Until Page Contains Text    暂无物流状态，请安排发货




