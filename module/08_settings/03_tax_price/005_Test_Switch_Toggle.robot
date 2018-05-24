*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot    # import login keyword
Resource          ../../../resources/browser.robot    # import ajax listener keyword
Resource          ../../../resources/tax_price.robot    # import ajax listener keyword

*** Variables ***
${tax_page_toggle_switch_api}    http://admin1024.shoplazza.com/api/tax/toggle
${tax_page_list_api}    http://admin1024.shoplazza.com/api/tax/list

*** Test Cases ***
Test Toggle Tax Switch
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    # using xpath temporary(should be instead by element id)
    Assign Id To Element    xpath://ul[@id="9$Menu"]//li[5]    tax_price_btn
    Wait Until Element Is Visible    id:tax_price_btn
    # Try toggle switch and check result
    Start Ajax Listener
    # click price btn
    Click Element    id:tax_price_btn
    Wait Until Page Contains    ${tax_price_setting}
    sleep    2
    Assign Id To Element    dom:document.querySelectorAll('.ant-table-tbody .ant-switch')[1];    switch_1
    ${dataLength}=    Execute JavaScript    return responseMap.get("${tax_page_list_api}").data.list.length;
    Should Be True    ${dataLength}>=1
    ${rawSwitch}=    Execute JavaScript    return responseMap.get("${tax_page_list_api}").data.list[1].is_enable;
    Click Element    id:switch_1
    sleep    2
    Page Should Contain    ${tax_page_setting_ok}
    Check response status
    ${newSwitch}=    Execute JavaScript    return responseMap.get("${tax_page_list_api}").data.list[1].is_enable;
    Should Not Be True    '${rawSwitch}'=='${newSwitch}'

*** KeyWords ***
Check response status
    ${state}=    Execute JavaScript    return responseMap.get("${tax_page_toggle_switch_api}").state;
    ${msg}=    Execute JavaScript    return responseMap.get("${tax_page_toggle_switch_api}").msg;
    Should Be Equal As Strings    ${state}    0
    Should Be Equal As Strings    ${msg}    请求成功
