*** Settings ***
Documentation     测试商品批量从专辑移除
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Products Test Case Teardown
Force Tags        Products
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_products.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_products.robot

*** Test Cases ***
products103
    [Documentation]    上传商品成功
    [Tags]    P0
    #上传商品成功
    #点击批量上传按钮
    Wait And Click Element    ${locatorB_productsMgmt_icon_uploadProduct}
    #等待上传按钮
    Wait Until Page Contains Element    id:sheets
    #上传文件
    Choose File    id:sheets    ${file_products_template}
    #点击上传
    Wait And Click Element    dom:document.querySelectorAll(".ant-btn-submit")[0]
    #等待上传提示
    Sleep    10
    Wait Until Element Is Visible    dom:document.querySelectorAll(".tip___2LkVX")[0]
    ${tip}    Get Text    dom:document.querySelectorAll(".tip___2LkVX")[0]
    #Should Be Equal As Strings    ${tip}    您已成功导入1条商品，0条商品导入失败。
    Go TO    ${home_page}

products104
    [Documentation]    上传商品失败
    [Tags]    P0
    #上传商品失败
    #点击批量上传按钮
    Sleep    5
    Wait And Click Element    ${locatorB_productsMgmt_icon_uploadProduct}
    #等待上传按钮
    Wait Until Page Contains Element    id:sheets
    #上传文件
    Choose File    id:sheets    ${file_products_wrong_template}
    Sleep    10
    #提示上传文件有错误
    ${title}    Get Text    dom:document.querySelectorAll(".ant-btn-submit span")[0]
    Should Be Equal As Strings    ${title}    忽略错误,开始导入
    Go TO    ${home_page}

products105
    [Documentation]    上传重复的商品
    [Tags]    P0
    #上传重复的商品
    #点击批量上传按钮
    Sleep    5
    Wait And Click Element    ${locatorB_productsMgmt_icon_uploadProduct}
    #等待覆盖选项
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    #等待上传按钮
    Wait Until Page Contains Element    id:sheets
    #上传文件
    Choose File    id:sheets    ${file_products_template}
    #点击上传
    Wait And Click Element    dom:document.querySelectorAll(".ant-btn-submit")[0]
    #等待上传提示
    Sleep    10
    Wait Until Element Is Visible    dom:document.querySelectorAll(".tip___2LkVX")[0]
    ${tip}    Get Text    dom:document.querySelectorAll(".tip___2LkVX")[0]
    #Should Be Equal As Strings    ${tip}    您已成功导入1条商品，0条商品导入失败，已忽略重复商品。
    Go TO    ${home_page}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup
    Login With Default User
    Start Ajax Listener
    Sleep    5
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
