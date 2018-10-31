*** Settings ***
Documentation     checkout 公共方法
Resource          kw_common.robot

*** keywords ***
navigation Suite Setup
    [Documentation]    布置开始执行用例环境
    Login With Default User


navigation Suite Teardown
    [Documentation]    每个用例执行结束步骤

    Close Test Suite Browser

navigation Test Setup
    [Documentation]    每个用例执行开始步骤
    Go To navigation menu Page