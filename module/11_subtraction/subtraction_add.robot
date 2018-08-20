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
    Subtraction Add Activity Name    自动化测试

subtraction041
    [Documentation]    活动名称输入英文字符  > 可以成功输入，并保存
    [Tags]    P1
    Subtraction Add Activity Name    zidonghua

subtraction042
    [Documentation]    活动名称输入特殊符号字符  > 可以成功输入，并保存
    [Tags]    P1
    Subtraction Add Activity Name    @#$%

subtraction043
    [Documentation]    活动名称输入数字字符  > 可以成功输入，并保存
    [Tags]    P1
    Subtraction Add Activity Name    99999

subtraction044
    [Documentation]    活动名称输入混合（包括中英文，特殊符号，数字）字符  > 可以成功输入，并保存
    [Tags]    P1
    Subtraction Add Activity Name    dd@@11

subtraction045
    [Documentation]    名称为空保存  > 保存失败
    [Tags]    P1
    Subtraction Add Activity Name    $Empty

subtraction046
    [Documentation]    活动名称输入1-25个字符  > 可以成功输入，并保存
    [Tags]    P1
    Subtraction Add Activity Name    123456789123456789123456

subtraction047
    [Documentation]    活动名称输入26以上个字符  > 可以成功输入，并保存
    [Tags]    P1
    Subtraction Add Activity Name    123456789123456789123456789

subtraction049
    [Documentation]    开始时间设置为早于当前时间  > 不能设置
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}
    #.点击第一个选择时间框
    Wait And Click Element    ${locatorB_subtraction_edit_select_first_time}
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_prev_mon}
    ${res_elm}    Get Element Attribute    dom:document.querySelectorAll(".ant-calendar-date")[14]    aria-disabled
    Should Be True    '${res_elm}'=='true'

subtraction050
    [Documentation]    开始时间设置为等于或大于当前时间  > 可以设置
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}
    #.点击第一个选择时间框
    Wait And Click Element    ${locatorB_subtraction_edit_select_first_time}
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[19]
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_confirm}
    Subtraction Confirm Cancel Alert

subtraction051
    [Documentation]    开始时间为空保存  > 下方提示“请选择时间”
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    自动化测试
    #.选择所有商品
    Subtraction Select Product
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_time}
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[24]
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_confirm}
    Subtraction Input Coupon Type    ${input_count}    ${input_percentage}
    Wait And Click Element    ${locatorB_subtraction_first_btn_save}
    Wait Until Page Contains Element    ${locatorB_subtraction_edit_common_error}
    Subtraction Confirm Cancel Alert

subtraction052
    [Documentation]    结束时间设置为等于或早于开始时间 > 不能设置
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}
    #.点击第一个选择时间框
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_time}
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_prev_mon}
    ${res_elm}    Get Element Attribute    dom:document.querySelectorAll(".ant-calendar-date")[14]    aria-disabled
    Should Be True    '${res_elm}'=='true'

subtraction053
    [Documentation]    结束时间设置为大于开始时间  > 可以设置
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}
    #.点击第一个选择时间框
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_time}
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[19]
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_confirm}
    Subtraction Confirm Cancel Alert

subtraction054
    [Documentation]    结束时间为空保存  > 下方提示“请选择时间”
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    自动化测试
    #.选择所有商品
    Subtraction Select Product
    Wait And Click Element    ${locatorB_subtraction_edit_select_first_time}
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[24]
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_confirm}
    Subtraction Input Coupon Type    ${input_count}    ${input_percentage}
    Wait And Click Element    ${locatorB_subtraction_first_btn_save}
    Wait Until Page Contains Element    ${locatorB_subtraction_edit_common_error}
    Subtraction Confirm Cancel Alert

subtraction055
    [Documentation]    活动时间选择长期  > 结束时间为空
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}
    Subtraction Add Activity Set Time
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-input-lg")[1].value===''
    Should Be True    '${res}'=='True'
    Subtraction Confirm Cancel Alert

