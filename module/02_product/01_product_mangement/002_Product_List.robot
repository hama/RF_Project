*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot    # import login keyword
Resource          ../../../resources/browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Product_Total
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #查询数据库中商品总数
    ${should_be}    getProductCount
    #查询页面上显示的商品记录总数
    Assign id To Element    dom:document.querySelectorAll(".ant-pagination-total-text")[0]    btn1
    Wait Until Element Is Visible    btn1
    ${count}    Get Text    btn1
    ${count}    searchStr    ${count}
    #比较商品总数
    Should Be True    ${should_be}==${count}
    #获取商品总数
    ${all_count}    Execute Javascript    return document.getElementsByClassName("ant-switch").length
    Assign id To Element    dom:document.querySelectorAll(".ant-select-selection-selected-value")[1]    btn2
    Wait Until Element Is Visible    btn2
    ${size}    Get Text    btn2
    ${size}    searchStr    ${size}
    Log    ${size}
    Run Keyword If    ${should_be}<=${size}    Should Be True    ${should_be}==${all_count}
    Run Keyword If    ${should_be}>${size}    Should Be True    ${all_count}==${size}

Up_And_Down_Product
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    dom:document.getElementsByClassName("ant-switch")[0]
    #获取商品总数，包含上下架商品
    ${all_count}    Execute Javascript    return document.getElementsByClassName("ant-switch").length
    #获取上架商品数量
    ${up_product}    Execute Javascript    return document.getElementsByClassName("ant-switch-checked").length
    #上架商品数量应该大于0
    Should Be True    ${up_product}>0
    #上架商品数量应该小于商品总数
    Should Be True    ${up_product}<${all_count}

Validate_All_Tab
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    ${class_should_be}=    Set Variable    ant-radio-button-wrapper ant-radio-button-wrapper-checked
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-radio-button-wrapper")[0].getAttribute('class')
    Should Be Equal As Strings    ${class_should_be}    ${class}

Validate_Table
    #验证表头显示
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Sleep    1
    Assign Id To Element    dom:document.querySelectorAll(".editBtn___2yB79")[1]    btn1
    Wait Until Element Is Visible    btn1
    Click Element    btn1
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
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".ok___1LXqc")[0]
    #添加完所有表头之后再进行表头信息的检验
    Page Should Contain Element    dom:document.querySelectorAll(".ant-table-thead tr th input")[0]
    Page Should Contain    商品图片
    Page Should Contain    商品名称
    Page Should Contain    库存
    Page Should Contain    SKU
    Page Should Contain    浏览量
    Page Should Contain    销量
    Page Should Contain    上架
    Page Should Contain    操作
    Page Should Contain    创建时间
    Page Should Contain Element    dom:document.querySelectorAll(".preview___37DtU")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".delete___2xfx-")[0]
    #图片
    Page Should Contain Element    dom:document.querySelectorAll(".center___1nHSZ")[0]
    #库存
    #在这里修改情况，验证第一个商品是否有库存
    ${should_quantity}    getFirstProductQuantity
    ${show_quantity}    Get Text    dom:document.querySelectorAll(".ant-table-tbody tr")[0].getElementsByTagName("td")[3]
    #如果库存为0
    Run Keyword If    ${should_quantity}==0    compare_quantity    ${show_quantity}
    Run Keyword If    ${should_quantity}>0    compare_quantity2    ${show_quantity}    ${should_quantity}

Validate_Product_Status
    #验证表头显示
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody .ant-table-row")[0]
    #获取当前页展示的商品数量
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-table-tbody .ant-table-row").length
    #判断当前页所有商品状态
    : FOR    ${i}    IN RANGE    ${count}
    \    ${status}    getProductStatus    ${i}
    \    Run Keyword If    ${status}==0    should_be_down    ${i}
    \    Run Keyword If    ${status}==1    should_be_up    ${i}

*** Keywords ***
compare_quantity
    [Arguments]    ${show_quantity}
    Should Be Equal As Strings    ${show_quantity}    N/A

compare_quantity2
    [Arguments]    ${show_quantity}    ${should_quantity}
    ${show_quantity}    searchStr    ${show_quantity}
    Should Be True    ${show_quantity}==${should_quantity}

should_be_down
    [Arguments]    ${i}
    #获取按钮类名
    ${class_name}    Execute Javascript    return document.getElementsByClassName("ant-switch")[${i}].getAttribute("class")
    Should Be Equal As Strings    ${class_name}    ant-switch

should_be_up
    [Arguments]    ${i}
    #获取按钮类名
    ${class_name}    Execute Javascript    return document.getElementsByClassName("ant-switch")[${i}].getAttribute("class")
    Should Be Equal As Strings    ${class_name}    ant-switch ant-switch-checked
