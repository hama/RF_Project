*** Settings ***
Documentation     测试商品搜索
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
products071
    [Documentation]    验证商品搜索结果
    [Tags]    P0
    #商品搜索
    #获取商品名称
    Wait Until Page Contains Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #输入商品名称
    Wait And Input Text    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2]    ${name}
    #点击搜索
    Wait And Click Element    dom:document.querySelectorAll(".small_main_btn___2AyG3")[0]
    #验证搜索结果
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-tbody")[0]
    Element Should Contain    dom:document.querySelectorAll(".ant-table-tbody")[0]    ${name}

products072
    [Documentation]    验证取消商品搜索
    [Tags]    P0
    #取消商品搜索
    #获取商品名称
    Wait Until Page Contains Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #输入商品名称
    Wait And Input Text    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2]    ${name}
    #点击重置
    Wait And Click Element    dom:document.querySelectorAll(".small_btn___1P-Yc")[0]
    #输入框内容应该为空
    ${content}=    Execute Javascript    return document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2].value.length
    Should Be Equal As Strings    ${content}    0
    #验证商品数量
    #数据库中库存数量
    ${should_count}    getAllProductCount
    #查询页面上显示的商品记录总数
    Assign id To Element    dom:document.querySelectorAll(".ant-pagination-total-text")[0]    btn1
    Wait Until Element Is Visible    btn1
    ${count}    Get Text    btn1
    ${count}    searchStrs    ${count}
    #比较商品总数
    Should Be True    ${should_count}==${count}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup
    Login With Test Account
    Start Ajax Listener
    Add Product
    Sleep    5
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Delete_First_Product
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
