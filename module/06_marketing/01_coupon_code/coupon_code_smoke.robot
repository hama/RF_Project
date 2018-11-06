*** Settings ***
Documentation     测试商品列表
Suite Setup       Coupon Code Suite Setup
Suite Teardown    Coupon Code Suite Teardown
Test Setup        Coupon Code Case Setup
Test Teardown     Teardown Test Case
Force Tags        coupon code
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***

coupon_code001
    [Documentation]    验证左侧导航栏可进入优惠码界面
    [Tags]    P0
    Wait Until Page Contains Text    优惠码

coupon_code002
    [Documentation]    验证优惠码界面新建活动课点击
    [Tags]    P0
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Wait Until Page Contains Text    优惠码列表

coupon_code003
    [Documentation]    验证优惠码界面tab全部栏正常  >  1.将tab切换到未开始   2.再点击全部
    [Tags]    P0
    Wait And Click Element     ${locatorB_couponCode_button_before}
    Select All Coupon Code Tag
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCode_button_all}    class    ant-tabs-tab-active ant-tabs-tab

coupon_code004
    [Documentation]    验证优惠码界面tab未开始栏正常  >  1.点击未开始
    [Tags]    P0
    Wait And Click Element     ${locatorB_couponCode_button_before}
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCode_button_before}   class    ant-tabs-tab-active ant-tabs-tab

coupon_code005
    [Documentation]    验证优惠码界面tab进行中栏正常  >  1.点击进行中
    [Tags]    P0
    Wait And Click Element     ${locatorB_couponCode_button_doing}
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCode_button_doing}    class    ant-tabs-tab-active ant-tabs-tab

coupon_code006
    [Documentation]    验证优惠码界面tab未开始栏正常  >  1.点击已结束
    [Tags]    P0
    Wait And Click Element     ${locatorB_couponCode_button_finish}
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCode_button_finish}   class    ant-tabs-tab-active ant-tabs-tab

coupon_code007
    [Documentation]    验证优惠码界面搜索输入框可输入内容
    [Tags]    P0
    Wait And Click Element     ${locatorB_couponCode_button_before}
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCode_button_before}   class    ant-tabs-tab-active ant-tabs-tab

coupon_code022
    [Documentation]    验证优惠码活动列表中点击优惠码活动可进入活动详情
    [Tags]    P0
    ${code}    get_coupon_code_random_code_py
    Reload Page And Start Ajax
    Select All Coupon Code Tag



coupon_code070
    [Documentation]    验证新建优惠码界面，活动名称输入框输入合法内容可保存成功
    [Tags]    P0    threshold    smoke
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    activity_auto

coupon_code076
    [Documentation]    验证新建优惠码界面，优惠类型选择折扣券时可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    activity_auto

coupon_code078
    [Documentation]    验证新建优惠码界面，优惠类型选择代金券时可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    activity_auto

coupon_code082
    [Documentation]    验证新建优惠码界面，时间选择器中选择合法时间，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto1
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    #.获取当前系统时间
    ${nowTime}    Get Time
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${nowTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_end}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_endInput}    ${empty}
    #.拿到的当前系统时间 + 30 天    exclude_millis=yes  时间设置格式
    ${endTime}    Add Time To Date	  ${nowTime}   30 days    exclude_millis=yes
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_endInput}    ${endTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityTime}
    Should Be Equal    ${text}    ${nowTime}-\n${endTime}


coupon_code085
    [Documentation]    验证新建优惠码界面，勾选不限结束时间，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto1
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    ${nowTime}    Get Time
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${nowTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    #.判断元素是否出现，出现者不点，不出现就点击
    ${class} =    Get Element Attribute    ${locatorB_couponCodeNew_selectTime_notEndTimeStart}    class
    Run Keyword If    '${class}'=='ant-checkbox'    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_notEndTime}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityTime}
    Should Be Equal    ${text}    ${nowTime}-\n无期限

coupon_code090
    [Documentation]    验证新建优惠码界面，优惠码输入框中输入合法内容可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto1
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    ${nowTime}    Get Time
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${nowTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    ${empty}
    ${randomcode}     kwcoupon.get_coupon_code_random_code_py
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    ${randomcode}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_couponCode}
    Should Be Equal    ${text}    ${randomcode}