subtraction057
    [Documentation]    优惠类型选择满件打折  > 设置成功
    [Tags]    P0
    Subtraction Add Activity Name    自动化测试    true

subtraction058
    [Documentation]    选择满额减元，勾选上不封顶  > 设置成功
    [Tags]    P0
    Subtraction Add Activity Name    自动化测试    false    true

subtraction059
    [Documentation]    下方添加多个层级，勾选上不封顶  > "3、提示选择上不封顶，只有优惠层级1生效，其他都会失效4、下方除了层级1，其他层级消失"
    [Tags]    P0
    delSubtraction    all
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    自动化测试
    #.选择所有商品
    Subtraction Select Product
    #.设置时间
    Subtraction Add Activity Set Time
    #.输入优惠规则
    Subtraction Input Coupon Type    ${input_count}    ${input_percentage}
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-inner")[1].click()
    Execute JavaScript    ${locatorB_subtraction_edit_add_level}
    Wait Until Page Contains    新增优惠层级，上不封顶功能将会失效。请确认是否新增
    Execute JavaScript    return location.reload()
    Alert Should Be Present
    Go To Subtraction Page

subtraction060
    [Documentation]    满额减元优惠条件为空  > 提交时下方提示不能为空
    [Tags]    P0
    Subtraction Check Preferential Conditions    ${Empty}    ${Empty}
    Subtraction Confirm Cancel Alert

subtraction061
    [Documentation]    满额减元优惠条件为0  > 不能保存
    [Tags]    P0
    Subtraction Check Preferential Conditions    0    0
    Subtraction Confirm Cancel Alert

subtraction062
    [Documentation]    满额减元优惠条件＞0  > 可以提交成功
    [Tags]    P0
    Subtraction Check Preferential Conditions    10    1    true

subtraction063
    [Documentation]    满额减元优惠条件输入非数字字符  > 下方提示“最多输入9位整数，两位小数”
    [Tags]    P1
    Subtraction Check Preferential Conditions    @#$    @
    Subtraction Confirm Cancel Alert

subtraction066
    [Documentation]    满额减元优惠内容为优惠金额小于优惠条件  > 可以提交成功
    [Tags]    P0
    Subtraction Check Preferential Conditions    10    2    true

subtraction067
    [Documentation]    满额减元优惠内容为优惠金额大于优惠条件  > 提交时提示优惠内容为优惠金额不能大于优惠条件
    [Tags]    P1
    Subtraction Check Preferential Conditions    10    11
    Subtraction Confirm Cancel Alert

subtraction069
    [Documentation]    满额减元添加层级2  > 可以添加成功
    [Tags]    P1
    Subtraction Check Add Level    2

subtraction070
    [Documentation]    满额减元添加层级3  > 可以添加成功
    [Tags]    P1
    Subtraction Check Add Level    3

subtraction071
    [Documentation]    满额减元添加层级4  > 可以添加成功
    [Tags]    P1
    Subtraction Check Add Level    4

subtraction072
    [Documentation]    满额减元添加层级5  > 可以添加成功
    [Tags]    P1
    Subtraction Check Add Level    5

subtraction073
    [Documentation]    满额减元添加层级6  > 可以添加成功
    [Tags]    P1
    Subtraction Check Add Level    6

subtraction074
    [Documentation]    满额减元删除层级1  > 不能删除
    [Tags]    P1
    Subtraction Check Del Level    1

subtraction075
    [Documentation]    满额减元删除层级2  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    2

subtraction076
    [Documentation]    满额减元删除层级3  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    3

subtraction077
    [Documentation]    满额减元删除层级4  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    4

subtraction078
    [Documentation]    满额减元删除层级5  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    5

subtraction079
    [Documentation]    满额减元删除层级6  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    6

