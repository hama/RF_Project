*** Settings ***
Documentation     Test payment price page ui.
Suite Setup       New Test Suite Browser And Login    1004714019@qq.com    123456    test
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot    # import login keyword
Resource          ../../../resources/browser.robot    # import ajax listener keyword

*** Test Cases ***
Test_PayPal_Page_Normal
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    Click Element    //*[@id="9$Menu"]/li[4]/a
    Sleep    1
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[0].children[0].getElementsByTagName("a")[0]    href1
    Wait Until Element Is Visible    href1
    Click Element    href1
    Select Window    title=PayPal Express Checkout: An Integrated Payment Method - PayPal US
    Sleep    1
    Select Window    店匠科技
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[0].children[0].getElementsByTagName("a")[1]    href2
    Wait Until Element Is Visible    href2
    Click Element    href2
    Select Window    title=登录您的PayPal账户
    Sleep    1
    Select Window    店匠科技
    #Test_Activation_PayPal
    #    Go TO    ${home_page}
    #    Wait Until Element Is Visible    class:icon_setting___3OCQq
    #    Click Element    class:icon_setting___3OCQq
    #    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    #    Click Element    //*[@id="9$Menu"]/li[4]/a
    #    Sleep    1
    #    Assign id To Element    dom:document.querySelectorAll(".paypal_icon___2_7gF .jihuo___1dwdu")[0]    btn1
    #    Wait Until Element Is Visible    btn1
    #    Click Element    btn1
    #    Sleep    10
    #    Select Window    title=店匠科技
    #    Click Element    btn1
    #    Select Window    title=注册商家账户
    #    Input Text    id:emailAddress    lizhicheng@shoplazza.com
    #    Click Element    id:countryDropDown
    #    Wait Until Element Is Visible    //*[@id="countryDropDown"]/div/div/ul/li[203]
    #    Click Element    //*[@id="countryDropDown"]/div/div/ul/li[203]
    #    Wait Until Element Is Visible    id:createContinue
    #    Click Element    id:createContinue

Test_Stripe_Page_Normal
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    Click Element    //*[@id="9$Menu"]/li[4]/a
    Sleep    1
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[1].children[0].getElementsByTagName("a")[0]    href1
    Wait Until Element Is Visible    href1
    Click Element    href1
    Select Window    title=Stripe - Online payment processing for internet businesses
    Sleep    1
    Select Window    店匠科技
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[1].children[0].getElementsByTagName("a")[1]    href2
    Wait Until Element Is Visible    href2
    Click Element    href2
    Select Window    title=Stripe: Login
    Sleep    1
    Select Window    店匠科技
