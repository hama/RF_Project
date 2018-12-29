*** Settings ***
Resource          kw_common.robot

*** Keywords ***
Floating Page Suite Setup
    [Documentation]    浮窗通知 - 套件 - 初始化操作
    Login With Default User
    Add Product Order

Floating Page Suite Teardown
    [Documentation]    浮窗通知 - 套件 - 清除操作
    Close Test Suite Browser

Floating Page Test Setup
    [Documentation]    浮窗通知 - 测试用例 - 初始化操作
    Go To Floating Page
    Floating Settings Page Then Open    ant-switch ant-switch-checked
    Sleep And Click Element    ${locatorB_floatingSettings_icon_floatinglistBack}
    Sleep    2

Floating Page Test Teardown
    [Documentation]    浮窗通知 - 测试用例 - 清除操作
    Teardown Test Case

Add Product Order
    [Documentation]    添加三个订单
    :FOR    ${ONE}    IN RANGE    3
    \    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Sleep    2

Reload More Page
    [Documentation]    多次刷新页面
    :FOR    ${ONE}    IN RANGE    5
    \    Reload Page And Start Ajax
    Sleep    2

Close Floating Inform
    Sleep    2
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Close Window
    Select Window    title=${title1}
    Go To Floating Page
    Sleep And Click Element    ${locatorB_floatingMgmt_button_floatingSettings}
    Sleep    2
    ${class}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_button_OpenInform}    class
    Sleep    1
    Run Keyword If    '${class}'=='ant-switch ant-switch-checked'    Run Keywords    Sleep And Click Element    ${locatorB_floatingSettings_button_OpenInform}    AND    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep And Click Element    ${locatorB_floatingSettings_icon_floatinglistBack}

Focus Current Window
    [Documentation]   聚焦当前窗口
    Sleep    2
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Close Window
    Select Window    title=${title1}
    Sleep    2

Floating Settings Page Then Open
    [Documentation]    浮窗设置页面，并且开启浮窗通知 按钮
    [Arguments]    ${statusOpen}
    Sleep And Click Element    ${locatorB_floatingMgmt_button_floatingSettings}
    Sleep    2
    ${class}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_button_OpenInform}    class
    Sleep    1
    Run Keyword If    '${class}'=='${statusOpen}'    Run Keywords    Sleep And Click Element    ${locatorB_floatingSettings_button_OpenInform}    AND    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2

Appear Floating Then Exit Circle
    [Documentation]    满足条件则退出循环
    [Arguments]    ${statusJudge}    ${sleep_time}=2    ${circleNum}=9999
    :FOR    ${ONE}    IN RANGE    ${circleNum}
    \    Reload Page And Start Ajax
    \    Sleep    ${sleep_time}
    \    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_floating_upPop_floatingPop}
    \    Run Keyword If    '${status}'=='${statusJudge}'    Exit For Loop
    Sleep    2

Change Backgroud Color
    [Documentation]    更换背景颜色
    [Arguments]    ${locator}    ${numOne}    ${numTwo}    ${numThere}    ${numFour}
    Sleep    2
    Execute Javascript     document.querySelectorAll('[class*="colorPicker"]')[0].scrollIntoView()
    Sleep And Click Element    ${locator}
    Wait And Input Text    ${locatorB_floatingSettings_input_colorR}    ${numOne}
    Wait And Input Text    ${locatorB_floatingSettings_input_colorG}    ${numTwo}
    Wait And Input Text    ${locatorB_floatingSettings_input_colorB}    ${numThere}
    Wait And Input Text    ${locatorB_floatingSettings_input_colorA}    ${numFour}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2

B_reset001
    [Documentation]    开启浮窗-方式一
    Sleep And Click Element    ${locatorB_floatingMgmt_button_floatingSettings}
    Sleep    2
    ${class}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_button_OpenInform}    class
    Sleep    1
    Run Keyword If    '${class}'=='ant-switch'    Run Keywords    Sleep And Click Element    ${locatorB_floatingSettings_button_OpenInform}    AND    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep And Click Element    ${locatorB_floatingSettings_icon_floatinglistBack}
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Appear Floating Then Exit Circle    ${True}
    Close Floating Inform

