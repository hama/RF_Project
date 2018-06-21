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
Product_Search
    [Documentation]    验证商品搜索结果
    [Tags]    P0
    #商品搜索
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #获取商品名称
    Wait Until Page Contains Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #输入商品名称
    Wait Until Page Contains Element    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2]
    Input Text    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2]    ${name}
    #点击搜索
    Wait Until Page Contains Element    dom:document.querySelectorAll(".small_main_btn___2AyG3")[0]
    Click Element    dom:document.querySelectorAll(".small_main_btn___2AyG3")[0]
    #验证搜索结果
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-tbody")[0]
    Element Should Contain    dom:document.querySelectorAll(".ant-table-tbody")[0]    ${name}

Cancel_Product_Search
    [Documentation]    验证取消商品搜索
    [Tags]    P0
    #取消商品搜索
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #获取商品名称
    Wait Until Page Contains Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #输入商品名称
    Wait Until Page Contains Element    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2]
    Input Text    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2]    ${name}
    #点击重置
    Wait Until Page Contains Element    dom:document.querySelectorAll(".small_btn___1P-Yc")[0]
    Click Element    dom:document.querySelectorAll(".small_btn___1P-Yc")[0]
    #输入框内容应该为空
    ${content}    Execute Javascript    return document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2].value
    Should Be True    '${content}'==''
    #验证商品数量
    #数据库中库存数量
    ${should_count}    getProductCount
    #查询页面上显示的商品记录总数
    Assign id To Element    dom:document.querySelectorAll(".ant-pagination-total-text")[0]    btn1
    Wait Until Element Is Visible    btn1
    ${count}    Get Text    btn1
    ${count}    searchStr    ${count}
    #比较商品总数
    Should Be True    ${should_count}==${count}
