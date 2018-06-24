*** Settings ***
Documentation     Test payment price page ui.
Suite Setup       New Test Suite Browser And Login    1004714019@qq.com    123456    test
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Teardown     Teardown Test Case
Force Tags        payment
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword

*** Test Cases ***
Test_PayPal
    Go TO    ${home_page}
    #login to payment channel
    #跳转到支付模块
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    Click Element    //*[@id="9$Menu"]/li[4]/a
    Sleep    1
    #test PayPal account
    #测试PayPal
    Assign id To Element    dom:document.querySelectorAll(".ant-tabs-tab")[1]    btn1
    Wait Until Element Is Visible    btn1
    Click Element    btn1
    Assign id To Element    dom:document.querySelectorAll(".paySetting_setting___1lGiv")[0]    btn2
    Wait Until Element Is Visible    btn2
    Click Element    btn2
    #输入收款账号
    Wait Until Element Is Visible    id:account
    Input Text    id:account    wangyue@shoplazza.com
    Assign id To Element    dom:document.querySelectorAll(".submit___SUXsC")[0]    btn3
    Wait Until Element Is Visible    btn3
    Click Element    btn3
    Sleep    5
    #location to PayPal payment href
    #验证跳转到PayPal结账页面
    Select Window    title=PayPal结账 - 登录

Test_PayPal_Page_Normal
    Go TO    ${home_page}
    #login to payment channel
    #跳转到支付模块
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    Click Element    //*[@id="9$Menu"]/li[4]/a
    Sleep    1
    #click PayPal index href
    #点击PayPal官网链接
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[0].children[0].getElementsByTagName("a")[0]    href1
    Wait Until Element Is Visible    href1
    Click Element    href1
    #location to PayPal index href
    #跳转到PayPal官网
    Select Window    title=PayPal Express Checkout: An Integrated Payment Method - PayPal US
    Sleep    1
    Select Window    店匠科技
    #click PayPal mangement href
    #点击PayPal管理链接
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[0].children[0].getElementsByTagName("a")[1]    href2
    Wait Until Element Is Visible    href2
    Click Element    href2
    #location to PayPal mangement href
    #跳转到PayPal管理页面
    Select Window    title=登录您的PayPal账户
    Sleep    1
    Select Window    店匠科技

Test_Stripe_Page_Normal
    Go TO    ${home_page}
    #login to payment channel
    #跳转到支付模块
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    Click Element    //*[@id="9$Menu"]/li[4]/a
    Sleep    1
    #click stripe index href
    #点击stripe官网链接
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[1].children[0].getElementsByTagName("a")[0]    href1
    Wait Until Element Is Visible    href1
    Click Element    href1
    #location to stripe index href
    #跳转到stripe官网
    Select Window    title=Stripe - Online payment processing for internet businesses
    Sleep    1
    Select Window    店匠科技
    #click stripe mangement href
    #点击stripe管理链接
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[1].children[0].getElementsByTagName("a")[1]    href2
    Wait Until Element Is Visible    href2
    Click Element    href2
    #location to stripe mangement href
    #跳转到stripe管理页面
    Select Window    title=Stripe: Login
    Sleep    1
    Select Window    店匠科技

Test_PayPal_Without_Account
    Go TO    ${home_page}
    #login to payment channel
    #跳转到支付模块
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    Click Element    //*[@id="9$Menu"]/li[4]/a
    Sleep    1
    #validate test PayPal without account
    #测试不输入PayPal账号的情况
    Assign id To Element    dom:document.querySelectorAll(".ant-tabs-tab")[1]    btn1
    Wait Until Element Is Visible    btn1
    Click Element    btn1
    Assign id To Element    dom:document.querySelectorAll(".paySetting_setting___1lGiv")[0]    btn2
    Wait Until Element Is Visible    btn2
    Click Element    btn2
    Assign id To Element    dom:document.querySelectorAll(".submit___SUXsC")[0]    btn3
    Wait Until Element Is Visible    btn3
    Click Element    btn3
    #页面提示
    Page Should Contain    PayPal账号不能为空

Test_PayPal_Cancel
    Go TO    ${home_page}
    #login to payment channel
    #跳转到支付模块
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    Click Element    //*[@id="9$Menu"]/li[4]/a
    Sleep    1
    #validate cancle PayPal
    #测试取消PayPal支付
    Assign id To Element    dom:document.querySelectorAll(".ant-tabs-tab")[1]    btn1
    Wait Until Element Is Visible    btn1
    Click Element    btn1
    Assign id To Element    dom:document.querySelectorAll(".paySetting_setting___1lGiv")[0]    btn2
    Wait Until Element Is Visible    btn2
    Click Element    btn2
    Assign id To Element    dom:document.querySelectorAll(".submit___SUXsC")[1]    btn3
    Wait Until Element Is Visible    btn3
    Click Element    btn3
    #location to PayPal test page
    #收起收款页，跳回PayPal测试页
    Page Should Not Contain Element    id:account
