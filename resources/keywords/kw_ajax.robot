*** Settings ***
Library           ${CURDIR}/../../lib/utils/ajaxhandle.py

*** Keywords ***
Get Correct Response By Api With Wait
    [Arguments]    ${api}    ${waitTime}=1
    [Documentation]    获取包含${api}且返回码200的response内容
    Sleep    ${waitTime}
	&{correctMap}=    Execute JavaScript    return correctMap;
    ${response}    get_response_by_api_py    ${correctMap}    ${api}
    [Return]    ${response}

Get Error Response By Api With Wait
	[Arguments]    ${api}    ${waitTime}=1
    [Documentation]    获取包含${api}且返回码非200的response内容
    Sleep    ${waitTime}
    &{errorMap}=    Execute JavaScript    return errorMap;
    ${response}    get_response_by_api_py    ${errorMap}    ${api}
    [Return]    ${response}

Get All Correct Responses With Wait
	[Arguments]    ${waitTime}=1
    [Documentation]     获取所有返回码200的response内容
    Sleep    ${waitTime}
    &{correctMap}=    Execute JavaScript    return correctMap;
    Log    ${correctMap}
    [Return]    &{correctMap}

Get All Error Responses With Wait
	[Arguments]    ${waitTime}=1
    [Documentation]     获取所有返回码非200的response内容
    Sleep    ${waitTime}
    &{errorMap}=    Execute JavaScript    return errorMap;
    Log    ${errorMap}
    [Return]    &{errorMap}

Is Exist Correct Response
    [Documentation]     判断是否存在Correct Response，存在为True，否则为False
    ${is_exist}    Get All Correct Responses With Wait
    ${status}    Set Variable If    ${is_exist} != {}    True    False
    [Return]    ${status}

Is Exist Error Response
    [Documentation]     判断是否存在Error Response，存在为True，否则为False
    ${is_exist}    Get All Error Responses With Wait
    ${status}    Set Variable If    ${is_exist} != {}    True    False
    [Return]    ${status}