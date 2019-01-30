#*** Settings ***
#Suite Setup       Open Test Browser    ${url}
#Suite Teardown    Close Test Suite Browser
#Test Setup        Tracking Testcase Setup
#Test Teardown     Tracking Testcase Teardown
#Force Tags        tracking
#Resource          ../../resources/keywords/kw_common.robot
#
#*** Variables ***
##${url}    https://trackingtest.myshoplaza.com/
#${url}    https://admin.shoplazza.com/
#
#*** Test Cases ***
#tracking001
#    [Documentation]
#    [Tags]
##    Sleep    10
#    Sleep    1
#
#tracking002
#    [Documentation]
#    [Tags]
##    Sleep    10
#    Sleep    1
#
#tracking003
#    [Documentation]
#    [Tags]
##    Sleep    10
#    Sleep    1
#
#tracking004
#    [Documentation]
#    [Tags]
##    Sleep    10
#    Sleep    1
#
#tracking005
#    [Documentation]
#    [Tags]
##    Sleep    10
#    Sleep    1
#
#tracking006
#    [Documentation]
#    [Tags]
##    Sleep    10
#    Sleep    1
#
#tracking007
#    [Documentation]
#    [Tags]
##    Sleep    10
#    Sleep    1
#
#tracking008
#    [Documentation]
#    [Tags]
##    Sleep    10
#    Sleep    3
#    ${all_messages}    get_all_messages
#    ${target_messages}    get_request_messages_by_url    ${all_messages}    www.google-analytics.com
##    ${target_messages}    get_request_messages_by_url    ${all_messages}    shence.shoplazza
#	@{request_data}    get_request_data_list    ${target_messages}
#	get_decoded_request_data    @{request_data}[0]
#
#*** Keywords ***
#Tracking Testcase Setup
#	[Documentation]
#	start_listener_on_new_tab
#	Reload Page
#
#Tracking Testcase Teardown
#	[Documentation]
#	log_messages_with_conf
#	Open New And Close Other Windows    ${url}
#
