*** Settings ***
Documentation
Resource          kw_common.robot

*** keyword ***
Store Suite Setup
    Login With Default User

Store Suite Teardown
    kwstore.set_store_info_with_conf_py
    Close Test Suite Browser

Store Test Setup
	kwstore.set_store_info_with_conf_py
	Go To Store Page