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
    Go To Coupon Page

Select All Coupon Code Tag
    Sleep And Click Element    ${locatorB_couponCode_button_all}
    Sleep    2

Select Before Coupon Code Tag
    Sleep And Click Element    ${locatorB_couponCode_button_before}
    Sleep    2

Select Doing Coupon Code Tag
    Sleep And Click Element    ${locatorB_couponCode_button_doing}
    Sleep    2

Select Finish Coupon Code Tag
    Sleep And Click Element    ${locatorB_couponCode_button_finish}
    Sleep    2

Add Default Coupon Code Text
    [Documentation]    优惠码新建页面字段默认值输入
    [Arguments]    ${activityName}    ${num}    ${Mannum}    ${preferential}    ${discount}
    Sleep    2
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    ${activityName}
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
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    ${num}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_Mannum}    ${Mannum}
    ${status_one}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_text_input_cashpreferential}
    Run Keyword If    '${status_one}'=='False'    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discountpreferential}    ${preferential}
    Run Keyword If    '${status_one}'=='True'    Wait And Input Text    ${locatorB_couponCodeNew_text_input_cashpreferential}    ${preferential}
    ${status_two}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_text_input_cash}
    Run Keyword If    '${status_two}'=='False'    Wait And Input Text    ${locatorB_couponCodeNew_text_input_discount}    ${discount}
    Run Keyword If    '${status_two}'=='True'    Wait And Input Text    ${locatorB_couponCodeNew_text_input_cash}    ${discount}
    Wait And Click Element    ${locatorB_couponCodeNew_button_allProducts}

Wait And Click Coupon Confirm
    [Documentation]    等待2秒后，点击保存按钮
    Sleep    2
    Sleep And Click Element    ${locatorB_button_save00}
    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
    Sleep    2

CouponCode001
    [Documentation]    验证优惠码页面可进入
    [Tags]    P0
    Wait Until Page Contains Text    优惠码
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_button_addActivity}

CouponCode003
    [Documentation]    验证优惠码界面新建活动可点击
    [Tags]    P0
    Sleep And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Wait Until Page Contains Text    返回优惠码列表

CouponCode004
    [Documentation]    验证新建优惠码页面，左上角返回按钮可点击
    [Tags]    P0
#    Sleep And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Sleep And Click Element    ${locatorB_couponCodeNew_icon_backcouponlist}
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_button_addActivity}

CouponCode005
    [Documentation]    验证优惠码列表全部栏，会展示所有状态的优惠码活动
    [Tags]    P0
    Sleep And Click Element     ${locatorB_couponCode_button_before}
    Select All Coupon Code Tag
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCode_button_all}    class    ant-tabs-tab-active ant-tabs-tab
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[0]    已结束
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[1]    进行中
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[2]    未开始

CouponCode006
    [Documentation]    验证优惠码列表未开始栏，只展示未开始的优惠码活动
    [Tags]    P0
    kwcoupon.add_before_coupon_code_py
    Reload Page And Start Ajax
    Sleep And Click Element     ${locatorB_couponCode_button_before}
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCode_button_before}   class    ant-tabs-tab-active ant-tabs-tab
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[0]    未开始
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[1]    未开始

CouponCode007
    [Documentation]    验证优惠码列表进行中栏，只展示进行中的优惠码活动
    [Tags]    P0
    kwcoupon.add_doing_coupon_code_py
    Reload Page And Start Ajax
    Sleep And Click Element     ${locatorB_couponCode_button_doing}
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCode_button_doing}    class    ant-tabs-tab-active ant-tabs-tab
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[0]    进行中
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[1]    进行中

CouponCode008
    [Documentation]    验证优惠码界面tab未开始栏正常  >  1.点击已结束
    [Tags]    P0
    kwcoupon.add_finish_coupon_code_py
    Reload Page And Start Ajax
    Sleep And Click Element     ${locatorB_couponCode_button_finish}
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCode_button_finish}   class    ant-tabs-tab-active ant-tabs-tab
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[0]    已结束
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[1]    已结束

