*** Settings ***
Documentation     product management keyword

Resource          kw_common.robot

*** Keyword ***
Subtraction Suite Setup
    [Documentation]    满减活动 套件初始化
    Login With Default User

Subtraction Case Setup
    [Documentation]    满减活动 用例初始化
    Go To Subtraction Page

Subtraction Case Teardown
    [Documentation]    满减活动 用例清除
    Teardown Test Case

Subtraction Suite Teardown
    [Documentation]    满减活动 套件清除
    Close Test Suite Browser


Add Fill Rebate Activity
    [Documentation]    添加一个满减活动
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    满减活动001
    ${StartTime}=    Get Time
    Wait And Click Element    ${locatorB_subtractionNew_icon_ActivityTimeStart}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityTimeStart}    ${StartTime}
    Wait And Click Element    ${locatorB_subtractionNew_button_ActivityTimeStart}
    ${EndTime}=    Add Time To Date    ${StartTime}    20days
    Wait And Click Element    ${locatorB_subtractionNew_icon_ActivityTimeEnd}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityTimeEnd}    ${EndTime}
    Wait And Click Element    ${locatorB_subtractionNew_button_ActivityTimeEnd}
    Wait And Input Text    ${locatorB_subtractionNew_input_totalPrice}    200
    Wait And Input Text    ${locatorB_subtractionNew_input_cutPrice}     50
    Wait And Click Element    ${locatorB_subtractionNew_button_selectAllProduct}

