*** Settings ***
Documentation     满减活动封装公共部分关键字
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          var_common.robot
Resource          var_subtraction.robot
Resource          kw_browser.robot
Resource          kw_common.robot
Library           customLibrary

*** keyword ***
Subtraction_Status_Check
    [Documentation]    封装满减活动case三种状态的公共部分关键字
    [Arguments]    ${one}    ${two}    ${three}
    Go To Subtraction Page