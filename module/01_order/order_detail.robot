*** Settings ***
Suite Setup       Order_Common_Step
Suite Teardown    Close Test Suite Browser
Force Tags        Order
Resource          ../../resources/keywords/kw_browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/variable/var_tax_price.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/variable/var_order.robot
Library           SeleniumLibrary    run_on_failure=NOTHING
Resource          ../../resources/keywords/kw_add_order.robot
Resource          ../../resources/keywords/kw_order.robot
Resource          ../../resources/keywords/kw_products.robot
Resource          ../../resources/keywords/kw_checkout.robot


*** Test Cases ***
order072
    [Documentation]    运单号输入时，物流商会匹配对应的内容，点击保存后，运单号更新成功
    [Tags]    P0
    ${input}    set variable    123456
    Order_Common_Head
    Wait And Click Element    ${locatorB_order_first_btn}    #.添加运单(此按钮的元素为 button[1])
    Wait And Click Element    ${locatorB_order_four_btn}
    Go To Order Page
    Wait Until Element Is Visible    ${locatorB_order}
    Order Setp
    page should contain element    ${locatorB_order_detail_element}
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Should Be True    '${res}'=='已发货'
    Wait And Click Element    ${locatorB_order_dateil_update_send}
    input text    ${locatorB_order_detail_nums}    ${input}
    Wait And Click Element    ${locatorB_order_three_btn}
    page should contain element    ${locatorB_order_waybill_information}
    Quit Order Setp

order073
    [Documentation]    点击取消会取消本次操作，运单号不会被更新
    [Tags]    P1
    Order_Click_Cancel_Waybill    ${locatorB_order_two_btn}

order074
    [Documentation]    保存成功，运单号不会被更新
    [Tags]    P0
    Order_Click_Cancel_Waybill    ${locatorB_order_three_btn}

order075
    [Documentation]    弹出二次确认弹窗提示用户确定取消发货
    [Tags]    P0
    Order_Common_Head
    Wait And Click Element    ${locatorB_order_first_btn}
    Wait And Click Element    ${locatorB_order_four_btn}
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    Common Js Click    ${locatorB_order_settint_status}    2
    Page Should Contain element    ${locatorB_order_two_btn}
    Wait And Click Element    ${locatorB_order_close_btn}
    Quit Order Setp

order_detail_update_send_not
    [Documentation]    运单号输入时，物流商会匹配对应的内容，点击保存后，运单号更新成功
    [Tags]    P0
    Order_Common_Head
    page should contain element    ${locatorB_order_detail_element}
    ${input}    set variable    123456
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Should Be True    '${res}'=='未发货'
    Wait And Click Element    ${locatorB_order_first_btn}    #.添加运单(此按钮的元素为 button[1])
    Wait And Click Element    ${locatorB_order_four_btn}
    Wait And Click Element    dom:document.querySelectorAll(".tw-Updated")[0]
    Input Text    ${locatorB_order_detail_nums}    ${input}
    Wait And Click Element    ${locatorB_order_three_btn}
    page should contain element    dom:document.querySelectorAll(".label___oVKMA")[0]
    Quit Order Setp

order076
    [Documentation]    取消发货成功，本次发货已被取消
    [Tags]    P0
    Order_Cancel_Ship

order077
    [Documentation]    取消本次操作，不会取消发货
    [Tags]    P1
    Order_Cancel_Ship    false

*** keywords ***
Order Setp
    [Documentation]    当前套件公共步骤
    Wait And Click Element    ${locatorB_order}
    Wait And Click Element    ${locatorB_order_list_first_tr}

Order_Common_Head
    [Documentation]    公共头部步骤
    Add Order
    Go To Home By Url    #.跳转主页
    Order Setp

Order_Click_Cancel_Waybill
    [Documentation]    封装点击取消 成功|失败，运单号不会被更新
    [Arguments]    ${element}
    Order_Common_Head
    page should contain element    ${locatorB_order_detail_element}
    Wait And Click Element    ${locatorB_order_first_btn}
    Wait And Click Element    ${locatorB_order_four_btn}
    Wait And Click Element    ${locatorB_order_dateil_update_send}
    Wait And Click Element    ${element}
    page should not contain    ${locatorB_order_waybill_information}
    Quit Order Setp

Order_Cancel_Ship
    [Documentation]    封装取消发货公共步骤
    [Arguments]    ${check_element}=false
    Order_Common_Head
    Wait And Click Element    ${locatorB_order_first_btn}    #.添加运单(此按钮的元素为 button[1])
    Wait And Click Element    ${locatorB_order_four_btn}
    Go To Order Page
    Order Setp
    page should contain element    ${locatorB_order_detail_element}
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    Common Js Click    ${locatorB_order_settint_status}    2
    Run keyword If    '${check_element}'=='false'    Wait And Click Element    ${locatorB_order_two_btn}
    Run keyword If    '${check_element}'=='false'    Page Should Not Contain Element    ${locatorB_order_first_btn}
    ...    ELSE    Wait And Click Element    ${locatorB_order_three_btn}
    ...    ELSE    Page Should Contain Element    ${locatorB_order_first_btn}
    Quit Order Setp

Order_Common_Step
    #.登陆
    Login With Default User
    #.添加支付方式 ipaylinks
    Add Payment
    #.添加支付方式 cod
    Add Cod Payment
    #.添加商品
    Add Order Products
