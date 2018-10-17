*** Settings ***
Documentation     Checkout Page keyword

Resource          kw_common.robot

*** keyword ***

Checkout Page Test Setup
    kwcheckout.set_checkout_process_py
    Go To Checkout Settings Page
