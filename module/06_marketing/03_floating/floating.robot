*** Settings ***
Documentation     浮窗功能测试
Suite Setup       Floating Page Suite Setup
Suite Teardown    Floating Page Suite Teardown
Test Setup        Floating Page Test Setup
Test Teardown     Floating Page Test Teardown
Force Tags        Floating

Resource        ../../../resources/keywords/kw_common.robot


*** Test cases ***
floating_group001
    [Tags]    group
    #测试点
    Check P0 Point From B_reset001
    Check P0 Point From B_reset002
    Check P0 Point From B_reset003
    Check P0 Point From B_reset009

floating_group004
    [Tags]    group
    #前置条件
    Floating Settings Page Then Open    ant-switch
    #测试点
    Check P0 Point From B_reset013
    Check P0 Point From B_reset018

floating_group006
    [Tags]    group
    #前置条件
    Floating Settings Page Then Open    ant-switch
    #测试点
    Check P0 Point From B_reset020
    Check P0 Point From B_reset021
    Check P0 Point From B_reset022
    Check P0 Point From B_reset023
    Check P0 Point From B_reset024

floating_group007
    [Tags]    group
    #前置条件
    Floating Settings Page Then Open    ant-switch
    Sleep And Click Element    ${locatorB_floatingSettings_tab_reviewSettings}
    #测试点
    Check P0 Point From B_reset025
    Check P0 Point From B_reset026
    Check P0 Point From B_reset027
    Check P0 Point From B_reset028

floating_group008
    [Tags]    group
    #前置条件
    Floating Settings Page Then Open    ant-switch
    Sleep And Click Element    ${locatorB_floatingSettings_tab_reviewSettings}
    #测试点
    Check P0 Point From B_reset029
    Check P0 Point From B_reset030
    Check P0 Point From B_reset031
    Check P0 Point From B_reset032
    Check P0 Point From B_reset033
    Check P0 Point From B_reset034
    Check P0 Point From B_reset035
    Check P0 Point From B_reset036
    Check P0 Point From B_reset037
    Check P0 Point From B_reset038
    Check P0 Point From B_reset039

floating_group009
    [Tags]    group
    #前置条件
    Floating Settings Page Then Open    ant-switch
    Sleep And Click Element    ${locatorB_floatingSettings_tab_reviewSettings}
    #测试点
    Check P1 Point From B_reset040

#floating_group010
#    [Tags]    group
#    #前置条件
#    Floating Settings Page Then Open    ant-switch
#    Sleep And Click Element    ${locatorB_floatingSettings_tab_reviewSettings}
#    #测试点
#    Check P1 Point From B_reset042
#    Check P1 Point From B_reset043
#    Check P1 Point From B_reset044
#    Check P1 Point From B_reset045


