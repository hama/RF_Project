*** Settings ***
Library           SeleniumLibrary    run_on_failure=NOTHING    implicit_wait=7.0
Library           OperatingSystem
Library           Collections
Library           DateTime
Library           String
Library           ${CURDIR}/../../lib/customlib/kwcart.py
Library           ${CURDIR}/../../lib/customlib/kwcheckout.py
Library           ${CURDIR}/../../lib/customlib/kwcollection.py
Library           ${CURDIR}/../../lib/customlib/kwcomment.py
Library           ${CURDIR}/../../lib/customlib/kwcoupon.py
Library           ${CURDIR}/../../lib/customlib/kwfilemanagement.py
Library           ${CURDIR}/../../lib/customlib/kwmenus.py
Library           ${CURDIR}/../../lib/customlib/kworder.py
Library           ${CURDIR}/../../lib/customlib/kwpayment.py
Library           ${CURDIR}/../../lib/customlib/kwproduct.py
Library           ${CURDIR}/../../lib/customlib/kwshipping.py
Library           ${CURDIR}/../../lib/customlib/kwstore.py
Library           ${CURDIR}/../../lib/customlib/kwtax.py
Library           ${CURDIR}/../../lib/customlib/lib_utils.py
Library           ${CURDIR}/../../lib/customlib/kwrebate.py
Library           ${CURDIR}/../../lib/customlib/kwcustomer.py
Resource          ../variable/var_common.robot
Resource          kw_ajax.robot
Resource          kw_browser.robot
Resource          kw_checkout.robot
Resource          kw_coupon_code.robot
Resource          kw_login.robot
Resource          kw_navigation.robot
Resource          kw_order.robot
Resource          kw_product_collection.robot
Resource          kw_product_comment.robot
Resource          kw_product_management.robot
Resource          kw_settings_page.robot
Resource          kw_shipping.robot
Resource          kw_store.robot
Resource          kw_tax.robot
Resource          kw_navmenu.robot
Resource          kw_uploadfile.robot
Resource          kw_payment_channel.robot
Resource          kw_subtraction.robot
Resource          kw_customer.robot

*** Keywords ***
Login With Default User
    [Documentation]    默认登录用户
    New Test Suite Browser And Login    ${user_default_contact}    ${user_default_pwd}    ${user_default_domain}

Login With User
    [Arguments]    ${username}    ${password}    ${domain}
    [Documentation]    登录用户
    log    Login with ${username}
    Comment    wait until login button is visible
    Wait And Input Text    ${locatorB_login_input_account}    ${username}
    Wait And Input Password    ${locatorB_login_input_password}    ${password}
    Wait And Click Element    ${locatorB_login_btn_login}
    Comment    wait until domain input text element is visible
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_login_input_domain}    2
    Run Keyword If    '${status}'=='${True}'    Wait And Input Text    ${locatorB_login_input_domain}    ${domain}
    Run Keyword If    '${status}'=='${True}'    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Locator    ${locatorB_logout_icon_individualAccount}
    log    Login Success
    Comment    close new_user's pop
    ${close}=    Execute JavaScript    return document.querySelectorAll('.ant-modal-close-x')[0]===undefined
    Run Keyword If    '${close}'=='${False}'    Wait And Click Element    dom:document.querySelectorAll('.ant-modal-close-x')[0]

Check ${caseLevel} Point From ${caseNum}
    [Documentation]    通过caseNum，检测级别为caseLevel的点（用例标号为caseNum）
	Run Keyword If    '${caseLevel}' in '${checkLevel}'    ${caseNum}

Wait And Input Text
    [Arguments]    ${element_locator}    ${text}    ${timeout}=3s    ${retry_time}=3x
    [Documentation]    封装的输入方法，等待元素可被输入时，再输入
    Wait Until Element Is Visible    ${element_locator}    10
    # 避免已有value的input标签，无法输入。因此在Input Text之前，点击input标签。解决此问题
    Wait And Click Element    ${element_locator}
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Input Text    ${element_locator}    ${text}

