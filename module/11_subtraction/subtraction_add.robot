*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Force Tags        Subtraction
Library           ${CURDIR}/../../lib/customLibrary
Resource          ../../resources/kw_browser.robot
Resource          ../../resources/kw_common.robot
Resource          ../../resources/var_subtraction.robot
Resource          ../../resources/kw_add_order.robot
Resource          ../../resources/kw_order.robot
Resource          ../../resources/kw_products.robot
Resource          ../../resources/kw_subtraction.robot

*** Test Cases ***
subtraction040
    [Documentation]    活动名称输入中文字符  > 可以成功输入，并保存
    [Tags]    P1
    subtraction_add_activity_name    自动化测试

subtraction041
    [Documentation]    活动名称输入英文字符  > 可以成功输入，并保存
    [Tags]    P1
    subtraction_add_activity_name    zidonghua

subtraction042
    [Documentation]    活动名称输入特殊符号字符  > 可以成功输入，并保存
    [Tags]    P1
    subtraction_add_activity_name    @#$%

subtraction043
    [Documentation]    活动名称输入数字字符  > 可以成功输入，并保存
    [Tags]    P1
    subtraction_add_activity_name    99999

subtraction044
    [Documentation]    活动名称输入混合（包括中英文，特殊符号，数字）字符  > 可以成功输入，并保存
    [Tags]    P1
    subtraction_add_activity_name    dd@@11

subtraction045
    [Documentation]    名称为空保存  > 保存失败
    [Tags]    P1
    subtraction_add_activity_name    $Empty

subtraction046
    [Documentation]    活动名称输入1-25个字符  > 可以成功输入，并保存
    [Tags]    P1
    subtraction_add_activity_name    123456789123456789123456

subtraction047
    [Documentation]    活动名称输入26以上个字符  > 可以成功输入，并保存
    [Tags]    P1
    subtraction_add_activity_name    123456789123456789123456789

subtraction049
    [Documentation]    开始时间设置为早于当前时间  > 不能设置
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_add_subtraction}
    #.点击第一个选择时间框
    Wait And Click Element    ${locator_ContentB_edit_select_first_time}
    Wait And Click Element    ${locator_ContentB_edit_select_second_prev_mon}
    ${res_elm}    Get Element Attribute    dom:document.querySelectorAll(".ant-calendar-date")[14]    aria-disabled
    Should Be True    '${res_elm}'=='true'

subtraction050
    [Documentation]    开始时间设置为等于或大于当前时间  > 可以设置
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_add_subtraction}
    #.点击第一个选择时间框
    Wait And Click Element    ${locator_ContentB_edit_select_first_time}
    Wait And Click Element    ${locator_ContentB_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[19]
    Wait And Click Element    ${locator_ContentB_edit_select_second_confirm}

subtraction051
    [Documentation]    开始时间为空保存  > 下方提示“请选择时间”
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_add_subtraction}
    Wait And Input Text    ${locator_ContentB_edit_input_name}    自动化测试
    #.选择所有商品
    subtraction_select_product
    Wait And Click Element    ${locator_ContentB_edit_select_second_time}
    Wait And Click Element    ${locator_ContentB_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[24]
    Wait And Click Element    ${locator_ContentB_edit_select_second_confirm}
    subtraction_input_coupon_type    ${input_count}    ${input_percentage}
    Wait And Click Element    ${locator_ContentB_first_btn_save}
    Wait Until Page Contains Element    ${locator_ContentB_edit_common_error}
    subtraction_confirm_cancel_alert

subtraction052
    [Documentation]    结束时间设置为等于或早于开始时间 > 不能设置
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_add_subtraction}
    #.点击第一个选择时间框
    Wait And Click Element    ${locator_ContentB_edit_select_second_time}
    Wait And Click Element    ${locator_ContentB_edit_select_second_prev_mon}
    ${res_elm}    Get Element Attribute    dom:document.querySelectorAll(".ant-calendar-date")[14]    aria-disabled
    Should Be True    '${res_elm}'=='true'

