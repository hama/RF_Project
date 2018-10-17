*** Settings ***
Documentation     Coupon Code 公共方法
Resource          ../variable/var_common.robot
Resource          ../variable/var_coupon_code.robot

*** keywords ***

Coupon Code Suite Setup
    [Documentation]
    Login With Default User

Coupon Code Suite Teardown
    [Documentation]
    Close Test Suite Browser

Coupon Code Case Setup
    [Documentation]
    Go To Coupon Page

Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_button_all}
    Sleep    2

Select Before Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_button_before}
    Sleep    2

Select Doing Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_button_doing}
    Sleep    2

Select Done Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_button_done}
    Sleep    2

Select Done Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_button_done}
    Sleep    2
