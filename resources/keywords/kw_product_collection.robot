*** Settings ***
Documentation     product collection keyword
Library           SeleniumLibrary    run_on_failure=NOTHING
Resource          ../variable/var_common.robot
Resource          kw_browser.robot
Resource          kw_common.robot

*** keyword ***
Product Collection Suite Setup
    [Documentation]
    Login With Default User

Product Collection Suite Teardown
    [Documentation]
    kwcollection.del_all_collections_py
    Close Test Suite Browser

Product Collection Case Setup
    [Documentation]
    kwcollection.del_all_collections_py
    Go To Product Collection Page
