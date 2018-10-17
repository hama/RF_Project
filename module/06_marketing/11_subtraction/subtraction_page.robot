*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Test Teardown     Teardown Test Case
Force Tags        Subtraction
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
subtraction001
    [Documentation]    进入满减活动界面，查看左上角标题
    [Tags]    P0
    Go To Subtraction Page
    Page Should Contain    ${locatorB_subtraction_header_text}

subtraction002
    [Documentation]    进入全部满减活动界面
    [Tags]    P0
    delSubtraction_fromdb    all
    # 调用添加一个满减活动关键字 - 状态为：进行中
    Add Subtraction Wait Step    1
    Go To Subtraction Page
    Go To Subtraction Page
    Page Should Contain Element    ${locatorB_subtraction_first_tr_eml}
    delSubtraction_fromdb    #.删除满减活动

subtraction003
    [Documentation]    进入未开始满减活动界面
    [Tags]    P0
    #.添加一个未开始的活动
    Add Subtraction Wait Step    2
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_title_not_start}
    Page Should Contain Element    ${locatorB_subtraction_first_tr_eml}
    ${data}    Get Text    ${locatorB_subtraction_get_status_text}
    Should Be True    '${data}'=='未开始'
    delSubtraction_fromdb    #.删除满减活动

subtraction004
    [Documentation]    进入-进行中满减活动界面
    [Tags]    P0
    #.添加一个进行中的活动
    Add Subtraction Wait Step    1
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_title_processing}
    ${data}    Get Text    ${locatorB_subtraction_get_status_text}
    Should Be True    '${data}'=='进行中'
    delSubtraction_fromdb    #.删除满减活动

subtraction005
    [Documentation]    进入已结束满减活动界面
    [Tags]    P0
    #.添加一个已结束的活动
    Add Subtraction Wait Step    3
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_title_end}
    ${data}    Get Text    ${locatorB_subtraction_get_status_text}
    Should Be True    '${data}'=='已结束'
    delSubtraction_fromdb    #.删除满减活动

subtraction010
    [Documentation]    活动状态未开始修改名称 -修改成功
    [Tags]    P0
    delSubtraction_fromdb
    subtraction_common_change_name    gggggg    2

subtraction011
    [Documentation]    活动状态进行中修改名称 -修改成功
    [Tags]    P0
    delSubtraction_fromdb
    subtraction_common_change_name    gggggg    1

subtraction012
    [Documentation]    活动状态已结束修改名称 -修改失败
    [Tags]    P1
    delSubtraction_fromdb
    subtraction_common_change_name    gggggg    3

subtraction013
    [Documentation]    活动状态 "未开始" 设置各时区---点击跳转基础信息 > 可设置成功，活动时间改变
    [Tags]    P0
    subtraction_set_time_zone    2    true

subtraction014
    [Documentation]    活动状态 "进行中" 设置各时区---点击跳转基础信息 > 可设置成功，活动时间改变
    [Tags]    P0
    subtraction_set_time_zone    1    true

subtraction015
    [Documentation]    活动状态已结束设置各时区---点击跳转基础信息 > 可设置成功，活动时间改变
    [Tags]    P1
    subtraction_set_time_zone    3    true

subtraction016
    [Documentation]    活动状态未开始修改开始时间 > 可修改成功
    [Tags]    P0
    subtraction_change_time_end    2

subtraction017
    [Documentation]    活动状态进行中修改开始时间  > 不能修改
    [Tags]    P1
    subtraction_change_time_end    1

subtraction018
    [Documentation]    活动状态已结束修改开始时间  > 不能修改
    [Tags]    P1
    subtraction_change_time_end    3

subtraction019
    [Documentation]    活动状态未开始修改结束时间  > 可修改成功
    [Tags]    P0
    subtraction_change_time_start    2


subtraction020
    [Documentation]    活动状态进行中修改结束时间  > 可修改成功
    [Tags]    P1
    subtraction_change_time_start    1

subtraction021
    [Documentation]    活动状态已结束修改结束时间  > 不能修改
    [Tags]    P1
    subtraction_change_time_start    3

subtraction022
    [Documentation]    活动状态未开始修改优惠类型  > 可修改成功
    [Tags]    P0
    subtraction_change_coupon_type    2

subtraction023
    [Documentation]    活动状态进行中修改优惠类型  > 不可修改
    [Tags]    P1
    subtraction_change_coupon_type    1

subtraction024
    [Documentation]    活动状态已结束修改优惠类型  > 不可修改
    [Tags]    P1
    subtraction_change_coupon_type    3

subtraction025
    [Documentation]     活动状态未开始修改上不封顶  > 可修改成功
    [Tags]    P0
    subtraction_change_not_capped    2

subtraction026
    [Documentation]     活动状态进行中修改上不封顶  > 可修改成功
    [Tags]    P1
    subtraction_change_not_capped    1

subtraction027
    [Documentation]     活动状态已结束修改上不封顶  > 不可修改
    [Tags]    P1
    subtraction_change_not_capped    3

