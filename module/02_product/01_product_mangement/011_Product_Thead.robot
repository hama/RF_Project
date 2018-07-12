*** Settings ***
Documentation     测试商品列表编辑表头展示
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Products Test Case Teardown
Force Tags        Products
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot

*** Test Cases ***
products066
    [Documentation]    验证自定义商品表头显示
    [Tags]    P0
    #验证自定义商品列表排版
    #点击“编辑表头”
    Execute Javascript    return document.querySelectorAll(".edit_head___UidlR")[0].scrollIntoView()
    Sleep    1
    Wait And Click Element    ${locator_products_editTableHead}
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
    Go TO    ${home_page}

products068
    [Documentation]    验证商品列表取消所有的表头复选框之后的显示情况
    [Tags]    P0
    #验证取消所有选中的复选框
    #点击“编辑表头”
    Execute Javascript    return document.querySelectorAll(".edit_head___UidlR")[0].scrollIntoView()
    Sleep    1
    Wait And Click Element    ${locator_products_editTableHead}
    #取消所有
    Cancel_All
    #确定
    Wait And Click Element    dom:document.querySelectorAll(".ok___1LXqc")[0]
    Sleep    1
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    上架
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    创建时间
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    库存
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    SKU
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    销量
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    浏览量

products069
    [Documentation]    验证商品列表取消部分的表头复选框之后的显示情况
    [Tags]    P0
    #验证取消部分
    #点击“编辑表头”
    Execute Javascript    return document.querySelectorAll(".edit_head___UidlR")[0].scrollIntoView()
    Sleep    1
    Wait And Click Element    ${locator_products_editTableHead}
    #选中所有
    Click_All
    #再取消上架和创建时间
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]
    #确定
    Wait And Click Element    dom:document.querySelectorAll(".ok___1LXqc")[0]
    Sleep    1
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    上架
    Element Should Not Contain    dom:document.querySelectorAll(".ant-table-thead")[0]    创建时间

products070
    [Documentation]    验证商品列表修改表头复选框之后点击取消按钮的显示情况
    [Tags]    P0
    #验证点击取消按钮的状态
    #点击“编辑表头”
    Execute Javascript    return document.querySelectorAll(".edit_head___UidlR")[0].scrollIntoView()
    Sleep    1
    #记录当前的表头排列
    ${old_count}    Execute Javascript    return document.querySelectorAll(".ant-table-thead tr")[0].querySelectorAll("th").length
    Wait And Click Element    ${locator_products_editTableHead}
    #取消
    Wait And Click Element    dom:document.querySelectorAll(".cancel___3VskU")[0]
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
    \    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]
    Sleep    1
    #再将所有复选框选中
    ${cancel}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox").length
    : FOR    ${i}    IN RANGE    ${cancel}
    \    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox")[${i}]

Cancel_All
    #取消所有
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-body")[0]
    #点击已经选中的，将他们全部取消选中
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox-checked").length
    : FOR    ${index}    IN RANGE    ${count}
    \    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]

Products Suite Setup
    [Documentation]    商品 case setup,添加商品
    Login With Default User
    Start Ajax Listener
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品,恢复到全部选中的状态
    Wait And Click Element    ${locator_products_editTableHead}
    Click_All
    Wait And Click Element    dom:document.querySelectorAll(".ok___1LXqc")[0]
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
