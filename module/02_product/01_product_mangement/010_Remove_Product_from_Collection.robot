*** Settings ***
Documentation     测试商品批量从专辑移除
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
Remove_Products_From_Collections
    [Documentation]    验证商品批量移除专辑，前提条件要存在两个或多个商品专辑
    [Tags]    P0
    #将两个商品一次性从两个专辑中移除
    #选中两个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[1]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[1]
    #记录下操作的商品名称
    ${name1}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${name2}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[1]
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择从专辑移除
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[6]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0]
    #选中专辑
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[1]
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".confirm___3pVk5")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #去商品专辑模块检查
    Wait And Click Element    dom:document.querySelectorAll(".menu_item___3VgTh")[2].querySelectorAll("a")[0]
    #进入专辑详情查看是否存在刚刚添加的商品
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains    专辑详情
    Page Should Not Contain    ${name1}
    Sleep    1
    #点击返回商品专辑
    Wait And Click Element    dom:document.querySelectorAll(".back1")[0]
    #进入专辑详情查看是否存在刚刚添加的商品
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[1]
    Wait Until Page Contains    专辑详情
    Page Should Not Contain    ${name2}
    Go TO    ${home_page}

Remove_Product_From_Collections
    [Documentation]    验证一个商品从两个专辑中批量移除
    [Tags]    P0
    #将一个商品从两个专辑中移除
    #选中1个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #记录下操作的商品名称
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择从专辑移除
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[6]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    #选中专辑
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[1]
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".confirm___3pVk5")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #去商品专辑模块检查
    Wait And Click Element    dom:document.querySelectorAll(".menu_item___3VgTh")[2].querySelectorAll("a")[0]
    #进入专辑详情查看是否存在刚刚添加的商品
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains    专辑详情
    Page Should Not Contain    ${name}
    Sleep    1
    #点击返回商品专辑
    Wait And Click Element    dom:document.querySelectorAll(".back1")[0]
    #进入另一个专辑详情查看是否存在刚刚添加的商品
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains    专辑详情
    Page Should Not Contain    ${name}
    Go TO    ${home_page}

Remove_Product_From_Collection_Without_Product
    [Documentation]    验证商品批量移除专辑时，未选择商品
    [Tags]    P0
    #未选择商品，提示请勾选一个商品
    #不选择商品
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择从专辑移除
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[6]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #页面提示信息
    Page Should Contain    请至少选择一个商品
    Go TO    ${home_page}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,添加商品，专辑
    Login With Default User
    Start Ajax Listener
    #Add Product
    Go TO    ${home_page}
    #Add Product
    Go TO    ${home_page}
    Add_Collection
    Go TO    ${home_page}
    Add_Collection
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品，专辑
    #Delete_Collection
    Go TO    ${home_page}
    #Delete_Collection
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
