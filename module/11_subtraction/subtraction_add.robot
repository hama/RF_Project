*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Force Tags        Subtraction
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/variable/var_subtraction.robot
Resource          ../../resources/keywords/kw_add_order.robot
Resource          ../../resources/keywords/kw_order.robot
Resource          ../../resources/keywords/kw_products.robot
Resource          ../../resources/keywords/kw_subtraction.robot
Library           ${CURDIR}/../../lib/customlib/kwmarketing.py


*** Test Cases ***
lklklklklk
    delSubtraction_fromdb
    Add Subtraction Wait Step    2
    Go To Subtraction Page
    #.输入100
    Wait And Input Text    dom:document.querySelectorAll(".ant-input")[0]    100
    #.点击重置
    Wait And Click Element    dom:document.querySelectorAll("button")[2]
    ${res_data}    Execute JavaScript    return document.querySelectorAll(".ant-input")[0].value===''
    Should Be True    '${res_data}'=='True'
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
    Confirm Cancel Alert

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
    Confirm Cancel Alert

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
    Confirm Cancel Alert

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
    Confirm Cancel Alert

subtraction055
    [Documentation]    活动时间选择长期  > 结束时间为空
    [Tags]    P0
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}
    Subtraction Add Activity Set Time
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-input-lg")[1].value===''
    Should Be True    '${res}'=='True'
    Confirm Cancel Alert

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
    delSubtraction_fromdb    all
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
    Confirm Cancel Alert

subtraction061
    [Documentation]    满额减元优惠条件为0  > 不能保存
    [Tags]    P0
    Subtraction Check Preferential Conditions    0    0
    Confirm Cancel Alert

subtraction062
    [Documentation]    满额减元优惠条件＞0  > 可以提交成功
    [Tags]    P0
    Subtraction Check Preferential Conditions    10    1    true

subtraction063
    [Documentation]    满额减元优惠条件输入非数字字符  > 下方提示“最多输入9位整数，两位小数”
    [Tags]    P1
    Subtraction Check Preferential Conditions    @#$    @
    Confirm Cancel Alert

subtraction066
    [Documentation]    满额减元优惠内容为优惠金额小于优惠条件  > 可以提交成功
    [Tags]    P0
    Subtraction Check Preferential Conditions    10    2    true

subtraction067
    [Documentation]    满额减元优惠内容为优惠金额大于优惠条件  > 提交时提示优惠内容为优惠金额不能大于优惠条件
    [Tags]    P1
    Subtraction Check Preferential Conditions    10    11
    Confirm Cancel Alert

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
    Confirm Cancel Alert

subtraction107
    [Documentation]    商品筛选专辑选择专辑A  > 筛选成功
    [Tags]    P0
    Subtraction Check Product Filter
    Wait And Click Element    ${locatorB_subtraction_selectPro_allAblum}
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[1]===undefined
    Should Be True    '${res}'=='True'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Confirm Cancel Alert

subtraction108
    [Documentation]    商品筛选状态选择全部  > 筛选成功
    [Tags]    P0
    Subtraction Check Product Filter
    Wait And Click Element    ${locatorB_subtraction_selectPro_allStatus}
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[2]===undefined
    Should Be True    '${res}'=='True'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Confirm Cancel Alert

subtraction109
    [Documentation]    商品筛选状态选择上架  > 筛选成功
    [Tags]    P0
    Subtraction Check Product Filter
    Wait And Click Element    ${locatorB_subtraction_selectPro_allStatus}
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[3]===undefined
    Should Be True    '${res}'=='True'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Confirm Cancel Alert

subtraction110
    [Documentation]    商品筛选状态选择下架  > 筛选成功
    [Tags]    P0
    Subtraction Check Product Filter
    Wait And Click Element    ${locatorB_subtraction_selectPro_allStatus}
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[4]===undefined
    Should Be True    '${res}'=='True'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Confirm Cancel Alert

subtraction111
    [Documentation]    输入框输入任意关键字，点击搜索/按enter  > 搜索成功
    [Tags]    P0
    Subtraction Check Product Filter
    ${get_values}    Execute JavaScript    return document.querySelectorAll(".list_li_content___1ZXgo div span")[0].innerText
    Wait And Input Text    ${locatorB_subtraction_input_search}    ${get_values}
    Wait And Click Element    ${locatorB_subtraction_selectPro_search_bth}
    ${res_values}    Execute JavaScript    return document.querySelectorAll(".list_li_content___1ZXgo div span")[0].innerText
    Should Be True    '${get_values}'=='${res_values}'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Confirm Cancel Alert

