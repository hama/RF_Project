*** Settings ***
Documentation     order keyword

Resource          kw_common.robot

*** keyword ***
Dealing Order Suite Setup
    [Documentation]
    Login With Default User
    kwproduct.del_all_products_py

Dealing Order Suite Teardown
    [Documentation]
    kwproduct.del_all_products_py
    Close Test Suite Browser

Dealing Order Case Setup
    [Documentation]
    kwshipping.del_all_shipping_py
    Go To Dealing Order Page
    

Undeal Order Suite Setup
    [Documentation]
    Login With Default User
    kwproduct.del_all_products_py

Undeal Order Suite Teardown
    [Documentation]
    kwproduct.del_all_products_py
    Close Test Suite Browser

Undeal Order Case Setup
    [Documentation]
    Go To Undeal Order Page

Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_button_all}
    Sleep    2

Select To Deliver Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_button_toDeliver}
    Sleep    2

Select Delivered Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_button_delivered}
    Sleep    2

Select Finished Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_button_finished}
    Sleep    2

Select All Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_button_all}
    Sleep    2

Select To Pay Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_button_toPay}
    Sleep    2

Select Canceled Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_button_canceled}
    Sleep    2


