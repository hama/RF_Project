*** Settings ***
Resource          ../../resources/payment.robot

*** Test Cases ***
001_payment
    #.登录后直接进入支付设设置
    ${xpath_d}    set variable    id:test_add_btn
    Login With Payment    ${xpath_a}    ${xpath_b}    ${xpath_c}
    sleep    1
    page should contain element    //*[@id="root"]/div/div/div[1]/div[2]/div[1]/div/div[1]/span
    close browser

002_payment
    #.从其他界面切换到支付设置
    ${xpath_d}    set variable    id:test_add_btn
    Login With Payment    ${xpath_a}    ${xpath_b}    ${xpath_c}
    sleep    1
    click element    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[6]/div
    sleep    1
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
    click element    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    sleep    1
    page should contain element    //*[@id="root"]/div/div/div[1]/div[2]/div[1]/div/div[1]/span
    close browser

003_payment
    #.点击首款
    ${xpath_d}    set variable    id:test_add_btn
    Login With Payment    ${xpath_a}    ${xpath_b}    ${xpath_c}
    sleep    1
    click element    //*[@id="dj"]/div[1]/div/div[1]/div/div/div/div/div[2]
    sleep    1
    page should contain element    //*[@id="root"]/div/div/div[1]/div[2]/div[1]/div/div[1]/span
    close browser

004_payment
    #.点击测试
    ${xpath_d}    set variable    id:test_add_btn
    Login With Payment    ${xpath_a}    ${xpath_b}    ${xpath_c}
    sleep    1
    click element    //*[@id="dj"]/div[1]/div/div[1]/div/div/div/div/div[3]
    sleep    1
    page should contain element    //*[@id="dj"]/div[1]/div/div[2]/div[2]/ul/li/div[2]
    close browser

005_payment
    #.在线支付 编辑按钮
    ${xpath_d}    set variable    id:test_add_btn
    Login With Payment    ${xpath_a}    ${xpath_b}    ${xpath_c}
    sleep    1
    Wait Until Element Is Visible    //*[@id="online_pay"]/div[1]/button
    click button    //*[@id="online_pay"]/div[1]/button
    sleep    1
    page should contain button    //*[@id="online_pay"]/div[2]/div/form/div[4]/div/div/button
    close browser

006_payment
    #.在线支付 编辑按钮 输入框限制及特殊字符限制
    ${xpath_d}    set variable    id:test_add_btn
    Login With Payment    ${xpath_a}    ${xpath_b}    ${xpath_c}
    sleep    1
    Wait Until Element Is Visible    //*[@id="online_pay"]/div[1]/button
    click button    //*[@id="online_pay"]/div[1]/button
    sleep    1
    ${res_0}    execute javascript    return document.querySelectorAll("input[placeholder='请输入在线支付名称']")[0].value
    ${res_1}    execute javascript    document.querySelectorAll("input[placeholder='请输入支付说明']")[0].value
    page should contain button    //*[@id="online_pay"]/div[2]/div/form/div[4]/div/div/button
    close browser

007_payment
    #.支付编辑界面保存按钮，未输入名称时点击保存
    ${xpath_d}    set variable    id:test_add_btn
    Login With Payment    ${xpath_a}    ${xpath_b}    ${xpath_c}
    sleep    1
    Wait Until Element Is Visible    //*[@id="online_pay"]/div[1]/button
    click button    //*[@id="online_pay"]/div[1]/button
    sleep    1
    #${res_0}    execute javascript    return document.querySelectorAll("input[placeholder='请输入在线支付名称']")[0].value
    input text    method_name    ${empty}
    click button    //*[@id="online_pay"]/div[2]/div/form/div[4]/div/div/button
    close browser

008_payment
    #.输入支付内容，其他内容不输入. 不保存
    ${xpath_d}    set variable    id:test_add_btn
    Login With Payment    ${xpath_a}    ${xpath_b}    ${xpath_c}
    sleep    1
    Wait Until Element Is Visible    //*[@id="online_pay"]/div[1]/button
    click button    //*[@id="online_pay"]/div[1]/button
    sleep    1
    input text    method_name    1
    click button    //*[@id="online_pay"]/div[1]/button
    close browser

009_payment
    #.PayPal栏点击PayPal官网或PayPal管理页／新开窗口跳转至PayPal界面
    ${xpath_d}    set variable    id:test_add_btn
    Login With Patment Visible    //*[@id="online_pay"]/div[1]/button