subtraction028
    [Documentation]    活动状态未开始修改优惠规则  > 可修改成功
    [Tags]    P1
    subtraction_change_preferential_rules    2

subtraction029
    [Documentation]    活动状态进行中修改优惠规则  > 不可修改
    [Tags]    P1
    subtraction_change_preferential_rules    1

subtraction030
    [Documentation]    活动状态已结束修改优惠规则  > 不可修改
    [Tags]    P1
    subtraction_change_preferential_rules    3

subtraction031
    [Documentation]    活动状态未开始修改全部商品  > 不能修改
    [Tags]    P1
    subtraction_change_all_product_quantity    2

subtraction032
    [Documentation]    活动状态进行中修改全部商品  > 不能修改
    [Tags]    P1
    subtraction_change_all_product_quantity    1

subtraction033
    [Documentation]    活动状态已结束修改全部商品  > 不能修改
    [Tags]    P1
    subtraction_change_all_product_quantity    3

subtraction034
    [Documentation]    活动状态未开始修改自选商品  > 可修改成功
    [Tags]    P0
    subtraction_change_sub_product_quantity    2    true

subtraction035
    [Documentation]    活动状态进行中修改自选商品  > 可修改成功
    [Tags]    P0
    subtraction_change_sub_product_quantity    1    true

subtraction036
    [Documentation]    活动状态已结束修改自选商品  > 可修改成功
    [Tags]    P0
    subtraction_change_sub_product_quantity    3    true

subtraction037
    [Documentation]    更改内容后，点击右上角取消按钮  > 弹出框，提示放弃当前更改内容
    [Tags]    P0
    subtraction_change_cancel    2

subtraction038
    [Documentation]    弹出框，提示放弃当前更改内容，点击取消  > 返回当前页面且更改不变
    [Tags]    P0
    subtraction_change_cancel    2

subtraction039
    [Documentation]    弹出框，提示放弃当前更改内容，点击确实  > 返回当前页面，保存前的更改清空
    [Tags]    P0
    subtraction_change_cancel    2

#------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------KeyWord----------------------------------------------------------
#------------------------------------------------------------------------------------------------------------------

*** Keywords ***
subtraction_common_change_name
    [Documentation]    修改活动状态case封装
    [Arguments]    ${value}    ${status}    ${paremeter}=False
    Add Subtraction Wait Step    ${status}
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_title_all}
    ${data}    Get Text    dom:document.querySelectorAll("tbody tr td")[1]
    Wait And Click Element    ${locatorB_subtraction_first_tr_eml}
    Run Keyword If    ${status}<>3    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    ${value}
    Run Keyword If    ${status}<>3    Wait And Click Element    ${locatorB_subtraction_first_btn_save}
    ...    ELSE    Page Should Not Contain    保存
    Run Keyword If    '${paremeter}'=='False'    Should Not Be True    '${data}'=='${value}'
    ...    ELSE    Should Be True    '${data}'=='${value}'

subtraction_set_time_zone
    [Documentation]    设置时区case封装
    [Arguments]    ${index}    ${check}
    delSubtraction_fromdb
    #.添加进行中的活动
    Add Subtraction Wait Step    ${index}
    Go To Subtraction Page
    #. 设置时区 - 美属萨摩亚
    Add Subtraction Timezone Wait    ${check}
    Wait And Click Element    ${locatorB_subtraction_title_all}
    Wait And Click Element    ${locatorB_subtraction_first_tr_eml}
    Wait Until Element Is Visible    dom:document.querySelectorAll('.title___1Hp1y span')[0]
    ${res}    Get Text    dom:document.querySelectorAll('.title___1Hp1y span')[0]
    Should Be True    '${res}'=='(GMT - 11:00) 美属萨摩亚，中途岛'

subtraction_change_time_end
    [Documentation]    修改结束时间case封装
    [Arguments]    ${index}
    Common Click First Tr Step    ${index}
    Run Keyword If    ${index}==2    Wait And Click Element    dom:document.querySelectorAll('.ant-input-lg')[1]
    Run Keyword If    ${index}==2    Wait And Click Element    dom:document.querySelectorAll('.ant-calendar-tbody tr td')[25]
    Run Keyword If    ${index}==2    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ...    ELSE    Page Should Not Contain Element    dom:document.querySelectorAll('.ant-calendar-tbody tr td')[25]

subtraction_change_time_start
    [Documentation]    修改开始时间case封装
    [Arguments]    ${index}
    Common Click First Tr Step    ${index}
    Wait And Click Element    ${locatorB_subtraction_edit_select_first_time}
    Run Keyword If    ${index}==2    Wait And Click Element    dom:document.querySelectorAll('.ant-calendar-tbody tr td')[17]
    Run Keyword If    ${index}==2    Wait And Click Element    dom:document.querySelectorAll("button")[1]

    ...    ELSE    Page Should Not Contain Element    dom:document.querySelectorAll('.ant-calendar-tbody tr td')[17]

