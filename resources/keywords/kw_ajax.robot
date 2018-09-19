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