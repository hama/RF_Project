*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Upload_Success
    [Documentation]    上传商品成功
    [Tags]    P0
    #上传商品成功
    #模版文件
    ${file}    Set Variable    /Users/lizhicheng/dianjiang/shoplaza_robot/module/02_product/product_template.xlsx
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击批量上传按钮
    Sleep    3
    Wait Until Element Is Visible    dom:document.querySelectorAll(".import___3EkG3 i")[0]
    Click Element    dom:document.querySelectorAll(".import___3EkG3 i")[0]
    #等待上传按钮
    Wait Until Page Contains Element    id:sheets
    #上传文件
    Choose File    id:sheets    ${file}
    #点击上传
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-btn-submit")[0]
    Click Element    dom:document.querySelectorAll(".ant-btn-submit")[0]
    #等待上传提示
    Sleep    3
    Wait Until Element Is Visible    dom:document.querySelectorAll(".tip___2LkVX")[0]
    ${tip}    Get Text    dom:document.querySelectorAll(".tip___2LkVX")[0]
    Should Be Equal As Strings    ${tip}    您已成功导入1条商品，0条商品导入失败。

Upload_Wrong
    [Documentation]    上传商品失败
    [Tags]    P0
    #上传商品失败
    #模版文件
    ${file}    Set Variable    /Users/lizhicheng/dianjiang/shoplaza_robot/module/02_product/wrong_format.xlsx
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击批量上传按钮
    Sleep    3
    Wait Until Element Is Visible    dom:document.querySelectorAll(".import___3EkG3 i")[0]
    Click Element    dom:document.querySelectorAll(".import___3EkG3 i")[0]
    #等待上传按钮
    Wait Until Page Contains Element    id:sheets
    #上传文件
    Choose File    id:sheets    ${file}
    Sleep    1
    #提示上传文件有错误
    ${title}    Get Text    dom:document.querySelectorAll(".ant-btn-submit span")[0]
    Should Be Equal As Strings    ${title}    忽略错误,开始导入

Upload_Success_Without_Same
    [Documentation]    上传重复的商品
    [Tags]    P0
    #上传重复的商品
    #模版文件
    ${file}    Set Variable    /Users/lizhicheng/dianjiang/shoplaza_robot/module/02_product/product_template.xlsx
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击批量上传按钮
    Sleep    3
    Wait Until Element Is Visible    dom:document.querySelectorAll(".import___3EkG3 i")[0]
    Click Element    dom:document.querySelectorAll(".import___3EkG3 i")[0]
    #等待覆盖选项
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    #等待上传按钮
    Wait Until Page Contains Element    id:sheets
    #上传文件
    Choose File    id:sheets    ${file}
    #点击上传
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-btn-submit")[0]
    Click Element    dom:document.querySelectorAll(".ant-btn-submit")[0]
    #等待上传提示
    Sleep    3
    Wait Until Element Is Visible    dom:document.querySelectorAll(".tip___2LkVX")[0]
    ${tip}    Get Text    dom:document.querySelectorAll(".tip___2LkVX")[0]
    Should Be Equal As Strings    ${tip}    您已成功导入1条商品，0条商品导入失败，已忽略重复商品。
