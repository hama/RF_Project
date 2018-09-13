*** Settings ***
Library           SeleniumLibrary    run_on_failure=NOTHING
Library           ${CURDIR}/../../lib/customlib/kwpayment.py
Library           ${CURDIR}/../../lib/customlib/kwcheckout.py
Library           ${CURDIR}/../../lib/customlib/kwproduct.py
Resource          ../variable/var_common.robot
Resource          ../variable/var_login.robot
Resource          kw_browser.robot
Resource          kw_products.robot
Resource          ../variable/var_store.robot

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

Go To Home Page
    [Documentation]    跳转到主页
    Wait And Click Element    ${locatorB_overview}

Go To Setting Page
    [Documentation]    跳转到设置页面
    Wait And Click Element    ${locatorB_setting}

Go To Home By Url
    [Documentation]    通过url跳转到主页
    Sleep    1
    Go To    ${home_page}
    Sleep    1

Go To Products Page
    [Documentation]    跳转到商品页面
    ${data}    Get Select Elements    0    #.获取导航栏商品的下拉按钮元素
    Run Keyword If    '${data}'=='false'    Wait And Click Element    ${locatorB_products}
    ...    ELSE    Wait And Click Element    ${locatorB_product_manage}
    #Wait And Click Element    ${locatorB_products}
    #Wait And Click Element    ${locatorB_product_manage}
    Sleep    2
    Wait Until Page Contains    ${contentB_products_all}
    Location Should Be    ${url_products}
    Sleep    1

Go To Marketing Page
    [Documentation]    跳转到营销页面
    Wait And Click Element    ${locatorB_marketing}
    Sleep    2
    #点击满减活动
    #Wait And Click Element    id:test_marketing_substraction
    #Sleep    2

Go To Order Page
    [Documentation]    跳转到订单页面
    Wait And Click Element    ${locatorB_order}
    Wait Until Page Contains    ${contentB_order_title}
    Location Should Be    ${url_order}

Go To Tax Price Page
    [Documentation]    跳转到税费页面
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${unvisible}=    Execute Javascript    return document.querySelectorAll('a[href="/taxPrice"]')[0]===undefined
    Run Keyword If    ${unvisible}    Wait And Click Element    ${locatorB_setting}
    Wait And Click Element    ${locatorB_setting_taxPrice}
    Location Should Be    ${url_tax_price}

Go To Shipping Page
    [Documentation]    跳转到物流页面
    Sleep    2.5
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若设置按钮没展开，则展开设置按钮
    ${unvisible}=    Execute Javascript    return document.querySelectorAll('a[href="/shipping"]')[0]===undefined
    Run Keyword If    ${unvisible}    Wait And Click Element    ${locatorB_setting}
    Wait And Click Element    ${locatorB_setting_shipping}
    Wait Until Element Is Visible    ${locatorB_shipping_add_shipping}
    Page Should Contain    ${contentB_shipping_tab1}
    Page Should Contain    ${contentB_shipping_tab2}
    Location Should Be    ${url_shipping}

Go To Subtraction Page
    [Documentation]    跳转营销-满减活动页面
    Wait Until Element Is Visible    ${locatorB_marketing}
    # 若营销按钮没展开，则展开营销按钮
    ${data}    Get Select Elements    1    # 获取导航栏营销下拉元素
    Run Keyword If    '${data}'=='false'    Wait And Click Element    ${locatorB_marketing}
    ...    ELSE    Wait And Click Element    ${locatorB_marketing_subtraction}
    Wait Until Page Contains    ${locatorB_subtraction_header_text}
    Location Should Be    ${url_subtraction}

Go To Coupon Page
    [Documentation]    跳转营销-优惠券页面
    Wait Until Element Is Visible    ${locatorB_marketing}
    # 若营销按钮没展开，则展开营销按钮
    ${data}    Get Select Elements    1    # 获取导航栏营销下拉元素
    Run Keyword If    '${data}'=='false'    Wait And Click Element    ${locatorB_marketing}
    Run Keyword If    '${data}'=='false'    Wait And Click Element    ${locatorB_marketing_coupon_code}
    ...    ELSE    Wait And Click Element    ${locatorB_marketing_coupon_code}
    Wait Until Page Contains    ${locatorB_couponLst_couponText}
    Location Should Be    ${url_coupon_code}

