*** Settings ***
Suite Setup       New Test Suite Browser And Login    15220581724    123456    chen
Suite Teardown    #Close Test Suite Browser
Resource          ../../resources/kw_browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/var_tax_price.robot
Resource          ../../resources/kw_common.robot
Resource          ../../resources/kw_add_order.robot
Library           SeleniumLibrary
Library           customLibrary
Resource          ./common.robot
Resource          ../../resources/var_order.robot

*** Test Cases ***
order_list_page
    [Documentation]    订单列表列出所有状态按钮
    [Tags]    P1
    Add Order
    Go To    ${home_page}
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Page Should Contain Element    ${order_all_btn}
    Page Should Contain Element    ${order_already_pay_btn}
    Page Should Contain Element    ${order_alerady_send_btn}
    Page Should Contain Element    ${order_alerady_mission_btn}
    Page Should Contain Element    ${order_not_payment_btn}
    Page Should Contain Element    ${order_alerady_cencel_btn}

order_all_list_page
    [Documentation]    点击全部
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${order_list_btn}
    page should contain element    dom:document.querySelectorAll(".ant-radio-button-wrapper-checked")

order_be_delivered_page
    [Documentation]    点击待发货
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_delivered_btn}
    page should contain element    dom:document.querySelectorAll(".ant-radio-button-wrapper-checked")

order_alerady_send_page
    [Documentation]    点击已发货
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_alerady_send_btn}
    page should contain element    dom:document.querySelectorAll(".ant-radio-button-wrapper-checked")

order_alerady_mission_page
    [Documentation]    点击已完成
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_alerady_mission_btn}
    page should contain element    dom:document.querySelectorAll(".ant-radio-button-wrapper-checked")

order_not_payment_page
    [Documentation]    点击未支付
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_not_payment_btn}
    page should contain element    dom:document.querySelectorAll(".ant-radio-button-wrapper-checked")

order_alerady_cencel_page
    [Documentation]    点击已取消
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_alerady_cencel_btn}
    page should contain element    dom:document.querySelectorAll(".ant-radio-button-wrapper-checked")

order_alerady_refund_page
    [Documentation]    点击已退款
    [Tags]    P1
    Go To Order Page
    Sleep    1
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_alerady_refund_btn}
    page should contain element    dom:document.querySelectorAll(".ant-radio-button-wrapper-checked")

order_detail
    [Documentation]    点击订单详情
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_list_first_tr}
    page should contain element    ${order_detail_element}

order_detail_send
    [Documentation]    点击订单详情查看自否发货
    [Tags]    P1
    Add Order
    Go To    ${home_page}
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_list_first_tr}
    Wait Until Element Is Visible    dom:document.querySelectorAll('button')[1]
    Click Button    添加运单
    Wait And Click Element    dom:document.querySelectorAll('button')[4]
    Go To Order Page
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_list_first_tr}
    page should contain element    ${order_detail_element}
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Should Be True    '${res}'=='已发货'

order_detail_send_detail
    [Documentation]    点击订单详情添加运单详情 弹出框
    [Tags]    P1
    Add Order
    Go To    ${home_page}
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_list_first_tr}
    page should contain element    ${order_detail_element}
    click button    添加运单
    sleep    1.5
    page should contain element    dom:document.querySelectorAll("button")[4]
    Wait And Click Element    class:ant-modal-close-x
    Wait And Click Element    ${locator_order}

order_list_search
    [Documentation]    订单列表搜索
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Page Should Contain Element    ${order_list_searchs}

order_list_all_check
    [Documentation]    订单列表点击全部 显示所有订单
    [Tags]    P1
    #${time}    getTimeData
    #${order_list_apis}=    Set Variable    http://admin1024.shoplazza.com/api/order/list?start_create_time=${start_time}&end_create_time=${end_time}&page=0&size=20
    #Go To Order Page
    #Start Ajax Listener
    #Sleep    1.5
    #Wait And Click Element    ${order_list_btn}
    #Sleep    1
    #${dataLength}=    Execute JavaScript    return responseMap.get("${order_list_apis}").data.list
    #${count}    evaluate    len(${dataLength})
    #Should Be True    ${count}==20
    Wait And Click Element    ${locator_order}

order_list_already_refund_check
    [Documentation]    选中已退款栏，订单列表展示已退款订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_alerady_refund_btn}
    Sleep    2
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[3].innerText
    \    Should Be True    '${data}'=='已退款'

order_list_already_send_check
    [Documentation]    选中已发货，订单列表展示已发货订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_alerady_send_btn}
    Sleep    3
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[4].innerText
    \    Should Be True    '${data}'=='全部发货'

order_list_already_mission_check
    [Documentation]    选中已完成,订单列表展示已完成订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_alerady_mission_btn}
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[4].innerText
    \    Should Be True    '${data}'=='已到达'

order_list_not_payment_check
    [Documentation]    选中未支付，订单列表展示未支付订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_not_payment_btn}
    Sleep    3
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[3].innerText
    \    Should Be True    '${data}'=='未支付'

order_list_already_cancel_check
    [Documentation]    选中已取消，订单列表展示已取消订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_alerady_cencel_btn}
    sleep    3
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[5].innerText
    \    Should Be True    '${data}'=='已取消'

