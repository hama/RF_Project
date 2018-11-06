*** Settings ***
Resource          kw_common.robot

*** keyword ***
Payment Channel Suite Setup
    [Documentation]    初始化物流信息
    Login With Default User


Payment Channel Suite Teardown
    [Documentation]
    Close Test Suite Browser

Payment Channel Test Setup
	Go To Payment Channel
