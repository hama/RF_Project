*** Settings ***



*** keywords ***

UploadFile Suite Setup
    [Documentation]
    Login With Default User
    kwfilemanagement.del_all_file_py

UploadFile Suite Teardown
    [Documentation]
    Close Test Suite Browser

UploadFile Case Setup
    [Documentation]
    kwfilemanagement.del_all_file_py
    Go To Uploadfile Page

UploadFile Case Teardown
    [Documentation]
    Teardown Test Case





DelImg
    [Documentation]    删除图片方法
    Wait Until Page Contains Text    商品图
    ${res}    Execute JavaScript    return document.querySelectorAll('tbody tr')[0]===undefined
    Run keyword If    '${res}'=='False'    Wait And Click Element    ${locatorB_uploadFile_icon_delImg}
    Run keyword If    '${res}'=='False'    Wait And Click Element    ${locatorB_global_alert_confirm}
    Sleep    2

#Wait Add Upfile
#    [Documentation]    添加30个文件
#    [Arguments]    ${count}=10
#    :FOR    ${i}    IN RANGE    ${count}
#    \    ${res_status}    add_upfiles_py
#    \    Sleep    12
#    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
#    \    ...    ELSE    Sleep    5

#Wait Del Upfile
#    [Documentation]    接口删除
#    [Arguments]    ${count}=10
#    :FOR    ${i}    IN RANGE    ${count}
#    \    ${res_status}    del_upfiles_py
#    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
#    \    ...    ELSE    Sleep    1