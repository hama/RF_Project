*** Settings ***
Documentation     测试商品批量上下架
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
products034
    [Documentation]    商品上架,第一个商品必须要有图片
    [Tags]    P0
    #上架一个商品
    Click_First_Product_And_Click_Batch_Menu
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

products035
    [Documentation]    商品取消上架
    [Tags]    P0
    #取消上架一个商品
    #获取第一个商品class
    ${should_class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    Click_First_Product_And_Click_Batch_Menu
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

products036
    [Documentation]    商品下架
    [Tags]    P0
    #下架一个商品
    Click_First_Product_And_Click_Batch_Menu
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
    Should Be Equal As Strings    ${class}    ant-switch ant-switch-checked
    Go TO    ${home_page}

products037
    [Documentation]    取消商品下架
    [Tags]    P0
    #取消下架一个商品
    #获取第一个商品class
    ${should_class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    Click_First_Product_And_Click_Batch_Menu
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

products039
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
    Wait And Click Element    ${locator_products_cancelDelete}
    #Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #验证当前页面应该含有该商品名称
    #Page Should Contain    ${name}
    Go TO    ${home_page}

products038
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
    Wait And Click Element    ${locator_products_delBtn}
    #Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #Sleep    3
    #验证当前页面不应该含有该商品名称
    #Page Should Not Contain    ${name}
    Go TO    ${home_page}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup
    Login With Default User
    Start Ajax Listener
    Go To Products Page

Products Suite Teardown
    [Documentation]    不需要删除商品
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
