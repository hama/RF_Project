*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Resource          ../../resources/kw_browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/var_tax_price.robot
Resource          ../../resources/kw_login.robot
Resource          ../../resources/kw_add_order.robot
Library           SeleniumLibrary

*** Test Cases ***
order_detail_update_send
    #.运单号输入时，物流商会匹配对应的内容，点击保存后，运单号更新成功
    add_order    #.调用生成订单
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    Sleep    1.5
    Wait Until Element Is Visible    dom:document.querySelectorAll('button')[1]
    Click Button    添加运单
    Wait Until Element Is Visible    dom:document.querySelectorAll('button')[4]
    Click Button    dom:document.querySelectorAll('button')[4]
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    ${input}    set variable    123456
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Sleep    1.3
    Should Be True    '${res}'=='已发货'
    click element    ${order_dateil_update_send}
    page should contain element    id:rcDialogTitle0
    input text    dom:document.querySelectorAll("#shipping_code")[0]    ${input}
    click element    dom:document.querySelectorAll('button')[3]
    page should contain element    dom:document.querySelectorAll(".shipping_code___3Gh0j")[0]

order_detail_click_cancel
    #.1.点击发货详情中的更新运单号 ,点击取消会取消本次操作，运单号不会被更新
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    click button    dom:document.querySelectorAll("button")[1]
    page should contain button    dom:document.querySelectorAll("button")[4]
    click button    dom:document.querySelectorAll("button")[4]
    Wait Until Element Is Visible    ${order_dateil_update_send}
    click element    ${order_dateil_update_send}
    sleep    1
    click button    dom:document.querySelectorAll("button")[2]
    page should not contain    dom:document.querySelectorAll(".shipping_code___3Gh0j")[0]

order_detail_save_pass
    #.1.点击发货详情中的更新运单号    运单号和物流商都不改变内容 保存成功，运单号不会被更新
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    click button    dom:document.querySelectorAll("button")[1]
    page should contain button    dom:document.querySelectorAll("button")[4]
    click button    dom:document.querySelectorAll("button")[4]
    Wait Until Element Is Visible    ${order_dateil_update_send}
    click element    ${order_dateil_update_send}
    sleep    1
    click button    dom:document.querySelectorAll("button")[3]
    page should not contain    dom:document.querySelectorAll(".shipping_code___3Gh0j")[0]

order_detail_cancel_send
    #.点击取消本次发货,弹出二次确认弹窗提示用户确定取消发货
    add_order    #.重生成订单
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    click button    dom:document.querySelectorAll("button")[1]
    page should contain button    dom:document.querySelectorAll("button")[4]
    click button    dom:document.querySelectorAll("button")[4]
    #Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    sleep    1.5
    Wait Until Element Is Visible    ${order_dateil_cencel_send}
    Execute Javascript    return document.querySelectorAll('.icon_custom_left___GO944')[2].click()
    sleep    1
    Page Should Contain element    dom:document.querySelectorAll("button")[2]

order_detail_update_send_not
    #.运单号输入时，物流商会匹配对应的内容，点击保存后，运单号更新成功
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    ${input}    set variable    123456
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Sleep    1.3
    Should Be True    '${res}'=='未发货'
    click button    添加运单
    page should contain button    dom:document.querySelectorAll("button")[4]
    click button    dom:document.querySelectorAll("button")[4]
    page should contain element    ${order_dateil_update_send}
    Wait Until Element Is Visible    ${shipping_code}
    Input Text    dom:document.querySelectorAll("#shipping_code")[0]    ${input}
    click element    dom:document.querySelectorAll('button')[3]
    Sleep    1.3
    page should contain element    dom:document.querySelectorAll(".label___oVKMA")[0]

order_detail_cancel_pass
    #.取消发货成功，本次发货已被取消
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    click button    dom:document.querySelectorAll("button")[1]
    page should contain button    dom:document.querySelectorAll("button")[4]
    click button    dom:document.querySelectorAll("button")[4]
    sleep    1.5
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    sleep    1.5
    Wait Until Element Is Visible    ${order_dateil_cencel_send}
    Execute Javascript    return document.querySelectorAll('.icon_custom_left___GO944')[2].click()
    sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[3]
    click button    dom:document.querySelectorAll("button")[3]
    sleep    1.5
    Page Should Contain Element    //*[@id="dj"]/div/div[2]/div/div/div[15]/div/div[2]/div

order_detail_cancel_send_cacel
    #.取消发货成功，点击取消按钮
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    click button    dom:document.querySelectorAll("button")[1]
    page should contain button    dom:document.querySelectorAll("button")[4]
    click button    dom:document.querySelectorAll("button")[4]
    sleep    1.5
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    sleep    1.5
    Wait Until Element Is Visible    ${order_dateil_cencel_send}
    Execute Javascript    return document.querySelectorAll('.icon_custom_left___GO944')[2].click()
    sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[3]
    click button    dom:document.querySelectorAll("button")[2]
    sleep    1.5
    Page Should Contain Element    //*[@id="dj"]/div/div[2]/div/div/div[15]/div/div[2]/div
