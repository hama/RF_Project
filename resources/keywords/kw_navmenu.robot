*** Settings ***
Documentation     checkout 公共方法
Resource          kw_common.robot

*** keywords ***
Navigation Suite Setup
    [Documentation]    布置开始执行用例环境
    Login With Default User


Navigation Suite Teardown
    [Documentation]    每个用例执行结束步骤

    Close Test Suite Browser

Navigation Test Setup
    [Documentation]    每个用例执行开始步骤
    Go To Navigation Menu Page