subtraction112
    [Documentation]    输入字符“0”，点击搜索/按enter  > 搜索成功
    [Tags]    P0
    Subtraction Check Product Filter
    Wait And Input Text    ${locatorB_subtraction_input_search}    0
    Wait And Click Element    ${locatorB_subtraction_selectPro_search_bth}
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Confirm Cancel Alert

subtraction113
    [Documentation]    点击重置  > 恢复默认搜索
    [Tags]    P1
    Subtraction Check Product Filter
    Wait And Input Text    ${locatorB_subtraction_input_search}    0
    Wait And Click Element    ${locatorB_subtraction_selectPro_search_bth}
    Wait And Click Element    dom:document.querySelectorAll("button")[7]
    ${data}    Execute JavaScript    return document.querySelectorAll('input[placeholder="请输入搜索内容"]')[0].value===''
    Should Be True    '${data}'=='True'
    Wait And Click Element    ${locatorB_subtraction_comm_close}
    Confirm Cancel Alert

subtraction121
    [Documentation]    商品从上往下依次退出活动  > 退出成功
    [Tags]    P0
    Subtraction Product Quit Subtraction    1

subtraction124
    [Documentation]    商品退出后保存，查看商品列表和活动列表中商品数量  > 数量更新
    [Tags]    P1
    Subtraction Product Quit Subtraction    1    true

subtraction125
    [Documentation]    未选中商品，点击保存 > 点击保存，弹出提示“请选择商品”
    [Tags]    P0
    Common Step
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    自动化测试
    #.设置时间
    Subtraction Add Activity Set Time
    Subtraction Input Coupon Type    19    2
    Wait And Click Element    ${locatorB_subtraction_first_btn_save}
    Wait Until Page Contains    请选择商品

subtraction127
    [Documentation]    存在进行中活动 > 提前结束活动，点击确定  > 活动由进行中的状态变为已结束
    [Tags]    P0
    delSubtraction_fromdb
    Add Subtraction Wait Step    1
    Go To Subtraction Page
    Wait And Click Element    dom:document.querySelectorAll("tbody tr:nth-child(1) td div i")[1]
    Wait And Click Element    dom:document.querySelectorAll("button")[5]
    ${data}    Get Text    dom:document.querySelectorAll("tbody tr:nth-child(1) td p")[2]
    Should Be True    '${data}'=='已结束'

subtraction128
    [Documentation]    存在进行中活动 > 提前结束活动，点击取消  > 保持原状
    [Tags]    P1
    delSubtraction_fromdb
    Add Subtraction Wait Step    1
    Go To Subtraction Page
    Wait And Click Element    dom:document.querySelectorAll("tbody tr:nth-child(1) td div i")[1]
    Wait And Click Element    dom:document.querySelectorAll("button")[4]
    ${data}    Get Text    dom:document.querySelectorAll("tbody tr:nth-child(1) td p")[2]
    Should Be True    '${data}'=='进行中'

subtraction129
    [Documentation]    存在未开始活动 > 删除活动，点击确定 > 活动删除成功
    [Tags]    P0
    delSubtraction_fromdb
    Add Subtraction Wait Step    2
    Go To Subtraction Page
    Wait And Click Element    dom:document.querySelectorAll("tbody tr:nth-child(1) td div i")[1]
    Wait And Click Element    dom:document.querySelectorAll("button")[5]
    ${data}    Execute JavaScript    return document.querySelectorAll("tbody tr td")[0]===undefined
    Should Be True    '${data}'=='True'

subtraction130
    [Documentation]    存在未开始活动 > 删除活动，点击取消 > 保持原状
    [Tags]    P0
    delSubtraction_fromdb
    Add Subtraction Wait Step    2
    Go To Subtraction Page
    Wait And Click Element    dom:document.querySelectorAll("tbody tr:nth-child(1) td div i")[1]
    Wait And Click Element    dom:document.querySelectorAll("button")[4]
    ${data}    Execute JavaScript    return document.querySelectorAll("tbody tr td")[0]===undefined
    Should Be True    '${data}'=='False'

