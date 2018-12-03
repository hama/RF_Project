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
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_button_addActivity}

coupon_code002
    [Documentation]    验证优惠码界面新建活动可点击
    [Tags]    P0
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Wait Until Page Contains Text    返回优惠码列表

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
    [Documentation]    验证优惠码界面 搜索输入框 可输入内容
    [Tags]    P0
    Wait And Input Text    ${locatorB_couponCode_input_enterCouponCode}    优惠码
    Value Of Element Should Be Equal With Wait    ${locatorB_couponCode_input_enterCouponCode}    优惠码

coupon_code022
    [Documentation]    验证优惠码活动列表中 点击 优惠码活动 可进入活动详情
    [Tags]    P0
    sleep    2
    ${CodeContent}    Get Text     ${locatorB_couponCode_text_firstCoupon_couponCode}
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_couponCode}
    Wait And Click Element    ${locatorB_couponCodeNew_text_input_promoCode}
    ${InputCodeContent}    Get Value     ${locatorB_couponCodeNew_text_input_promoCode}
    Should Be True    $CodeContent==$InputCodeContent
    Wait Until Page Contains Text    返回优惠码列表

coupon_code070
    [Documentation]    验证新建优惠码界面，活动名称输入框 输入合法内容 可保存成功
    [Tags]    P0    threshold    smoke
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    活动1
    Wait And Click Coupon Confirm
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCode_text_firstCoupon_activityName}    活动1

coupon_code076
    [Documentation]    验证新建优惠码界面，优惠类型选择 折扣券 时可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_discountCoupon}
    Wait And Click Coupon Confirm
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityNum}
    Sleep    1
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_select_couponStyle}    折扣券

coupon_code078
    [Documentation]    验证新建优惠码界面，优惠类型选择 代金券 时可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Click Coupon Confirm
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityNum}
    Sleep    1
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_select_couponStyle}    代金券

coupon_code082
    [Documentation]    验证新建优惠码界面，时间选择器中选择合法时间，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}     ${Empty}
    ${startTime1}    Get Time
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}     ${startTime1}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_end}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_endInput}    ${Empty}
    ${EndTime1}    Add Time To Date    ${startTime1}    20days
    ${EndTime2}    Evaluate    u"${EndTime1}".strip('.000')
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_endInput}    ${EndTime1}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Click Coupon Confirm
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCode_text_firstCoupon_activityTime}    ${startTime1}-\n${EndTime2}

coupon_code085
    [Documentation]    验证新建优惠码界面，勾选不限结束时间，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_start}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}     ${Empty}
    ${startTime1}    Get Time
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_startInput}     ${startTime1}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Long Press Element With Wait    ${locatorB_couponCodeNew_selectTime_notEndTime}
    Wait And Click Coupon Confirm
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCode_text_firstCoupon_activityTime}    ${startTime1}-\n无期限

coupon_code090
    [Documentation]    验证新建优惠码界面，优惠码输入框中 输入合法内容 可保存成功(随机生成)
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_text_p_promoCrandom}
    Sleep    2
    ${conpontext}    Get Value    ${locatorB_couponCodeNew_text_input_promoCode}
    Wait And Click Coupon Confirm
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCode_text_firstCoupon_couponCode}    ${conpontext}

coupon_code090.1
    [Documentation]    验证新建优惠码界面，优惠码输入框中 输入合法内容 可保存成功(手动输入)
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    ${randomStr}=    kwcoupon.get_coupon_code_random_code_py
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    ${randomStr}
    Wait And Click Coupon Confirm
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCode_text_firstCoupon_couponCode}    ${randomStr}

coupon_code098
    [Documentation]    验证新建优惠码界面，数量输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    100
    Wait And Click Coupon Confirm
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_text_firstCoupon_beenUsedAndUnUsed}    100

coupon_code099
    [Documentation]    验证新建优惠码界面，数量栏，勾选输入框下方的不限时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Long Press Element With Wait    ${locatorB_couponCodeNew_input_noLimit}
    Wait And Click Coupon Confirm
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_text_firstCoupon_beenUsedAndUnUsed}    不限

coupon_code107
    [Documentation]    验证新建优惠码界面，每人限用输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_Mannum}    20
    Wait And Click Coupon Confirm
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Sleep    2
    Value Of Element Should Be Equal With Wait      ${locatorB_couponCodeNew_text_input_Mannum}    20

coupon_code108
    [Documentation]    验证新建优惠码界面，每人限用栏，勾选输入框下方的不限时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Long Press Element With Wait    ${locatorB_couponCodeNew_input_limited}
    Wait And Click Coupon Confirm
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Sleep    2
    Element Attribute Should Contain With Wait    ${locatorB_couponCodeNew_input_limited}    class    ant-checkbox ant-checkbox-checked

