*** Settings ***
Documentation     生成订单
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          kw_browser.robot
Resource          kw_common.robot
Resource          var_common.robot
Resource          var_order.robot

*** Keywords ***
Quit Order Setp
    Sleep    1
    Click Element    ${locator_order}
    Sleep    1
