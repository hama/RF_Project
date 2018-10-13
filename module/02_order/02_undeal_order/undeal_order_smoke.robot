*** Settings ***
Suite Setup       Undeal Order Suite Setup
Suite Teardown    Undeal Order Suite Teardown
Test Setup        Undeal Order Case Setup
Test Teardown     Teardown Test Case
Force Tags        Order
Resource          ../../../resources/variable/var_order.robot
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_order.robot
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py
Library           ${CURDIR}/../../../lib/customlib/kworder.py


*** Test Cases ***
#order003
#    [Documentation]     验证未完成订单列表可正常进入
#    [tags]    P0    threshold    smoke
#    ${text00}    Wait And Get Text    ${locatorB_orderUndeal_button_toPay}
#    Should Be Equal    ${text00}    待支付
#
#order006
#    [Documentation]     验证C端购买商品进入checkout选择支付方式页面会在B端未完成订单列表中生成订单
#    [tags]    P0    threshold    smoke
#    ${count00}    kworder.get_undeal_order_count_py
#    kworder.add_undeal_order_with_products_py
#    Reload Page And Start Ajax
#    ${count01}    kworder.get_undeal_order_count_py
#	${difference}    Evaluate    ${count01}-${count00}
#	Should Be Equal    ${difference}    ${1}
#
#order112
#    [Documentation]     验证未完成订单列表，全部栏下含有筛选框：支付方式、支付状态、订单状态
#    [tags]    P0    threshold    smoke
#    Select All Undeal Order Tag
#    ${text00} =    Wait And Get Text    ${locatorB_orderUndeal_text_paymentMethod}
#    ${text01} =    Wait And Get Text    ${locatorB_orderUndeal_text_financialStatus}
#    ${text02} =    Wait And Get Text    ${locatorB_orderUndeal_text_orderStatus}
#    Should Be Equal    ${text00}    支付方式
#    Should Be Equal    ${text01}    支付状态
#    Should Be Equal    ${text02}    订单状态
#
#order130
#    [Documentation]     验证未完成订单列表，选择待支付栏，会显示未完成订单中所有待支付的订单
#    [tags]    P0    threshold    smoke
#    kworder.add_undead_order_with_to_pay_status_py
#    kworder.add_undead_order_with_order_cancel_status_py
#    kworder.add_undead_order_with_pay_fail_status_py
#    Reload Page And Start Ajax
#    Select To Pay Undeal Order Tag
#    ${text00} =    Sleep And Get Text    ${locatorB_orderUndeal_text_firstOrder_paymentStatus}
#    Should Be Equal    ${text00}    待支付
#
#order131
#    [Documentation]     验证未完成订单列表，选择已取消栏，会显示未完成订单中所有已取消的订单
#    [tags]    P0    threshold    smoke
#    kworder.add_undead_order_with_order_cancel_status_py
#    kworder.add_undead_order_with_pay_fail_status_py
#    kworder.add_undead_order_with_to_pay_status_py
#    Reload Page And Start Ajax
#    Select Canceled Undeal Order Tag
#    ${text00} =    Sleep And Get Text    ${locatorB_orderUndeal_text_firstOrder_orderStatus}
#    Should Be Equal    ${text00}    已取消
#
#order149
#    [Documentation]     验证未完成订单列表中的订单详情页面，左上角返回按钮可返回到未完成订单列表
#    [tags]    P0    threshold    smoke
#    kworder.add_undead_order_with_order_cancel_status_py
#    Reload Page And Start Ajax
#    Select All Undeal Order Tag
#    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
#    Wait Until Page Contains Text    返回订单列表
#    Wait And Click Element    ${locatorB_icon_back00}
#    Wait Until Page Contains Locator    ${locatorB_orderUndeal_items_listOrder}
#
#order152
#    [Documentation]     验证未完成支付的订单，订单详情页面的订单状态显示为：未完成
#    [tags]    P0    threshold    smoke
#    kworder.add_undead_order_with_to_pay_status_py
#    Reload Page And Start Ajax
#    Select All Undeal Order Tag
#    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
#    Wait Until Page Contains Locator    ${locatorB_orderDetail_tag_unfinished}

order193
    [Documentation]     验证C端使用信用卡支付后，订单详情页面显示的支付方式为：credit card
    [tags]    P0    threshold    smoke
    kworder.add_undead_order_with_pay_fail_status_py
    Reload Page And Start Ajax
    Select All Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_payway}    Credit Card

order195
    [Documentation]     验证C端未选择支付方式的订单，订单详情页面显示的支付方式为：无
    [tags]    P0    threshold    smoke
    kworder.add_undead_order_with_to_pay_status_py
    Reload Page And Start Ajax
    Select All Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_payway}    无
    Capture Page Screenshot

order196
    [Documentation]     验证订单详情页面，收货信息显示正常
    [tags]    P0    threshold    smoke
    kworder.add_undead_order_with_pay_fail_status_py
    Reload Page And Start Ajax
    Select All Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_items_listOrder}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationLastName}    姓：lastname
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationName}    名：name
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationPhone}    电话：123456789
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationEmail}    邮箱：12345@autotest.com
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationCountry}    国家：China
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationProvince}    省份：北京
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationCity}    城市：city
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationStreet}    街道：addr
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationApartment}    寓所：addr1
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationCompany}    公司：company
	Text Of Element Should Be Equal With Wait    ${locatorB_orderDetail_text_deliveryInformationCode}    邮编：00000