subtraction_change_coupon_type
    [Documentation]    修改优惠类型case封装
    [Arguments]    ${index}
    Common Click First Tr Step    ${index}
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__rendered")[0]

    Run Keyword If    ${index}==2    Wait And Click Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-root li")[1]
    Run Keyword If    ${index}==2    Wait And Input Text    ${locatorB_subtraction_edit_input_totalPrice}    ${input_count}
    Run Keyword If    ${index}==2    Wait And Input Text    ${locatorB_subtraction_edit_input_cutPrice}    ${input_percentage}
    Run Keyword If    ${index}==2    Wait And Click Element    ${locatorB_subtraction_first_btn_save}
    ...    ELSE    Page Should Not Contain    ${locatorB_subtraction_edit_text_save}

subtraction_change_not_capped
    [Documentation]    修改上不封顶case封装
    [Arguments]    ${index}
    #.点击第一个tr的内容
    Common Click First Tr Step    ${index}
    Wait And Click Element    ${locatorB_subtraction_edit_checkbox_capped}
    Run Keyword If    ${index}==3    Page Should Not Contain    ${locatorB_subtraction_edit_text_save}
    ...    ELSE    Wait And Click Element    ${locatorB_subtraction_first_btn_save}

subtraction_change_preferential_rules
    [Documentation]    修改优惠规则case封装
    [Arguments]    ${index}
    #.点击第一个tr的内容
    Common Click First Tr Step    ${index}
    Run Keyword If    ${index}==2    Wait And Input Text    ${locatorB_subtraction_edit_input_totalPrice}    ${input_count}
    Run Keyword If    ${index}==2    Wait And Input Text    ${locatorB_subtraction_edit_input_cutPrice}    ${input_percentage}
    Run Keyword If    ${index}==2    Wait And Click Element    ${locatorB_subtraction_first_btn_save}
    ...    ELSE    Page Should Not Contain    ${locatorB_subtraction_edit_text_save}

subtraction_change_all_product_quantity
    [Documentation]    修改满减所有商品规则case封装
    [Arguments]    ${index}
    #.点击第一个tr的内容
    Common Click First Tr Step    ${index}
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    ${undefined}    Execute JavaScript    return document.querySelectorAll("button p")[4]===undefined
    Run Keyword If    '${undefined}'=='False'    Wait And Click Element    dom:document.querySelectorAll("button p")[4]
    Run Keyword If    ${index}==2    Wait And Click Element    dom:document.querySelectorAll(".list___3_zLt div label")[0]
    Run Keyword If    ${index}==2    Wait And Click Element    dom:document.querySelectorAll("button")[6]
    Run Keyword If    ${index}==2    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody")
    #Run Keyword If    ${index}==2    ${length}=    Execute JavaScript    return document.querySelectorAll(".ant-table-tbody tr").length
    #Run Keyword If    ${index}==2    Should Be True    ${length}==2
    ...    ELSE    Page Should Not Contain    ${locatorB_subtraction_edit_text_save}

subtraction_change_sub_product_quantity
    [Documentation]    修改满减部分商品规则case封装
    [Arguments]    ${index}    ${type}=${Empty}
    #.点击第一个tr的内容
    Common Click First Tr Step    ${index}    ${type}
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    ${undefined}    Execute JavaScript    return document.querySelectorAll("button p")[4]===undefined
    Run Keyword If    '${undefined}'=='False'    Execute JavaScript    return document.querySelectorAll("button p")[4].click()
    Run Keyword If    ${index}<>3    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-checkbox-wrapper")[3]
    Run Keyword If    ${index}<>3    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-wrapper")[3].click()
    Run Keyword If    ${index}<>3    Execute JavaScript    return document.getElementsByClassName("handleSubmit___1JL8t")[0].scrollIntoView()
    Run Keyword If    ${index}<>3    Wait And Click Element    ${locatorB_subtraction_edit_select_product_save}
    Run Keyword If    ${index}<>3    Wait And Click Element    ${locatorB_subtraction_first_btn_save}
    ...    ELSE    Page Should Not Contain    ${locatorB_subtraction_edit_text_save}

subtraction_change_cancel
    [Documentation]    修改页面内容case封装
    [Arguments]    ${index}    ${confirm}=false    ${type}=${Empty}
    ${name}    Set Variable    自动化测试
    #.点击第一个tr的内容
    Common Click First Tr Step    ${index}    ${type}
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    ${name}
    Wait And Click Element    ${locatorB_subtraction_first_btn_cancel}
    Run Keyword If    '${confirm}'=='false'    Wait Until Page Contains    放弃当前更改内容？
    Run Keyword If    '${confirm}'=='false'    Wait And Click Element    ${locatorB_subtraction_confirm_cancel_btn}
    Run Keyword If    '${confirm}'=='false'    Wait And Click Element    ${locatorB_marketing_subtraction}
    Run Keyword If    '${confirm}'=='false'    Alert Should Be Present
    ...    ELSE    Wait And Click Element    ${locatorB_subtraction_confirm_determine_btn}






