*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Resource          ../../resources/kw_browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/var_tax_price.robot
Resource          ../../resources/kw_login.robot
Library           SeleniumLibrary
Library           customLibrary

*** Test Cases ***
order_export
    #.已完成订单 点击导出
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_alerady_mission_btn}
    Click Element    ${order_alerady_mission_btn}    #.点击已完成
    Wait Until Element Is Visible    ${order_list_export}
    Click Element    ${order_list_export}
    Sleep    1
    Page Should Contain Element    class:ant-modal-body

order_export_email_not_empty
    #.已完成订单 点击导出    不输入邮箱 提示错误
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_alerady_mission_btn}
    Click Element    ${order_alerady_mission_btn}    #.点击已完成
    Wait Until Element Is Visible    ${order_list_export}
    Click Element    ${order_list_export}
    Sleep    1
    Page Should Contain Element    class:ant-modal-body
    Click Button    dom:document.querySelectorAll("button")[3]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

order_export_format_error
    #.已完成订单 点击导出    输入非邮箱 提示错误
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_alerady_mission_btn}
    Click Element    ${order_alerady_mission_btn}    #.点击已完成
    Wait Until Element Is Visible    ${order_list_export}
    Click Element    ${order_list_export}
    Wait Until Element Is Visible    dom:document.querySelectorAll("#email")[0]
    Input Text    dom:document.querySelectorAll("#email")[0]    123456
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[3]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
