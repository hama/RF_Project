*** Settings ***
Library           SeleniumLibrary
Resource          var_common.robot
Resource          kw_browser.robot
Resource          kw_products.robot

*** Keywords ***
Login With Default User
    New Test Suite Browser And Login    ${user_default_name}    ${user_default_pwd}    ${user_default_domain}

Login With User
    [Arguments]    ${username}    ${password}    ${domain}
    log    Login with ${username}
    Comment    wait until login button is visible
    Wait And Input Text    id:account    ${username}
    Wait And Input Password    id:password    ${password}
    Wait And Click Button    class:logBtn___3pRgJ
    Comment    wait until domain input text element is visible
    ${href}=    Execute JavaScript    return window.location.href
    ${has_login}=    Execute JavaScript    return '${href}'==='${url_home_page}'
    Run Keyword Unless    ${has_login}    Input Domain    ${domain}
    Wait Until Element Is Visible    ${locatorB_setting}
    log    Login Success

Input Domain
    [Arguments]    ${domain}
    Wait And Input Text    id:username    ${domain}
    Wait And Click Button    class:logBtn___3pRgJ

Go To Setting Page
    [Documentation]    跳转到设置页面
    Wait And Click Element    ${locatorB_setting}

Go To Products Page
    [Documentation]    跳转到商品页面
    Wait And Click Element    ${locatorB_products}
    Wait Until Page Contains    ${contentB_products_all}
    Location Should Be    ${url_products}
    Sleep    1

Go To Marketing Page
    [Documentation]    跳转到营销页面
    Wait And Click Element    ${locatorB_marketing}
    Sleep    2
    #点击满减活动
    #Wait And Click Element    id:test_marketing_substraction
    #Sleep    2

Go To Order Page
    [Documentation]    跳转到订单页面
    Wait And Click Element    ${locatorB_order}
    Wait Until Page Contains    ${contentB_order_title}
    Location Should Be    ${url_order}

Go To Tax Price Page
    [Documentation]    跳转到税费页面
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${unvisible}=    Execute Javascript    return document.querySelectorAll('a[href="/taxPrice"]')[0]===undefined
    Run Keyword If    ${unvisible}    Wait And Click Element    ${locatorB_setting}
    Wait And Click Element    ${locatorB_setting_taxPrice}
    Location Should Be    ${url_tax_price}

Go To Shipping Page
    [Documentation]    跳转到物流页面
    Sleep    2.5
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${unvisible}=    Execute Javascript    return document.querySelectorAll('a[href="/shipping"]')[0]===undefined
    Run Keyword If    ${unvisible}    Wait And Click Element    ${locatorB_setting}
    Wait And Click Element    ${locatorB_setting_shipping}
    Wait Until Element Is Visible    ${locatorB_shipping_add_shipping}
    Page Should Contain    ${contentB_shipping_tab1}
    Page Should Contain    ${contentB_shipping_tab2}
    Location Should Be    ${url_shipping}

Wait And Input Text
    [Arguments]    ${element_locator}    ${text}
    [Documentation]    封装的输入方法，等待元素可被输入时，再输入
    Wait Until Element Is Visible    ${element_locator}
    Wait Until Keyword Succeeds    3x    1s    Input Text    ${element_locator}    ${text}

Wait And Input Password
    [Arguments]    ${element_locator}    ${pwd}
    [Documentation]    封装的输入方法，等待元素可被输入时，再输入
    Wait Until Element Is Visible    ${element_locator}
    Wait Until Keyword Succeeds    3x    1s    Input Password    ${element_locator}    ${pwd}

Wait And Click Element
    [Arguments]    ${element_locator}
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${element_locator}
    Wait Until Keyword Succeeds    5x    5s    Click Element    ${element_locator}
    Sleep    2

Wait And Click Button
    [Arguments]    ${button_locator}
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Sleep    1
    Wait Until Element Is Visible    ${button_locator}
    Wait Until Keyword Succeeds    5x    1s    Click Button    ${button_locator}
    Sleep    1

Wait And Click Link
    [Arguments]    ${link_locator}
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${link_locator}
    Wait Until Keyword Succeeds    5x    1s    Click Link    ${link_locator}
    Sleep    1

Common Js Click
    [Arguments]    ${element}    ${index}
    [Documentation]    封装js点击方法
    Execute JavaScript    return document.querySelectorAll("${element}")[${index}].click()

JS Get Element Length
    [Arguments]    ${element_locator}
    [Documentation]    封装的JS方法，返回元素集长度
    Execute Javascript    return ${element_locator}.length

Set Tax Price
    [Documentation]    封装设置税金方法,[element]:需要设置国家的中文名字(string),[numbers]:设置多少税金(int)
    [Arguments]    ${element}    ${numbers}
    Go To    ${home_page}    #.跳转主页
    Go To Tax Price Page    #.进入税金主页
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    ${length}    Execute JavaScript    return document.querySelectorAll(".ant-table-tbody tr").length
    :FOR    ${i}    IN RANGE    ${length}
    \    ${index}    evaluate    ${i}+1
    \    ${name}    Execute JavaScript    return document.querySelectorAll(".ant-table-tbody tr:nth-child(${index}) td div div p")[0].innerText
    \    Run Keyword If    '${name}'=='${element}'    Execute JavaScript    return document.querySelectorAll(".ant-table-tbody tr:nth-child(${index}) td i")[0].click()
    \    Run Keyword If    '${name}'=='${element}'    Input Text    dom:document.querySelectorAll('input')[0]    ${numbers}
    \    Run Keyword If    '${name}'=='${element}'    Wait And Click Element    dom:document.querySelectorAll('button')[2]
    Go To    ${home_page}



Checkout Page Decoration Condition
    [Documentation]    判断店铺是否装修
    Go To    ${home_page}
    Wait And Click Element    ${locator_store}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    ${name}    Execute JavaScript    return document.querySelectorAll("button span")[1].innerText
    Run keyword If    '${name}'<>'优化pc展示'    Run keyword    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Run keyword If    '${name}'<>'优化pc展示'    Run keyword    Wait And Click Element    dom:document.querySelectorAll("button")[5]

