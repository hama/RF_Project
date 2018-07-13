*** Settings ***
Library           SeleniumLibrary    #Test Setup    Open Headless Chrome    #Test Teardown    Close Browser
Resource          ../../../resources/var_common.robot

*** Variables ***
${interface}      ${home_page}/api/product/search?page=0&limit=20

*** Test Cases ***
Inject Products
    Open Browser    ${home_page}    chrome
    # wait for login
    Comment    wait until login button is visible
    Wait Until Element Is Visible    class:logBtn___3pRgJ
    Input Text    id:account    18825260804
    Input Password    id:password    18825260804
    Click Button    class:logBtn___3pRgJ
    # wait for login
    Comment    wait until domain input text element is visible
    Wait Until Element Is Visible    id:username
    Input Text    id:username    diu
    Click Button    class:logBtn___3pRgJ
    # exec ajax listener
    Execute JavaScript    ${CURDIR}/../lib/ajaxListener.js
    # clieck product button
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    # wait for table visible
    sleep    2
    Check result

*** Keywords ***
Open Headless Chrome
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}

Check result
    # 获取指定接口的数据，使用 Table should countains 关键字判断是否包含
    ${dataLength}=    Execute JavaScript    return responseMap.get("${interface}").data.products.length;
    : FOR    ${index}    IN RANGE    ${dataLength}
    \    ${meta_title}=    Execute JavaScript    return responseMap.get("${interface}").data.products[${index}].meta_title;
    \    ${inventory_quantity}=    Execute JavaScript    return responseMap.get("${interface}").data.products[${index}].inventory_quantity.toString();
    \    ${create_time}=    Execute JavaScript    return responseMap.get("${interface}").data.products[${index}].create_time;
    \    ${image_src}=    Execute JavaScript    return responseMap.get("${interface}").data.products[${index}].image.src;
    \    ${rowIndex}=    Evaluate    int(${index}) + 2
    \    Table Cell Should Contain    tag:table    ${rowIndex}    3    ${meta_title}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    4    ${inventory_quantity}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    7    ${create_time}
