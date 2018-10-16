*** Settings ***
Library           SeleniumLibrary    run_on_failure=NOTHING
Library           OperatingSystem
Library           DateTime
Library           Screenshot
Library           ${CURDIR}/../../lib/customlib/kwpayment.py
Library           ${CURDIR}/../../lib/customlib/kwcheckout.py
Library           ${CURDIR}/../../lib/customlib/kwproduct.py
Library           ${CURDIR}/../../lib/customlib/kwcollection.py
Library           ${CURDIR}/../../lib/customlib/kwcomment.py
Library           ${CURDIR}/../../lib/customlib/kworder.py
Resource          ../variable/var_common.robot
Resource          ../variable/var_login.robot
Resource          ../variable/var_store.robot
Resource          ../variable/var_account.robot
Resource          ../variable/var_shipping.robot
Resource          kw_browser.robot
Resource          kw_shipping.robot
Resource          kw_navigation.robot
Resource          kw_product_management.robot

*** Keywords ***
Login With Default User
    New Test Suite Browser And Login    ${user_default_contact}    ${user_default_pwd}    ${user_default_domain}

Login With User
    [Arguments]    ${username}    ${password}    ${domain}
    log    Login with ${username}
    Comment    wait until login button is visible
    Wait And Input Text    ${locatorB_login_input_account}    ${username}
    Wait And Input Password    ${locatorB_login_input_password}    ${password}
    Wait And Click Element    ${locatorB_login_btn_login}
    Comment    wait until domain input text element is visible
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_login_input_domain}    2
    Run Keyword If    '${status}'=='${True}'    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Run Keyword If    '${status}'=='${True}'    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Locator    ${locatorB_setting}
    log    Login Success
    Comment    close new_user's pop
    ${close}=    Execute JavaScript    return document.querySelectorAll('.ant-modal-close-x')[0]===undefined
    Run Keyword If    '${close}'=='${False}'    Wait And Click Element    dom:document.querySelectorAll('.ant-modal-close-x')[0]

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

Wait And Click Element
    [Arguments]    ${element_locator}    ${timeout}=7s    ${retry_time}=5x
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${element_locator}     10
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Click Element    ${element_locator}

Wait Exist And Click Element
    [Arguments]    ${element_locator}    ${timeout}=7s    ${retry_time}=5x
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Page Contains Locator    ${element_locator}
#    Wait Until Element Is Enabled    ${element_locator}
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
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${element_locator}     10
    ${return}    Get Text    ${element_locator}
    [Return]    ${return}

Sleep And Get Text
    [Arguments]    ${element_locator}    ${sleep_time}=3
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Sleep    ${sleep_time}
    ${return}    Get Text    ${element_locator}
    [Return]    ${return}

Wait And Get Value
    [Arguments]    ${element_locator}
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${element_locator}     10
    ${return}    Get Value    ${element_locator}
    [Return]    ${return}

Text Of Element Should Be Equal With Wait
	[Arguments]    ${element_locator}    ${expected_text}    ${timeout}=10
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${text}    Wait And Get Text    ${element_locator}
    \    ${status}    Run Keyword And Return Status    Should Be Equal    ${text}    ${expected_text}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Text Of Element Should Contain With Wait
	[Arguments]    ${element_locator}    ${expected_text}    ${timeout}=10
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${text}    Wait And Get Text    ${element_locator}
    \    ${status}    Run Keyword And Return Status    Should Contain    ${text}    ${expected_text}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Value Of Element Should Be Equal With Wait
	[Arguments]    ${element_locator}    ${expected_value}    ${timeout}=10
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${value}    Wait And Get Value    ${element_locator}
    \    ${status}    Run Keyword And Return Status    Should Be Equal    ${value}    ${expected_value}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Location Should Contain With Wait
	[Arguments]    ${expected_value}    ${timeout}=10
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
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

