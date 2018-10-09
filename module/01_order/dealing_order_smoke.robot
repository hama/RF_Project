*** Settings ***
Suite Setup       Dealing Order Suite Setup
Suite Teardown    Dealing Order Suite Teardown
Test Setup        Dealing Order Case Setup
Test Teardown     Teardown Test Case
Force Tags        Order
Resource          ../../resources/variable/var_common.robot
Resource          ../../resources/variable/var_order.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/keywords/kw_order.robot
Library           ${CURDIR}/../../lib/customlib/lib_utils.py



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

order039
    [Documentation]     验证待处理订单列表中，订单编号显示为checkout发起订单时的订单编号
    [tags]    P0    threshold    smoke
    ${count00}    kworder.get_dealing_order_count_py
    ${order_id}    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${count01}    kworder.get_dealing_order_count_py
	${difference}    Evaluate    ${count01}-${count00}
	Should Be Equal    ${difference}    ${1}
	${order_num00}    kworder.get_latest_dealing_order_num_py
	${order_num01}    kworder.get_order_num_by_order_id_py    ${order_id}
	Should Be Equal    ${order_num00}    ${order_num01}

order040
    [Documentation]     验证待处理订单列表中，订单栏日期显示为在checkout生成订单的时间
    [tags]    P0    threshold    smoke
    ${order_id}    kworder.add_dealing_order_with_products_py
	# 创建订单的时间戳
    ${createtime1}    Get Time
    Reload Page And Start Ajax
    ${tmptime} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_date}
    ${createtime2} =    Convert Date    ${tmptime}    result_format=%Y-%m-%d %H:%M:%S
    # 通过订单号，判断是否创建了一个新的订单
	${order_num00}    kworder.get_latest_dealing_order_num_py
	${order_num01}    kworder.get_order_num_by_order_id_py    ${order_id}
	Should Be Equal    ${order_num00}    ${order_num01}
	${result} =    lib_utils.compare_time_py    ${createtime1}    ${createtime2}
	${status} =    Evaluate    ${result}<10
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
    Log To Console    ${conf}
    ${order_id}    kworder.add_order_by_conf_py    ${conf}
    Reload Page And Start Ajax
    ${tmptime} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_receiverName}
	Should Be Equal    '${status}'    'True'