B_reset002
    [Documentation]    开启浮窗-方式二
    Sleep And Click Element    ${locatorB_floatingMgmt_button_floatingOpen}
    Sleep    2
    ${class}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_button_OpenInform}    class
    Sleep    1
    Run Keyword If    '${class}'=='ant-switch'    Run Keywords    Sleep And Click Element    ${locatorB_floatingSettings_button_OpenInform}    AND    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep And Click Element    ${locatorB_floatingSettings_icon_floatinglistBack}
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Appear Floating Then Exit Circle    ${True}
    Close Floating Inform

B_reset003
    [Documentation]    关闭浮窗
    Sleep And Click Element    ${locatorB_floatingMgmt_button_floatingSettings}
    Sleep    2
    ${class}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_button_OpenInform}    class
    Sleep    1
    Run Keyword If    '${class}'=='ant-switch ant-switch-checked'    Run Keywords    Sleep And Click Element    ${locatorB_floatingSettings_button_OpenInform}    AND    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep And Click Element    ${locatorB_floatingSettings_icon_floatinglistBack}
    Wait Until Page Contains Locator    ${locatorB_floatingMgmt_button_floatingOpen}
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Appear Floating Then Exit Circle    ${False}
    Close Floating Inform

B_reset009
    [Documentation]    标题格式校验-不填值
    Sleep And Click Element    ${locatorB_floatingMgmt_button_floatingSettings}
    Sleep    2
    Wait And Clear Element Text    ${locatorB_floatingSettings_input_styleTitle}
    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Value Of Element Should Be Equal With Wait    ${locatorB_floatingSettings_input_styleTitle}    {Buyer's Name} in {City, Country} purchased

B_reset013
    [Documentation]    购买时间替代文案关闭
    Sleep    2
    Execute Javascript     document.querySelectorAll('[id="template_config.replace_switch"]')[0].scrollIntoView()
    ${class}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_button_textReplace}    class
    Sleep    1
    Run Keyword If    '${class}'=='ant-switch ant-switch-checked'    Sleep And Click Element    ${locatorB_floatingSettings_button_textReplace}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Reload More Page
    Wait Until Page Not Contains Text    Recently
    Focus Current Window
    Go To Floating Page

B_reset018
    [Documentation]    验证开启顾客匿名/地名隐藏功能时，替代文本是否生效
    Sleep And Click Element    ${locatorB_floatingMgmt_button_floatingSettings}
    Sleep    2
    Execute Javascript     document.querySelectorAll('[id="template_config.anonymity_switch"]')[0].scrollIntoView()
    ${class}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_button_customerHide}    class
    Sleep    1
    Run Keyword If    '${class}'=='ant-switch'    Sleep And Click Element    ${locatorB_floatingSettings_button_customerHide}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep And Click Element    ${locatorB_floatingSettings_icon_floatinglistBack}
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Reload More Page
    Wait Until Page Contains Text    Someone
    Wait Until Page Contains Text    Somewhere
    Close Floating Inform

B_reset020
    [Documentation]    设置背景颜色
    Change Backgroud Color    ${locatorB_floatingSettings_span_backgroundColor}    208    2    27    100
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Double Click Element    ${locatorB_headerTop_link_storeHome}
    ${statusHome}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_headerTop_link_storeHome}
    Run Keyword If    '${statusHome}'=='${True}'    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Reload More Page
    ${style}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingPop}    style
    Should Contain    ${style}    rgb(208, 2, 27)
    Focus Current Window

B_reset021
    [Documentation]    设置标题颜色
    Change Backgroud Color    ${locatorB_floatingSettings_span_titleColor}    74    144    226    100
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Double Click Element    ${locatorB_headerTop_link_storeHome}
    ${statusHome}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_headerTop_link_storeHome}
    Run Keyword If    '${statusHome}'=='${True}'    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Reload More Page
    ${style}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingTitle}    style
    Should Contain    ${style}    rgb(74, 144, 226)
    Focus Current Window

B_reset022
    [Documentation]    设置商品名称颜色
    Change Backgroud Color    ${locatorB_floatingSettings_span_productColor}    0    0    0    100
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Double Click Element    ${locatorB_headerTop_link_storeHome}
    ${statusHome}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_headerTop_link_storeHome}
    Run Keyword If    '${statusHome}'=='${True}'    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Reload More Page
    ${style}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingProductName}    style
    Should Contain    ${style}    rgb(0, 0, 0)
    Focus Current Window

