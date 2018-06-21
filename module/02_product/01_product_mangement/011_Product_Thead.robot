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
Validate_Thead_Page
    [Documentation]    验证自定义商品列表排版
    [Tags]    P0
    #验证自定义商品列表排版
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击“编辑表头”
    Wait Until Page Contains Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Click Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    #验证弹窗中的排版信息
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #可选复选框个数
    ${count}    Execute Javascript    return document.querySelectorAll(".col___39m-D").length
    Should Be True    ${count}==6
    Page Should Contain    上架
    Page Should Contain    创建时间
    Page Should Contain    库存
    Page Should Contain    sku
    Page Should Contain    销量
    Page Should Contain    浏览量
    #确定／取消按钮
    Page Should Contain Element    dom:document.querySelectorAll(".cancel___3VskU")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ok___1LXqc")[0]

Validate_Cancel_All
    [Documentation]    验证商品列表取消所有的表头复选框之后的显示情况
    [Tags]    P0
    #验证取消所有选中的复选框
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击“编辑表头”
    Wait Until Page Contains Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Click Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    #取消所有
    Cancel_All
    #确定
    Click Element    dom:document.querySelectorAll(".ok___1LXqc")[0]
    Sleep    1
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    上架
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    创建时间
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    库存
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    SKU
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    销量
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    浏览量

Validate_Cancel_Part
    [Documentation]    验证商品列表取消部分的表头复选框之后的显示情况
    [Tags]    P0
    #验证取消部分
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击“编辑表头”
    Wait Until Page Contains Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Click Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    #选中所有
    Click_All
    #再取消上架和创建时间
    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]
    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]
    #确定
    Click Element    dom:document.querySelectorAll(".ok___1LXqc")[0]
    Sleep    1
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    上架
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    创建时间

Click_Cancel_Button
    [Documentation]    验证商品列表修改表头复选框之后点击取消按钮的显示情况
    [Tags]    P0
    #验证点击取消按钮的状态
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击“编辑表头”
    Wait Until Page Contains Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Sleep    1
    #记录当前的表头排列
    ${old_count}    Execute Javascript    return document.querySelectorAll(".ant-table-thead tr")[0].querySelectorAll("th").length
    Click Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    #取消
    Click Element    dom:document.querySelectorAll(".cancel___3VskU")[0]
    Sleep    1
    #记录现在的表头
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-table-thead tr")[0].querySelectorAll("th").length
    Should Be True    ${old_count}==${count}

*** Keywords ***
Click_All
    #选中所有
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-body")[0]
    #点击已经选中的，将他们全部取消选中
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox-checked").length
    : FOR    ${index}    IN RANGE    ${count}
    \    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]
    Sleep    1
    #再将所有复选框选中
    ${cancel}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox").length
    : FOR    ${i}    IN RANGE    ${cancel}
    \    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox")[${i}]

Cancel_All
    #取消所有
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-body")[0]
    #点击已经选中的，将他们全部取消选中
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox-checked").length
    : FOR    ${index}    IN RANGE    ${count}
    \    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]
