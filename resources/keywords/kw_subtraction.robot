*** Settings ***
Documentation     满减活动封装公共部分关键字
Library           SeleniumLibrary
Library           ${CURDIR}/../../lib/customLibrary
Resource          ../variable/var_common.robot
Resource          ../variable/var_subtraction.robot
Resource          kw_browser.robot
Resource          kw_common.robot

*** keyword ***
Add Subtraction Timezone Wait
    [Documentation]   等待设置时区接口返回
    [Arguments]    ${paremeter}    ${count}=10
    :FOR    ${index}    IN RANGE    ${count}
    \    ${data}    setBjTimeZone    ${paremeter}
    \    Run keyword If    '${data}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

Add Subtraction Wait Step
    [Documentation]    等待添加满减活动接口返回成功失败
    [Arguments]    ${index}    ${type}=${Empty}    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    addSubtraction    ${index}    ${type}
    \    Run keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

Common Click First Tr Step
    [Documentation]    点击table中的第一个tr公共步骤
    [Arguments]    ${index}    ${type}=${Empty}
    delSubtraction
    run_keyword_wait_step    ${index}    ${type}
    Go To Subtraction Page
    Wait And Click Element    ${locator_ContentB_title_all}
    Wait And Click Element    ${locator_ContentB_first_tr_eml}

