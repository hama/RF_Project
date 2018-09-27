*** Settings ***
Suite Setup       Common Suite
Suite Teardown    Close Test Suite Browser
Test Teardown     Teardown Test Case
Force Tags        Invitaion
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/variable/var_common.robot

*** Test Cases ***
Apps Marketplace001
    [Documentation]    邀请码工具
    [Tags]    P1    threshold
    Go To Invitaion Page
    Sleep    10
    Select Window    New
    Sleep    4
    ${res}    Execute JavaScript    return document.querySelectorAll('#agree_submit')[0]===undefined
    Run keyword If    '${res}'<>'False'    
    ...    ELSE    Wait Until Page Contains    授权确认

*** keywords ***
Common Suite
    [Documentation]    公共suite
    Login With Default User