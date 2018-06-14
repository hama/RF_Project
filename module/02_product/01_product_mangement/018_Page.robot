*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/kw_login.robot    
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Test_Normal_Page
    #翻页正常
    #运行环境需要已有多个商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #数据库中的商品总数
    ${count}    getAllProductCount
    #等待渲染数据
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    #滚动到最底部
    Execute Javascript    return document.querySelectorAll(".ant-pagination")[0].scrollIntoView()
    #选择翻页，这里选择第二页
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-pagination-item")[1]
    Click Element    dom:document.querySelectorAll(".ant-pagination-item")[1]
    #获取页面显示的商品总数
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-pagination-total-text")[0]
    ${show_count}    Get Text    dom:document.querySelectorAll(".ant-pagination-total-text")[0]
    ${show_count}    searchStr    ${show_count}
    #比较商品总数
    Should Be True    ${count}==${show_count}
    #获取每页多少条数据
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection-selected-value")[1]
    ${size}    Get Text    dom:document.querySelectorAll(".ant-select-selection-selected-value")[1]
    ${size}    searchStr    ${size}
    #应有的页数
    ${page}    pageCount    ${count}    ${size}
    #页面上显示的页数
    ${show_page}    Execute Javascript    return document.querySelectorAll(".ant-pagination-item").length
    Should Be True    ${page}==${show_page}
    #验证跳转到正确的页数
    Sleep    2
    ${class_name}    Execute Javascript    return document.querySelectorAll(".ant-pagination-item")[1].getAttribute("class")
    Should Be Equal As Strings    ${class_name}    ant-pagination-item ant-pagination-item-2 ant-pagination-item-active
    #验证展示正确的商品
    #获取当前页面返回的商品信息
    ${titles}    validateProductByPageAndSize    1    ${size}
    #循环比对
    ${i}    Set Variable    0
    : FOR    ${title}    IN    ${titles}
    \    ${this_title}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[${i}]
    \    Should Be Equal As Strings    ${title}    ['${this_title}']
    \    ${i}    Set Variable    ${i}+1

Validate_Location_Page
    #验证点击翻页后，点进商品详情页，再退出，会返回到正确到页数
    #运行环境需要已有多个商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #数据库中的商品总数
    ${count}    getAllProductCount
    #等待渲染数据
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    #滚动到最底部
    Execute Javascript    return document.querySelectorAll(".ant-pagination")[0].scrollIntoView()
    #选择翻页，这里选择第二页
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-pagination-item")[1]
    Click Element    dom:document.querySelectorAll(".ant-pagination-item")[1]
    #点进商品详情
    Sleep    2
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    #点击返回按钮
    Wait Until Page Contains Element    dom:document.querySelectorAll(".back1")[0]
    Click Element    dom:document.querySelectorAll(".back1")[0]
    #验证返回的页数是否还是第二页
    #滚动到最底部
    Execute Javascript    return document.querySelectorAll(".ant-pagination")[0].scrollIntoView()
    #判断当前在第几页
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-pagination-item")[1]
    ${class_name}    Execute Javascript    return document.querySelectorAll(".ant-pagination-item")[1].getAttribute("class")
    Should Be Equal As Strings    ${class_name}    ant-pagination-item ant-pagination-item-2 ant-pagination-item-active