B_reset023
    [Documentation]    设置时间颜色
    Change Backgroud Color    ${locatorB_floatingSettings_span_TimeColor}    144    19    254    100
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Double Click Element    ${locatorB_headerTop_link_storeHome}
    ${statusHome}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_headerTop_link_storeHome}
    Run Keyword If    '${statusHome}'=='${True}'    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Reload More Page
    ${style}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingTime}    style
    Should Contain    ${style}    rgb(144, 19, 254)
    Focus Current Window

B_reset024
    [Documentation]    重置文案和样式
    Sleep And Click Element    ${locatorB_floatingSettings_button_defaultSettings}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Reload More Page
    ${styleBackgroud}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingPop}    style
    Should Contain    ${styleBackgroud}    rgb(33, 33, 33)
    ${styleTitle}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingTitle}    style
    Should Contain    ${styleTitle}    rgba(255, 255, 255, 0.8)
    ${styleProduct}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingProductName}    style
    Should Contain    ${styleProduct}    rgba(255, 255, 255, 1)
    ${styleTime}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingTime}    style
    Should Contain    ${styleTime}    rgba(255, 255, 255, 0.8)

B_reset025
    [Documentation]    设置浮窗展示位置-左下
    Sleep    2
    Sleep And Click Element    ${locatorB_floatingSettings_select_reviewSettings}
    Sleep And Click Element    ${locatorB_floatingSettings_option_bottomLeft}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    :FOR    ${ONE}    IN RANGE    9999
    \    Reload Page And Start Ajax
    \    Sleep    2
    \    ${data-locate}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingPop}    data-locate
    \    Run Keyword If    '${data-locate}'=='left_down'    Exit For Loop
    Focus Current Window

B_reset026
    [Documentation]    设置浮窗展示位置-右下
    Sleep    2
    Sleep And Click Element    ${locatorB_floatingSettings_select_reviewSettings}
    Sleep And Click Element    ${locatorB_floatingSettings_option_bottomRight}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    :FOR    ${ONE}    IN RANGE    9999
    \    Reload Page And Start Ajax
    \    Sleep    2
    \    ${data-locate}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingPop}    data-locate
    \    Run Keyword If    '${data-locate}'=='right_down'    Exit For Loop
    Focus Current Window

B_reset027
    [Documentation]    设置浮窗展示位置-左上
    Sleep    2
    Sleep And Click Element    ${locatorB_floatingSettings_select_reviewSettings}
    Sleep And Click Element    ${locatorB_floatingSettings_option_upperLeft}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    :FOR    ${ONE}    IN RANGE    9999
    \    Reload Page And Start Ajax
    \    Sleep    2
    \    ${data-locate}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingPop}    data-locate
    \    Run Keyword If    '${data-locate}'=='left_up'    Exit For Loop
    Focus Current Window

B_reset028
    [Documentation]    设置浮窗展示位置-右上
    Sleep    2
    Sleep And Click Element    ${locatorB_floatingSettings_select_reviewSettings}
    Sleep And Click Element    ${locatorB_floatingSettings_option_upperRight}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    :FOR    ${ONE}    IN RANGE    9999
    \    Reload Page And Start Ajax
    \    Sleep    2
    \    ${data-locate}=    Wait And Get Element Attribute    ${locatorC_floating_upPop_floatingPop}    data-locate
    \    Run Keyword If    '${data-locate}'=='right_up'    Exit For Loop
    Focus Current Window

B_reset029
    [Documentation]    展示延时设置为0s
    Sleep    2
    Wait And Input Text    ${locatorB_floatingSettings_input_firstDelay}    0
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Appear Floating Then Exit Circle    ${True}    0
    Focus Current Window

B_reset030
    [Documentation]    展示延时设置为3s
    Sleep    2
    Wait And Input Text    ${locatorB_floatingSettings_input_firstDelay}    3
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Appear Floating Then Exit Circle    ${True}    3
    Focus Current Window

B_reset031
    [Documentation]    展示延时设置为10s
    Sleep    2
    Wait And Input Text    ${locatorB_floatingSettings_input_firstDelay}    10
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Appear Floating Then Exit Circle    ${True}    10
    Focus Current Window

