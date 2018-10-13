*** Settings ***
Documentation     Coupon Code 公共方法
Resource          ../variable/var_common.robot

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