CouponCode009
    [Documentation]    验证优惠码列表，可按照活动名称搜索活动
    [Tags]    P0
    Sleep    5
    Wait And Input Text    ${locatorB_couponCode_input_enterCouponCode}    优惠码2
    Wait And Click Element    ${locatorB_couponCode_button_searchCouponCode}
    Wait Until Page Contains Locator    ${locatorB_couponCode_text_firstCoupon_activityName}[0]
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_text_firstCoupon_activityName}[0]    优惠码2
    Wait And Clear Element Text    ${locatorB_couponCode_input_enterCouponCode}
    Wait And Click Element    ${locatorB_couponCode_button_searchCouponCode}

CouponCode011
    [Documentation]    验证优惠码列表，可按照优惠码搜索活动
    [Tags]    P0
    Sleep    5
    ${getCode001}=    Wait And Get Text   ${locatorB_couponCode_text_firstCoupon_couponCode}[0]
    ${getCode002}=    Wait And Get Text   ${locatorB_couponCode_text_firstCoupon_couponCode}[1]
    ${getCode003}=    Wait And Get Text   ${locatorB_couponCode_text_firstCoupon_couponCode}[2]
    Wait And Input Text    ${locatorB_couponCode_input_enterCouponCode}    ${getCode002}
    Wait And Click Element    ${locatorB_couponCode_button_searchCouponCode}
    Wait Until Page Contains Locator    ${locatorB_couponCode_text_firstCoupon_couponCode}[0]
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_text_firstCoupon_couponCode}[0]    ${getCode002}
    Wait Until Page Not Contains Locator    ${locatorB_couponCode_text_firstCoupon_couponCode}[1]
    Wait And Clear Element Text    ${locatorB_couponCode_input_enterCouponCode}
    Wait And Click Element    ${locatorB_couponCode_button_searchCouponCode}

CouponCode013
    [Documentation]    验证优惠码列表，可按照优惠码类型筛选类型为折扣券的活动
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCode_menu_selectStyle}
    Wait And Click Element    ${locatorB_couponCode_menu_discountStyle}
    Wait Until Page Contains Text    优惠码2
    Wait Until Page Contains Text    优惠码2

CouponCode014
    [Documentation]    验证优惠码列表，可按照优惠码类型筛选类型为代金券券的活动
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCode_menu_selectStyle}
    Wait And Click Element    ${locatorB_couponCode_menu_cashStyle}
    Wait Until Page Contains Text    优惠码1

CouponCode015
    [Documentation]    验证优惠码列表，优惠类型选择框选择所有类型时，优惠码列表将同时显示类型为折扣券和代金券的活动
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCode_menu_selectStyle}
    Wait And Click Element    ${locatorB_couponCode_menu_allStyle}
    Wait Until Page Contains Text    优惠码1
    Wait Until Page Contains Text    优惠码2
    Wait Until Page Contains Text    优惠码3

CouponCode025
    [Documentation]    验证优惠码列表，底部点击页数可切换页数
    [Tags]    P0
    Element Attribute Should Contain With Wait     dom:document.querySelectorAll('[class="pagination_dbee"] li[title="1"]')    class    ant-pagination-item-active
    Sleep And Click Element    dom:document.querySelectorAll('[class="pagination_dbee"] li[title="2"]')
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_items_listProduct}
    Element Attribute Should Contain With Wait     dom:document.querySelectorAll('[class="pagination_dbee"] li[title="2"]')    class    ant-pagination-item-active
    Sleep And Click Element    dom:document.querySelectorAll('[class="pagination_dbee"] li[title="1"]')

CouponCode026
    [Documentation]    验证优惠码列表，底部下一页按钮可点击
    [Tags]    P0
    Element Attribute Should Contain With Wait     dom:document.querySelectorAll('[class="pagination_dbee"] li[title="1"]')    class    ant-pagination-item-active
    Sleep And Click Element    dom:document.querySelectorAll('[class="pagination_dbee"] [class="anticon anticon-right"]')[0]
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_items_listProduct}
    Element Attribute Should Contain With Wait     dom:document.querySelectorAll('[class="pagination_dbee"] li[title="2"]')    class    ant-pagination-item-active
    Sleep And Click Element    dom:document.querySelectorAll('[class="pagination_dbee"] li[title="1"]')