#Wait And Select From List
#	[Arguments]    ${element_selectbox}    ${element_selectitem}
#    [Documentation]    由于项目中实现的下拉功能并不是select标签无法使用robot的关键字select from list。（暂不实现，为找见下拉框操作方法）
#    Wait And Click Element    ${element_selectbox}
#    Wait And Click Element    ${element_selectitem}

Wait And Click Element Then Confirm
	[Arguments]    ${element_locator}
    [Documentation]
    Wait And Click Element    ${element_locator}
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_popUps_button_footermiddle}
    Run Keyword If    '${status}'!='False'    Wait And Click Element    ${locatorB_popUps_button_footermiddle}
	...    ELSE    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}

Wait And Click Element Then Cancel
	[Arguments]    ${element_locator}
    [Documentation]
    Wait And Click Element    ${element_locator}
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_popUps_button_footerdefault}
    Run Keyword If    '${status}'!='False'    Wait And Click Element    ${locatorB_popUps_button_footerdefault}
    ...    ELSE    Wait And Click Element    ${locatorB_popUps_button_bodydefault}

Wait And Make Switch On
	[Arguments]    ${element_locator}
    [Documentation]
    Wait Until Element Is Visible    ${element_locator}     10
	${class} =    Get Element Attribute    ${element_locator}    class
	Run Keyword If    '${class}'=='ant-switch'    Wait And Click Element    ${element_locator}

Wait And Make Switch Off
	[Arguments]    ${element_locator}
    [Documentation]
    Wait Until Element Is Visible    ${element_locator}     10
	${class} =    Get Element Attribute    ${element_locator}    class
	Run Keyword If    '${class}'=='ant-switch ant-switch-checked'    Wait And Click Element    ${element_locator}

Wait Enabled And Choose File
	[Arguments]    ${element_locator}    ${file}    ${sleep_time}=5
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
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
#    ${exec_locator} =	Evaluate	'''${element_locator}'''[4:]
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
#    \    ${len}    Get List Length    ${exec_locator}
    \    ${len}    Get Element Count    ${element_locator}
    \    ${status}    Run Keyword And Return Status    Should Be Equal    ${len}    ${expected}
    \    Run Keyword If    ${status}    Exit For Loop
    \    Run Keyword If    '${i}'=='${times}'    Should Be True    ${status}
    \    ...    ELSE    Sleep    1

Element Attribute Should Be Equal With Wait
    [Arguments]    ${element_locator}    ${attribute}    ${expected}    ${timeout}=10
    ${times}    Evaluate    ${timeout}-1
    :FOR    ${i}    IN RANGE    ${timeout}
    \    ${attr}    Get Element Attribute    ${element_locator}    ${attribute}
    \    ${status}    Run Keyword And Return Status    Should Be equal    '${attr}'    '${expected}'
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
    @{new_window_handle}    Get Window Handles
    Select Window    ${new_window_handle[-1]}
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
    [Documentation]    等待页面不包含${locator}，包含继续等待直至超时异常，不包含即退出。${timeout}：超时时间，${retry_time}：${timeout}时间内尝试次数
    [Arguments]    ${locator}    ${timeout}=10
    Wait Until Page Does Not Contain Element    ${locator}    ${timeout}

Wait Until Page Contains Locator
    [Documentation]    等待页面包含${locator}，不包含继续等待直至超时异常，包含即退出。${timeout}：超时时间
    [Arguments]    ${locator}    ${timeout}=10
    Wait Until Page Contains Element    ${locator}    ${timeout}

Wait Until Page Contains Text
    [Documentation]    等待页面包含${text}，不包含继续等待直至超时异常，包含即退出。${timeout}：超时时间，${retry_time}：${timeout}时间内尝试次数
    [Arguments]    ${text}    ${timeout}=10
    Wait Until Page Contains    ${text}    ${timeout}

Wait Until Page Not Contains Text
    [Documentation]    等待页面不包含${text}，包含继续等待直至超时异常，不包含即退出。${timeout}：超时时间，${retry_time}：${timeout}时间内尝试次数
    [Arguments]    ${text}    ${timeout}=10
    Wait Until Page Does Not Contain    ${text}    ${timeout}

