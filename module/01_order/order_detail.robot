*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${comm_user}    ${comm_pwd}    ${comm_domain}
Suite Teardown    #Close Test Suite Browser
Force Tags        Order
Resource          ../../resources/kw_browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/var_tax_price.robot
Resource          ../../resources/kw_common.robot
Library           SeleniumLibrary
Resource          ../../resources/kw_add_order.robot
Resource          ../../resources/kw_order.robot


*** Test Cases ***
order072
    [Documentation]    运单号输入时，物流商会匹配对应的内容，点击保存后，运单号更新成功
    [Tags]    P0
    Add Order    #.调用生成订单
    Sleep    1
    Go To    ${home_page}
    Sleep    1
    Order Setp
    Wait Until Element Is Visible    dom:document.querySelectorAll('button')[1]
    Click Button    添加运单
    Sleep    2
    Wait And Click Element    dom:document.querySelectorAll('button')[4]
    Sleep    1.5
    Go To Order Page
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Order Setp
    page should contain element    ${order_detail_element}
    ${input}    set variable    123456
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Sleep    1.3
    Should Be True    '${res}'=='已发货'
    Sleep    1.5
    Wait And Click Element    ${order_dateil_update_send}
    input text    dom:document.querySelectorAll("#shipping_code")[0]    ${input}
    Wait And Click Element    dom:document.querySelectorAll('button')[3]
    page should contain element    dom:document.querySelectorAll(".shipping_code___3Gh0j")[0]
    Quit Order Setp

order073
    [Documentation]    点击取消会取消本次操作，运单号不会被更新
    [Tags]    P1
    Add Order    #.调用生成订单
    Go To    ${home_page}
    sleep    1
    Order Setp
    page should contain element    ${order_detail_element}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    page should contain button    dom:document.querySelectorAll("button")[4]
    Wait And Click Element    dom:document.querySelectorAll("button")[4]
    Wait Until Element Is Visible    ${order_dateil_update_send}
    Wait And Click Element    ${order_dateil_update_send}
    Wait And Click Element    dom:document.querySelectorAll("button")[2]
    page should not contain    dom:document.querySelectorAll(".shipping_code___3Gh0j")[0]
    #Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    Quit Order Setp

order074
    [Documentation]    保存成功，运单号不会被更新
    [Tags]    P0
    Add Order    #.调用生成订单
    Go To    ${home_page}
    sleep    1
    Order Setp
    page should contain element    ${order_detail_element}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait And Click Element    dom:document.querySelectorAll("button")[4]
    Wait And Click Element    ${order_dateil_update_send}
    Wait And Click Element    dom:document.querySelectorAll("button")[3]
    page should not contain    dom:document.querySelectorAll(".shipping_code___3Gh0j")[0]
    Quit Order Setp

order075
    [Documentation]    弹出二次确认弹窗提示用户确定取消发货
    [Tags]    P0
    Add Order    #.重生成订单
    go to    ${home_page}
    sleep    1
    Order Setp
    Sleep    3
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait And Click Element    dom:document.querySelectorAll("button")[4]
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    sleep    2.5
    Execute Javascript    return document.querySelectorAll('.icon_custom_left___GO944')[2].click()
    sleep    1
    Page Should Contain element    dom:document.querySelectorAll("button")[2]
    Wait And Click Element    class:ant-modal-close-x
    Quit Order Setp

order_detail_update_send_not
    [Documentation]    运单号输入时，物流商会匹配对应的内容，点击保存后，运单号更新成功
    [Tags]    P0
    Add Order    #.重生成订单
    go to    ${home_page}
    sleep    1
    Order Setp
    page should contain element    ${order_detail_element}
    ${input}    set variable    123456
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Sleep    1.3
    Should Be True    '${res}'=='未发货'
    click button    添加运单
    Sleep    2
    Wait And Click Element    dom:document.querySelectorAll("button")[4]
    Wait And Click Element    dom:document.querySelectorAll(".tw-Updated")[0]
    Input Text    dom:document.querySelectorAll("#shipping_code")[0]    ${input}
    Wait And Click Element    dom:document.querySelectorAll('button')[3]
    Sleep    2
    page should contain element    dom:document.querySelectorAll(".label___oVKMA")[0]
    Quit Order Setp

order076
    [Documentation]    取消发货成功，本次发货已被取消
    [Tags]    P0
    Add Order
    go to    ${home_page}
    Order Setp
    Wait Until Element Is Visible    dom:document.querySelectorAll('button')[1]
    Click Button    添加运单
    Sleep    2
    Wait And Click Element    dom:document.querySelectorAll('button')[4]
    Go To Order Page
    sleep    1
    Order Setp
    page should contain element    ${order_detail_element}
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    sleep    1.5
    Execute Javascript    return document.querySelectorAll('.icon_custom_left___GO944')[2].click()
    sleep    1
    Wait And Click Element    dom:document.querySelectorAll("button")[3]
    Sleep    1.5s
    Page Should Contain Element    dom:document.querySelectorAll("button")[1]
    Quit Order Setp

order077
    [Documentation]    取消本次操作，不会取消发货
    [Tags]    P1
    Add Order
    go to    ${home_page}
    Order Setp
    Wait Until Element Is Visible    dom:document.querySelectorAll('button')[1]
    Click Button    添加运单
    Sleep    2
    Wait And Click Element    dom:document.querySelectorAll('button')[4]
    Go To Order Page
    sleep    1
    Order Setp
    page should contain element    ${order_detail_element}
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    sleep    1.5
    Execute Javascript    return document.querySelectorAll('.icon_custom_left___GO944')[2].click()
    sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[3]
    Wait And Click Element    dom:document.querySelectorAll("button")[2]
    sleep    1.5
    Page Should Not Contain Element    dom:document.querySelectorAll("button")[1]
    Quit Order Setp

*** keywords ***
Order Setp
    Wait And Click Element    ${order_list_btn}
    Wait And Click Element    ${order_list_first_tr}