coupon_code098
    [Documentation]    验证新建优惠码界面，数量输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    youhuoquan noLimit
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    ${nowTime}    Get Time
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${nowTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    ${empty}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    20
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    youhuoquan noLimit

coupon_code099
    [Documentation]    验证新建优惠码界面，数量栏，勾选输入框下方的不限时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    youhuiquan num
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    ${nowTime}    Get Time
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${nowTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    ${empty}
    ${class} =    Get Element Attribute    ${locatorB_couponCodeNew_input_noTotalNum}    class
    Run Keyword If    '${class}'=='ant-checkbox'    Wait And Click Element    ${locatorB_couponCodeNew_input_noLimit}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    youhuiquan num


coupon_code107
    [Documentation]    验证新建优惠码界面，每人限用输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto1
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    ${nowTime}    Get Time
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${nowTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    20
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    activity_auto1

coupon_code108
    [Documentation]    验证新建优惠码界面，每人限用栏，勾选输入框下方的不限时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    youhuiquan num
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${empty}
    ${nowTime}    Get Time
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}    ${nowTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    ${empty}
    ${class} =    Get Element Attribute    ${locatorB_couponCodeNew_text_input_toLimited}    class
    Run Keyword If    '${class}'=='ant-checkbox'    Wait And Click Element    ${locatorB_couponCodeNew_input_limited}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    youhuiquan num

coupon_code116
    [Documentation]    验证新建优惠码界面，优惠类型为折扣券，优惠门槛输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_discountCoupon}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_preferential}    2
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityRules}
    Should Be Equal    ${text}    满2件10% off

coupon_code117
    [Documentation]    验证新建优惠码界面，优惠类型为折扣券，优惠门槛勾选输入框下方的无门槛时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    折扣券 无门槛
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_discountCoupon}
    Wait Exist And Click Element    ${locatorB_couponCodeNew_text_input_notThreshold}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityRules}
    Should Be Equal    ${text}    无门槛10% off

coupon_code125
    [Documentation]    验证新建优惠码界面，优惠类型为折扣券，优惠门槛输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto50
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_discountCoupon}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discount}    50
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityRules}
    Should Be Equal    ${text}    无门槛50% off

coupon_code129
    [Documentation]    验证新建优惠码界面，优惠类型为代金券，优惠门槛输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_preferential}     100
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discount}    10
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityRules}
    Should Be Equal    ${text}    满100USD减10USD

coupon_code130
    [Documentation]    验证新建优惠码界面，优惠类型为代金券，优惠门槛勾选输入框下方的无门槛时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_preferential}     ${empty}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discount}     ${empty}
    Wait Exist And Click Element    ${locatorB_couponCodeNew_text_input_notThreshold}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityRules}
    Should Be Equal    ${text}    无门槛减10USD

coupon_code142
    [Documentation]    验证新建优惠码界面，适用范围，选择全部商品时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_全部商品
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Click Element    ${locatorB_couponCodeNew_button_allProducts}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    activity_全部商品

coupon_code144
    [Documentation]    验证新建优惠码界面，适用范围，选择全部商品时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_部分商品
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_button_save00}
    ${text} =    Sleep And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be Equal    ${text}    activity_部分商品



coupon_code153
    [Documentation]    验证新建优惠码界面，选择商品窗口，选择商品后，添加按钮可点击
    [Tags]    P0    threshold    smoke
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

coupon_code155
    [Documentation]    验证新建优惠码界面，选择商品窗口，商品可展开
    [Tags]    P0    threshold    smoke
    kwproduct.del_all_products_py
    kwproduct.add_max_product_with_sub_py
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Wait Exist And Click Element    ${locatorB_popUps_icon_down}[0]
    Wait Until Page Contains Text    red min
    Wait Until Page Contains Text    red mid
    Wait Until Page Contains Text    black min
    Wait Until Page Contains Text    black mid

coupon_code164
    [Documentation]    验证活动编辑界面，修改任何内容可触发保存和取消按钮
    [Tags]    P0    threshold    smoke
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait Until Page Contains Locator    ${locatorB_button_save00}
    Wait Until Page Contains Locator    ${locatorB_button_canecl00}

coupon_code164.1
    [Documentation]    验证活动编辑界面，修改任何内容可触发保存和取消按钮
    [Tags]    P0    threshold    smoke
    kwcoupon.add_doing_coupon_code_py
    Reload Page And Start Ajax
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait Until Page Contains Locator    ${locatorB_button_save00}
    Wait Until Page Contains Locator    ${locatorB_button_canecl00}

coupon_code165
    [Documentation]    验证新建优惠码界面，取消按钮可撤销操作
    [Tags]    P0    threshold    smoke
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element Then Confirm     ${locatorB_button_canecl00}
    Wait Until Page Contains Text    新建活动

coupon_code169
    [Documentation]    验证新建优惠码，优惠码不可重复
    [Tags]    P0    threshold    smoke
    Sleep    1
    ${code}    get_coupon_code_random_code_py
    &{conf} =    Create Dictionary
    ...    code=${code}
    kwcoupon.add_before_coupon_code_py    ${conf}
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_items_listCoupon}[1]
    Wait And Input Text    ${locatorB_couponCodeNew_input_couponCode}    ${code}
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    优惠码重复


