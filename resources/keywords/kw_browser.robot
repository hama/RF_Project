*** Settings ***
Documentation     定义跟浏览器操作相关的关键字，如 打开浏览器、关闭浏览器
Resource          kw_common.robot

*** Variables ***
${is_headless}    False    # 定义是否采用 headless    (Case Sensitive for True/False)

*** Keywords ***
New Test Suite Browser And Login
    [Arguments]    ${username}    ${password}    ${domain}
    [Documentation]    创建浏览器对象并执行登录
    log    ===========================================================================================================================================================
    log    ===================================================== Test Suite Start, New Browser For Test Suite ========================================================
    log    ===========================================================================================================================================================
    Open Test Browser    ${home_page}
    Login With User    ${username}    ${password}    ${domain}

Close Test Suite Browser
    [Documentation]    Suite 执行完毕，关闭浏览器
    Run Keyword If Any Tests Failed    Capture Page Screenshot
    log    ===========================================================================================================================================================
    log    ====================================================== Test Suite End, Close Browser For Test Suite. ======================================================
    log    ===========================================================================================================================================================
    Close Browser

Setup Test Case
    [Documentation]    测试用例初始化
    Start Ajax Listener
    #    log    *******************************************************************************************************
    #    log    ******************************************* Test Case Start *******************************************
    #    log    *******************************************************************************************************

Teardown Test Case
    [Documentation]
    #    测试用例执行失败进行截图
    Run Keyword If Test Failed    Capture Page Screenshot
#    Run Keyword If Test Failed    Run Keyword And Ignore Error    Handle Alert
    Run Keyword If Test Failed    Log Error Response Of Ajax Listener
    Open New And Close Other Windows    ${home_page}
    #    log    *******************************************************************************************************
    #    log    ******************************************** Test Case End ********************************************
    #    log    *******************************************************************************************************

Open Test Browser
    [Arguments]    ${url}
    [Documentation]    仅打开浏览器，不登录
    log    Begin Open Browser Window
    Run Keyword If    '${is_headless}'=='${true}'    Open Headless Chrome    ${url}
    ...    ELSE    Open Browser    ${url}    chrome
    # 载入jquery，可使用jquery的selector去定位元素
    #    Execute Javascript    a = window.document.createElement('script');a.src='//code.jquery.com/jquery-1.9.1.min.js';window.document.body.appendChild(a);
    #    Sleep    2
    Set Window Position    0    0
    Set Window Size    1440    1080
    Sleep    3

Open Headless Chrome
    [Arguments]    ${url}
    [Documentation]    打开 Headless 浏览器
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
#    Call Method    ${chrome_options}    add_argument    disable-setuid-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}

Start Ajax Listener
    [Documentation]    执行 ajaxListener.js 开始监听页面 ajax 请求
    Execute JavaScript    ${CURDIR}/../../lib/ajaxListener.js

Log Error Response Of Ajax Listener
	[Documentation]    将监听的Error Response内容写入报告
	# 避免未初始化导致的异常
    Start Ajax Listener
    Get All Error Responses With Wait

Log Correct Response Of Ajax Listener
	[Documentation]    将监听的Correct Response内容写入报告
	# 避免未初始化导致的异常
    Start Ajax Listener
    Get All Correct Responses With Wait

Get Window Size And Print
	[Documentation]    获取窗口size并打印
	${width}    ${height}    Get Window Size
    Log To Console    ${Empty}
    Log To Console    Window's width is ${width}
    Log To Console    Window's height is ${height}