Go To Store Page
    [Documentation]    跳转基础信息页面
    Wait Until Element Is Visible    ${locatorB_setting}
    # 若营销按钮没展开，则展开营销按钮
    ${data}    Get Select Elements    3    # 获取导航栏营销下拉元素
    Run Keyword If    '${data}'=='false'    Wait And Click Element    ${locatorB_setting}
    Run Keyword If    '${data}'=='false'    Wait And Click Element    ${locatorB_setting_store}
    ...    ELSE    Wait And Click Element    ${locatorB_setting_store}
    Wait Until Page Contains    ${locatorB_storeLst_storeText}
    Location Should Be    ${url_coupon_store}

Wait And Input Text
    [Arguments]    ${element_locator}    ${text}    ${timeout}=3    ${retry_time}=1
    [Documentation]    封装的输入方法，等待元素可被输入时，再输入
    Wait Until Element Is Visible    ${element_locator}    10
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Input Text    ${element_locator}    ${text}

Wait And Input Password
    [Arguments]    ${element_locator}    ${pwd}    ${timeout}=3    ${retry_time}=1
    [Documentation]    封装的输入方法，等待元素可被输入时，再输入
    Wait Until Element Is Visible    ${element_locator}    10
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Input Password    ${element_locator}    ${pwd}

Wait And Click Element
    [Arguments]    ${element_locator}    ${timeout}=25    ${retry_time}=5
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${element_locator}     10
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Click Element    ${element_locator}

Wait And Select Checkbox
    [Arguments]    ${element_locator}    ${timeout}=3    ${retry_time}=1
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Enabled    ${element_locator}
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Click Element    ${element_locator}

Wait And Get Text
    [Arguments]    ${element_locator}
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    Wait Until Element Is Visible    ${element_locator}     10
    ${return}    Get Text    ${element_locator}
    [Return]    ${return}

Wait And Get List Items
	[Arguments]    ${element_locator}    ${element_visible}=${Empty}
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
	${exec_locator} =	Evaluate	'''${element_locator}'''[4:]
    Run Keyword If    '''${element_visible}'''!='''${Empty}'''    Wait Until Element Is Visible    ${element_visible}     10
    @{return}    Execute Javascript    return ${exec_locator}
    [Return]    @{return}

Click Element And Confirm
	[Arguments]    ${element_locator}
    [Documentation]
    Wait And Click Element    ${element_locator}
    Wait And Click Element    ${locatorB_popUps_button_middle}

Click Element And Cancel
	[Arguments]    ${element_locator}
    [Documentation]
    Wait And Click Element    ${element_locator}
    Wait And Click Element    ${locatorB_popUps_button_default}

Get List Length
	[Arguments]    ${element_locator}
    [Documentation]    封装的点击方法，等待元素可被点击时，再点击，具备失败重试
    ${exec_locator} =	Evaluate	'''${element_locator}'''[4:]
	${return} =	Execute Javascript    return ${exec_locator}.length
    [Return]    ${return}

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

Focus On New Window
	[Documentation]    聚焦到新窗口（紧跟开窗口动作之后）,并返回新窗口的handle
    @{new_window_handle}    Get Window Handles
    Select Window    ${new_window_handle[-1]}
    [Return]    ${new_window_handle[-1]}

Length Should Be Equal
	[Arguments]    ${element_locator}    ${expected}
	${len}    Get List Length    ${element_locator}
    Should Be Equal    ${len}    ${expected}


Common Js Click
    [Arguments]    ${element}    ${index}
    [Documentation]    封装js点击方法
    Execute JavaScript    return document.querySelectorAll("${element}")[${index}].click()

JS Get Element Length
    [Arguments]    ${element_locator}
    [Documentation]    封装的JS方法，返回元素集长度
    Execute Javascript    return ${element_locator}.length

Set Tax Price
    [Documentation]    封装设置税金方法,[element]:需要设置国家的中文名字(string),[numbers]:设置多少税金(int)
    [Arguments]    ${element}    ${numbers}
    Go To    ${home_page}    #.跳转主页
    Go To Tax Price Page    #.进入税金主页
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

