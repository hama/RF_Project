*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${comm_user}    ${comm_pwd}    ${comm_domain}
Suite Teardown    Close Test Suite Browser
Force Tags        Order
Resource          ../../resources/kw_browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/var_tax_price.robot
Resource          ../../resources/kw_common.robot
Library           SeleniumLibrary
Library           customLibrary
Resource          ../../resources/kw_order.robot
Resource          ../../resources/var_order.robot

*** Test Cases ***
order105
    [Documentation]    弹出导出订单弹窗，可选择导出本页数据，搜索出的数据和全部数据
    [Tags]    P0d
    Order Export Setp
    Sleep    1
    Page Should Contain Element    class:ant-modal-body
    Wait And Click Element    class:ant-modal-close-x
    Quit Order Setp

order109
    [Documentation]    已完成订单 点击导出 不输入邮箱 提示错误
    [Tags]    P0
    Order Export Setp
    Sleep    1
    Page Should Contain Element    class:ant-modal-body
    Click Button    dom:document.querySelectorAll("button")[3]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Wait And Click Element    class:ant-modal-close-x
    Quit Order Setp

order110
    [Documentation]    已完成订单 点击导出 输入非邮箱 提示错误
    [Tags]    P1
    Order Export Setp
    Wait Until Element Is Visible    dom:document.querySelectorAll("#email")[0]
    Input Text    dom:document.querySelectorAll("#email")[0]    123456
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[3]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Wait And Click Element    class:ant-modal-close-x
    Quit Order Setp

*** keywords ***
Order Export Setp
    sleep    1
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_alerady_mission_btn}    #.点击已完成
    Wait And Click Element    ${order_list_export}
