*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Resource          ../../resources/browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/tax_price.robot
Resource          ../../resources/shoplaza_login.robot
Library           SeleniumLibrary

*** Test Cases ***
order_dateil_update_send
    #.运单号输入时，物流商会匹配对应的内容，点击保存后，运单号更新成功
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    ${input}    set variable    123456
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Run keyword If    '${res}'=='已发货'    Run keyword    click element    ${order_dateil_update_send}
    Run keyword If    '${res}'=='已发货'    Run keyword    page should contain element    id:rcDialogTitle0
    Run keyword If    '${res}'=='已发货'    Run keyword    input text    dom:document.querySelectorAll("#shipping_code")[0]    ${input}
    Run keyword If    '${res}'=='已发货'    Run keyword    click element    dom:document.querySelectorAll('button')[3]
    Run keyword If    '${res}'=='已发货'    Run keyword    page should contain element    dom:document.querySelectorAll(".shipping_code___3Gh0j")[0]
    ...    ELSE IF    ${res}=='未发货'    Run keyword    click button    添加运单
    ...    ELSE IF    ${res}=='未发货'    Run keyword    page should contain button    dom:document.querySelectorAll("button")[4]
    ...    ELSE IF    ${res}=='未发货'    Run keyword    click button    dom:document.querySelectorAll("button")[4]
    ...    ELSE IF    ${res}=='未发货'    Run keyword    page should contain element    ${order_dateil_update_send}
    ...    ELSE IF    ${res}=='未发货'    Run keyword    Wait Until Element Is Visible    ${shipping_code}
    ...    ELSE IF    ${res}=='未发货'    Run keyword    Input Text    dom:document.querySelectorAll("#shipping_code")[0]    ${input}
    ...    ELSE IF    ${res}=='未发货'    Run keyword    click element    dom:document.querySelectorAll('button')[3]
    ...    ELSE IF    ${res}=='未发货'    Run keyword    page should contain element    dom:document.querySelectorAll(".shipping_code___3Gh0j")[0]