CouponCode027
    [Documentation]    验证优惠码列表，底部上一页按钮可点击
    [Tags]    P0
    Sleep And Click Element    dom:document.querySelectorAll('[class="pagination_dbee"] li[title="3"]')
    Element Attribute Should Contain With Wait     dom:document.querySelectorAll('[class="pagination_dbee"] li[title="3"]')    class    ant-pagination-item-active
    Sleep And Click Element    dom:document.querySelectorAll('[class="pagination_dbee"] [class="anticon anticon-left"]')[0]
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_items_listProduct}
    Element Attribute Should Contain With Wait     dom:document.querySelectorAll('[class="pagination_dbee"] li[title="2"]')    class    ant-pagination-item-active

CouponCode034
    [Documentation]    验证新建优惠码页面，输入信息后，点击返回按钮会出现未保存提示
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    coupon
    Wait And Click Element    ${locatorB_couponCodeNew_icon_backcouponlist}
    Sleep    2
    Wait Alert Should Be Present And Dismiss    页面上有未保存内容，是否确定退出?

CouponCode035
    [Documentation]    验证新建优惠码页面，输入信息后，切换菜单栏模块，会出现未保存提示
    [Tags]    P0
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    coupon123
    Wait And Click Element    ${locatorB_overview}
    Sleep    2
    Wait Alert Should Be Present And Dismiss    页面上有未保存内容，是否确定退出?

CouponCode037
    [Documentation]    验证出现未保存提示弹窗时，点击确认按钮，会离开新建活动页面，并且不保存已输入的内容
    [Tags]    P0
    Wait And Input Text    ${locatorB_couponCodeNew_input_activityName}    coupon45645
    Wait And Click Element    ${locatorB_couponCodeNew_icon_backcouponlist}
    Sleep    2
    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_button_addActivity}

CouponCode038
    [Documentation]    验证新建优惠码页面，所有信息输入合法内容后，点击下一步可进入第二页
    [Tags]    P0
    Add Default Coupon Code Text    coupon    100    5    2    50
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_notEndTime}
    Wait And Click Element    ${locatorB_couponCodeNew_input_noLimit}
    Wait And Click Element    ${locatorB_couponCodeNew_input_limited}
    Wait And Click Element    ${locatorB_couponCodeNew_text_input_notThreshold}
    Wait And Click Element    ${locatorB_couponCodeNew_button_nextStep}
    Wait Until Page Contains Text    Banner设置
    Wait Until Page Contains Text    倒计时及提醒文案
    Wait And Click Element    ${locatorB_couponCodeNew_button_prevStep}

CouponCode039
    [Documentation]    验证新建优惠码页面，所有信息输入合法内容后，点击下一步可进入第二页
    [Tags]    P0
    Add Default Coupon Code Text    优惠码    20    10    10    10
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    AAA001
    Wait And Click Element    ${locatorB_couponCodeNew_button_nextStep}
    Wait Until Page Contains Text    Banner设置
    Wait Until Page Contains Text    倒计时及提醒文案
    Wait And Click Element    ${locatorB_couponCodeNew_button_prevStep}

CouponCode040
    [Documentation]    验证新建优惠码页面，所有信息输入合法内容后，点击下一步可进入第二页
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Add Default Coupon Code Text    coupon    100    5    2    50
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_notEndTime}
    Wait And Click Element    ${locatorB_couponCodeNew_input_noLimit}
    Wait And Click Element    ${locatorB_couponCodeNew_input_limited}
    Wait And Click Element    ${locatorB_couponCodeNew_text_input_notThreshold}
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_span_chooseProduct}[0]
    Wait And Click Element    ${locatorB_couponCodeNew_span_button_chooseProductSure}[2]
    Wait And Click Element    ${locatorB_couponCodeNew_button_nextStep}
    Wait Until Page Contains Text    Banner设置
    Wait Until Page Contains Text    倒计时及提醒文案
    Wait And Click Element    ${locatorB_couponCodeNew_button_prevStep}

CouponCode041
    [Documentation]    验证新建优惠码页面，所有信息输入合法内容后，点击下一步可进入第二页
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    AAA001
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_span_chooseProduct}[0]
    Wait And Click Element    ${locatorB_couponCodeNew_span_chooseProduct}[1]
    Wait And Click Element    ${locatorB_couponCodeNew_span_button_chooseProductSure}[2]
    Wait And Click Element    ${locatorB_couponCodeNew_button_nextStep}
    Wait Until Page Contains Text    Banner设置
    Wait Until Page Contains Text    倒计时及提醒文案
    Wait And Click Element    ${locatorB_couponCodeNew_button_prevStep}

