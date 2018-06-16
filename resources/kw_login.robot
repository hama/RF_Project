*** Settings ***
Library           SeleniumLibrary
Resource          var_common.robot
Resource          kw_browser.robot

*** Variables ***
${is_headless}    False    # 定义是否采用 headless    (Case Sensitive for True/False)

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
    Sleep    3
    ${href}=    Execute JavaScript    return window.location.href
    ${has_login}=    Execute JavaScript    return '${href}'==='${url_home_page}'
    Run Keyword Unless    ${has_login}    Input Domain    ${domain}
    Wait Until Element Is Visible    ${locator_setting}
    log    Login Success
    log    ===============================================================

Input Domain
    [Arguments]    ${domain}
    Input Text    id:username    ${domain}
    Click Button    class:logBtn___3pRgJ

Go To Setting Page
    [Documentation]    跳转到设置页面
    Wait Until Element Is Visible    ${locator_setting}
    Click Element    ${locator_setting}
    Wait Until Element Is Visible    ${locator_setting}

Go To Tax Price Page
    [Documentation]    跳转到税费页面
    Wait Until Element Is Visible    ${locator_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${unvisible}=    Execute Javascript    return document.querySelectorAll('a[href="/taxPrice"]')[0]===undefined
    Run Keyword If    ${unvisible}    Click Element    ${locator_setting}
    Wait Until Element Is Visible    ${locator_setting_taxPrice}
    Sleep    1
    Click Element    ${locator_setting_taxPrice}
    Wait Until Page Contains    ${content_tax_setting}
    Location Should Be    ${url_tax_price}

Go To Shipping Page
    [Documentation]    跳转到物流页面
    Wait Until Element Is Visible    ${locator_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${unvisible}=    Execute Javascript    return document.querySelectorAll('a[href="/shipping"]')[0]===undefined
    Run Keyword If    ${unvisible}    Click Element    ${locator_setting}
    Wait Until Element Is Visible    ${locator_setting_shipping}
    Click Element    ${locator_setting_shipping}
    Sleep    1
    Wait Until Page Contains    ${content_shipping_tab1}
    Wait Until Page Contains    ${content_shipping_tab2}
    Location Should Be    ${url_shipping}
