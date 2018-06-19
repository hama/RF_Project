*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_product.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Library           ${CURDIR}/../../../lib/customLibrary

*** Test Cases ***
Test_Tax_Page_Normal
    Go To Products Page
    Assign id To Element    dom:document.querySelectorAll(".ant-pagination-total-text")[0]    btn1
    Wait Until Element Is Visible    btn1
    #获取商品记录总数
    ${count}    Get Text    btn1
    #转换为数字类型
    ${count}    searchStr    ${count}
    #调用关键字比较商品信息
    Run Keyword If    ${count}>1    compare    ${count}

*** Keywords ***
compare
    [Arguments]    ${count}
    Sleep    1
    : FOR    ${index}    IN RANGE    ${count}
    \    Run Keyword If    ${index}==${count}-1    Exit For Loop
    \    ${a}    Get Text    dom:document.querySelectorAll("tbody .vendor___12Azd")[${index}]
    \    ${b}    time    ${a}
    \    ${c}    Get Text    dom:document.querySelectorAll("tbody .vendor___12Azd")[${index}+1]
    \    ${d}    time    ${c}
    \    Should Be True    ${b}>${d}
