*** Settings ***
Documentation     Checkout Page keyword

Resource          kw_common.robot

*** keyword ***

Checkout Page Suite Setup
    Login With Default User
    kwproduct.add_product_with_conf_py
    kwshipping.add_shipping_with_conf_py


Checkout Page Suite Teardown
    kwcheckout.set_checkout_process_py
    Close Test Suite Browser

Checkout Page Test Setup
    kwcheckout.set_checkout_process_py
    Go To Checkout Settings Page


