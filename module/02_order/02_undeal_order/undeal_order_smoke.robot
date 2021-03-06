*** Settings ***
Suite Setup       Undeal Order Suite Setup
Suite Teardown    Undeal Order Suite Teardown
Test Setup        Undeal Order Case Setup
Test Teardown     Teardown Test Case
Force Tags        Undeal Order
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
order003
    [Documentation]     验证未完成订单列表可正常进入
    [tags]    P0    threshold    smoke
    ${text00}    Wait And Get Text    ${locatorB_orderUndeal_button_toPay}
    Should Be Equal    ${text00}    待支付

order006
    [Documentation]     验证C端购买商品进入checkout选择支付方式页面会在B端未完成订单列表中生成订单
    [tags]    P0    threshold    smoke
    ${count00}    kworder.get_undeal_order_count_py
    kworder.add_undead_order_with_to_pay_status_py
    Reload Page And Start Ajax
    ${count01}    kworder.get_undeal_order_count_py
	${difference}    Evaluate    ${count01}-${count00}
	Should Be Equal    ${difference}    ${1}

order112
    [Documentation]     验证未完成订单列表，全部栏下含有筛选框：支付方式、支付状态、订单状态
    [tags]    P0    threshold    smoke
    Select All Undeal Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderUndeal_text_paymentMethod}
    ${text01} =    Wait And Get Text    ${locatorB_orderUndeal_text_financialStatus}
    ${text02} =    Wait And Get Text    ${locatorB_orderUndeal_text_orderStatus}
    Should Be Equal    ${text00}    支付方式
    Should Be Equal    ${text01}    支付状态
    Should Be Equal    ${text02}    订单状态

order130
    [Documentation]     验证未完成订单列表，选择待支付栏，会显示未完成订单中所有待支付的订单
    [tags]    P0    threshold    smoke
    kworder.add_undead_order_with_to_pay_status_py
    kworder.add_undead_order_with_order_cancel_status_py
    kworder.add_undead_order_with_pay_fail_status_py
    Reload Page And Start Ajax
    Select To Pay Undeal Order Tag
    ${text00} =    Sleep And Get Text    ${locatorB_orderUndeal_text_firstOrder_paymentStatus}
    Should Be Equal    ${text00}    待支付

order131
    [Documentation]     验证未完成订单列表，选择已取消栏，会显示未完成订单中所有已取消的订单
    [tags]    P0    threshold    smoke
    kworder.add_undead_order_with_order_cancel_status_py
    kworder.add_undead_order_with_pay_fail_status_py
    kworder.add_undead_order_with_to_pay_status_py
    Reload Page And Start Ajax
    Select Canceled Undeal Order Tag
    ${text00} =    Sleep And Get Text    ${locatorB_orderUndeal_text_firstOrder_orderStatus}
    Should Be Equal    ${text00}    已取消

order133
    [Documentation]    验证未完成订单列表中，搜索按钮可点击
    [Tags]    P0    threshold
    kworder.add_undead_order_with_pay_fail_status_py
    kworder.add_undead_order_with_to_pay_status_py
    Reload Page And Start Ajax
    ${orderNum}=    kworder.get_latest_undeal_order_num_py
    Wait And Input Text    ${locatorB_order_input_searchText}    ${orderNum}
    Wait And Click Element    ${locatorB_order_button_searchBtn}
    Text Of Element Should Be Equal With Wait    ${locatorB_orderUndeal_text_firstOrder_orderNum}    ${orderNum}

order149
    [Documentation]     验证未完成订单列表中的订单详情页面，左上角返回按钮可返回到未完成订单列表
    [tags]    P0    threshold    smoke
    kworder.add_undead_order_with_order_cancel_status_py
    Reload Page And Start Ajax
    Select All Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
    Wait Until Page Contains Text    返回订单列表
    Wait And Click Element    ${locatorB_icon_back}
    Wait Until Page Contains Locator    ${locatorB_orderUndeal_items_listOrder}

order152
    [Documentation]     验证未完成支付的订单，订单详情页面的订单状态显示为：未完成
    [tags]    P0    threshold    smoke
    kworder.add_undead_order_with_to_pay_status_py
    Reload Page And Start Ajax
    Select All Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
    Wait Until Page Contains Locator    ${locatorB_orderDetail_tag_unfinished}