subtraction080
    [Documentation]    满件打折优惠条件为空  > 提交时下方提示不能为空
    [Tags]    P1
    Subtraction Check Full Discount    ${Empty}    ${Empty}

subtraction081
    [Documentation]    满件打折优惠条件为0  > 提交时下方提示不能为0
    [Tags]    P1
    Subtraction Check Full Discount    0    0

subtraction082
    [Documentation]    满件打折优惠条件0.1  > 提交时下方提示只能输入整数
    [Tags]    P1
    Subtraction Check Full Discount    0.1    0.1

subtraction083
    [Documentation]    满件打折优惠条件≥1  > 提交成功
    [Tags]    P1
    Subtraction Check Full Discount    1    1    true

subtraction084
    [Documentation]    满件打折优惠条件输入非数字字符  > 下方提示“只能输入整数”
    [Tags]    P1
    Subtraction Check Full Discount    @#$%^    @#$%

subtraction087
    [Documentation]    满件打折优惠条件输入非数字字符  > 下方提示“只能输入整数”
    [Tags]    P1
    Subtraction Check Full Discount    100    100

subtraction089
    [Documentation]    满件打折优惠条件输入非数字字符  > 下方提示“只能输入整数”
    [Tags]    P1
    Subtraction Check Full Discount    99    1

subtraction091
    [Documentation]    满件打折添加层级2  > 可以添加成功
    [Tags]    P1
    Subtraction Check Add Level    2    true

subtraction092
    [Documentation]    满件打折添加层级3  > 可以添加成功
    [Tags]    P1
    Subtraction Check Add Level    3    true

subtraction093
    [Documentation]    满件打折添加层级4  > 可以添加成功
    [Tags]    P1
    Subtraction Check Add Level    4    true

subtraction094
    [Documentation]    满件打折添加层级5  > 可以添加成功
    [Tags]    P1
    Subtraction Check Add Level    5    true

subtraction095
    [Documentation]    满件打折添加层级6  > 可以添加成功
    [Tags]    P1
    Subtraction Check Add Level    6    true

subtraction096
    [Documentation]    满额减元删除层级1  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    1    true

subtraction097
    [Documentation]    满额减元删除层级2  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    2    true

subtraction098
    [Documentation]    满额减元删除层级3  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    3    true

subtraction099
    [Documentation]    满额减元删除层级4  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    4    true

subtraction100
    [Documentation]    满额减元删除层级5  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    5    true

subtraction101
    [Documentation]    满额减元删除层级6  > 能删除
    [Tags]    P1
    Subtraction Check Del Level    6    true

subtraction105
    [Documentation]    未设置时间  > 添加活动--选择部分商品 >> 弹出提示“请先选择活动时间
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}
    Wait And Click Element    dom:document.querySelectorAll(".li_checked___2b5W1")[0]
    Wait Until Page Contains    请先选择活动时间

subtraction106
    [Documentation]    商品筛选专辑选择全部  > 筛选成功
    [Tags]    P0
    Subtraction Check Product Filter
    Wait And Click Element    ${locatorB_subtraction_selectPro_allAblum}
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[0]===undefined
    Should Be True    '${res}'=='True'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Subtraction Confirm Cancel Alert

subtraction107
    [Documentation]    商品筛选专辑选择专辑A  > 筛选成功
    [Tags]    P0
    Subtraction Check Product Filter
    Wait And Click Element    ${locatorB_subtraction_selectPro_allAblum}
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[1]===undefined
    Should Be True    '${res}'=='True'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Subtraction Confirm Cancel Alert

subtraction108
    [Documentation]    商品筛选状态选择全部  > 筛选成功
    [Tags]    P0
    Subtraction Check Product Filter
    Wait And Click Element    ${locatorB_subtraction_selectPro_allStatus}
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[2]===undefined
    Should Be True    '${res}'=='True'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Subtraction Confirm Cancel Alert

