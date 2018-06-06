*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Resource          ../../resources/browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/tax_price.robot
Resource          ../../resources/shoplaza_login.robot
Library           SeleniumLibrary
Library           customLibrary

*** Test Cases ***
order_list_time_sort
    #.选择后日期显示为2018-05-01~2018-05-30`,订单列表只显示这个时间段的订单
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1.5
    Page Should Contain Element    dom:document.querySelectorAll("input[placeholder='开始日期']")[0]
    Click Element    dom:document.querySelectorAll("input[placeholder='开始日期']")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-calendar-month-select")[0]
    Click Element    dom:document.querySelectorAll(".ant-calendar-month-select")[0]
    Page Should COntain Element    dom:document.querySelector(".ant-calendar-month-panel-table tr:nth-child(2) td:nth-child(2)")
    click element    dom:document.querySelector(".ant-calendar-month-panel-table tr:nth-child(2) td:nth-child(2)")
    Page Should Contain Element    dom:document.querySelectorAll(".ant-calendar-date")[1]
    Click Element    dom:document.querySelectorAll(".ant-calendar-date")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-calendar-month-select")[0]
    Click Element    dom:document.querySelectorAll(".ant-calendar-month-select")[0]
    Page Should Contain Element    dom:document.querySelector(".ant-calendar-month-panel-table tr:nth-child(2) td:nth-child(2)")
    Click Element    dom:document.querySelector(".ant-calendar-month-panel-table tr:nth-child(2) td:nth-child(2)")
    Page Should Contain Element    dom:document.querySelectorAll(".ant-calendar-date")[31]
    CLick Element    dom:document.querySelectorAll(".ant-calendar-date")[31]
    Sleep    1s
    Page Should Contain Element    dom:document.querySelectorAll("table tbody tr")[0]
    ${time}    Execute JavaScript    return document.querySelectorAll("table tbody tr td p")[0].innerHTML
    ${res}    order_list_str    ${time}    #.转换字符串比较
    #Run keyword If    '${res}'=="${false}"    Run keyword    Fail    ${error_msg}
    Should Be True    '${res}'=="${false}"

order_list_time_default
    #.取消日期筛选，默认显示为近三个月的订单
    go to    ${home_page}
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("table tbody tr td")[0]
    ${time}    Execute JavaScript    return document.querySelectorAll("table tbody tr td p")[0].innerHTML
    #Wait Until Element Is Visible    //*[@id="dj"]/div/div[4]/div[2]/ul/li[9]/a    #.最后一页
    sleep    1
    click element    //*[@id="dj"]/div/div[4]/div[2]/ul/li[9]/a
    sleep    1.5
    ${count}    Execute JavaScript    return document.querySelectorAll("table tbody tr").length    #.获取tr数量
    ${data}    Execute JavaScript    return document.querySelectorAll("table tbody tr:nth-child(${count}) td p")[0].innerHTML
    ${result}    order list maxmonth check    ${time}    ${data}
    #Run keyword If    '${result}'=="${False}"
    Should Be True    '${result}'=='${True}'
