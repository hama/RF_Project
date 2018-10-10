*** Settings ***
Suite Setup       Common Suite
Suite Teardown    Close Test Suite Browser
Test Teardown     Teardown Test Case
Force Tags        Invitaion
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/variable/var_common.robot
Resource          ../../resources/variable/var_uploadfile.robot
Library           ${CURDIR}/../../lib/customlib/kwstore.py


*** Test Cases ***
uploadFile001
    [Documentation]    测试素材库界面可正常进入
    [Tags]    P0    threshold
    Go To Uploadfile Page
    Wait Until Page Contains    商品图

uploadFile003
    [Documentation]    测试素材库界面产品和上传tab > "1.点击产品,查看结果" > 页面显示商品中所上传的所有图片或文件
    [Tags]    P0    threshold
    Go To Uploadfile Page
    Wait And Click Element    dom:document.querySelectorAll('.ant-tabs-tab')[0]

uploadFile004
    [Documentation]    测试素材库界面产品和上传tab > "1.点击上传,2.查看结果" > 页面显示所有在素材库上传的图片或文件
    [Tags]    P1    threshold
    Go To Uploadfile Page
    Wait Until Page Contains Locator    ${locatorB_upfile_add_btn}
    Choose File    ${locatorB_upfile_add_btn}    ${file_products_addImg2}
    Sleep    2
    Wait Until Page Contains    上传成功
    Wait Until Page Contains Locator    ${locatorB_upfile_firstTr_elm}
    DelImg

uploadFile005
    [Documentation]    "1.在商品编辑界面添加商品并上传图片1.jpg,2.在素材库产品页面查看" > 产品页面显示图片1.jpg
    [Tags]    P0
    Go To Uploadfile Page
    Wait Until Page Contains Locator    ${locatorB_upfile_add_btn}
    Choose File    ${locatorB_upfile_add_btn}    ${file_products_addImg2}
    Sleep    2
    Wait Until Page Contains Locator    ${locatorB_upfile_firstTr_elm}
    ${res}    Execute JavaScript    return document.querySelectorAll('tbody tr td')[2].innerHTML
    Should Be True    '${res}'=='<div>mv.jpg</div>'
    
uploadFile006
    [Documentation]    "1.在产品界面点击添加按钮,2.查看结果" > 打开本地文件选择窗口
    [Tags]    P0    threshold
    Go To Uploadfile Page
    Wait And Click Element    ${locatorB_upfile_upload_btn}

uploadFile009
    [Documentation]    测试上传栏 > "1.在上传界面点击添加按钮,2.在本地文件中选择图片3.jpg,3.点击确认" > 显示上传成功，上传栏中显示图片3.jpg
    [Tags]    P0    threshold
    Go To Uploadfile Page
    #.切换到 上传文件 栏目
    Wait And Click Element    ${locatorB_upfile_upfile_txt}
    Choose File    ${locatorB_upfile_add_btn}    ${file_products_addImg2}
    Sleep    2
    Wait Until Page Contains    上传成功
    Wait Until Page Contains Locator    ${locatorB_upfile_firstTr_elm}
    DelImg

uploadFile011
    [Documentation]    测试素材链接及复制按钮
    [Tags]    P0    threshold
    Go To Uploadfile Page
    Choose File    ${locatorB_upfile_add_btn}    ${file_products_addImg2}
    Sleep    2
    Wait Until Page Contains    上传成功
    Wait Until Page Contains Locator    ${locatorB_upfile_firstTr_elm}
    ${xurl}    Execute JavaScript    return document.querySelectorAll('tbody tr td div input')[0].value
    Execute Javascript    window.open("${xurl}")
    Select Window    New
    Sleep    2
    ${data}    Execute Javascript    return document.querySelectorAll('img')[0].src
    Should Be True    '${data}'<>''
    
