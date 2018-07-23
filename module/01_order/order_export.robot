*** Settings ***
Suite Setup       Login With Default User
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
    Page Should Contain Element    ${locatorB_order_export}
    Wait And Click Element    ${locatorB_order_close_btn}
    Quit Order Setp

order109
    [Documentation]    已完成订单 点击导出 不输入邮箱 提示错误
    [Tags]    P0
    Order Export Setp
    Sleep    1
    Page Should Contain Element    ${locatorB_order_export}
    Click Button    ${locatorB_order_three_btn}
    Page Should Contain Element    ${locatorB_order_export_error}
    Wait And Click Element    ${locatorB_order_close_btn}
    Quit Order Setp

order110
    [Documentation]    已完成订单 点击导出 输入非邮箱 提示错误
    [Tags]    P1
    Order Export Setp
    Wait Until Element Is Visible    ${locatorB_order_export_email}
    Input Text    ${locatorB_order_export_email}    123456
    Sleep    1
    Click Button    ${locatorB_order_three_btn}
    Page Should Contain Element    ${locatorB_order_export_error}
    Wait And Click Element    ${locatorB_order_close_btn}
    Quit Order Setp

*** keywords ***
Order Export Setp
    sleep    1
    Wait And Click Element    ${locatorB_order}
    Wait And Click Element    ${locatorB_order_alerady_mission_btn}    #.点击已完成
    Wait And Click Element    ${locatorB_order_list_export}