Wait And Input Password
    [Arguments]    ${element_locator}    ${pwd}    ${timeout}=3s    ${retry_time}=3x
    [Documentation]    封装的输入方法，等待元素可被输入时，再输入
    Wait Until Element Is Visible    ${element_locator}    10
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Input Password    ${element_locator}    ${pwd}

Wait And Mouse Over
    [Arguments]    ${element_locator}
    [Documentation]    鼠标移至指定位置，悬浮
    Wait Until Element Is Visible    ${element_locator}     10
    Mouse Over    ${element_locator}

Wait And Click Element
    [Arguments]    ${element_locator}    ${timeout}=7s    ${retry_time}=2x
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${element_locator}     10
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Click Element    ${element_locator}

Wait Exist And Click Element
    [Arguments]    ${element_locator}    ${timeout}=7s    ${retry_time}=5x
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Page Contains Locator    ${element_locator}
#    Wait Until Element Is Enabled    ${element_locator}
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Click Element    ${element_locator}

Wait Enabled And Click Element
    [Arguments]    ${element_locator}    ${timeout}=7s    ${retry_time}=5x
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Enabled    ${element_locator}
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Click Element    ${element_locator}

Sleep And Click Element
    [Arguments]    ${element_locator}    ${sleep_time}=3    ${timeout}=7s    ${retry_time}=5x
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Sleep    ${sleep_time}
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Click Element    ${element_locator}

Sleep ${sleeptime:\d+} Then Click Element ${element_locator}
    [Documentation]    关键字嵌入参数
    Sleep    ${sleeptime}
    Wait And Click Element    ${element_locator}

Wait And Get Text
    [Arguments]    ${element_locator}
    [Documentation]    获取元素文本信息
    Wait Until Element Is Visible    ${element_locator}     10
    ${return}    Get Text    ${element_locator}
    [Return]    ${return}

Sleep And Get Text
    [Arguments]    ${element_locator}    ${sleep_time}=3
    [Documentation]    获取元素文本信息
    Sleep    ${sleep_time}
    ${return}    Get Text    ${element_locator}
    [Return]    ${return}

Wait And Get Value
    [Arguments]    ${element_locator}
    [Documentation]    获取元素的值
    Wait Until Element Is Visible    ${element_locator}     10
    ${return}    Get Value    ${element_locator}
    [Return]    ${return}

Text Of Element Should Be Equal With Wait
	[Arguments]    ${element_locator}    ${expected_text}    ${timeout}=10
    [Documentation]    元素的文本信息应该等于
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${text}    Wait And Get Text    ${element_locator}
    \    ${status}    Run Keyword And Return Status    Should Be Equal    ${text}    ${expected_text}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Text Of Element Should Contain With Wait
	[Arguments]    ${element_locator}    ${expected_text}    ${timeout}=10
    [Documentation]    元素的文本信息应该包含
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${text}    Wait And Get Text    ${element_locator}
    \    ${status}    Run Keyword And Return Status    Should Contain    ${text}    ${expected_text}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Value Of Element Should Be Equal With Wait
	[Arguments]    ${element_locator}    ${expected_value}    ${timeout}=10
    [Documentation]    元素的值应该等于
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${value}    Wait And Get Value    ${element_locator}
    \    ${status}    Run Keyword And Return Status    Should Be Equal    ${value}    ${expected_value}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Location Should Contain With Wait
	[Arguments]    ${expected_value}    ${timeout}=10
    [Documentation]    地址包含
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${status}    Run Keyword And Return Status    Location Should Contain    ${expected_value}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Wait And Get Items List From Locator
	[Arguments]    ${element_locator}    ${element_visible}=${Empty}
    [Documentation]    获取${element_locator}中的元素，并放入列表中返回
	${exec_locator} =	Evaluate	'''${element_locator}'''[4:]
    Run Keyword If    '''${element_visible}'''!='''${Empty}'''    Wait Until Element Is Visible    ${element_visible}     10
    @{return}    Execute Javascript    return ${exec_locator}
    [Return]    @{return}

Wait And Select From List By Clicking
	[Arguments]    ${element_selectbox}    ${element_selectitem}
    [Documentation]    点击元素，实现select选择。（用于非select标签封装的下拉选框）
    Wait And Click Element    ${element_selectbox}
    Wait And Click Element    ${element_selectitem}