coupon_code116
    [Documentation]    验证新建优惠码界面，优惠类型为 折扣券，优惠门槛 输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element   ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_discountCoupon}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_preferential}    3
    Wait And Click Coupon Confirm
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_select_couponStyle}    折扣券
    Value Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_preferential}    3

coupon_code117
    [Documentation]    验证新建优惠码界面，优惠类型为折扣券，优惠门槛勾选输入框下方的无门槛时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element   ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_discountCoupon}
    Long Press Element With Wait    ${locatorB_couponCodeNew_text_input_notThreshold}
    Wait And Click Coupon Confirm
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_text_firstCoupon_activityRules}    无门槛
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_select_couponStyle}    折扣券

coupon_code124
    [Documentation]    验证新建优惠码界面，优惠类型为折扣券时，折扣比例输入框可输入内容
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element   ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_discountCoupon}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discount}    123qwe测试！@
    Wait And Click Element    ${locatorB_couponCodeNew_text_input_preferential}
    Value Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_discount}    123qwe测试！@

coupon_code125
    [Documentation]    验证新建优惠码界面，优惠类型为折扣券时，折扣比例输入框中输入合法内容，可保存
    [Tags]    P0
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_discountCoupon}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discount}    8
    Wait And Click Coupon Confirm
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_text_firstCoupon_activityRules}    8
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_select_couponStyle}    折扣券

coupon_code129
    [Documentation]    验证新建优惠码界面，优惠类型为代金券，优惠门槛输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_preferential}     100
    Wait And Click Coupon Confirm
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_text_firstCoupon_activityRules}    100
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Sleep    2
    Text Of Element Should Contain With Wait    ${locatorB_couponCodeNew_select_couponStyle}    代金券

coupon_code130
    [Documentation]    验证新建优惠码界面，优惠类型为代金券，优惠门槛勾选输入框下方的无门槛时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Long Press Element With Wait    ${locatorB_couponCodeNew_text_input_notThreshold}
    Wait And Click Coupon Confirm
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_text_firstCoupon_activityRules}    无门槛
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_select_couponStyle}    代金券

coupon_code138
    [Documentation]    验证新建优惠码界面，优惠类型为代金券，优惠金额输入框中输入合法内容时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discount}     100
    Wait And Click Coupon Confirm
    Wait Until Page Contains Text    保存成功
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_text_firstCoupon_activityRules}    100

coupon_code142
    [Documentation]    验证新建优惠码界面，适用范围，选择全部商品时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Coupon Confirm
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCode_text_firstCoupon_activityRange}    全场

coupon_code144
    [Documentation]    验证新建优惠码界面，适用范围，选择全部商品时，可保存成功
    [Tags]    P0    threshold
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Wait And Click Element    ${locatorB_couponCodeNew_span_chooseProduct}
    Wait And Click Element    ${locatorB_couponCodeNew_span_button_chooseProductSure}
    Sleep    2
    Wait And Click Coupon Confirm
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_text_firstCoupon_activityRange}    部分商品 (1件)

coupon_code153
    [Documentation]    验证新建优惠码界面，选择商品窗口，选择商品后，添加按钮可点击
    [Tags]    P0    threshold    smoke
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Wait And Click Element    ${locatorB_couponCodeNew_span_chooseProduct}
    Wait And Click Element    ${locatorB_couponCodeNew_span_button_chooseProductSure}
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_hadAdded}    已选择1件商品
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}

coupon_code154
    [Documentation]    验证新建优惠码界面，选择商品窗口，商品过多时，点击加载更多可显示更多商品
    [Tags]    P0    threshold
    :FOR    ${ONE}    IN RANGE    21
    \    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Wait And Click Element    ${locatorB_couponCodeNew_text_button_defaultMore}

coupon_code155
    [Documentation]    验证新建优惠码界面，选择商品窗口，商品可展开
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Wait And Click Element    ${locatorB_couponCodeNew_text_icon_anticonDown}
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_text_icon_anticonUp}

coupon_code164
    [Documentation]    验证活动编辑界面，修改任何内容可触发保存和取消按钮（活动未开始）
    [Tags]    P0    threshold    smoke
    Select All Coupon Code Tag
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait Until Page Contains Locator    ${locatorB_button_save00}
    Wait Until Page Contains Locator    ${locatorB_button_canecl00}

coupon_code164.1
    [Documentation]    验证活动编辑界面，修改任何内容可触发保存和取消按钮（活动进行中）
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
    Sleep    2
    ${activityName}    Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    activity_auto
    Wait And Click Element Then Confirm     ${locatorB_button_canecl00}
    Wait Until Page Not Contains Locator    ${locatorB_button_canecl00}
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCode_text_firstCoupon_activityName}    ${activityName}

coupon_code169
    [Documentation]    验证新建优惠码，优惠码不可重复
    [Tags]    P0    threshold    smoke
    Select All Coupon Code Tag
    Sleep    2
    ${couponCode}    Get Text    ${locatorB_couponCode_text_firstCoupon_couponCode}
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    ${couponCode}
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    优惠码重复


