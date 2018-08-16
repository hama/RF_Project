*** Settings ***
Documentation     满减活动封装公共部分关键字
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          var_common.robot
Resource          var_subtraction.robot
Resource          kw_browser.robot
Resource          kw_common.robot
Library           customLibrary

*** keyword ***
Subtraction_Setting_TimeZone
    [Documentation]    封装满减活动设置时区
    ${check_email}    Execute JavaScript    return document.querySelectorAll("#email").value===''
    ${check_service_email}    Execute JavaScript    return document.querySelectorAll("#service_email").value===''
    Run keyword If    ${check_email}    Wait And Input Text    ${locator_ContentB_edit_input_email}    ${locator_ContentB_comm_email}
    Run keyword If    ${check_service_email}    Wait And Input Text    ${locator_ContentB_edit_input_service_email}    ${locator_ContentB_comm_service_email}

run_keyword_wait_timezone
    [Documentation]   等待设置时区接口返回
    [Arguments]    ${paremeter}    ${count}=10
    :FOR    ${index}    IN RANGE    ${count}
    \    ${data}    setBjTimeZone    ${paremeter}
    \    Run keyword If    '${data}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

run_keyword_wait_step
    [Documentation]    等待添加满减活动接口返回成功失败
    [Arguments]    ${index}    ${type}=${Empty}    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    addSubtraction    ${index}    ${type}
    \    Run keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

common_click_first_tr_step
    [Documentation]    点击table中的第一个tr公共步骤
    [Arguments]    ${index}    ${type}=${Empty}
    delSubtraction
    run_keyword_wait_step    ${index}    ${type}
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_title_all}
    Wait And Click Element    ${locator_ContentB_first_tr_eml}