Wait And Select From List By Index
	[Arguments]    ${element_selectbox}    ${index}    ${timeout}=10
    [Documentation]    通过下标选择元素
    Wait Until Element Is Visible    ${element_selectbox}     10
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${status}    Run Keyword And Return Status    Select From List By Index    ${element_selectbox}    ${index}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Wait And Select From List By Label
	[Arguments]    ${element_selectbox}    ${label}    ${timeout}=10
    [Documentation]    通过文本选择元素
    Wait Until Element Is Visible    ${element_selectbox}     10
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${status}    Run Keyword And Return Status    Select From List By Label    ${element_selectbox}    ${label}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Wait And Select From List By Value
	[Arguments]    ${element_selectbox}    ${value}    ${timeout}=10
    [Documentation]    通过值选择元素
    Wait Until Element Is Visible    ${element_selectbox}     10
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${status}    Run Keyword And Return Status    Select From List By Value    ${element_selectbox}    ${value}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Wait And Click Element Then Confirm
	[Arguments]    ${element_locator}
    [Documentation]      全局 确认弹窗
    Wait And Click Element    ${element_locator}
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_popUps_button_footermiddle}
    Run Keyword If    '${status}'!='False'    Wait And Click Element    ${locatorB_popUps_button_footermiddle}
	...    ELSE    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}

Wait And Click Element Then Cancel
	[Arguments]    ${element_locator}
    [Documentation]      全局 取消弹窗
    Wait And Click Element    ${element_locator}
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_popUps_button_footerdefault}
    Run Keyword If    '${status}'!='False'    Wait And Click Element    ${locatorB_popUps_button_footerdefault}
    ...    ELSE    Wait And Click Element    ${locatorB_popUps_button_bodydefault}

Wait And Get Element Attribute
	[Arguments]    ${element_locator}    ${attr}
    [Documentation]    获取元素属性
    Wait Until Element Is Visible    ${element_locator}     10
	${attr_value} =    Get Element Attribute    ${element_locator}    ${attr}
	[Return]    ${attr_value}

Wait And Make Switch On
	[Arguments]    ${element_locator}
    [Documentation]    使switch按钮开启
    Wait Until Element Is Visible    ${element_locator}     10
	${class} =    Get Element Attribute    ${element_locator}    class
	Run Keyword If    '${class}'=='ant-switch'    Wait And Click Element    ${element_locator}

Wait And Make Switch Off
	[Arguments]    ${element_locator}
    [Documentation]    使switch按钮关闭
    Wait Until Element Is Visible    ${element_locator}     10
	${class} =    Get Element Attribute    ${element_locator}    class
	Run Keyword If    '${class}'=='ant-switch ant-switch-checked'    Wait And Click Element    ${element_locator}

Wait Enabled And Choose File
	[Arguments]    ${element_locator}    ${file}    ${sleep_time}=5
    [Documentation]    上传文件
    Wait Until Element Is Enabled    ${element_locator}    10
    ${NORMAL_PATH}    Normalize Path  ${file}
    Choose File    ${element_locator}    ${NORMAL_PATH}
	Sleep    ${sleep_time}    # 由于商品图片未上传完成，点击保存，保存成功。会导致bug，因此等待5秒钟

# 可用Get Element Count替代
#Get List Length
#	[Arguments]    ${exec_locator}
#    [Documentation]    private，不建议直接调用。可使用Count Of Element Should Be Equal With Wait
#	${return} =	Execute Javascript    return ${exec_locator}.length
#    [Return]    ${return}

Count Of Element Should Be Equal With Wait
    [Arguments]    ${element_locator}    ${expected}    ${timeout}=10
    [Documentation]    元素的个数应该等于
#    ${exec_locator} =	Evaluate	'''${element_locator}'''[4:]
    ${times}    Evaluate    ${timeout}-1
    ${elementIsStandby}    Run Keyword And Return Status    Wait Until Element Is Enabled    ${element_locator}    3
    Run Keyword If    '${elementIsStandby}'!='True'    Sleep    3
    :FOR    ${i}    IN RANGE    ${timeout}
