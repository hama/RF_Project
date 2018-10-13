*** Settings ***
Documentation     测试商品列表
Suite Setup       Coupon Code Suite Setup
Suite Teardown    Coupon Code Suite Teardown
Test Setup        Coupon Code Case Setup
Test Teardown     Teardown Test Case
Force Tags        coupon code
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/keywords/kw_common.robot
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py

*** Test Cases ***
coupon_code070
    [Documentation]    验证新建优惠码界面，活动名称输入框输入合法内容可保存成功
    [Tags]    P0    threshold
    Select All Product Tag

    ${item1_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
    ${item2_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[1]
    ${result}    lib_utils.compare_time_py    ${item1_createtime}    ${item2_createtime}
    ${status} =    Evaluate    ${result}>0
    Should Be Equal    '${status}'    'True'
