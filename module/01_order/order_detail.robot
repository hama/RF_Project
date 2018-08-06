*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Force Tags        Order
Resource          ../../resources/kw_browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/var_tax_price.robot
Resource          ../../resources/kw_common.robot
Resource          ../../resources/var_order.robot
Library           SeleniumLibrary
Resource          ../../resources/kw_add_order.robot
Resource          ../../resources/kw_order.robot
Resource          ../../resources/kw_products.robot


*** Test Cases ***
order072
    [Documentation]    运单号输入时，物流商会匹配对应的内容，点击保存后，运单号更新成功
    [Tags]    P0
    Add Order Products    #.调用添加商品
    Sleep    5
    Add Order    #.调用生成订单
    Sleep    1
    Go To    ${home_page}
    Sleep    1
    Order Setp
    Wait Until Element Is Visible    ${locatorB_order_first_btn}
    Click Button    添加运单
    Sleep    2
    Wait And Click Element    ${locatorB_order_four_btn}
    Sleep    1.5
    Go To Order Page
    sleep    1
    Wait Until Element Is Visible    ${locatorB_order}
    Order Setp
    page should contain element    ${locatorB_order_detail_element}
    ${input}    set variable    123456
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Sleep    1.3
    Should Be True    '${res}'=='已发货'
    Sleep    1.5
    Wait And Click Element    ${locatorB_order_dateil_update_send}
    input text    ${locatorB_order_detail_nums}    ${input}
    Wait And Click Element    ${locatorB_order_three_btn}
    page should contain element    ${locatorB_order_waybill_information}
    Quit Order Setp

order073
    [Documentation]    点击取消会取消本次操作，运单号不会被更新
    [Tags]    P1
    Add Order    #.调用生成订单
    Go To    ${home_page}
    sleep    1
    Order Setp
    page should contain element    ${locatorB_order_detail_element}
    Wait And Click Element    ${locatorB_order_first_btn}
    Wait And Click Element    ${locatorB_order_four_btn}
    Wait And Click Element    ${locatorB_order_dateil_update_send}
    Wait And Click Element    ${locatorB_order_two_btn}
    page should not contain    ${locatorB_order_waybill_information}
    #Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    Quit Order Setp

order074
    [Documentation]    保存成功，运单号不会被更新
    [Tags]    P0
    Add Order    #.调用生成订单
    Go To    ${home_page}
    sleep    1
    Order Setp
    page should contain element    ${locatorB_order_detail_element}
    Wait And Click Element    ${locatorB_order_first_btn}
    Wait And Click Element    ${locatorB_order_four_btn}
    Wait And Click Element    ${locatorB_order_dateil_update_send}
    Wait And Click Element    ${locatorB_order_three_btn}
    page should not contain    ${locatorB_order_waybill_information}
    Quit Order Setp

order075
    [Documentation]    弹出二次确认弹窗提示用户确定取消发货
    [Tags]    P0
    Add Order    #.重生成订单
    go to    ${home_page}
    sleep    1
    Order Setp
    Sleep    3
    Wait And Click Element    ${locatorB_order_first_btn}
    Wait And Click Element    ${locatorB_order_four_btn}
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    sleep    2.5
    Common Js Click    ${locatorB_order_settint_status}    2
    sleep    1
    Page Should Contain element    ${locatorB_order_two_btn}
    Wait And Click Element    ${locatorB_order_close_btn}
    Quit Order Setp

order_detail_update_send_not
    [Documentation]    运单号输入时，物流商会匹配对应的内容，点击保存后，运单号更新成功
    [Tags]    P0
    Add Order    #.重生成订单
    go to    ${home_page}
    sleep    1
    Order Setp
    page should contain element    ${locatorB_order_detail_element}
    ${input}    set variable    123456
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Sleep    1.3
    Should Be True    '${res}'=='未发货'
    click button    添加运单
    Sleep    2
    Wait And Click Element    ${locatorB_order_four_btn}
    Wait And Click Element    dom:document.querySelectorAll(".tw-Updated")[0]
    Input Text    ${locatorB_order_detail_nums}    ${input}
    Wait And Click Element    ${locatorB_order_three_btn}
    Sleep    2
    page should contain element    dom:document.querySelectorAll(".label___oVKMA")[0]
    Quit Order Setp

order076
    [Documentation]    取消发货成功，本次发货已被取消
    [Tags]    P0
    Add Order
    go to    ${home_page}
    Order Setp
    Wait Until Element Is Visible    ${locatorB_order_first_btn}
    Click Button    添加运单
    Sleep    2
    Wait And Click Element    ${locatorB_order_four_btn}
    Go To Order Page
    sleep    1
    Order Setp
    page should contain element    ${locatorB_order_detail_element}
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    sleep    1.5
    Common Js Click    ${locatorB_order_settint_status}    2
    sleep    1
    Wait And Click Element    ${locatorB_order_three_btn}
    Sleep    1.5s
    Page Should Contain Element    ${locatorB_order_first_btn}
    Quit Order Setp

order077
    [Documentation]    取消本次操作，不会取消发货
    [Tags]    P1
    Add Order
    go to    ${home_page}
    Order Setp
    Wait Until Element Is Visible    ${locatorB_order_first_btn}
    Click Button    添加运单
    Sleep    2
    Wait And Click Element    ${locatorB_order_four_btn}
    Go To Order Page
    sleep    1
    Order Setp
    page should contain element    ${locatorB_order_detail_element}
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    sleep    1.5
    Common Js Click    ${locatorB_order_settint_status}    2
    sleep    1
    Wait And Click Element    ${locatorB_order_two_btn}
    sleep    1.5
    Page Should Not Contain Element    ${locatorB_order_first_btn}
    Quit Order Setp

*** keywords ***
Order Setp
    Wait And Click Element    ${locatorB_order}
    Wait And Click Element    ${locatorB_order_list_first_tr}