#    \    ${len}    Get List Length    ${exec_locator}
    \    ${len}    Get Element Count    ${element_locator}
    \    ${status}    Run Keyword And Return Status    Should Be Equal    ${len}    ${expected}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Element Attribute Should Be Equal With Wait
    [Arguments]    ${element_locator}    ${attribute}    ${expected}    ${timeout}=10
    [Documentation]    元素的属性应该等于
    ${times}    Evaluate    ${timeout}-1
    ${elementIsStandby}    Run Keyword And Return Status    Wait Until Element Is Enabled    ${element_locator}    3
    Run Keyword If    '${elementIsStandby}'!='True'    Sleep    3
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${attr}    Get Element Attribute    ${element_locator}    ${attribute}
    \    ${status}    Run Keyword And Return Status    Should Be equal    '${attr}'    '${expected}'
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Element Attribute Should Contain With Wait
    [Arguments]    ${element_locator}    ${attribute}    ${expected}    ${timeout}=10
    [Documentation]    元素的属性应该包含
    ${times}    Evaluate    ${timeout}-1
    ${elementIsStandby}    Run Keyword And Return Status    Wait Until Element Is Enabled    ${element_locator}    3
	Run Keyword If    '${elementIsStandby}'!='True'    Sleep    3
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${attr}    Get Element Attribute    ${element_locator}    ${attribute}
    \    ${status}    Run Keyword And Return Status    Should Contain    ${attr}    ${expected}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Open New And Close Other Windows
	[Arguments]    ${url}
	[Documentation]    开启一个指定的新窗口，并关闭其余窗口
	@{window_handles}    Get Window Handles
    Execute Javascript    window.open("${url}")
    :FOR    ${window_handle}    IN    @{window_handles}
    \    Select Window    ${window_handle}
    \    Close Window
    @{new_window_handle}    Get Window Handles
    Select Window    ${new_window_handle[0]}
    Set Window Size    1440    1080

Focus On New Window
	[Documentation]    聚焦到新窗口（紧跟开窗口动作之后）,并返回新窗口的handle
	Sleep    1
    @{new_window_handle}    Get Window Handles
    Select Window    ${new_window_handle[-1]}
    Set Window Size    1440    1080
    [Return]    ${new_window_handle[-1]}

#Click And Page Contains Element With Refresh
#    [Documentation]    点击&检查页面包含元素，含刷新机制
#    [Arguments]    ${click_element}    ${contain_element}    ${timeout}=10    ${retry_time}=2
#    :FOR    ${i}    IN RANGE    1
#    \    Click With Refresh    ${click_element}    ${timeout}    ${retry_time}
#    \    ${status0}    Run Keyword And Return Status    Wait Until Page Not Contains Locator    ${contain_element}    ${timeout}    ${retry_time}
#    \    Run Keyword If    '${status0}'=='False'    Reload Page And Start Ajax
#    \    ...     ELSE    Exit For Loop
#
#Click And Page Not Contains Element With Refresh
#    [Documentation]    点击&检查页面不包含元素，含刷新机制
#    [Arguments]    ${click_element}    ${contain_element}    ${timeout}=10    ${retry_time}=2
#    :FOR    ${i}    IN RANGE    1
#    \    Click With Refresh    ${click_element}    ${timeout}    ${retry_time}
#    \    ${status0}    Run Keyword And Return Status    Wait Until Page Not Contains Locator    ${contain_element}    ${timeout}    ${retry_time}
#    \    Run Keyword If    '${status0}'=='True'    Reload Page And Start Ajax
#    \    ...     ELSE    Exit For Loop
#
#Click And Page Contains With Refresh
#    [Documentation]    点击&检查页面包含文字，含刷新机制
#    [Arguments]    ${click_element}    ${contain_text}    ${timeout}=10    ${retry_time}=2
#    :FOR    ${i}    IN RANGE    1
#    \    Click With Refresh    ${click_element}    ${timeout}    ${retry_time}
#    \    ${status0}    Run Keyword And Return Status    Wait Until Page Not Contains Text    ${contain_text}    ${timeout}    ${retry_time}
#    \    Run Keyword If    '${status0}'=='False'    Reload Page And Start Ajax
#    \    ...     ELSE    Exit For Loop
#
#Click And Page Not Contains With Refresh
#    [Documentation]    点击&检查页面不包含文字，含刷新机制
#    [Arguments]    ${click_element}    ${contain_text}    ${timeout}=10    ${retry_time}=2
#    :FOR    ${i}    IN RANGE    1
#    \    Click With Refresh    ${click_element}    ${timeout}    ${retry_time}
#    \    ${status0}    Run Keyword And Return Status    Wait Until Page Not Contains Text    ${contain_text}    ${timeout}    ${retry_time}
#    \    Run Keyword If    '${status0}'=='True'    Reload Page And Start Ajax
#    \    ...     ELSE    Exit For Loop
#
#Click With Refresh
#    [Documentation]    点击，含刷新机制
#    [Arguments]    ${click_element}    ${timeout}=10    ${retry_time}=2
#    :FOR    ${i}    IN RANGE    1
#    \    ${status0}    Run Keyword And Return Status    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Click Element    ${click_element}
#    \    Run Keyword If    '${status0}'=='False'    Reload Page And Start Ajax
#    \    ...     ELSE    Exit For Loop

