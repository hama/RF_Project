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


*** Testcases ***
order002
	[Documentation]     验证在菜单栏点击订单时，默认选中并进入订单的第一个子菜单：待处理订单
    [tags]    P0    threshold    smoke
    ${text00}    Wait And Get Text    ${locatorB_orderDealing_button_alreadyToDeliver}
    Should Be Equal    ${text00}    待发货