CouponCode042
    [Documentation]    验证新建优惠码页面，所有信息输入合法内容后，点击下一步可进入第二页
    [Tags]    P0
    Add Default Coupon Code Text    coupon    100    5    2    50
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_notEndTime}
    Wait And Click Element    ${locatorB_couponCodeNew_input_noLimit}
    Wait And Click Element    ${locatorB_couponCodeNew_input_limited}
    Wait And Click Element    ${locatorB_couponCodeNew_text_input_notThreshold}
    Wait And Click Element    dom:document.querySelectorAll('[class*="ant-steps-item-icon"]')[1]
    Wait Until Page Contains Text    Banner设置
    Wait Until Page Contains Text    倒计时及提醒文案
    Wait And Click Element    ${locatorB_couponCodeNew_button_prevStep}

CouponCode043
    [Documentation]    验证新建优惠码页面，所有信息输入合法内容后，点击下一步可进入第二页
    [Tags]    P0
    Add Default Coupon Code Text    优惠码    20    10    10    10
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    AAA001
    Wait And Click Element    dom:document.querySelectorAll('[class*="ant-steps-item-icon"]')[1]
    Wait Until Page Contains Text    Banner设置
    Wait Until Page Contains Text    倒计时及提醒文案
    Wait And Click Element    ${locatorB_couponCodeNew_button_prevStep}

CouponCode044
    [Documentation]    验证新建优惠码页面，所有信息输入合法内容后，点击下一步可进入第二页
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Add Default Coupon Code Text    coupon    100    5    2    50
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_notEndTime}
    Wait And Click Element    ${locatorB_couponCodeNew_input_noLimit}
    Wait And Click Element    ${locatorB_couponCodeNew_input_limited}
    Wait And Click Element    ${locatorB_couponCodeNew_text_input_notThreshold}
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_span_chooseProduct}[0]
    Wait And Click Element    ${locatorB_couponCodeNew_span_button_chooseProductSure}[2]
    Wait And Click Element    dom:document.querySelectorAll('[class*="ant-steps-item-icon"]')[1]
    Wait Until Page Contains Text    Banner设置
    Wait Until Page Contains Text    倒计时及提醒文案
    Wait And Click Element    ${locatorB_couponCodeNew_button_prevStep}

CouponCode045
    [Documentation]    验证新建优惠码页面，所有信息输入合法内容后，点击下一步可进入第二页
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    AAA001
    Wait And Click Element    ${locatorB_couponCodeNew_button_chooseSomeProducts}
    Wait And Click Element    ${locatorB_couponCodeNew_icon_continueToAdd}
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_span_chooseProduct}[0]
    Wait And Click Element    ${locatorB_couponCodeNew_span_chooseProduct}[1]
    Wait And Click Element    ${locatorB_couponCodeNew_span_button_chooseProductSure}[2]
    Wait And Click Element    dom:document.querySelectorAll('[class*="ant-steps-item-icon"]')[1]
    Wait Until Page Contains Text    Banner设置
    Wait Until Page Contains Text    倒计时及提醒文案
    Wait And Click Element    ${locatorB_couponCodeNew_button_prevStep}

CouponCode081
    [Documentation]    验证新建优惠码页面，使用规则栏，时区显示正常
    [Tags]    P0
    Go To Store Page
    ${title}=    Wait And Get Element Attribute    dom:document.querySelectorAll('[id="time_zone"] [class="ant-select-selection-selected-value"]')[0]    title
    Run Keyword If    '${title}'!='(GMT + 08:00) 北京，香港，台北，新加坡'    Wait And Select From List By Label    dom:document.querySelectorAll('[id="time_zone"]')[0]    (GMT + 08:00) 北京，香港，台北，新加坡
    Go To Coupon Page
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Wait Until Page Contains Text    (GMT + 08:00) 北京，香港，台北，新加坡

CouponCode082
    [Documentation]    验证新建优惠码页面，使用规则栏，设置时区按钮可点击
    [Tags]    P0
    Sleep    2
    Wait And Click Element    dom:document.querySelectorAll('[href="/store"]')[0]
    Wait Until Page Contains Text    店铺信息
    Wait Until Page Contains Text    常规设置
    Wait Until Page Contains Text    联系地址
    Go To Coupon Page