subtraction109
    [Documentation]    商品筛选状态选择上架  > 筛选成功
    [Tags]    P0
    Subtraction Check Product Filter
    Wait And Click Element    ${locatorB_subtraction_selectPro_allStatus}
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[3]===undefined
    Should Be True    '${res}'=='True'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Subtraction Confirm Cancel Alert

subtraction110
    [Documentation]    商品筛选状态选择下架  > 筛选成功
    [Tags]    P0
    Subtraction Check Product Filter
    Wait And Click Element    ${locatorB_subtraction_selectPro_allStatus}
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[4]===undefined
    Should Be True    '${res}'=='True'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Subtraction Confirm Cancel Alert



*** Keywords ***
Subtraction Add Activity Name
    [Documentation]    添加活动 名称 case封装
    [Arguments]    ${name}    ${type}=false    ${parmeter}=false
    Common Step
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    ${name}
    #.选择所有商品
    Subtraction Select Product
    #.设置时间
    Subtraction Add Activity Set Time
    Run keyword If    '${type}'<>'false'    Wait And Click Element    ${locatorB_subtraction_select_fullDiscount}
    Run keyword If    '${type}'<>'false'    Wait And Click Element    ${locatorB_subtraction_select_fullDiscountData}
    Run keyword If    '${parmeter}'<>'false'    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-inner")[1].click()
    #.输入优惠规则
    Subtraction Input Coupon Type    ${input_count}    ${input_percentage}

    Wait And Click Element    ${locatorB_subtraction_first_btn_save}

Subtraction Add Activity Set Time
    [Documentation]    添加活动 设置时间case
    Wait And Click Element    ${locatorB_subtraction_edit_select_first_time}
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[19]
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_confirm}

    Wait And Click Element    ${locatorB_subtraction_edit_select_second_time}
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_next_mon}
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[24]
    Wait And Click Element    ${locatorB_subtraction_edit_select_second_confirm}

Subtraction Input Coupon Type
    [Documentation]    添加活动 输入优惠规则
    [Arguments]    ${name}    ${names}
    Wait And Input Text    ${locatorB_subtraction_edit_input_totalPrice}    ${name}
    Wait And Input Text    ${locatorB_subtraction_edit_input_cutPrice}    ${names}

Subtraction Input Add Level
    [Documentation]    添加活动 添加层级-1
    [Arguments]    ${elm_total}    ${elm_cutprice}    ${name1}    ${name2}
    Wait And Input Text    ${elm_total}    ${name1}
    Wait And Input Text    ${elm_cutprice}    ${name2}

Subtraction Select Product
    [Documentation]    添加活动 选择所有商品
    [Arguments]    ${parmeter}=false
    Run keyword If    '${parmeter}'=='false'    Wait And Click Element    dom:document.querySelectorAll("button")[3]

Subtraction Select SubProduct
    [Documentation]    添加活动 选择部分商品
    [Arguments]    ${parmeter}=false
    Run keyword If    '${parmeter}'=='false'    Wait And Click Element    dom:document.querySelectorAll("button")[4]


Subtraction Check Preferential Conditions
    [Documentation]    添加活动 优惠条件case封装
    [Arguments]    ${name}    ${value}    ${parmeter}=false
    Common Step
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    自动化测试
    #.选择所有商品
    Subtraction Select Product
    #.设置时间
    Subtraction Add Activity Set Time
    Subtraction Input Coupon Type    ${name}    ${value}
    Wait And Click Element    ${locatorB_subtraction_first_btn_save}
    Run keyword If    '${parmeter}'=='false'    Wait Until Page Contains Element    ${locatorB_subtraction_edit_common_error}

