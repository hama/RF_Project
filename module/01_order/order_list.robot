*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Resource          ../../resources/browser.robot    #Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Resource          ../../resources/tax_price.robot
Resource          ../../resources/shoplaza_login.robot
Library           SeleniumLibrary

*** Test Cases ***
order_list_page
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Page Should Contain Element    ${order_all_btn}
    Page Should Contain Element    ${order_already_pay_btn}
    Page Should Contain Element    ${order_alerady_enter_btn}
    Page Should Contain Element    ${order_alerady_send_btn}
    Page Should Contain Element    ${order_alerady_mission_btn}
    Page Should Contain Element    ${order_not_payment_btn}
    Page Should Contain Element    ${order_alerady_cencel_btn}

order_all_list_page
    #.点击全部
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2
    page should contain element    //*[@id="dj"]/div/div[4]

order_alerady_paymen_page
    #.点击已支付
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    Wait Until Element Is Visible    ${order_already_pay_btn}
    Click Element    ${order_already_pay_btn}
    sleep    2
    page should contain element    //*[@id="dj"]/div/div[4]

order_alerady_enter_page
    #.点击已确认
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_alerady_enter}
    page should contain element    //*[@id="dj"]/div/div[4]

order_alerady_send_page
    #.点击已发货
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_alerady_send_btn}
    page should contain element    //*[@id="dj"]/div/div[4]

order_alerady_mission_page
    #.点击已完成
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_alerady_mission_btn}
    page should contain element    //*[@id="dj"]/div/div[4]

order_not_payment_page
    #.点击未支付
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_not_payment_btn}
    page should contain element    //*[@id="dj"]/div/div[4]

order_alerady_cencel_page
    #.点击已取消
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    2s
    Wait Until Element Is Visible    //*[@id="dj"]/div
    Click Element    ${order_alerady_cencel_btn}
    page should contain element    //*[@id="dj"]/div/div[4]

order_detail
    #.点击订单详情
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    2
    page should contain element    ${order_detail_element}

order_dateil_send
    #.点击订单详情查看自否发货
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    ${res}    execute javascript    return document.querySelectorAll(".ant-col-3 p")[1].innerHTML
    Run keyword If    '${res}'=='已发货'    Run keyword    page should contain element    //*[@id="dj"]/div/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[1]/div/div/div/div/div/div/div/table/tbody/tr
    ...    ELSE    Run keyword    page should contain element    //*[@id="dj"]/div/div[1]/div[1]/div[2]/div[2]/div/div[1]/div[1]/div/div/div/div/div/div/div/table/tbody/tr

order_dateil_send_detail
    #.点击订单详情添加运单详情 弹出框
    go to    ${home_page}
    sleep    1
    Wait Until Element Is Visible    ${order_list_btn}
    Click Element    ${order_list_btn}
    sleep    1
    click element    ${order_list_first_tr}
    sleep    1
    page should contain element    ${order_detail_element}
    click button    添加运单
    sleep    1.5
    page should contain element    dom:document.querySelectorAll("button")[4]
