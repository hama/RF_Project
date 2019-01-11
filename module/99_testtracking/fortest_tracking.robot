*** Settings ***
Suite Setup       Open Test Browser    ${url}
Suite Teardown    Close Test Suite Browser
Test Setup        Tracking Testcase Setup
Test Teardown     Tracking Testcase Teardown
Force Tags        tracking
Resource          ../../resources/keywords/kw_common.robot

*** Variables ***
#${url}    https://trackingtest.myshoplaza.com/
${url}    https://admin.shoplazza.com/

*** Test Cases ***
tracking001
    [Documentation]
    [Tags]
#    Sleep    10

tracking002
    [Documentation]
    [Tags]
#    Sleep    10

tracking003
    [Documentation]
    [Tags]
#    Sleep    10

*** Keywords ***
Tracking Testcase Setup
	[Documentation]
	start_listener_on_new_tab
	Reload Page

Tracking Testcase Teardown
	[Documentation]
	log_messages_with_conf
	Open New And Close Other Windows    ${url}

