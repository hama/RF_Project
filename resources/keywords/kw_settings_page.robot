*** Settings ***
Documentation     Checkout Page keyword

Resource          kw_common.robot

*** keyword ***

Checkout Page Suite Setup
    Login With Default User
    kwshipping.del_all_shipping_py
    kwproduct.add_product_with_conf_py
    kwshipping.add_shipping_with_conf_py


Checkout Page Suite Teardown
    kwcheckout.set_checkout_process_py
    kwshipping.del_all_shipping_py
    Close Test Suite Browser

Checkout Page Test Setup
    kwcheckout.set_checkout_process_py
    Go To Checkout Settings Page

Go To BuyMembers Label
	Wait And Click Element    ${locatorB_checkout_label_buyMembers}
    Sleep    1

Go To RegisterMembers Label
	Wait And Click Element    ${locatorB_checkout_label_registerMembers}
	Sleep    1

Go To NotMembers Label
	Wait And Click Element    ${locatorB_checkout_label_notMembers}
	Sleep    1
