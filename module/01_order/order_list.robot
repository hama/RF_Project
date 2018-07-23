*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Force Tags        Order
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../resources/kw_browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/var_tax_price.robot
Resource          ../../resources/kw_common.robot
Resource          ../../resources/kw_add_order.robot
Resource          ../../resources/kw_order.robot
Library           SeleniumLibrary
Library           customLibrary
Resource          ../../resources/var_order.robot

*** Test Cases ***
order009
    [Documentation]    显示订单列表，分别为，全部，已支付，已确认，已发货，已完成，未支付，已取消
    [Tags]    P1
    Add Order    #.添加订单
    Go To    ${home_page}
    sleep    1
    Wait And Click Element    ${locator_order}
    Page Should Contain Element    ${locator_order}
    Page Should Contain Element    ${locator_order_already_pay_btn}
    Page Should Contain Element    ${locator_order_alerady_send_btn}
    Page Should Contain Element    ${locator_order_alerady_mission_btn}
    Page Should Contain Element    ${locator_order_not_payment_btn}
    Page Should Contain Element    ${locator_order_alerady_cencel_btn}

order011
    [Documentation]    显示全部订单，分别显示订单编号，订单生成日期，顾客姓名，支付状态，订单状态和总价
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${locator_order}
    page should contain element    ${locator_order_all}

order012
    [Documentation]    显示已支付订单，分别显示订单编号，订单生成日期，顾客姓名，支付状态，订单状态和总价，支付状态全部显示为已支付
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_delivered_btn}
    page should contain element    ${locator_order_all}

order014
    [Documentation]    显示已发货订单，分别显示订单编号，订单生成日期，顾客姓名，支付状态，订单状态和总价，订单状态全部显示为全部发货或部分发货
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_alerady_send_btn}
    page should contain element    ${locator_order_all}

order015
    [Documentation]    显示已完成订单，分别显示订单编号，订单生成日期，顾客姓名，支付状态，订单状态和总价，订单状态全部显示为已完成
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_alerady_mission_btn}
    page should contain element    ${locator_order_all}

order016
    [Documentation]    显示未支付订单，分别显示订单编号，订单生成日期，顾客姓名，支付状态，订单状态和总价，支付状态全部显示为未支付
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_not_payment_btn}
    page should contain element    ${locator_order_all}

order017
    [Documentation]    显示已取消订单，分别显示订单编号，订单生成日期，顾客姓名，支付状态，订单状态和总价，订单状态全部显示为已取消
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_alerady_cencel_btn}
    page should contain element    ${locator_order_all}

order_013
    [Documentation]    显示已确认订单，分别显示订单编号，订单生成日期，顾客姓名，支付状态，订单状态和总价
    [Tags]    P1
    Go To Order Page
    Sleep    1
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_alerady_refund_btn}
    page should contain element    ${locator_order_all}

order018
    [Documentation]    进入订单详情页面，显示订单详情，分别为订单号，下单时间，订单状态，订单信息，商品总价，实际支付价格，支付状态，发货状态，收件人信息，以及发货详情
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_list_first_tr}
    page should contain element    ${locator_order_detail_element}

order070
    [Documentation]    发货成功后，订单状态下方将显示发货详情，包括商品详情，商品价格，商品数量，商品总价记忆物流信息
    [Tags]    P1
    Add Order
    Go To    ${home_page}
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_list_first_tr}
    Wait Until Element Is Visible    ${locator_order_first_btn}
    Click Button    添加运单
    Wait And Click Element    ${locator_order_four_btn}
    Go To Order Page
    sleep    1
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_list_first_tr}
    page should contain element    ${locator_order_detail_element}
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Should Be True    '${res}'=='已发货'

order071
    [Documentation]    弹窗更新运单号弹窗
    [Tags]    P1
    Add Order
    Go To    ${home_page}
    sleep    1
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_list_first_tr}
    page should contain element    ${locator_order_detail_element}
    click button    添加运单
    sleep    1.5
    page should contain element    ${locator_order_four_btn}
    Wait And Click Element    ${locator_order_close_btn}
    Wait And Click Element    ${locator_order}