#order193
#    [Documentation]     验证C端使用信用卡支付后，订单详情页面显示的支付方式为：credit card
#    [tags]    P0    threshold    smoke
#    kworder.add_undead_order_with_pay_fail_status_py
#    Reload Page And Start Ajax
#    Select All Undeal Order Tag
#    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_payway}    Credit Card

order195
    [Documentation]     验证C端未选择支付方式的订单，订单详情页面显示的支付方式为：无
    [tags]    P0    threshold    smoke
    kworder.add_undead_order_with_to_pay_status_py
    Reload Page And Start Ajax
    Select All Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_payway}    无

order196
    [Documentation]     验证订单详情页面，收货信息显示正常
    [tags]    P0    threshold    smoke
    kworder.add_undead_order_with_pay_fail_status_py
    Reload Page And Start Ajax
    Select All Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationLastName}    姓：lastname
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationName}    名：firstname
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationPhone}    电话：18888888888
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationEmail}    邮箱：12345@autotest.com
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationCountry}    国家/地区：China
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationProvince}    省份：Beijing
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationCity}    城市：city
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationStreet}    街道：address
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationApartment}    寓所：address1
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationCompany}    公司：company
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationCode}    邮编：00000



##周莉编写
#order095
#    [Documentation]    验证C端未完成支付的订单，在B端未完成列表中显示的支付方式为：无
#    [Tags]    P0
#    kworder.add_undead_order_with_to_pay_status_py
#    ${orderID}=    kworder.get_latest_undeal_order_num_py
#    Reload Page And Start Ajax
#    Wait And Input Text    ${locatorB_order_input_searchText}    ${orderID}
#    Wait And Click Element    ${locatorB_order_button_searchBtn}
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderUndeal_text_firstOrder_paymentMethod}    无
#
#order096
#    [Documentation]    验证C端使用线上支付并且支付失败的订单，B端未完成列表中的支付方式显示为线上支付
#    [Tags]    P0
#    kworder.add_undead_order_with_pay_fail_status_py
#    ${orderID}=    kworder.get_latest_undeal_order_num_py
#    Reload Page And Start Ajax
#    Wait And Input Text    ${locatorB_order_input_searchText}    ${orderID}
#    Wait And Click Element    ${locatorB_order_button_searchBtn}
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderUndeal_text_firstOrder_paymentMethod}    线上支付
#
#order097
#    [Documentation]    验证C端使用COD支付并且支付失败的订单，B端未完成列表中的支付方式显示为COD支付
#    [Tags]    P0
#    kworder.add_undead_order_with_pay_cod_py
#    ${orderID}=    kworder.get_latest_undeal_order_num_py
#    Reload Page And Start Ajax
#    Wait And Input Text    ${locatorB_order_input_searchText}    ${orderID}
#    Wait And Click Element    ${locatorB_order_button_searchBtn}
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderUndeal_text_firstOrder_paymentMethod}    COD支付
#
#order098
#    [Documentation]    验证C端未选择支付方式的订单，B端未完成订单列表中，显示的支付状态为：待支付
#    [Tags]    P0
#    kworder.add_undead_order_with_to_pay_status_py
#    ${orderID}=    kworder.get_latest_undeal_order_num_py
#    Reload Page And Start Ajax
#    Wait And Input Text    ${locatorB_order_input_searchText}    ${orderID}
#    Wait And Click Element    ${locatorB_order_button_searchBtn}
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderUndeal_text_firstOrder_paymentStatus}    待支付
#
#order101
#    [Documentation]    验证C端未支付的订单，在个人中心取消此订单时，B端未完成列表中显示的支付状态为：支付取消
#    [Tags]    P0
#    kworder.add_undead_order_with_pay_cod_py
#    ${orderID}=    kworder.get_latest_undeal_order_num_py
#    Reload Page And Start Ajax
#    Wait And Input Text    ${locatorB_order_input_searchText}    ${orderID}
#    Wait And Click Element    ${locatorB_order_button_searchBtn}
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderUndeal_text_firstOrder_paymentStatus}    支付取消