B_reset032
    [Documentation]    展示延时设置为15s
    Sleep    2
    Wait And Input Text    ${locatorB_floatingSettings_input_firstDelay}    15
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Value Of Element Should Be Equal With Wait    ${locatorB_floatingSettings_input_firstDelay}    10

B_reset033
    [Documentation]    展示时间设置为2s
    Sleep    2
    Wait And Input Text    ${locatorB_floatingSettings_input_duration}    2
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Value Of Element Should Be Equal With Wait    ${locatorB_floatingSettings_input_duration}    3

B_reset034
    [Documentation]    展示时间不设置
    Sleep    2
    Wait And Clear Element Text    ${locatorB_floatingSettings_input_duration}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Value Of Element Should Be Equal With Wait    ${locatorB_floatingSettings_input_duration}    5

B_reset035
    [Documentation]    展示时间设置为10s
    Sleep    2
    Wait And Input Text    ${locatorB_floatingSettings_input_duration}    10
    Sleep    2
    ${classLimit}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingLimit}    class
    Run Keyword If    '${classLimit}'=='ant-checkbox'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingLimit}
    Wait And Input Text    ${locatorB_floatingSettings_input_floatingMaxTimes}    1
    ${classCircle}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingCircle}    class
    Run Keyword If    '${classCircle}'=='ant-checkbox ant-checkbox-checked'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingCircle}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Wait Until Page Contains Locator    ${locatorC_floating_upPop_floatingPop}
    Sleep    10
    Wait Until Page Not Contains Locator    ${locatorC_floating_upPop_floatingPop}
    Focus Current Window

B_reset036
    [Documentation]    展示时间设置为15s
    Wait And Input Text    ${locatorB_floatingSettings_input_duration}    15
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Value Of Element Should Be Equal With Wait    ${locatorB_floatingSettings_input_duration}    10

B_reset037
    [Documentation]    间隔时间设置为0s
    Wait And Input Text    ${locatorB_floatingSettings_input_interval}    0
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Value Of Element Should Be Equal With Wait    ${locatorB_floatingSettings_input_interval}    1

B_reset038
    [Documentation]    间隔时间设置为5s
    Sleep    2
    Wait And Input Text    ${locatorB_floatingSettings_input_interval}    5
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Wait Until Page Contains Locator    ${locatorC_floating_upPop_floatingPop}
    Sleep    5
    Wait Until Page Contains Locator    ${locatorC_floating_upPop_floatingPop}
    Focus Current Window

B_reset039
    [Documentation]    间隔时间设置为12s
    Wait And Input Text    ${locatorB_floatingSettings_input_interval}    12
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Double Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Value Of Element Should Be Equal With Wait    ${locatorB_floatingSettings_input_interval}    10

B_reset040
    [Documentation]    启用限制浮窗显示个数
    Sleep    2
    ${classLimit}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingLimit}    class
    Run Keyword If    '${classLimit}'=='ant-checkbox'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingLimit}
    Wait And Input Text    ${locatorB_floatingSettings_input_floatingMaxTimes}    3
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Value Of Element Should Be Equal With Wait    ${locatorB_floatingSettings_input_floatingMaxTimes}    3

B_reset042
    [Documentation]    设置显示的浮窗个数>后台浮窗库的个数【未开启循环】
    Sleep    2
    ${classLimit}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingLimit}    class
    Run Keyword If    '${classLimit}'=='ant-checkbox'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingLimit}
    Wait And Input Text    ${locatorB_floatingSettings_input_firstDelay}    3
    Wait And Input Text    ${locatorB_floatingSettings_input_duration}    5
    Wait And Input Text    ${locatorB_floatingSettings_input_interval}    1
    Wait And Input Text    ${locatorB_floatingSettings_input_floatingMaxTimes}    10
    ${classCircle}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingCircle}    class
    Run Keyword If    '${classCircle}'=='ant-checkbox ant-checkbox-checked'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingCircle}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Set Global Variable    ${circleCount}    0
    :FOR    ${ONE}    IN RANGE    9999
    \    Sleep    3
    \    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_floating_upPop_floatingPop}
    \    Run Keyword If    '${status}'!='${True}'    Exit For Loop
    \    ${circleCount}=    Evaluate    ${circleCount}+${1}
    \    Sleep    6
    Should Be True    ${circleCount}!=10
    Sleep    2
    Focus Current Window