uploadFile012
    [Documentation]    测试素材栏删除按钮 > "1.点击删除按钮,2.查看结果" > 点击删除按钮时弹出二次确认弹窗提示是否删除
    [Tags]    P0    threshold
    Go To Uploadfile Page
    Wait Until Page Contains Locator    ${locatorB_upfile_firstTr_elm}
    #.点击删除
    Wait And Click Element    ${locatorB_upfile_del_img}
    Wait Until Page Contains    确定

uploadFile013
    [Documentation]    测试素材栏删除按钮 > "1.点击删除按钮,2.查看结果" > 点击确认
    [Tags]    P0    threshold
    Go To Uploadfile Page
    Wait Until Page Contains Locator    ${locatorB_upfile_firstTr_elm}
    #.点击删除
    Wait And Click Element    ${locatorB_upfile_del_img}
    #.点击确定
    Wait And Click Element    ${locatorB_global_alert_confirm}
    Wait Until Page Does Not Contain Element     ${locatorB_upfile_firstTr_elm}

uploadFile014
    [Documentation]    "1.已在素材库界面,2.素材库已有内容,3.网络正常" > 测试素材栏删除按钮 点击取消 > 本次不会删除
    [Tags]    P0    threshold
    Go To Uploadfile Page
    Wait Until Page Contains Locator    ${locatorB_upfile_add_btn}
    Choose File    ${locatorB_upfile_add_btn}    ${file_products_addImg2}
    Sleep    2
    Wait Until Page Contains Locator    ${locatorB_upfile_firstTr_elm}
    #.点击删除
    Wait And Click Element    ${locatorB_upfile_del_img}
    #.点击取消
    Wait And Click Element    ${locatorB_global_alert_cancel}
    Wait Until Page Contains Locator    ${locatorB_upfile_firstTr_elm}

uploadFile015
    [Documentation]    测试批量删除 > 显示删除
    [Tags]    P1    threshold
    Go To Uploadfile Page
    Wait Until Page Contains Locator    ${locatorB_upfile_add_btn}
    #.点击批量选中
    Wait And Click Element    ${locatorB_upfile_batchSect_elm}
    #.显示删除 元素
    Wait Until Page Contains Locator    ${locatorB_upfile_del_img}

uploadFile018
    [Documentation]    测试下一页上一页按钮 > 素材列表切换到下一页
    [Tags]    P1    threshold
    #.添加30个
    ${res}    Wait Add Upfile
    Log    ${res}
    Go To Uploadfile Page
    Wait Until Page Contains Locator    ${locatorB_upfile_add_btn}
    #.点击下一页
    Wait And Click Element    ${locatorB_upfile_nextPge_btn}
    #删除所有
    Wait Del Upfile

uploadFile019
    [Documentation]    测试下一页上一页按钮 > 素材列表切换到上一页
    [Tags]    P1    threshold
    #.添加30个
    ${res}    Wait Add Upfile
    Log    ${res}
    Go To Uploadfile Page
    Wait Until Page Contains Locator    ${locatorB_upfile_add_btn}
    #.点击下一页
    Wait And Click Element    ${locatorB_upfile_nextPge_btn}
    #.点击上一页
    Wait And Click Element    ${locatorB_upfile_prePge_btn}
    #删除所有
    Wait Del Upfile

*** keywords ***
Common Suite
    [Documentation]    公共suite
    Login With Default User
    Wait Del Upfile

DelImg
    [Documentation]    删除图片方法
    Wait Until Page Contains    商品图
    ${res}    Execute JavaScript    return document.querySelectorAll('tbody tr')[0]===undefined
    Run keyword If    '${res}'=='False'    Wait And Click Element    ${locatorB_upfile_del_img}
    Run keyword If    '${res}'=='False'    Wait And Click Element    ${locatorB_global_alert_confirm}
    Sleep    2

Wait Add Upfile
    [Documentation]    添加30个文件
    [Arguments]    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    add_upfiles_py
    \    Sleep    12
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    5

Wait Del Upfile
    [Documentation]    接口删除
    [Arguments]    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    del_upfiles_py
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1