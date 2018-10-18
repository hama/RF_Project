*** Settings ***
Documentation
Resource          kw_common.robot

*** keyword ***
Store Suite Setup
    [Documentation]    初始化物流信息
    Login With Default User

Store Suite Teardown
    [Documentation]
    Close Test Suite Browser

Store Test Setup
	kwstore.set_store_info_with_conf_py
	Go To Store Page
