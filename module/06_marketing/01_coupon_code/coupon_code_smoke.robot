*** Settings ***
Documentation     测试商品列表
Suite Setup       Coupon Code Suite Setup
Suite Teardown    Coupon Code Suite Teardown
Test Setup        Coupon Code Case Setup
Test Teardown     Teardown Test Case
Force Tags        coupon code
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
coupon_code070
    [Documentation]    验证新建优惠码界面，活动名称输入框输入合法内容可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    activity_auto

coupon_code153
    [Documentation]    验证新建优惠码界面，选择商品窗口，选择商品后，添加按钮可点击
    [Tags]    P0    threshold
    kwproduct.del_all_products_py
    kwproduct.add_max_product_py
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Wait Exist And Click Element    ${locatorB_popUps_checkbox}
	Wait And Click Element    ${locatorB_popUps_button_footermiddle}
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_hadAdded}    已选择1件商品
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_items_listProduct}