Subtraction Check Full Discount
    [Documentation]    添加活动 满件打折case封装
    [Arguments]    ${name}    ${value}    ${parmeter}=false
    Common Step
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    自动化测试
    #.选择所有商品
    Subtraction Select Product
    #.设置时间
    Subtraction Add Activity Set Time
    Wait And Click Element    ${locatorB_subtraction_select_fullDiscount}
    Wait And Click Element    ${locatorB_subtraction_select_fullDiscountData}
    Subtraction Input Coupon Type    ${name}    ${value}
    Wait And Click Element    ${locatorB_subtraction_first_btn_save}
    Run keyword If    '${parmeter}'=='false'    Wait Until Page Contains Element    ${locatorB_subtraction_edit_common_error}
    Run keyword If    '${parmeter}'=='false'    Subtraction Confirm Cancel Alert


add_level
    [Documentation]    添加层级方法
    [Arguments]    ${length}
    :FOR    ${i}    IN RANGE    ${length}
    \    ${x}    set variable    ${i}
    \    ${level_price}    Evaluate    ${i}+5
    \    ${level_cutprice}    Evaluate    ${i}+3
    \    ${elm_price}    Evaluate    str('id:totalPrice')+str(${x})
    \    ${elm_cutprice}    Evaluate    str('id:cutPrice')+str(${x})
    \    Run keyword If    ${x}<>0    Execute JavaScript    ${locatorB_subtraction_edit_add_level}
    \    Subtraction Input Add Level    ${elm_price}    ${elm_cutprice}    ${level_price}    ${level_cutprice}

del_level
    [Documentation]    删除层级方法
    [Arguments]    ${length}
    :FOR    ${i}    IN RANGE    ${length}
    \    ${del_len}    Execute JavaScript    return document.querySelectorAll(".delete_icon___2AQqo").length
    \    Run keyword If    ${del_len}<>0    Wait And Click Element    ${locatorB_subtraction_edit_del_level}

Subtraction Check Add Level
    [Documentation]    添加活动 添加层级case封装
    [Arguments]    ${length}    ${parmeter}=false
    Common Step
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    自动化测试
    #.选择所有商品
    Subtraction Select Product
    #.设置时间
    Subtraction Add Activity Set Time
    Run keyword If    '${parmeter}'<>'false'    Wait And Click Element    ${locatorB_subtraction_select_fullDiscount}
    Run keyword If    '${parmeter}'<>'false'    Wait And Click Element    ${locatorB_subtraction_select_fullDiscountData}
    Subtraction Input Coupon Type    ${input_count}    ${input_percentage}
    add_level    ${length}
    Wait And Click Element    ${locatorB_subtraction_first_btn_save}

Subtraction Check Del Level
    [Documentation]    添加活动 删除层级case封装
    [Arguments]    ${length}    ${parmeter}=false
    Common Step
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    自动化测试
    #.选择所有商品
    Subtraction Select Product
    #.设置时间
    Subtraction Add Activity Set Time
    Run keyword If    '${parmeter}'<>'false'    Wait And Click Element    ${locatorB_subtraction_select_fullDiscount}
    Run keyword If    '${parmeter}'<>'false'    Wait And Click Element    ${locatorB_subtraction_select_fullDiscountData}
    Subtraction Input Coupon Type    ${input_count}    ${input_percentage}
    add_level    6
    del_level    ${length}
    Wait And Click Element    ${locatorB_subtraction_first_btn_save}

Subtraction Check Product Filter
    [Documentation]    添加活动 商品筛选case封装
    Common Step
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    自动化测试
    #.设置时间
    Subtraction Add Activity Set Time
    #.输入优惠规则
    Subtraction Input Coupon Type    ${input_count}    ${input_percentage}
    #.选择部分商品
    Subtraction Select SubProduct
    Wait Until Page Contains    选择商品


Subtraction Confirm Cancel Alert
    [Documentation]    取消页面填写内容未保存跳走出现的弹窗
    Wait And Click Element    ${locatorB_subtraction_first_btn_cancel}
    Wait And Click Element    ${locatorB_subtraction_confirm_determine_btn}

Common Step
    [Documentation]    公共步骤
    delSubtraction    all
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}


