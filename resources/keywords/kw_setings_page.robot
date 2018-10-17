*** Settings ***
Documentation     Checkout Page keyword

Resource          ../variable/var_setings_page.robot
Resource          ../variable/var_common.robot
Resource          kw_browser.robot
Resource          kw_common.robot
Library           ${CURDIR}/../../lib/customlib/kwcheckout.py
*** keyword ***
Checkout Page Test Setup
    kwcheckout.set_checkout_process_py
    Go To Checkout Settings Page
