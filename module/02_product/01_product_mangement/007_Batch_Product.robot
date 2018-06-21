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
Edit_Normal_Page_Without_Check_Product
    [Documentation]    不选择商品，直接操作，提示请选择至少一个商品
    [Tags]    P0
    # 进行任意批量操作
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__rendered")[1]
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]
    Page Should Contain    ${content_products_tips_select_products}

Validate_Batch_Opreation
    [Documentation]    验证商品批量操作菜单栏正确显示
    [Tags]    P0
    #验证批量操作菜单栏正确
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-arrow")[1]
    Page Should Contain    上架
    Page Should Contain    下架
    Page Should Contain    删除商品
    Page Should Contain    添加标签
    Page Should Contain    移除标签
    Page Should Contain    添加到专辑
    Page Should Contain    从专辑移除
    Go TO    ${home_page}

Validate_Batch_Product_Without_Product
    [Documentation]    验证商品批量操作时不选中一个商品
    [Tags]    P0
    #验证不勾选商品点击批量操作菜单
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择操作
    Set Focus To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]
    Mouse Down    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]
    Mouse Up    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]
    Page Should Contain    请至少选择一个商品
    Go TO    ${home_page}

Product_Up
    [Documentation]    商品上架
    [Tags]    P0
    #上架一个商品
    #选中第一个商品
    #此处使用Wait And Click Element会出错
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择上架
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[0]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击确定
    Wait And Click Element    dom:document.querySelectorAll(".middle_btn___2ExQc")[0]
    Sleep    3
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #比较class
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    Should Be Equal As Strings    ${class}    ant-switch ant-switch-checked
    Go TO    ${home_page}

Product_Up_Cancel
    [Documentation]    商品取消上架
    [Tags]    P0
    #取消上架一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #获取第一个商品class
    ${should_class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    #选中第一个商品
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择上架
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[0]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击取消
    Click Element    dom:document.querySelectorAll(".cancel___Nh0a2")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #比较class
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    Should Be Equal As Strings    ${class}    ${should_class}
    Go TO    ${home_page}

Product_Down
    [Documentation]    商品下架
    [Tags]    P0
    #下架一个商品
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择下架
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击确定
    Wait And Click Element    dom:document.querySelectorAll(".middle_btn___2ExQc")[0]
    Sleep    3
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #比较class
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    Should Be Equal As Strings    ${class}    ant-switch
    Go TO    ${home_page}

Product_Down_Cancel
    [Documentation]    取消商品下架
    [Tags]    P0
    #取消下架一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #获取第一个商品class
    ${should_class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    #选中第一个商品
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择下架
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击取消
    Wait And Click Element    dom:document.querySelectorAll(".cancel___Nh0a2")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #比较class
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    Should Be Equal As Strings    ${class}    ${should_class}
    Go TO    ${home_page}

Product_Delete
    [Documentation]    删除商品
    [Tags]    P0
    #店铺中含有多个名称相同的商品，影响case运行!!!!!!!!!!!!!!!!!!!!
    #商品删除
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #获取此商品的名称
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择删除商品
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[2]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击确定
    Wait And Click Element    id:test_delete_modal_sure_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    Sleep    3
    #验证当前页面不应该含有该商品名称
    Page Should Not Contain    ${name}
    Go TO    ${home_page}

Product_Delete_Cancel
    [Documentation]    取消删除商品
    [Tags]    P0
    #取消商品删除
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #获取此商品的名称
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择删除商品
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[2]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击取消
    Wait And Click Element    id:test_delete_modal_cancel_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #验证当前页面应该含有该商品名称
    Page Should Contain    ${name}
    Go TO    ${home_page}

Product_List
    [Documentation]    删除完所有商品后，商品列表应该显示暂无数据
    [Tags]    P0
    #列表为空
    Wait Until Element Is Visible    class:table_null_p___1yzjh
    Page Should Contain    暂无数据

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup
    Login With Default User
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