order_list_search_id
    [Documentation]    订单ID输入框中输入已有订单的订单编号,列表只展示搜索的订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_list_first_tr}
    ${order_id}    Execute JavaScript    return document.querySelectorAll("table tbody tr td")[0].innerText    #,获取tr第一个订单号
    log    ${order_id}
    ${odr_id}    searchStrs    ${order_id}
    Sleep    3
    Input Text    dom:document.querySelectorAll(".ant-input")[4]    ${odr_id}
    Sleep    1
    Wait And Click Element    ${order_list_search}    #.搜索按钮
    ${order_ids}    Execute JavaScript    return document.querySelectorAll("table tbody tr td")[0].innerText    #,在获取tr第一个订单号
    ${ord_ids}    searchStrs    ${order_ids}
    sleep    1.5
    Should Be True    '${order_id}'=='${order_ids}'

order_list_search_error
    [Documentation]    订单搜索输入错误id
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_list_first_tr}
    Input Text    dom:document.querySelectorAll(".ant-input")[4]    1230000000    #.输入错误订单号
    Wait And Click Element    ${order_list_search}    #.搜索按钮
    Sleep    1.5
    Page Should Not Contain Element    ${order_list_first_tr}

order_list_search_name
    [Documentation]    订单搜索姓名输入 百渊 出现百渊的所有订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_list_first_tr}
    ${order_name}    Execute JavaScript    return document.querySelectorAll("table tbody tr td p")[1].innerText    #,获取tr第一个姓名
    Sleep    1
    Input Text    dom:document.querySelectorAll(".ant-input")[4]    ${order_name}
    Sleep    2
    Wait And Click Element    ${order_list_search}    #.搜索按钮
    ${order_count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length    #,在获取tr数量
    : FOR    ${i}    IN RANGE    ${order_count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td p")[1].innerText
    \    Should Be True    '${order_name}'=='${data}'

order_list_search_name_error
    [Documentation]    订单搜索姓名输入 张三 错误
    [Tags]    P1
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_list_first_tr}
    ${order_name}    Set Variable    张三
    Sleep    1
    Input Text    dom:document.querySelectorAll(".ant-input")[4]    ${order_name}
    Sleep    1
    Wait And Click Element    ${order_list_search}    #.搜索按钮
    Page Should Not Contain Element    ${order_list_first_tr}

order_list_search_price
    [Documentation]    订单搜索最低价15 最高价15 列表出现15USD的订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    ${price}    Set Variable    15
    Wait Until Element Is Visible    ${order_list_search}
    Input Text    dom:document.querySelectorAll("input[placeholder='最低金额']")[0]    ${price}
    Input Text    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]    ${price}
    Sleep    1.5
    Wait And Click Element    ${order_list_search}    #.搜索按钮
    ${order_count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length    #,在获取tr数量
    : FOR    ${i}    IN RANGE    ${order_count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td p")[2].innerText
    \    ${res_data}    searchStrs    ${data}
    \    Should Be True    '${price}'=='${res_data}'

order_list_search_price_interval
    [Documentation]    订单搜索最低价输入 10 最高价输入20 列表出现10 ～ 20价格的订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    ${min_price}    Set Variable    15
    ${max_price}    Set Variable    20
    Wait Until Element Is Visible    ${order_list_search}
    Input Text    dom:document.querySelectorAll("input[placeholder='最低金额']")[0]    ${min_price}
    Input Text    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]    ${max_price}
    Wait And Click Element    ${order_list_search}    #.搜索按钮
    Sleep    1.5
    ${order_count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length    #,在获取tr数量
    : FOR    ${i}    IN RANGE    ${order_count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td p")[2].innerText
    \    ${res_data}    searchStrs    ${data}
    \    Run keyword If    ${min_price}<'${res_data}'>${max_price}    log    success
    \    ...    ELSE    Run keyword    Fail    ${error_msg}

order_list_search_price_error
    [Documentation]    订单搜索最低价输入 10 最高价输入8 提示错误
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    ${min_price}    Set Variable    15
    ${max_price}    Set Variable    8
    Wait Until Element Is Visible    ${order_list_search}
    Input Text    dom:document.querySelectorAll("input[placeholder='最低金额']")[0]    ${min_price}
    Input Text    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]    ${max_price}
    Wait And Click Element    ${order_list_search}    #.搜索按钮
    ${msg}    Get Value    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]
    Should Be True    '${msg}'=='${Empty}'

order_list_search_price_errors
    [Documentation]    订单搜索最大价输入10 最小价格输入30 提示错误
    [Tags]    P0
    Go To Order Page
    Wait Until Element Is Visible    ${order_list_btn}
    Wait And Click Element    ${order_list_btn}
    ${min_price}    Set Variable    30
    ${max_price}    Set Variable    10
    Wait Until Element Is Visible    ${order_list_search}
    Input Text    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]    ${max_price}
    Input Text    dom:document.querySelectorAll("input[placeholder='最低金额']")[0]    ${min_price}
    Wait And Click Element    ${order_list_search}    #.搜索按钮
    ${msg}    Get Value    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]
    Should Be True    '${msg}'=='${Empty}'
