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
Validate_No_Collection
    [Documentation]    验证商品批量添加专辑时，无专辑数据
    [Tags]    P0
    #验证无专辑数据时
    Click_First_Product_And_Click_Batch_Menu
    #选择添加到专辑
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #提示专辑暂无数据
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-placeholder")[0]
    ${title}    GetText    dom:document.querySelectorAll(".ant-table-placeholder")[0]
    Should Be Equal As Strings    ${title}    ${content_products_empty}
    Go TO    ${home_page}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,添加商品
    Login With Test Account
    Start Ajax Listener
    #Add Product
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