subtraction131
    [Documentation]    输入关键字为名称，点击搜索/按enter > 搜索成功
    [Tags]    P0
    delSubtraction_fromdb
    Add Subtraction Wait Step    2
    Go To Subtraction Page
    ${name}    Get Text    dom:document.querySelectorAll("tbody tr:nth-child(1) td")[1]
    Wait And Input Text    dom:document.querySelectorAll(".ant-input")[0]    ${name}
    #.点击搜索
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${res_name}    Get Text    dom:document.querySelectorAll("tbody tr:nth-child(1) td")[1]
    Should Be True    '${name}'=='${res_name}'

subtraction132
    [Documentation]    输入关键字为编号，点击搜索/按enter > 搜索成功
    [Tags]    P0
    delSubtraction_fromdb
    Add Subtraction Wait Step    2
    Go To Subtraction Page
    ${name}    Get Text    dom:document.querySelectorAll("tbody tr:nth-child(1) td")[0]
    Wait And Input Text    dom:document.querySelectorAll(".ant-input")[0]    ${name}
    #.点击搜索
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${res_name}    Get Text    dom:document.querySelectorAll("tbody tr:nth-child(1) td")[0]
    Should Be True    '${name}'=='${res_name}'

subtraction133
    [Documentation]    输入字符“0”，点击搜索/按enter > 搜索成功
    [Tags]    P1
    delSubtraction_fromdb
    Add Subtraction Wait Step    2
    Go To Subtraction Page
    Wait And Input Text    dom:document.querySelectorAll(".ant-input")[0]    0
    #.点击搜索
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${res_data}    Execute JavaScript    return document.querySelectorAll("tbody tr:nth-child(1) td")[0]===undefined
    Should Be True    '${res_data}'=='True'

subtraction134
    [Documentation]    点击类型满额减元 > 搜索成功
    [Tags]    P0
    delSubtraction_fromdb
    Add Subtraction Wait Step    2
    Go To Subtraction Page
    #.点击选择满额减元
    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[0]
    Execute JavaScript    return document.querySelectorAll(".ant-select-dropdown-menu-item")[1]
    #.点击搜索
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${res_data}    Execute JavaScript    return document.querySelectorAll("tbody tr:nth-child(1) td")[0]===undefined
    Should Be True    '${res_data}'=='False'

subtraction136
    [Documentation]    点击重置 > 搜索成功
    [Tags]    P0
    delSubtraction_fromdb
    Add Subtraction Wait Step    2
    Go To Subtraction Page
    #.输入100
    Wait And Input Text    dom:document.querySelectorAll(".ant-input")[0]    100
    #.点击重置
    Wait And Click Element    dom:document.querySelectorAll("button")[2]
    ${res_data}    Execute JavaScript    return document.querySelectorAll(".ant-input")[0].value===''
    Should Be True    '${res_data}'=='True'


#------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------KeyWord----------------------------------------------------------
#------------------------------------------------------------------------------------------------------------------


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
    Run keyword If    '${parmeter}'=='false'    Confirm Cancel Alert


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

Subtraction Product Quit Subtraction
    [Documentation]    添加活动 商品退出活动case封装
    [Arguments]    ${length}    ${parmeter}=false
    Common Step
    Wait And Input Text    ${locatorB_subtraction_edit_input_name}    自动化测试
    #.设置时间
    Subtraction Add Activity Set Time
    #.输入优惠规则
    Subtraction Input Coupon Type    ${input_count}    ${input_percentage}
    #.选择部分商品
    Subtraction Select SubProduct
    Wait Until Page Contains    选择商品
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[22].click()
    Wait And Click Element    dom:document.querySelectorAll("button")[9]
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody")[0]
    :FOR    ${i}    IN RANGE    ${length}
    \    ${x}    Evaluate    ${i}+1
    \    Wait And Click Element    dom:document.querySelectorAll("tbody tr:nth-child(${x}) td")[5]
    Run keyword If    '${parmeter}'=='false'    Confirm Cancel Alert
    ...    ELSE    Wait And Click Element    ${locatorB_subtraction_first_btn_save}


Common Step
    [Documentation]    公共步骤
    delSubtraction_fromdb    all
    Go To Subtraction Page
    Wait And Click Element    ${locatorB_subtraction_add_subtraction}