CouponCode083
    [Documentation]    验证优惠码列表，活动时间栏，时区显示正常
    [Tags]    P0
    Sleep    2
    Wait And Mouse Over    dom:document.querySelectorAll('[class*="djfont dj-more icon_custom"]')[0]
    Wait Until Page Contains Text    (GMT + 08:00) 北京，香港，台北，新加坡

CouponCode084
    [Documentation]    验证新建优惠码页面，优惠码输入框已输入内容后，点击随机生成按钮，会清空输入框并且随机生成一个优惠码
    [Tags]    P0
    Sleep    2
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_promoCode}    AAA001
    Wait And Click Element    ${locatorB_couponCodeNew_text_p_promoCrandom}
    ${code}=    Wait And Get Text    ${locatorB_couponCodeNew_text_input_promoCode}
    Should Be True    $code!=AAA001

CouponCode085
    [Documentation]    验证新建优惠码页面，数量勾选不限时，在数量输入框中输入内容，会取消勾选不限
    [Tags]    P0
    Wait And Click Element    ${locatorB_couponCodeNew_input_noLimit}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    10
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCodeNew_input_noLimit}    class    ant-checkbox

CouponCode086
    [Documentation]    验证新建优惠码页面，数量输入框中输入内容后勾选不限会清空输入框中的内容
    [Tags]    P0
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_num}    20
    Wait And Click Element    ${locatorB_couponCodeNew_input_noLimit}
    Value Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_num}    ${Empty}

CouponCode088
    [Documentation]    验证新建优惠码页面，每人限用勾选不限时，在每人限用输入框中输入内容，会取消勾选不限
    [Tags]    P0
    Wait And Click Element    ${locatorB_couponCodeNew_input_limited}
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_Mannum}    10
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCodeNew_input_limited}    class    ant-checkbox

CouponCode089
    [Documentation]    验证新建优惠码页面，每人限用输入框中输入内容后勾选不限会清空输入框中的内容
    [Tags]    P0
    Wait And Input Text    ${locatorB_couponCodeNew_text_input_Mannum}    20
    Wait And Click Element    ${locatorB_couponCodeNew_input_limited}
    Value Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_Mannum}    ${Empty}

CouponCode091
    [Documentation]    验证新建优惠码页面，结束时间勾选不限时，选择结束时间，会取消勾选不限
    [Tags]    P0
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_notEndTime}
    ${startTime}    Get Time
    ${EndTime}    Add Time To Date    ${startTime}    20days
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_end}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_endInput}    ${EndTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCodeNew_selectTime_notEndTime}    class    ant-checkbox

CouponCode092
    [Documentation]    验证新建优惠码页面，选择结束时间后勾选不限会清空已选择的结束时间
    [Tags]    P0
    Sleep    2
    ${startTime}    Get Time
    ${EndTime}    Add Time To Date    ${startTime}    20days
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_end}
    Wait And Input Text    ${locatorB_couponCodeNew_selectTime_endInput}    ${EndTime}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_confirm}
    Wait And Click Element    ${locatorB_couponCodeNew_selectTime_notEndTime}
    Value Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_selectTime_endInput}    ${Empty}

CouponCode094
    [Documentation]    验证新建优惠码页面，优惠类型为折扣券时，优惠规则栏，优惠门槛输入框中输入内容，勾选无门槛，会清空输入框中的内容
    [Tags]    P0
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Wait And Click Element    ${locatorB_couponCodeNew_text_input_notThreshold}
    Value Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_discountpreferential}    ${Empty}
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_notThreshold}    class    ant-checkbox ant-checkbox-checked

CouponCode095
    [Documentation]    验证新建优惠码页面，优惠类型为折扣券时，优惠规则栏勾选无门槛，在优惠门槛输入框中输入内容，会取消勾选无门槛
    [Tags]    P0
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Value Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_discountpreferential}    10
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_notThreshold}    class    ant-checkbox

CouponCode096
    [Documentation]    验证新建优惠码页面，优惠类型为代金券时，优惠规则栏，优惠门槛输入框中输入内容，勾选无门槛，会清空输入框中的内容
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Wait And Click Element    ${locatorB_couponCodeNew_text_input_notThreshold}
    Value Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_discountpreferential}    ${Empty}
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_notThreshold}    class    ant-checkbox ant-checkbox-checked