order080
    [Documentation]    订单列表跳转到搜索界面
    [Tags]    P1
    Go To Order Page
    sleep    1
    Wait And Click Element    ${locator_order}
    Page Should Contain Element    ${locator_order_list_search}

order082
    [Documentation]    图标选中全部栏，订单列表展示全部订单
    [Tags]    P1
    #${time}    getTimeData
    #${order_list_apis}=    Set Variable    http://admin1024.shoplazza.com/api/order/list?start_create_time=${locator_start_time}&end_create_time=${locator_end_time}&page=0&size=20
    #Go To Order Page
    #Start Ajax Listener
    #Sleep    1.5
    #Wait And Click Element    ${locator_order}
    #Sleep    1
    #${dataLength}=    Execute JavaScript    return responseMap.get("${locator_order_list_api}").data.list
    #${count}    evaluate    len(${dataLength})
    #Should Be True    ${count}==20
    Wait And Click Element    ${locator_order}

order_list_already_refund_check
    [Documentation]    选中已退款栏，订单列表展示已退款订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_alerady_refund_btn}
    Sleep    2
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[3].innerText
    \    Should Be True    '${data}'=='已退款'

order085
    [Documentation]    图标选中已发货栏，订单列表展示已发货订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_alerady_send_btn}
    Sleep    3
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[4].innerText
    \    Should Be True    '${data}'=='全部发货'

order084
    [Documentation]    图标选中已支付栏，订单列表展示已支付订单
    [Tags]    P0
    Add Order    #.添加订单
    Go To    ${home_page}
    Add Alerady Mission Order    #.添加已完成订单
    Go To Order Page
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_alerady_mission_btn}
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[4].innerText
    \    Should Be True    '${data}'=='已到达'

order090
    [Documentation]    图标选中未支付栏，订单列表展示未支付订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_not_payment_btn}
    Sleep    3
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[3].innerText
    \    Should Be True    '${data}'=='未支付'

order092
    [Documentation]    图标选中已取消栏，订单列表展示已取消订单
    [Tags]    P0
    Add Order    #.添加订单
    Go To    ${home_page}
    Add Alerady Cancel Order    #.添加已取消订单
    Go To Order Page
    Wait And Click Element    ${locator_order}
    Wait And Click Element    ${locator_order_alerady_cencel_btn}
    sleep    3
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[4].innerText
    \    Should Be True    '${data}'=='已取消'

order093
    [Documentation]    订单ID输入框中输入已有订单的订单编号,列表只展示搜索的订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${locator_order}
    Wait Until Element Is Visible    ${locator_order_list_first_tr}
    ${order_id}    Execute JavaScript    return document.querySelectorAll("table tbody tr td")[0].innerText    #,获取tr第一个订单号
    log    ${order_id}
    ${odr_id}    searchStrs    ${order_id}
    Sleep    3
    Input Text    ${locator_order_list_input}    ${odr_id}
    Sleep    1
    Wait And Click Element    ${locator_order_list_search}    #.搜索按钮
    ${order_ids}    Execute JavaScript    return document.querySelectorAll("table tbody tr td")[0].innerText    #,在获取tr第一个订单号
    ${ord_ids}    searchStrs    ${order_ids}
    sleep    1.5
    Should Be True    '${order_id}'=='${order_ids}'

order094
    [Documentation]    订单列表不显示任何内容，提示暂无数据
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${locator_order}
    Wait Until Element Is Visible    ${locator_order_list_first_tr}
    Input Text    ${locator_order_list_input}    1230000000    #.输入错误订单号
    Wait And Click Element    ${locator_order_list_search}    #.搜索按钮
    Sleep    1.5
    Page Should Not Contain Element    ${locator_order_list_first_tr}

