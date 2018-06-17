*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Validate_Product_Down
    #验证商品下架
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #切换到下架商品
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-radio-button-wrapper")[2]
    Click Element    dom:document.querySelectorAll(".ant-radio-button-wrapper")[2]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody .ant-table-row")[0]
    #获取当前页展示的商品数量
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-table-tbody .ant-table-row").length
    #显示下架商品总记录数
    Assign id To Element    dom:document.querySelectorAll(".ant-pagination-total-text")[0]    btn1
    Wait Until Element Is Visible    btn1
    ${should_count}    Get Text    btn1
    #转换为数字类型
    ${should_count}    searchStr    ${should_count}
    #与数据库数据对比
    ${database_count}    selectProductCountByStatus    0
    Should Be Equal As Integers    ${should_count}    ${database_count}
    #判断当前页所有商品状态是否都为下架
    : FOR    ${i}    IN RANGE    ${count}
    \    ${status}    Execute Javascript    return document.querySelectorAll(".ant-switch")[${i}].getAttribute("class")
    \    Should Be Equal As Strings    ${status}    ant-switch
    #验证是否按时间排序
    Run Keyword If    ${count}>1    compare    ${count}

No_Product
    #验证无下架商品时，商品下架的提示信息
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #切换到下架商品
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-radio-button-wrapper")[2]
    Click Element    dom:document.querySelectorAll(".ant-radio-button-wrapper")[2]
    Sleep    1
    Page Should Contain    暂无数据

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