Wait Until Page Not Contains Locator
    [Arguments]    ${locator}    ${timeout}=10
    [Documentation]    等待页面不包含${locator}，包含继续等待直至超时异常，不包含即退出。${timeout}：超时时间，${retry_time}：${timeout}时间内尝试次数
    Wait Until Page Does Not Contain Element    ${locator}    ${timeout}

Wait Until Page Contains Locator
    [Arguments]    ${locator}    ${timeout}=10
    [Documentation]    等待页面包含${locator}，不包含继续等待直至超时异常，包含即退出。${timeout}：超时时间
    Wait Until Page Contains Element    ${locator}    ${timeout}

Wait Until Page Contains Text
    [Arguments]    ${text}    ${timeout}=10
    [Documentation]    等待页面包含${text}，不包含继续等待直至超时异常，包含即退出。${timeout}：超时时间，${retry_time}：${timeout}时间内尝试次数
    Wait Until Page Contains    ${text}    ${timeout}

Wait Until Page Not Contains Text
    [Arguments]    ${text}    ${timeout}=10
    [Documentation]    等待页面不包含${text}，包含继续等待直至超时异常，不包含即退出。${timeout}：超时时间，${retry_time}：${timeout}时间内尝试次数
    Wait Until Page Does Not Contain    ${text}    ${timeout}

Wait Alert Should Be Present And Accept
    [Arguments]    ${text}    ${timeout}=10
	[Documentation]    告警弹窗${text}
    Alert Should Be Present    ${text}    ACCEPT    ${timeout}

Wait Alert Should Be Present And Dismiss
    [Arguments]    ${text}    ${timeout}=10
	[Documentation]    告警弹窗${text}
    Alert Should Be Present    ${text}    DISMISS    ${timeout}

Reload Page And Start Ajax
    [Arguments]    ${sleep_time}=2
	[Documentation]    刷新页面并添加监控
	Sleep    ${sleep_time}
	Reload Page
#	Sleep    1
#	Start Ajax Listener
	Sleep    2

Select All Items Then Click Batch Menu
    [Documentation]    选中所有items,并且点击批量操作菜单
    Wait Exist And Click Element    ${locatorB_checkbox00}
    Wait And Click Element    ${locatorB_select_batchOperations}

Long Press Element With Wait
    [Documentation]    鼠标长按释放
    [Arguments]    ${locator}    ${sleep_time}=5
    Wait Until Element Is Visible    ${locator}     10
    Mouse Down    ${locator}
    Sleep    ${sleep_time}
    Mouse Up    ${locator}

Go To First Product C Interface
    [Documentation]    从B端，点击第一个商品的预览按钮，进入C端商品详情页
	Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_icon_firstpreview}
    Focus On New Window
    Start Ajax Listener
    Sleep    2