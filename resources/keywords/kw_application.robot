*** Settings ***
Documentation     application 公共方法
Resource          kw_common.robot

*** Keywords ***
Application Suite Setup
    Login With Default User

Application Case Setup
    Go To Application Page

Application Suite Teardown
    Close Test Suite Browser

Application Case Teardown
    Teardown Test Case