B_reset043
    [Documentation]    设置显示的浮窗个数>后台浮窗库的个数【开启循环】
    Sleep    2
    ${classLimit}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingLimit}    class
    Run Keyword If    '${classLimit}'=='ant-checkbox'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingLimit}
    Wait And Input Text    ${locatorB_floatingSettings_input_firstDelay}    3
    Wait And Input Text    ${locatorB_floatingSettings_input_duration}    5
    Wait And Input Text    ${locatorB_floatingSettings_input_interval}    1
    Wait And Input Text    ${locatorB_floatingSettings_input_floatingMaxTimes}    10
    ${classCircle}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingCircle}    class
    Run Keyword If    '${classCircle}'=='ant-checkbox'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingCircle}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Set Global Variable    ${circleCount}    0
    :FOR    ${ONE}    IN RANGE    10
    \    Sleep    3
    \    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_floating_upPop_floatingPop}
    \    Run Keyword If    '${status}'!='${True}'    Exit For Loop
    \    ${circleCount}=    Evaluate    ${circleCount}+${1}
    \    log to console     ${circleCount}
    \    Sleep    6
    Should Be True    ${circleCount}==10
    Sleep    2
    Focus Current Window

B_reset044
    [Documentation]    设置显示的浮窗个数<后台浮窗库的个数【未开启循环】
    Sleep    2
    ${classLimit}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingLimit}    class
    Run Keyword If    '${classLimit}'=='ant-checkbox'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingLimit}
    Wait And Input Text    ${locatorB_floatingSettings_input_firstDelay}    3
    Wait And Input Text    ${locatorB_floatingSettings_input_duration}    5
    Wait And Input Text    ${locatorB_floatingSettings_input_interval}    1
    Wait And Input Text    ${locatorB_floatingSettings_input_floatingMaxTimes}    1
    ${classCircle}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingCircle}    class
    Run Keyword If    '${classCircle}'=='ant-checkbox ant-checkbox-checked'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingCircle}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    Set Global Variable    ${circleCount}    0
    :FOR    ${ONE}    IN RANGE    9999
    \    Sleep    3
    \    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_floating_upPop_floatingPop}
    \    Run Keyword If    '${status}'!='${True}'    Exit For Loop
    \    ${circleCount}=    Evaluate    ${circleCount}+${1}
    \    Sleep    6
    Should Be True    ${circleCount}==1
    Sleep    2
    Focus Current Window

B_reset045
    [Documentation]    设置显示的浮窗个数<后台浮窗库的个数【开启循环】
    Sleep    2
    ${classLimit}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingLimit}    class
    Run Keyword If    '${classLimit}'=='ant-checkbox'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingLimit}
    Wait And Input Text    ${locatorB_floatingSettings_input_firstDelay}    3
    Wait And Input Text    ${locatorB_floatingSettings_input_duration}    5
    Wait And Input Text    ${locatorB_floatingSettings_input_interval}    1
    Wait And Input Text    ${locatorB_floatingSettings_input_floatingMaxTimes}    1
    ${classCircle}=    Wait And Get Element Attribute    ${locatorB_floatingSettings_checkout_floatingCircle}    class
    Run Keyword If    '${classCircle}'=='ant-checkbox'    Sleep And Click Element    ${locatorB_floatingSettings_checkout_floatingCircle}
    ${statusSave}=    Run Keyword And Return Status    Wait Until Page Contains Locator     ${locatorB_floatingSettings_button_settingsSave}
    Run Keyword If    '${statusSave}'=='${True}'    Sleep And Click Element    ${locatorB_floatingSettings_button_settingsSave}
    Sleep    2
    Sleep And Click Element    ${locatorB_headerTop_link_storeHome}
    Focus On New Window
    :FOR    ${ONE}    IN RANGE    5
    \    Sleep    3
    \    ${status}=    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorC_floating_upPop_floatingPop}
    \    Run Keyword If    '${status}'!='${True}'    Exit For Loop
    \    ${circleCount}=    Evaluate    ${circleCount}+${1}
    \    log to console     ${circleCount}
    \    Sleep    6
    Should Be True    ${circleCount}==5
    Sleep    2
    Focus Current Window