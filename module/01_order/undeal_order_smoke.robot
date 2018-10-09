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
Library           ${CURDIR}/../../lib/customlib/kworder.py


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
    kworder.add_undeal_order_with_products_py
    Reload Page And Start Ajax
    ${count01}    kworder.get_undeal_order_count_py
	${difference}    Evaluate    ${count01}-${count00}
	Should Be Equal    ${difference}    ${1}

