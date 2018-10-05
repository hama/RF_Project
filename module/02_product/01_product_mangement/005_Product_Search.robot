*** Settings ***
Documentation     测试商品搜索
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_product_management.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_product_management.robot

*** Test Cases ***
products071
    [Documentation]    验证商品搜索结果
    [Tags]    P0
    #商品搜索
    #获取商品名称
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_text_firstProductName}
    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
    #输入商品名称
    Wait And Input Text    ${locatorB_productsMgmt_input_name}    ${name}
    #点击搜索
    Wait And Click Element    dom:document.querySelectorAll(".small_main_btn___2AyG3")[0]
    #验证搜索结果
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".ant-table-tbody")[0]
    Element Should Contain    dom:document.querySelectorAll(".ant-table-tbody")[0]    ${name}

products072
    [Documentation]    验证取消商品搜索
    [Tags]    P0
    #取消商品搜索
    #获取商品名称
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_text_firstProductName}
    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
    #输入商品名称
    Wait And Input Text    ${locatorB_productsMgmt_input_name}    ${name}
    #点击重置
    Wait And Click Element    dom:document.querySelectorAll(".small_btn___1P-Yc")[0]
    #输入框内容应该为空
    ${content}=    Execute Javascript    return document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2].value.length
    Should Be Equal As Strings    ${content}    0
    #验证商品数量
    #数据库中库存数量
    ${should_count}    getAllProductCount_py
    #查询页面上显示的商品记录总数
    Assign id To Element    ${locatorB_page_text_totalRecord}    btn1
    Wait Until Element Is Visible    btn1
    ${count}    Get Text    btn1
    ${count}    searchStrs_py    ${count}
    #比较商品总数
    Should Be True    ${should_count}==${count}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup
    Login With Default User
    Start Ajax Listener
    Go To Product Management Page

Products Suite Teardown
    [Documentation]    删除商品
    Close Test Suite Browser

Products Test Case Setup
    Go To Product Management Page

