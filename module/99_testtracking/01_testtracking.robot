*** Settings ***
Suite Setup       Tracking Suite Setup
Suite Teardown    Close Test Suite Browser
Test Setup        Tracking Testcase Setup
Test Teardown     Tracking Testcase Teardown
Force Tags        tracking
Resource          ../../resources/keywords/kw_common.robot

*** Variables ***
${url}    https://trackingtest.myshoplaza.com/
#${url}    https://admin.shoplazza.com/

*** Test Cases ***
tracking001
    [Documentation]
    [Tags]
#    Sleep    10
    Sleep    3
    ${all_messages}    get_all_messages
#    raw_data = {"ea": "view_item_list", "gtm": "2oubc0", "vp": "1440x720", "de": "UTF-8", "_v": "j72", "t": "event"}
	&{data}=    Create Dictionary    ea=view_item_list    gtm=2oubc0    vp=1440x720    t=event
    assert_contain_keys_process    ${all_messages}    www.google-analytics.com    ${data}

#    ${target_messages}    get_request_messages_by_url    ${all_messages}    www.google-analytics.com
##    ${target_messages}    get_request_messages_by_url    ${all_messages}    shence.shoplazza
#	@{request_data}    get_request_data_list    ${target_messages}
#	get_decoded_request_data    @{request_data}[0]

*** Keywords ***
Tracking Suite Setup
	[Documentation]
	Open Test Browser    ${url}
	Open New And Close Other Windows    ${url}

Tracking Testcase Setup
	[Documentation]
	start_listener_on_new_tab
	Reload Page

Tracking Testcase Teardown
	[Documentation]
	Open New And Close Other Windows    ${url}

