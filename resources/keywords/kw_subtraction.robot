*** Settings ***
Documentation     product management keyword

Resource          kw_common.robot

*** Keyword ***
Subtraction Suite Setup
    [Documentation]    满减活动 套件初始化
    Login With Default User

Subtraction Case Setup
    [Documentation]    满减活动 用例初始化
    kwrebate.end_all_rebates_py
    Go To Subtraction Page

Subtraction Case Teardown
    [Documentation]    满减活动 用例清除
    Teardown Test Case

Subtraction Suite Teardown
    [Documentation]    满减活动 套件清除
    Close Test Suite Browser


Add Fill Rebate Activity
    [Documentation]    添加一个满减活动
    Sleep    2
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    满减活动001
    ${STime}=    Get Time
    Set Global Variable    ${StartTime}    ${STime}
    Wait And Click Element    ${locatorB_subtractionNew_icon_ActivityTimeStart}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityTimeStart}    ${StartTime}
    Wait And Click Element    ${locatorB_subtractionNew_button_ActivityTimeStart}
    ${ETime}=    Add Time To Date    ${StartTime}    4hours
    Set Global Variable    ${EndTime}    ${ETime}
    Wait And Click Element    ${locatorB_subtractionNew_icon_ActivityTimeEnd}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityTimeEnd}    ${EndTime}
    Wait And Click Element    ${locatorB_subtractionNew_button_ActivityTimeEnd}
    Wait And Input Text    ${locatorB_subtractionNew_input_totalPrice}    50
    Wait And Input Text    ${locatorB_subtractionNew_input_cutPrice}     20
    Sleep And Click Element    ${locatorB_subtractionNew_button_selectAllProduct}


Add Activity Same Time
    Sleep And Click Element    ${locatorB_subtractionNew_icon_ActivityTimeStart}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityTimeStart}    ${Empty}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityTimeStart}    ${StartTime}
    Sleep And Click Element    ${locatorB_subtractionNew_button_ActivityTimeStart}
    Sleep And Click Element    ${locatorB_subtractionNew_icon_ActivityTimeEnd}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityTimeEnd}    ${Empty}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityTimeEnd}    ${EndTime}
    Sleep And Click Element    ${locatorB_subtractionNew_button_ActivityTimeEnd}