Click And Page Contains Element With Refresh
    [Documentation]    点击&检查页面包含元素，含刷新机制
    [Arguments]    ${click_element}    ${contain_element}    ${timeout}=10    ${retry_time}=2
    :FOR    ${i}    IN RANGE    1
    \    Click With Refresh    ${click_element}    ${timeout}    ${retry_time}
    \    ${status0}    Run Keyword And Return Status    Wait Until Page Not Contains Locator    ${contain_element}    ${timeout}    ${retry_time}
    \    Run Keyword If    '${status0}'=='False'    Execute JavaScript    return location.reload()
    \    ...     ELSE    Exit For Loop

Click And Page Not Contains Element With Refresh
    [Documentation]    点击&检查页面不包含元素，含刷新机制
    [Arguments]    ${click_element}    ${contain_element}    ${timeout}=10    ${retry_time}=2
    :FOR    ${i}    IN RANGE    1
    \    Click With Refresh    ${click_element}    ${timeout}    ${retry_time}
    \    ${status0}    Run Keyword And Return Status    Wait Until Page Not Contains Locator    ${contain_element}    ${timeout}    ${retry_time}
    \    Run Keyword If    '${status0}'=='True'    Execute JavaScript    return location.reload()
    \    ...     ELSE    Exit For Loop

Click And Page Contains With Refresh
    [Documentation]    点击&检查页面包含文字，含刷新机制
    [Arguments]    ${click_element}    ${contain_text}    ${timeout}=10    ${retry_time}=2
    :FOR    ${i}    IN RANGE    1
    \    Click With Refresh    ${click_element}    ${timeout}    ${retry_time}
    \    ${status0}    Run Keyword And Return Status    Wait Until Page Not Contains Text    ${contain_text}    ${timeout}    ${retry_time}
    \    Run Keyword If    '${status0}'=='False'    Execute JavaScript    return location.reload()
    \    ...     ELSE    Exit For Loop

Click And Page Not Contains With Refresh
    [Documentation]    点击&检查页面不包含文字，含刷新机制
    [Arguments]    ${click_element}    ${contain_text}    ${timeout}=10    ${retry_time}=2
    :FOR    ${i}    IN RANGE    1
    \    Click With Refresh    ${click_element}    ${timeout}    ${retry_time}
    \    ${status0}    Run Keyword And Return Status    Wait Until Page Not Contains Text    ${contain_text}    ${timeout}    ${retry_time}
    \    Run Keyword If    '${status0}'=='True'    Execute JavaScript    return location.reload()
    \    ...     ELSE    Exit For Loop

Click With Refresh
    [Documentation]    点击，含刷新机制
    [Arguments]    ${click_element}    ${timeout}=10    ${retry_time}=2
    :FOR    ${i}    IN RANGE    1
    \    ${status0}    Run Keyword And Return Status    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Click Element    ${click_element}
    \    Run Keyword If    '${status0}'=='False'    Execute JavaScript    return location.reload()
    \    ...     ELSE    Exit For Loop

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

Wait Until Alert Be Present
    [Documentation]    等待Alert出现，并消除
    [Arguments]    ${msg}    ${timeout}=10    ${retry_time}=2
    Wait Until Keyword Succeeds    ${timeout}    ${retry_time}    Alert Should Be Present    ${msg}

Alert Should Not Be Present
    [Arguments]    ${msg}
    ${result}    Run Keyword And Ignore Error    Alert Should Be Present    ${msg}
    Should Be True    '${result}'!='PASS'

Get Select Elements
    [Documentation]    获取第N个导航栏下拉元素
    [Arguments]    ${index}
    ${res}    Get Element Attribute    dom:document.querySelectorAll(".ant-menu-submenu-title")[${index}]    aria-expanded
    [Return]    ${res}

Confirm Cancel Alert
    [Documentation]    取消页面填写内容未保存跳走出现的弹窗
    Wait And Click Element    ${locatorB_subtraction_first_btn_cancel}
    Wait And Click Element    ${locatorB_subtraction_confirm_determine_btn}

Add Payment Cod Wait
    [Documentation]    添加 cod支付方式
    [Arguments]    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    add_payment_cod_py
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1

Del Payment Cod Wait
    [Documentation]    删除 cod支付方式
    [Arguments]    ${count}=10
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    del_payment_cod_py
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