*** Settings ***
Documentation     Define startup and tear down action for test cases.

*** Variables ***
${home_page}      http://admin1024.shoplazza.com    # feature test enviroment
${is_headless}    false    # whether should use headless chrome

*** Keywords ***
Test Suite Custom Teardown
    Run Keyword If Test Passed    Capture Page Screenshot
    Run Keyword If Test Failed    Capture Page Screenshot

New Test Suite Browser And Login
    [Arguments]    ${username}    ${password}    ${domain}
    Comment    new browser for test suite
    log    ===========================================================================================================================================================
    log    ===================================================== Test Suite Start, New Browser For Test Suite ========================================================
    log    ===========================================================================================================================================================
    Run Keyword If    '${is_headless}'=='${true}'    Open Headless Chrome    ${home_page}
    ...    ELSE    Open Browser    ${home_page}    chrome
    Set Window Size    1920    1080
    Set Window Position    0    0
    Login With User    ${username}    ${password}    ${domain}

Close Test Suite Browser
    Comment    close the browser opened for this test suite.
    log    ===========================================================================================================================================================
    log    ====================================================== Test Suite End, Close Browser For Test Suite. ======================================================
    log    ===========================================================================================================================================================
    #Close Browser

Setup Test Case
    Comment    start a new test case.
    log    *******************************************************************************************************
    log    ******************************************* Test Case Start *******************************************
    log    *******************************************************************************************************

Teardown Test Case
    Comment    capture page screenshot if test failed.
    Run Keyword If Test Failed    Capture Page Screenshot
    log    *******************************************************************************************************
    log    ******************************************** Test Case End ********************************************
    log    *******************************************************************************************************

Close Test Case Window
    log    Close The Browser Window.
    Close Window

New Test Case Window
    # new browser window(tab) for test case
    log    New Browser Window For Test Cases
    Execute JavaScript    window.open('${home_page}')
    ${handler}=    Select Window    NEW
    log    ${handler}
    Select Window    ${handler}

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
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}

Start Ajax Listener
    Execute JavaScript    ${CURDIR}/../lib/ajaxListener.js
