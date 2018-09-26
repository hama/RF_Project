*** Settings ***
Documentation     product collection keyword
Library           SeleniumLibrary    run_on_failure=NOTHING
Resource          ../variable/var_common.robot
Resource          ../variable/var_marketing.robot
Resource          ../variable/var_product_management.robot
Resource          ../variable/var_product_collection.robot
Resource          kw_browser.robot
Resource          kw_common.robot

*** keyword ***
Product Collection Suite Setup
    [Documentation]
    Login With Default User

Product Collection Suite Teardown
    [Documentation]
    del_all_collection_py
    Close Test Suite Browser

Product Collection Case Setup
    [Documentation]
    del_all_collection_py
    Go To Product Collection Page