CouponCode097
    [Documentation]    验证新建优惠码页面，优惠类型为代金券时，优惠规则栏，优惠门槛输入框中输入内容，勾选无门槛，会清空输入框中的内容
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_select_couponStyle}
    Wait And Click Element    ${locatorB_couponCodeNew_selectItem_cashCoupon}
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Value Of Element Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_discountpreferential}    10
    Element Attribute Should Be Equal With Wait    ${locatorB_couponCodeNew_text_input_notThreshold}    class    ant-checkbox

CouponCode123
    [Documentation]    验证新建优惠码活动第一页，可取消新建活动
    [Tags]    P0
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Wait And Click Element Then Confirm    ${locatorB_button_canecl00}
    Wait Until Page Contains Locator    ${locatorB_couponCodeNew_button_addActivity}

CouponCode124
    [Documentation]    验证新建优惠码活动第一页，点击取消按钮，点击二次确认弹窗中的取消按钮，不会取消本次编辑
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Wait And Click Element Then Cancel    ${locatorB_button_canecl00}
    Wait Until Page Contains Text    基本信息
    Wait Until Page Contains Text    使用规则
    Wait Until Page Contains Text    优惠规则
    Wait Until Page Contains Text    适用范围

CouponCode125
    [Documentation]    验证新建优惠码第一页，点击取消按钮，点击二次确认弹窗中的关闭按钮，不会取消本次编辑
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_button_canecl00}
    Wait And Click Element    dom:document.querySelectorAll('[aria-label="Close"]')[0]
    Wait Until Page Contains Text    基本信息
    Wait Until Page Contains Text    使用规则
    Wait Until Page Contains Text    优惠规则
    Wait Until Page Contains Text    适用范围

CouponCode126
    [Documentation]    验证新建优惠码第二页，点击上一步按钮可返回第一页
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_button_nextStep}
    Wait And Click Element    ${locatorB_couponCodeNew_button_prevStep}
    Wait Until Page Contains Text    基本信息
    Wait Until Page Contains Text    使用规则
    Wait Until Page Contains Text    优惠规则
    Wait Until Page Contains Text    适用范围

CouponCode127
    [Documentation]    验证新建优惠码第二页，点击创建活动可返回第一页
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_button_nextStep}
    Wait And Click Element    dom:document.querySelectorAll('[class*="ant-steps-item-icon"]')[0]
    Wait Until Page Contains Text    基本信息
    Wait Until Page Contains Text    使用规则
    Wait Until Page Contains Text    优惠规则
    Wait Until Page Contains Text    适用范围

CouponCode128
    [Documentation]    验证新建优惠码第二页，banner设置可上传小于10M的图片
    [Tags]    P0
    Sleep    2
    Wait Enabled And Choose File    dom:document.querySelectorAll('input[type="file"]')[0]    ${file_products_addImg}
    Wait Until Page Contains Locator    dom:document.querySelectorAll('input[type="file"] + div img[class*="img"]')[0]

CouponCode129
    [Documentation]    验证新建优惠码第二页，banner设置可上传小于10M的图片
    [Tags]    P0
    Sleep    2
    Wait And Mouse Over    dom:document.querySelectorAll('input[type="file"] + div img[class*="img"]')[0]
    Wait And Click Element    dom:document.querySelectorAll('[class*="djfont dj-preview"]')[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll('[class="ant-modal-body"] img')[0]
    Wait And Click Element    dom:document.querySelectorAll('[aria-label="Close"]')[1]

CouponCode130
    [Documentation]    验证新建优惠码第二页，上传图片后可删除图片
    [Tags]    P0
    Sleep    2
    Wait And Mouse Over    dom:document.querySelectorAll('input[type="file"] + div img[class*="img"]')[0]
    Wait And Click Element    dom:document.querySelectorAll('[class*="djfont delete"]')[0]
    Wait Until Page Not Contains Locator    dom:document.querySelectorAll('input[type="file"] + div img[class*="img"]')[0]

CouponCode141
    [Documentation]    验证优惠码列表，活动未开始时，活动状态显示为：未开始，并且操作按钮显示预览和删除按钮
    [Tags]    P0
    &{conf}=    Create Dictionary    title=coupon_before
    kwcoupon.add_before_coupon_code_py    ${conf}
    Reload Page And Start Ajax
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[0]    未开始
    Wait Until Page Contains Locator    ${locatorB_couponCode_icon_firstCoupon_activityPreview}
    Wait Until Page Contains Locator    ${locatorB_couponCode_icon_firstCoupon_activityDelete}

CouponCode142
    [Documentation]    验证优惠码列表，活动未开始时，预览按钮可点击
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCode_icon_firstCoupon_activityPreview}
    Focus On New Window
    Wait Until Page Contains Text    FOLLOW US
    Wait Until Page Contains Text    SUPPORT
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Sleep    2
    Select Window    title=${title1}

