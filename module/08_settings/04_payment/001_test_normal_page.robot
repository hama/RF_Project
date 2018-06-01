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
    #login to payment channel
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    Click Element    //*[@id="9$Menu"]/li[4]/a
    Sleep    1
    #click PayPal index href
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[0].children[0].getElementsByTagName("a")[0]    href1
    Wait Until Element Is Visible    href1
    Click Element    href1
    #location to PayPal index href
    Select Window    title=PayPal Express Checkout: An Integrated Payment Method - PayPal US
    Sleep    1
    Select Window    店匠科技
    #click PayPal mangement href
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[0].children[0].getElementsByTagName("a")[1]    href2
    Wait Until Element Is Visible    href2
    Click Element    href2
    #location to PayPal mangement href
    Select Window    title=登录您的PayPal账户
    Sleep    1
    Select Window    店匠科技

Test_Stripe_Page_Normal
    Go TO    ${home_page}
    #login to payment channel
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Wait Until Element Is Visible    //*[@id="9$Menu"]/li[4]/a
    Click Element    //*[@id="9$Menu"]/li[4]/a
    Sleep    1
    #click stripe index href
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[1].children[0].getElementsByTagName("a")[0]    href1
    Wait Until Element Is Visible    href1
    Click Element    href1
    #location to stripe index href
    Select Window    title=Stripe - Online payment processing for internet businesses
    Sleep    1
    Select Window    店匠科技
    #click stripe mangement href
    Assign id To Element    dom:document.querySelectorAll(".paySetting_des___3Usc_")[1].children[0].getElementsByTagName("a")[1]    href2
    Wait Until Element Is Visible    href2
    Click Element    href2
    #location to stripe mangement href
    Select Window    title=Stripe: Login
    Sleep    1
    Select Window    店匠科技
