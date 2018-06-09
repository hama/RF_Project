*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Resource          ../../resources/browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/tax_price.robot
Resource          ../../resources/shoplaza_login.robot
Library           SeleniumLibrary
Library           customLibrary

*** Test Cases ***
order_list_page
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Page Should Contain Element    ${order_all_btn}
    Page Should Contain Element    ${order_already_pay_btn}
    Page Should Contain Element    ${order_alerady_enter_btn}
    Page Should Contain Element    ${order_alerady_send_btn}
    Page Should Contain Element    ${order_alerady_mission_btn}
    Page Should Contain Element    ${order_not_payment_btn}
    Page Should Contain Element    ${order_alerady_cencel_btn}

order_all_list_page
    #.点击全部
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2
    page should contain element    //*[@id="dj"]/div/div[4]

order_be_delivered_page
    #.点击待发货
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_delivered_btn}
    page should contain element    //*[@id="dj"]/div/div[4]

order_alerady_send_page
    #.点击已发货
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_alerady_send_btn}
    page should contain element    //*[@id="dj"]/div/div[4]

order_alerady_mission_page
    #.点击已完成
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_alerady_mission_btn}
    page should contain element    //*[@id="dj"]/div/div[4]

order_not_payment_page
    #.点击未支付
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_not_payment_btn}
    page should contain element    //*[@id="dj"]/div/div[4]

order_alerady_cencel_page
    #.点击已取消
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_alerady_cencel_btn}
    page should contain element    //*[@id="dj"]/div/div[4]

order_alerady_refund_page
    #.点击已退款
    go to    ${home_page}
    Sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_alerady_refund_btn}
    page should contain element    //*[@id="dj"]/div/div[4]

order_detail
    #.点击订单详情
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    2
    page should contain element    ${order_detail_element}

order_dateil_send
    #.点击订单详情查看自否发货
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Run keyword If    '${res}'=='已发货'    Run keyword    page should contain element    //*[@id="dj"]/div/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[1]/div/div/div/div/div/div/div/table/tbody/tr
    ...    ELSE    Run keyword    page should contain element    //*[@id="dj"]/div/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[1]/div/div/div/div/div/div/div/table/tbody/tr

order_dateil_send_detail
    #.点击订单详情添加运单详情 弹出框
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    click button    添加运单
    sleep    1.5
    page should contain element    dom:document.querySelectorAll("button")[4]

order_list_search
    #.订单列表搜索
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    Page Should Contain Element    ${order_list_search}

order_list_all_check
    #.订单列表点击全部 显示所有订单
    go to    ${home_page}
    sleep    1
    Start Ajax Listener
    sleep    1
    click element    ${order_list_btn}
    sleep    1.5
    ${dataLength}    Execute JavaScript    return responseMap.get("${order_list_api}").data.list
    ${count}    evaluate    len(${dataLength})
    Run keyword If    ${count}<>20    Run keyword    Page Should Contain    djdjdj

order_list_already_refund_check
    #.选中已退款栏，订单列表展示已退款订单
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    click element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_alerady_refund_btn}
    Click Element    ${order_alerady_refund_btn}
    sleep    1
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[3].innerText
    \    Run keyword If    '${data}'<>'已退款'    Fail    ${error_msg}

order_list_already_send_check
    #.选中已发货，订单列表展示已发货订单
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_alerady_send_btn}
    Click Element    ${order_alerady_send_btn}
    sleep    1
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[5].innerText
    \    Run keyword If    '${data}'<>'全部发货' and '${data}'<>'部分发货'    Fail    ${error_msg}

order_list_already_mission_check
    #.选中已完成,订单列表展示已完成订单
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_alerady_mission_btn}
    Click Element    ${order_alerady_mission_btn}
    sleep    1
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[5].innerText
    \    Run keyword If    '${data}'<>'已完成'    Fail    ${error_msg}

order_list_not_payment_check
    #.选中未支付，订单列表展示未支付订单
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_not_payment_btn}
    Click Element    ${order_not_payment_btn}
    sleep    1
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[4].innerText
    \    Run keyword If    '${data}'<>'未支付'    Fail    ${error_msg}

order_list_already_cancel_check
    #.选中未支付，订单列表展示未支付订单
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_alerady_cencel_btn}
    Click Element    ${order_alerady_cencel_btn}
    sleep    1
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length
    : FOR    ${i}    IN RANGE    ${count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td")[5].innerText
    \    Run keyword If    '${data}'<>'已取消'    Fail    ${error_msg}

order_list_search_id
    #.订单ID输入框中输入已有订单的订单编号,列表只展示搜索的订单
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_list_first_tr}
    ${order_id}    Execute JavaScript    return document.querySelectorAll("table tbody tr td")[1].innerText    #,获取tr第一个订单号
    ${odr_id}    searchStrs    ${order_id}
    Sleep    1
    Input Text    dom:document.querySelectorAll(".ant-input")[4]    ${odr_id}
    Sleep    1
    Click Element    ${order_list_search}    #.搜索按钮
    ${order_ids}    Execute JavaScript    return document.querySelectorAll("table tbody tr td")[1].innerText    #,在获取tr第一个订单号
    ${ord_ids}    searchStrs    ${order_ids}
    sleep    1.5
    Run keyword If    '${order_id}'<>'${order_ids}'    Fail    ${error_msg}

