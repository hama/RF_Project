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
Product_Search
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