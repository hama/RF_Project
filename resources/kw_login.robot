*** Settings ***
Library           SeleniumLibrary    # import selenium library
Resource          kw_browser.robot

*** Variables ***
${home_page}      http://admin1024.shoplazza.com/
# default user, has everything
${defaultUser}    17601298661
${defaultPassword}    111111
${defaultDomain}    baiyuan

${testUser1}    18825260804
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
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    log    Login Success
    log    ===============================================================

Input Domain
    [Arguments]    ${domain}
    Input Text    id:username    ${domain}
    Click Button    class:logBtn___3pRgJ
