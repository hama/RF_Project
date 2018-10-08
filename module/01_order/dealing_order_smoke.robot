*** Settings ***
Suite Setup       Dealing Order Suite Setup
Suite Teardown    Dealing Order Suite Teardown
Test Setup        Dealing Order Case Setup
Test Teardown     Teardown Test Case
Force Tags        Order
Resource          ../../resources/variable/var_order.robot
Resource          ../../resources/variable/var_common.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/keywords/kw_order.robot
Library           ${CURDIR}/../../lib/customlib/lib_utils.py
Library           ${CURDIR}/../../lib/customlib/kworder.py


*** Testcases ***
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
    ${timestamp1}    Get Time    epoch
    Reload Page And Start Ajax
    ${item1_createtime}=    Wait And Get Text    ${locatorB_orderDealing_text_firstOrder_date}
    # 通过订单号，判断是否创建了一个新的订单
	${order_num00}    kworder.get_latest_dealing_order_num_py
	${order_num01}    kworder.get_order_num_by_order_id_py    ${order_id}
	Should Be Equal    ${order_num00}    ${order_num01}
	# 创建订单的时间戳
	${timestamp2}    Convert Date    ${item1_createtime}    epoch
	${status} =    Evaluate    -60000 < ${timestamp2}-${timestamp1} < 60000



