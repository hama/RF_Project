*** Settings ***
Documentation     Coupon Code 公共方法
Resource          kw_common.robot

*** keywords ***

Coupon Code Suite Setup
    [Documentation]
    Login With Default User
    kwproduct.add_max_product_py


Coupon Code Suite Teardown
    [Documentation]
    Close Test Suite Browser

Coupon Code Case Setup
    [Documentation]
    kwcoupon.add_before_coupon_code_py
    Go To Coupon Page

Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_button_all}
    Sleep    2

Select Before Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_button_before}
    Sleep    2

Select Doing Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_button_doing}
    Sleep    2

Select Finish Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_button_finish}
    Sleep    2

Add Default Coupon Code Text
    [Documentation]    优惠码新建页面字段默认值输入
    Sleep    2
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    优惠码默认值
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}     ${Empty}
    ${startTime}    Get Time
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}     ${startTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_end}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_endInput}    ${Empty}
    ${EndTime}    Add Time To Date    ${startTime}    20days
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_endInput}    ${EndTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Click Element    ${locatorB_couponCodeNew_text_p_promoCrandom}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    10
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_Mannum}    2
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_preferential}    200
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discount}    10
    Wait And Click Element    ${locatorB_couponCodeNew_button_allProducts}

Wait And Click Coupon Confirm
    [Documentation]    等待2秒后，点击保存按钮
    Sleep    2
    Sleep And Click Element    ${locatorB_button_save00}
    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
    Sleep    2