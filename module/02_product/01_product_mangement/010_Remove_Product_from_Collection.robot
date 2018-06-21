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
Remove_Products_From_Collections
    [Documentation]    验证商品批量移除专辑
    [Tags]    P0
    #将两个商品一次性从两个专辑中移除
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中两个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[1]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[1]
    #记录下操作的商品名称
    ${name1}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${name2}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[1]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择从专辑移除
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[6]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Sleep    1
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    #选中专辑
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[1]
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".confirm___3pVk5")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #去商品专辑模块检查
    Sleep    1
    Wait Until Page Contains Element    dom:document.querySelectorAll(".menu_item___3VgTh")[1].querySelectorAll("a")[0]
    Click Element    dom:document.querySelectorAll(".menu_item___3VgTh")[1].querySelectorAll("a")[0]
    Sleep    1
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    #进入专辑详情查看是否存在刚刚添加的商品
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains    专辑详情
    Page Should Not Contain    ${name1}
    Sleep    1
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]
    Click Element    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]
    #进入专辑详情查看是否存在刚刚添加的商品
    Wait Until Page Contains    专辑详情
    Page Should Not Contain    ${name2}

Remove_Product_From_Collections
    [Documentation]    验证一个商品从两个专辑中批量移除
    [Tags]    P0
    #将一个商品从两个专辑中移除
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中1个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #记录下操作的商品名称
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择从专辑移除
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[6]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Sleep    1
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    #选中专辑
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[0]
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[1]
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".confirm___3pVk5")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #去商品专辑模块检查
    Sleep    1
    Wait Until Page Contains Element    dom:document.querySelectorAll(".menu_item___3VgTh")[1].querySelectorAll("a")[0]
    Click Element    dom:document.querySelectorAll(".menu_item___3VgTh")[1].querySelectorAll("a")[0]
    Sleep    1
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    #进入专辑详情查看是否存在刚刚添加的商品
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains    专辑详情
    Page Should Not Contain    ${name}
    Sleep    1
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]
    Click Element    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]
    #进入另一个专辑详情查看是否存在刚刚添加的商品
    Wait Until Page Contains    专辑详情
    Page Should Not Contain    ${name}

Remove_Product_From_Collection_Without_Product
    [Documentation]    验证商品批量移除专辑时，未选择商品
    [Tags]    P0
    #未选择商品，提示请勾选一个商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #不选择商品
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择从专辑移除
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[6]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #页面提示信息
    Page Should Contain    请至少选择一个商品