order096
    [Documentation]    订单列表中展示下单顾客为：百渊的所有订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${locator_order}
    Wait Until Element Is Visible    ${locator_order_list_first_tr}
    ${order_name}    Execute JavaScript    return document.querySelectorAll("table tbody tr td p")[1].innerText    #,获取tr第一个姓名
    Sleep    1
    Input Text    ${locator_order_list_input}    ${order_name}
    Sleep    2
    Wait And Click Element    ${locator_order_list_search}    #.搜索按钮
    ${order_count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length    #,在获取tr数量
    : FOR    ${i}    IN RANGE    ${order_count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td p")[1].innerText
    \    Should Be True    '${order_name}'=='${data}'

order097
    [Documentation]    订单搜索姓名输入 张三 错误
    [Tags]    P1
    Go To Order Page
    Wait And Click Element    ${locator_order}
    Wait Until Element Is Visible    ${locator_order_list_first_tr}
    ${order_name}    Set Variable    张三
    Sleep    1
    Input Text    ${locator_order_list_input}    ${order_name}
    Sleep    1
    Wait And Click Element    ${locator_order_list_search}    #.搜索按钮
    Page Should Not Contain Element    ${locator_order_list_first_tr}

order098
    [Documentation]    订单搜索最低价15 最高价15 列表出现15USD的订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${locator_order}
    ${price}    Set Variable    15
    Wait Until Element Is Visible    ${locator_order_list_search}
    Input Text    ${locator_order_list_minprice}    ${price}
    Input Text    ${locator_order_list_maxprice}    ${price}
    Sleep    1.5
    Wait And Click Element    ${locator_order_list_search}    #.搜索按钮
    ${order_count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length    #,在获取tr数量
    : FOR    ${i}    IN RANGE    ${order_count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td p")[2].innerText
    \    ${res_data}    searchStrs    ${data}
    \    Should Be True    '${price}'=='${res_data}'

order099
    [Documentation]    订单搜索最低价输入 10 最高价输入20 列表出现10 ～ 20价格的订单
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${locator_order}
    ${min_price}    Set Variable    15
    ${max_price}    Set Variable    20
    Wait Until Element Is Visible    ${locator_order_list_search}
    Input Text    ${locator_order_list_minprice}    ${min_price}
    Input Text    ${locator_order_list_maxprice}    ${max_price}
    Wait And Click Element    ${locator_order_list_search}    #.搜索按钮
    Sleep    1.5
    ${order_count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length    #,在获取tr数量
    : FOR    ${i}    IN RANGE    ${order_count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td p")[2].innerText
    \    ${res_data}    searchStrs    ${data}
    \    Run keyword If    ${min_price}<'${res_data}'>${max_price}    log    success
    \    ...    ELSE    Run keyword    Fail    ${error_msg}

order101
    [Documentation]    订单搜索最低价输入 10 最高价输入8 提示错误 / 提示最大订单价应大于或等于最小订单价
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${locator_order}
    ${min_price}    Set Variable    15
    ${max_price}    Set Variable    8
    Wait Until Element Is Visible    ${locator_order_list_search}
    Input Text    ${locator_order_list_minprice}    ${min_price}
    Input Text    ${locator_order_list_maxprice}    ${max_price}
    Wait And Click Element    ${locator_order_list_search}    #.搜索按钮
    ${msg}    Get Value    ${locator_order_list_maxprice}
    Should Be True    '${msg}'=='${Empty}'

order102
    [Documentation]    订单搜索最大价输入10 最小价格输入30 提示错误 / 提示，最小订单价应小于或等于最大订单价
    [Tags]    P0
    Go To Order Page
    Wait And Click Element    ${locator_order}
    ${min_price}    Set Variable    30
    ${max_price}    Set Variable    10
    Wait Until Element Is Visible    ${locator_order_list_search}
    Input Text    ${locator_order_list_maxprice}    ${max_price}
    Input Text    ${locator_order_list_minprice}    ${min_price}
    Wait And Click Element    ${locator_order_list_search}    #.搜索按钮
    ${msg}    Get Value    ${locator_order_list_maxprice}
    Should Be True    '${msg}'=='${Empty}'
