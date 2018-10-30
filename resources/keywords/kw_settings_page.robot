*** Settings ***
Documentation     Checkout Page keyword

Resource          kw_common.robot

*** keyword ***

Checkout Page Suite Setup
    Login With Default User

Checkout Page Suite Teardown
    kwcheckout.set_checkout_process_py
    Close Test Suite Browser

Checkout Page Test Setup
    kwcheckout.set_checkout_process_py
    Go To Checkout Settings Page


