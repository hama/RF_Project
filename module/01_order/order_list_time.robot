*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Force Tags        Order
Resource          ../../resources/keywords/kw_browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/variable/var_tax_price.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/keywords/kw_order.robot
Resource          ../../resources/variable/var_order.robot
Resource          ../../resources/keywords/kw_add_order.robot
Library           SeleniumLibrary    run_on_failure=NOTHING

*** Test Cases ***
order078
    [Documentation]    选择后日期显示为2018-06-01~至今`,订单列表只显示这个时间段的订单
    [Tags]    P0
    Add Order
    Go To Home By Url
    Wait And Click Element    ${locatorB_order}
    sleep    3
    Common Js Click    input[placeholder='开始日期']    0
    #Execute JavaScript    return document.querySelectorAll("input[placeholder='开始日期']")[0].click()
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

order079
    [Documentation]    取消日期筛选，默认显示为近三个月的订单
    [Tags]    P0
    Sleep    1.5
    Go To Order Page
    Wait And Click Element    ${locatorB_order}
    Wait Until Element Is Visible    dom:document.querySelectorAll("table tbody tr td")[0]
    ${time}    Execute JavaScript    return document.querySelectorAll("table tbody tr td p")[0].innerHTML
    ${result}    order list maxmonth check    ${time}    ${time}
    Should Be True    '${result}'=='${True}'
