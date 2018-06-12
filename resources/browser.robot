*** Settings ***
Documentation     定义跟浏览器操作相关的关键字，如 打开浏览器、关闭浏览器

*** Variables ***
${home_page}      http://admin1024.shoplazza.com    # 提取主页变量，可通过启动参数 -v 更改为实际测试环境 
${is_headless}    False                             # 定义是否采用 headless  (Case Sensitive for True/False)

*** Keywords ***
Test Suite Custom Teardown
    [Documentation]    用例执行失败时，进行截图
    Run Keyword If Test Failed    Capture Page Screenshot

New Test Suite Browser And Login
    [Documentation]    创建浏览器对象并执行登录
    [Arguments]    ${username}    ${password}    ${domain}
    Comment    new browser for test suite
    log    ===========================================================================================================================================================
    log    ===================================================== Test Suite Start, New Browser For Test Suite ========================================================
    log    ===========================================================================================================================================================
    Run Keyword If    '${is_headless}'=='${true}'    Open Headless Chrome    ${home_page}
    ...    ELSE    Open Browser    ${home_page}    chrome
    #Set Window Size    1920    1080
    #Set Window Position    0    0
    Login With User    ${username}    ${password}    ${domain}

Close Test Suite Browser
    [Documentation]    Suite 执行完毕，关闭浏览器
    Comment    close the browser opened for this test suite.
    log    ===========================================================================================================================================================
    log    ====================================================== Test Suite End, Close Browser For Test Suite. ======================================================
    log    ===========================================================================================================================================================
    Close Browser

Setup Test Case
    [Documentation]    开始一个新的 Test case
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
