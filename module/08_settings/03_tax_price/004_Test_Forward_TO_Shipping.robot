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
Test_Forward_To_Shipping
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    # using xpath temporary(should be instead by element id)
    Assign Id To Element    xpath://ul[@id="9$Menu"]//li[5]    tax_price_btn
    Wait Until Element Is Visible    id:tax_price_btn
    Click Element    id:tax_price_btn
    Wait Until Page Contains    ${tax_price_setting}
    sleep    2
    Page Should Contain    ${tax_page_country}
    Page Should Contain    ${tax_page_country_price}
    Page Should Contain    ${tax_page_location}
    Page Should Contain    ${tax_page_operation}
    Page Should Contain    ${tax_page_tips}
    # test mouse hover
    Click Button    tag:button
    Wait Until Page Contains    ${tax_shipping_setting_title}
    Page Should Contain    ${tax_shipping_tab1}
    Page Should Contain    ${tax_shipping_tab1}