CouponCode143
    [Documentation]    验证优惠码列表，未开始活动，点击删除按钮后，点击二次确认弹窗中的取消按钮，不会删除活动
    [Tags]    P0
    Sleep    2
    Wait And Click Element Then Cancel    ${locatorB_couponCode_icon_firstCoupon_activityDelete}
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCode_text_firstCoupon_activityName}    coupon_before

CouponCode144
    [Documentation]    验证优惠码列表，可删除未开始的活动
    [Tags]    P0
    Sleep    2
    Wait And Click Element Then Confirm    ${locatorB_couponCode_icon_firstCoupon_activityDelete}
    ${codeName}=    Wait And Get Text    ${locatorB_couponCode_text_firstCoupon_activityName}
    Should Be True    '${codeName}'!='coupon_before'

CouponCode145
    [Documentation]    验证未开始的优惠码活动，可修改所有内容
    [Tags]    P0
    kwcoupon.add_before_coupon_code_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_couponCode_text_firstCoupon_activityName}
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Wait And Click Element    ${locatorB_couponCodeNew_button_nextStep}
    Sleep And Click Element    ${locatorB_button_save00}
    Text Of Element Should Be Equal With Wait    ${locatorB_couponCode_text_firstCoupon_activityName}    优惠码

CouponCode146
    [Documentation]    验证优惠码列表，活动已开始时，活动状态显示为进行中，并且操作按钮显示预览和提前结束按钮
    [Tags]    P0
    &{conf}=    Create Dictionary    title=coupon_doing
    kwcoupon.add_doing_coupon_code_py
    Reload Page And Start Ajax
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[0]    进行中
    Wait Until Page Contains Locator    ${locatorB_couponCode_icon_firstCoupon_activityPreview}
    Wait Until Page Contains Locator    ${locatorB_couponCode_icon_firstCoupon_activityStop}

CouponCode147
    [Documentation]    验证优惠码列表，进行中活动栏，预览按钮可点击
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCode_icon_firstCoupon_activityPreview}
    Focus On New Window
    Wait Until Page Contains Text    FOLLOW US
    Wait Until Page Contains Text    SUPPORT
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Sleep    2
    Select Window    title=${title1}

CouponCode148
    [Documentation]    验证优惠码列表，进行中活动，点击提前结束按钮后，点击二次确认弹窗中的取消按钮，不会结束活动
    [Tags]    P0
    Sleep    2
    Wait And Click Element Then Cancel    ${locatorB_couponCode_icon_firstCoupon_activityStop}
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[0]    进行中

CouponCode149
    [Documentation]    验证优惠码列表，可提前结束进行中的活动
    [Tags]    P0
    Sleep    2
    Wait And Click Element Then Confirm    ${locatorB_couponCode_icon_firstCoupon_activityStop}
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[0]    已结束

CouponCode154
    [Documentation]    验证优惠码列表，活动已结束时，活动状态显示为：已结束，并且操作栏只显示预览按钮
    [Tags]    P0
    &{conf}=    Create Dictionary    title=coupon_doing_002
    kwcoupon.add_doing_coupon_code_py
    Reload Page And Start Ajax
    Wait And Click Element Then Cancel    ${locatorB_couponCode_icon_firstCoupon_activityStop}
    Text Of Element Should Contain With Wait    ${locatorB_couponCode_tag_firstCoupon_activityStatus}[0]    已结束
    Wait Until Page Contains Locator    ${locatorB_couponCode_icon_firstCoupon_activityPreview}
    Wait Until Page Not Contains Locator    ${locatorB_couponCode_icon_firstCoupon_activityStop}

CouponCode155
    [Documentation]    验证优惠码列表，已结束活动栏，预览按钮可点击
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_couponCode_icon_firstCoupon_activityPreview}
    Focus On New Window
    Wait Until Page Contains Text    FOLLOW US
    Wait Until Page Contains Text    SUPPORT