subtraction053
    [Documentation]    结束时间设置为大于开始时间  > 可以设置
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_add_subtraction}
    #.点击第一个选择时间框
    Wait And Click Element    ${locator_ContentB_edit_select_second_time}
    Wait And Click Element    ${locator_ContentB_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[19]
    Wait And Click Element    ${locator_ContentB_edit_select_second_confirm}
    subtraction_confirm_cancel_alert

subtraction054
    [Documentation]    结束时间为空保存  > 下方提示“请选择时间”
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_add_subtraction}
    Wait And Input Text    ${locator_ContentB_edit_input_name}    自动化测试
    #.选择所有商品
    subtraction_select_product
    Wait And Click Element    ${locator_ContentB_edit_select_first_time}
    Wait And Click Element    ${locator_ContentB_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[24]
    Wait And Click Element    ${locator_ContentB_edit_select_second_confirm}
    subtraction_input_coupon_type    ${input_count}    ${input_percentage}
    Wait And Click Element    ${locator_ContentB_first_btn_save}
    Wait Until Page Contains Element    ${locator_ContentB_edit_common_error}
    subtraction_confirm_cancel_alert

subtraction055
    [Documentation]    活动时间选择长期  > 结束时间为空
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_add_subtraction}
    subtraction_add_activity_set_time
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-input-lg")[1].value===''
    Should Be True    '${res}'=='True'
    subtraction_confirm_cancel_alert

subtraction057
    [Documentation]    优惠类型选择满件打折  > 设置成功
    [Tags]    P0
    subtraction_add_activity_name    自动化测试    true

subtraction058
    [Documentation]    选择满额减元，勾选上不封顶  > 设置成功
    [Tags]    P0
    subtraction_add_activity_name    自动化测试    false    true

subtraction059
    [Documentation]    下方添加多个层级，勾选上不封顶  > "3、提示选择上不封顶，只有优惠层级1生效，其他都会失效4、下方除了层级1，其他层级消失"
    [Tags]    P0
    delSubtraction    all
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_add_subtraction}
    Wait And Input Text    ${locator_ContentB_edit_input_name}    自动化测试
    #.选择所有商品
    subtraction_select_product
    #.设置时间
    subtraction_add_activity_set_time
    #.输入优惠规则
    subtraction_input_coupon_type    ${input_count}    ${input_percentage}
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-inner")[1].click()
    Execute JavaScript    ${locator_ContentB_edit_add_level}
    Wait Until Page Contains    新增优惠层级，上不封顶功能将会失效。请确认是否新增
    Execute JavaScript    return location.reload()
    Alert Should Be Present
    Go To Subtraction Page

*** Keywords ***
subtraction_add_activity_name
    [Documentation]    添加活动 名称 case封装
    [Arguments]    ${name}    ${type}=false    ${parmeter}=false
    delSubtraction    all
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_add_subtraction}
    Wait And Input Text    ${locator_ContentB_edit_input_name}    ${name}
    #.选择所有商品
    subtraction_select_product
    #.设置时间
    subtraction_add_activity_set_time
    Run keyword If    '${type}'<>'false'    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__rendered")[0]
    Run keyword If    '${type}'<>'false'    Wait And Click Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-root li")[1]
    Run keyword If    '${parmeter}'<>'false'    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-inner")[1].click()
    #.输入优惠规则
    subtraction_input_coupon_type    ${input_count}    ${input_percentage}
    Wait And Click Element    ${locator_ContentB_first_btn_save}

subtraction_add_activity_set_time
    [Documentation]    添加活动 设置时间case
    Wait And Click Element    ${locator_ContentB_edit_select_first_time}
    Wait And Click Element    ${locator_ContentB_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[19]
    Wait And Click Element    ${locator_ContentB_edit_select_second_confirm}

    Wait And Click Element    ${locator_ContentB_edit_select_second_time}
    Wait And Click Element    ${locator_ContentB_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[24]
    Wait And Click Element    ${locator_ContentB_edit_select_second_confirm}

subtraction_input_coupon_type
    [Documentation]    添加活动 输入优惠规则
    [Arguments]    ${name}    ${names}
    Wait And Input Text    ${locator_ContentB_edit_input_totalPrice}    ${name}
    Wait And Input Text    ${locator_ContentB_edit_input_cutPrice}    ${names}

subtraction_select_product
    [Documentation]    添加活动 选择商品
    [Arguments]    ${parmeter}=false
    Run keyword If    '${parmeter}'=='false'    Wait And Click Element    dom:document.querySelectorAll("button")[3]

subtraction_check_select_start_time
    [Documentation]    添加活动，检查选择时间
    [Arguments]    ${parmeter}=false
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_add_subtraction}
    #.点击第一个选择时间框
    Wait And Click Element    ${locator_ContentB_edit_select_first_time}
    Wait And Click Element    ${locator_ContentB_edit_select_second_prev_mon}
    ${res_elm}    Get Element Attribute    dom:document.querySelectorAll(".ant-calendar-date")[14]    aria-disabled
    Should Be True    '${res_elm}'=='true'

subtraction_confirm_cancel_alert
    [Documentation]    取消页面填写内容未保存跳走出现的弹窗
    Wait And Click Element    ${locator_ContentB_first_btn_cancel}
    Wait And Click Element    ${locator_ContentB_btn_confirm_determine}

