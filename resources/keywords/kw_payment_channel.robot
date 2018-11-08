*** Settings ***
Resource          kw_common.robot

*** keyword ***
Payment Channel Suite Setup
    Login With Default User


Payment Channel Suite Teardown
    Close Test Suite Browser

Payment Channel Test Setup
	Go To Payment Channel

