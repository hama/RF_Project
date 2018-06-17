*** Settings ***
Library           SeleniumLibrary
Resource          var_common.robot
Resource          kw_browser.robot

*** Keywords ***
Login With User
    [Arguments]    ${username}    ${password}    ${domain}
    # login with specify user and domain
    log    ===============================================================
    log    Login with ${username}
    Comment    wait until login button is visible
    Wait And Input Text    id:account    ${username}
    Wait And Input Password    id:password    ${password}
    Wait And Click Button    class:logBtn___3pRgJ
    Comment    wait until domain input text element is visible
    Sleep    1
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
    Wait And Click Element    ${locator_setting}

Go To Tax Price Page
    [Documentation]    跳转到税费页面
    Wait Until Element Is Visible    ${locator_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${unvisible}=    Execute Javascript    return document.querySelectorAll('a[href="/taxPrice"]')[0]===undefined
    Run Keyword If    ${unvisible}    Click Element    ${locator_setting}
    Wait And Click Element    ${locator_setting_taxPrice}
    Wait Until Page Contains    ${content_tax_setting}
    Location Should Be    ${url_tax_price}

Go To Shipping Page
    [Documentation]    跳转到物流页面
    Wait Until Element Is Visible    ${locator_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${unvisible}=    Execute Javascript    return document.querySelectorAll('a[href="/shipping"]')[0]===undefined
    Run Keyword If    ${unvisible}    Click Element    ${locator_setting}
    Wait And Click Element    ${locator_setting_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    Page Should Contain    ${content_shipping_tab1}
    Page Should Contain    ${content_shipping_tab2}
    Location Should Be    ${url_shipping}

Wait And Input
    [Arguments]    ${element_locator}    ${text}
    [Documentation]    封装的输入方法，等待元素可被输入时，再输入
    Wait Until Element Is Visible    ${element_locator}
    Wait Until Keyword Succeeds    3x    1s    Input Text    ${text}

Wait And Input Password
    [Arguments]    ${element_locator}    ${pwd}
    [Documentation]    封装的输入方法，等待元素可被输入时，再输入
    Wait Until Element Is Visible    ${element_locator}
    Wait Until Keyword Succeeds    3x    1s    Input Password    ${pwd}

Wait And Click Element
    [Arguments]    ${element_locator}
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${element_locator}
    Wait Until Keyword Succeeds    3x    1s    Click Element    ${element_locator}

Wait And Click Button
    [Arguments]    ${button_locator}
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${button_locator}
    Wait Until Keyword Succeeds    3x    1s    Click Button    ${button_locator}

Wait And Click Link
    [Arguments]    ${link_locator}
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${link_locator}
    Wait Until Keyword Succeeds    3x    1s    Click Link    ${link_locator}
