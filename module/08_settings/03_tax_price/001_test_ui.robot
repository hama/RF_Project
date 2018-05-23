*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot    # import login keyword
Resource          ../../../resources/browser.robot    # import ajax listener keyword
Resource          ../../../resources/tax_price.robot    # import ajax listener keyword

*** Test Cases ***
Test_Tax_Page_Normal
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    # using xpath temporary(should be instead by element id)
    Start Ajax Listener
    Assign Id To Element    xpath://ul[@id="9$Menu"]//li[5]    tax_price_btn
    Wait Until Element Is Visible    id:tax_price_btn
    Click Element    id:tax_price_btn
    Wait Until Page Contains    ${tax_price_setting}
    Page Should Contain    ${tax_page_country}
    Page Should Contain    ${tax_page_country_price}
    Page Should Contain    ${tax_page_location}
    Page Should Contain    ${tax_page_operation}
    sleep    1
    Check Tax Page List

Test_Session_Timeout
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    # using xpath temporary(should be instead by element id)
    Delete All Cookies
    Click Element    class:icon_setting___3OCQq
    sleep    3
    Select Frame    dom:document.getElementsByTagName('iframe')[0]
    Page Should Contain    登录我的店匠商铺

*** KeyWords ***
Check Tax Page List
    # 获取指定接口的数据，使用 Table should countains 关键字判断是否包含
    ${dataLength}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list.length;
    : FOR    ${index}    IN RANGE    ${dataLength}
    \    ${rowIndex}=    Evaluate    int(${index}) + 2
    \    ${country_name}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[${index}].country_name;
    \    ${country_name_en}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[${index}].country_name_en;
    \    ${country_price}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[${index}].country_price.toString();
    \    ${zone_total}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[${index}].zone_total.toString();
    \    Table Cell Should Contain    tag:table    ${rowIndex}    1    ${country_name}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    1    ${country_name_en}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    2    ${country_price}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    3    ${zone_total}
