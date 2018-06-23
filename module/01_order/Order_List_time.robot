*** Settings ***
Suite Setup       New Test Suite Browser And Login    15220581724    123456    ${user_default_domain}
Suite Teardown    Close Test Suite Browser
Resource          ../../resources/kw_browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/var_tax_price.robot
Resource          ../../resources/kw_common.robot
Library           SeleniumLibrary
Library           customLibrary
Resource          ./common.robot
Resource          ../../resources/var_order.robot
Resource          ../../resources/kw_add_order.robot

*** Test Cases ***
order_list_time_sort
    [Documentation]    选择后日期显示为2018-06-01~至今`,订单列表只显示这个时间段的订单
    [Tags]    P0
    Add Order
    Go To    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1.5
    Wait And Click Element    dom:document.querySelectorAll("input[placeholder='开始日期']")[0]
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-month-select")[0]
    Wait And Click Element    dom:document.querySelector(".ant-calendar-month-panel-table tr:nth-child(2) td:nth-child(3)")
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-date")[4]
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-month-select")[0]
    Wait And Click Element    dom:document.querySelector(".ant-calendar-month-panel-table tr:nth-child(2) td:nth-child(3)")
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-footer-extra div a")[0]
    Page Should Contain Element    dom:document.querySelectorAll("table tbody tr")[0]
    ${time}    Execute JavaScript    return document.querySelectorAll("table tbody tr td p")[0].innerHTML
    ${res}    order_list_str    ${time}    #.转换字符串比较
    Should Be True    '${res}'=="${false}"

order_list_time_default
    [Documentation]    取消日期筛选，默认显示为近三个月的订单
    [Tags]    P0
    Sleep    1.5
    Go To Order Page
    Wait And Click Element    ${order_list_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("table tbody tr td")[0]
    ${time}    Execute JavaScript    return document.querySelectorAll("table tbody tr td p")[0].innerHTML
    sleep    1
    ${result}    order list maxmonth check    ${time}    ${time}
    Should Be True    '${result}'=='${True}'
