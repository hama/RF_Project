*** Settings ***
Library           SeleniumLibrary
Resource          var_tax_price.robot
Resource          var_shipping.robot

*** Variables ***
${home_page}      http://admin1024.shoplazza.com/
# default user, has everything
${defaultUser}    17601298661
${defaultPassword}    111111
${defaultDomain}    baiyuan
# 测试用户1
${testUser1}      18825260804
${testUser1Password}    18825260804
${testUser1Domain}    diu

*** Keywords ***
Login With User
    [Arguments]    ${username}    ${password}    ${domain}
    # login with specify user and domain
    log    ===============================================================
    log    Login with ${username}
    Comment    wait until login button is visible
    Wait Until Element Is Visible    class:logBtn___3pRgJ
    Input Text    id:account    ${username}
    Input Password    id:password    ${password}
    Click Button    class:logBtn___3pRgJ
    Comment    wait until domain input text element is visible
    Sleep    1
    ${has_login}=    Execute JavaScript    return window.location.href === "${home_page}"
    Run Keyword Unless    ${has_login}    Input Domain
    Wait Until Element Is Visible    id:test_setting
    log    Login Success
    log    ===============================================================

Input Domain
    [Arguments]    ${domain}
    Input Text    id:username    ${domain}
    Click Button    class:logBtn___3pRgJ

Go To Setting Page
    [Documentation]    跳转到设置页面
    Wait Until Element Is Visible    id:test_setting
    Click Element    id:test_setting
    Wait Until Element Is Visible    id:test_setting

Go To Tax Price Page
    [Documentation]    跳转到税费页面
    Wait Until Element Is Visible    id:test_setting
    Click Element    id:test_setting
    Wait Until Element Is Visible    id:test_setting
    Assign Id To Element    dom:document.querySelectorAll('a[href="/taxPrice"]')[0]    tax_price_btn
    Wait Until Element Is Visible    id:tax_price_btn
    Click Element    id:tax_price_btn
    Wait Until Page Contains    ${tax_price_setting}
    Location Should Be    ${tax_price_url}

Go To Shipping Page
    [Documentation]    跳转到物流页面
    Wait Until Element Is Visible    id:test_setting
    Click Element    id:test_setting
    Wait Until Element Is Visible    id:test_setting
    Assign Id To Element    dom:document.querySelectorAll('a[href="/shipping"]')[0]    shipping_btn
    Wait Until Element Is Visible    id:shipping_btn
    Click Element    id:shipping_btn
    Wait Until Page Contains    ${tax_shipping_tab1}
    Location Should Be    ${shipping_url}
