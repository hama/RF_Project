*** Settings ***
Library           SeleniumLibrary    # import selenium library

*** Variables ***
${home_page}      http://admin1024.shoplazza.com    # feature test enviroment
${is_headless}    false    # whether should use headless chrome
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
    Comment    wait until login button is visible
    Wait Until Element Is Visible    class:logBtn___3pRgJ
    Input Text    id:account    ${username}
    Input Password    id:password    ${password}
    Click Button    class:logBtn___3pRgJ
    Comment    wait until domain input text element is visible
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${domain}
    Click Button    class:logBtn___3pRgJ

Open Test Browser
    [Arguments]    ${url}
    log    Begin Open Browser Window
    Run Keyword If    '${is_headless}'=='${true}'    Open Headless Chrome    ${url}
    ...    ELSE    Open Browser    ${url}    chrome

Open Headless Chrome
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}