Wait Alert Should Be Present And Accept
	[Documentation]    告警弹窗${text}
    [Arguments]    ${text}    ${timeout}=10
    Alert Should Be Present    ${text}    ACCEPT    ${timeout}

Wait Alert Should Be Present And Dismiss
	[Documentation]    告警弹窗${text}
    [Arguments]    ${text}    ${timeout}=10
    Alert Should Be Present    ${text}    DISMISS    ${timeout}

Reload Page And Start Ajax
	[Documentation]    刷新页面并添加监控
#    [Arguments]    ${sleep_time}=1
	Reload Page
	Start Ajax Listener
#	Sleep    ${sleep_time}

Select All Items Then Click Batch Menu
    [Documentation]    选中所有items,并且点击批量操作菜单
    Wait Exist And Click Element    ${locatorB_checkbox00}
    Wait And Click Element    ${locatorB_select_batchOperations}



























Common Js Click
    [Arguments]    ${element}    ${index}
    [Documentation]    封装js点击方法
    Execute JavaScript    return document.querySelectorAll("${element}")[${index}].click()


Set Tax Price
    [Documentation]    封装设置税金方法,[element]:需要设置国家的中文名字(string),[numbers]:设置多少税金(int)
    [Arguments]    ${element}    ${numbers}
    Go To    ${home_page}    #.跳转主页
    Go To Tax Page    #.进入税金主页
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    ${length}    Execute JavaScript    return document.querySelectorAll(".ant-table-tbody tr").length
    :FOR    ${i}    IN RANGE    ${length}
    \    ${index}    evaluate    ${i}+1
    \    ${name}    Execute JavaScript    return document.querySelectorAll(".ant-table-tbody tr:nth-child(${index}) td div div p")[0].innerText
    \    Run Keyword If    '${name}'=='${element}'    Execute JavaScript    return document.querySelectorAll(".ant-table-tbody tr:nth-child(${index}) td i")[0].click()
    \    Run Keyword If    '${name}'=='${element}'    Input Text    dom:document.querySelectorAll('input')[0]    ${numbers}
    \    Run Keyword If    '${name}'=='${element}'    Wait And Click Element    dom:document.querySelectorAll('button')[2]
    Go To    ${home_page}

Checkout Page Decoration Condition
    [Documentation]    判断店铺是否装修
    Go To    ${home_page}
    Wait And Click Element    ${locatorB_store}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    ${name}    Execute JavaScript    return document.querySelectorAll("button span")[1].innerText
    Run Keyword If    '${name}'<>'优化pc展示'    Run keyword    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Run Keyword If    '${name}'<>'优化pc展示'    Run keyword    Wait And Click Element    dom:document.querySelectorAll("button")[5]

Confirm Cancel Alert
    [Documentation]    取消页面填写内容未保存跳走出现的弹窗
    Wait And Click Element    ${locatorB_subtraction_first_btn_cancel}
    Wait And Click Element    ${locatorB_subtraction_confirm_determine_btn}

Add Payment Cod Wait
    [Documentation]    添加 cod支付方式
    [Arguments]    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    activate_payment_cod_py
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

Del Payment Cod Wait
    [Documentation]    删除 cod支付方式
    [Arguments]    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    inactivate_payment_cod_py
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

Wait Add StoreInfo
    [Documentation]    添加 基础信息
    [Arguments]    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    add_store_info_py
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

Change Checkout Setp Wait
    [Documentation]    修改结账流程的 地址输入模式
    [Arguments]    ${parameter}    ${type}=${Empty}    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    set_checkout_step_py    ${parameter}    ${type}
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

Add Product Wait
    [Documentation]    等待添加商品
    [Arguments]    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    add_min_product_py
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

Add OtherTaxPrice Wait
    [Documentation]    等待添加其他税费
    [Arguments]    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    add_other_tax_price_py
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

Add StoreInfo Wait
    [Documentation]    等待添加店铺基础信息
    [Arguments]    ${par}    ${pars}    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    add_store_info_py    ${par}    ${pars}
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1
