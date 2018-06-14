*** Settings ***
Documentation     定义跟浏览器操作相关的关键字，如 打开浏览器、关闭浏览器

*** Variables ***
${home_page}      http://admin1024.shoplazza.com    # 提取主页变量，可通过启动参数 -v 更改为实际测试环境 
${is_headless}    False                             # 定义是否采用 headless  (Case Sensitive for True/False)

*** Keywords ***
New Test Suite Browser And Login
    [Documentation]    创建浏览器对象并执行登录
    [Arguments]    ${username}    ${password}    ${domain}
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
    log    ===========================================================================================================================================================
    log    ====================================================== Test Suite End, Close Browser For Test Suite. ======================================================
    log    ===========================================================================================================================================================
    Close Browser

Setup Test Case
    [Documentation]    测试用例初始化
    log    *******************************************************************************************************
    log    ******************************************* Test Case Start *******************************************
    log    *******************************************************************************************************

Teardown Test Case
    [Documentation]    测试用例清理动作
    # 用例失败时进行截图
    Run Keyword If Test Failed    Capture Page Screenshot
    log    *******************************************************************************************************
    log    ******************************************** Test Case End ********************************************
    log    *******************************************************************************************************

Open Test Browser
    [Documentation]    仅打开浏览器，不登录，用于验证 注册/找回密码模块
    [Arguments]    ${url}
    log    Begin Open Browser Window
    Run Keyword If    '${is_headless}'=='${true}'    Open Headless Chrome    ${url}
    ...    ELSE    Open Browser    ${url}    chrome

Open Headless Chrome
    [Documentation]    打开 Headless 浏览器
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}

Start Ajax Listener
    [Documentation]    执行 ajaxListener.js 开始监听页面 ajax 请求
    Execute JavaScript    ${CURDIR}/../lib/ajaxListener.js
