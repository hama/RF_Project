*** Settings ***
Suite Setup       Dealing Order Suite Setup
Suite Teardown    Dealing Order Suite Teardown
Test Setup        Dealing Order Case Setup
Test Teardown     Teardown Test Case
Force Tags        Order
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
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
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_popUp_deliveryInformationEmail}    邮箱：12345@autotest.com
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