order_list_search_error
    #.订单搜索输入错误id
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_list_first_tr}
    Input Text    dom:document.querySelectorAll(".ant-input")[4]    1230000000    #.输入错误订单号
    Click Element    ${order_list_search}    #.搜索按钮
    Sleep    1.5
    Page Should Not Contain Element    ${order_list_first_tr}

order_list_search_name
    #.订单搜索姓名输入 百渊 出现百渊的所有订单
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_list_first_tr}
    ${order_name}    Execute JavaScript    return document.querySelectorAll("table tbody tr td p")[1].innerText    #,获取tr第一个姓名
    Sleep    1
    Input Text    dom:document.querySelectorAll(".ant-input")[4]    ${order_name}
    Sleep    1
    Click Element    ${order_list_search}    #.搜索按钮
    ${order_count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length    #,在获取tr数量
    : FOR    ${i}    IN RANGE    ${order_count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td p")[1].innerText
    \    Run keyword If    '${order_name}'<>'${data}'    Fail    ${error_msg}

order_list_search_name_error
    #.订单搜索姓名输入 张三    错误
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_list_first_tr}
    ${order_name}    Set Variable    张三
    Sleep    1
    Input Text    dom:document.querySelectorAll(".ant-input")[4]    ${order_name}
    Sleep    1
    Click Element    ${order_list_search}    #.搜索按钮
    Sleep    1.5
    Page Should Not Contain Element    ${order_list_first_tr}

order_list_search_price
    #.订单搜索最低价15 最高价15    列表出现15USD的订单
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    ${price}    Set Variable    15
    Wait Until Element Is Visible    ${order_list_search}
    Input Text    dom:document.querySelectorAll("input[placeholder='最低金额']")[0]    ${price}
    Input Text    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]    ${price}
    Click Element    ${order_list_search}    #.搜索按钮
    Sleep    1.5
    ${order_count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length    #,在获取tr数量
    : FOR    ${i}    IN RANGE    ${order_count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td p")[2].innerText
    \    ${res_data}    searchStrs    ${data}
    \    Run keyword If    '${price}'<>'${res_data}'    Fail    ${error_msg}

order_list_search_price_interval
    #.订单搜索最低价输入 10 最高价输入20    列表出现10 ～ 20价格的订单
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    ${min_price}    Set Variable    15
    ${max_price}    Set Variable    20
    Wait Until Element Is Visible    ${order_list_search}
    Input Text    dom:document.querySelectorAll("input[placeholder='最低金额']")[0]    ${min_price}
    Input Text    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]    ${max_price}
    Click Element    ${order_list_search}    #.搜索按钮
    Sleep    1.5
    ${order_count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length    #,在获取tr数量
    : FOR    ${i}    IN RANGE    ${order_count}
    \    ${x}    Evaluate    ${i}+1
    \    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${x}) td p")[2].innerText
    \    ${res_data}    searchStrs    ${data}
    \    Run keyword If    ${min_price}<'${res_data}'>${max_price}    log    success
    \    ...    ELSE    Run keyword    Fail    ${error_msg}

order_list_search_price_error
    #.订单搜索最低价输入 10 最高价输入8 提示错误
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    ${min_price}    Set Variable    15
    ${max_price}    Set Variable    8
    Wait Until Element Is Visible    ${order_list_search}
    Input Text    dom:document.querySelectorAll("input[placeholder='最低金额']")[0]    ${min_price}
    Input Text    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]    ${max_price}
    Click Element    ${order_list_search}    #.搜索按钮
    ${msg}    Get Value    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]
    Run keyword If    '${msg}'=='${Empty}'    log    success
    ...    ELSE    Fail    ${error_msg}

order_list_search_price_errors
    #.订单搜索最大价输入10 最小价格输入30 提示错误
    Go To    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    ${min_price}    Set Variable    30
    ${max_price}    Set Variable    10
    Wait Until Element Is Visible    ${order_list_search}
    Input Text    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]    ${max_price}
    Input Text    dom:document.querySelectorAll("input[placeholder='最低金额']")[0]    ${min_price}
    Click Element    ${order_list_search}    #.搜索按钮
    ${msg}    Get Value    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]
    Run keyword If    '${msg}'=='${Empty}'    log    success
    ...    ELSE    Fail    ${error_msg}
