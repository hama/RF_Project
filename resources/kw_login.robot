*** Settings ***
Library           SeleniumLibrary    # import selenium library
Resource          kw_browser.robot

*** Variables ***
${home_page}      http://admin1024.shoplazza.com    # feature test enviroment
# default user, has everything
${defaultUser}    17601298661
${defaultPassword}    111111
${defaultDomain}    baiyuan
# the user has nothing
${nothingUser}    18825260804
${nothingUserPassword}    18825260804
${nothingUserDomain}    diu

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
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${domain}
    Click Button    class:logBtn___3pRgJ
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    log    Login Success
    log    ===============================================================
