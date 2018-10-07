*** Settings ***
Suite Setup       Undeal Order Suite Setup
Suite Teardown    Undeal Order Suite Teardown
Test Setup        Undeal Order Case Setup
Test Teardown     Teardown Test Case
Force Tags        Order
Resource          ../../resources/variable/var_order.robot
Resource          ../../resources/variable/var_common.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/keywords/kw_order.robot
Library           ${CURDIR}/../../lib/customlib/lib_utils.py


*** Testcases ***
order003
    [Documentation]     验证未完成订单列表可正常进入
    [tags]    P0    threshold    smoke
    Do An Action        Argument
    Do Another Action   ${robotVar}
