*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot    # import login keyword
Resource          ../../../resources/browser.robot    # import ajax listener keyword
Library           /usr/local/lib/python2.7/site-packages/customLibrary

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
    Wait Until Element Is Visible    document.getElementsByClassName("ant-switch")
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
