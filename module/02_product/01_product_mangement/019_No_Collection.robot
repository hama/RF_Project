*** Settings ***
Documentation     测试商品列表
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
products058
    [Documentation]    验证商品批量添加专辑时，无专辑数据
    [Tags]    P0
    #验证无专辑数据时
    Click_First_Product_And_Click_Batch_Menu
    #选择添加到专辑
    Assign Id To Element    ${locator_products_dropdown_addtoCategory}    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    ${locator_products_popUps}
    #提示专辑暂无数据
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-placeholder")[0]
    ${title}    GetText    dom:document.querySelectorAll(".ant-table-placeholder")[0]
    Should Be Equal As Strings    ${title}    ${content_products_empty}
    Go TO    ${home_page}

*** Keywords ***
Products Suite Setup
    [Documentation]    删除所有专辑
    Login With Default User
    Start Ajax Listener
    Delete_All_Collection
    Sleep    5
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除所有商品
    Go To Products Page
    Sleep    5
    Delete_All_Products
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
