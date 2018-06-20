*** Settings ***
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_shipping.robot

*** keywords ***
Common Setp
    [Arguments]    ${element}    ${elements_}
    Wait And Click Element    ${element}
    Wait And Click Element    ${elements_}

Quantity All Setp
    Wait And Click Element    ${locator_shipping_add_shipping}
    Wait And Click Element    ${locator_shipping_add_quantity_btn}
    Sleep    1

Quit All Shipping
    Wait Until Element is Visible    ${locator_setting_shipping}
    Click Element    ${locator_setting_shipping}
    Sleep    1
    Alert Should Be Present

Quit All Setp
    Wait Until Element is Visible    ${locator_setting_shipping}
    Click Element    ${locator_setting_shipping}
    Sleep    1
