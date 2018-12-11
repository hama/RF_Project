*** Settings ***
Suite Setup          Customer Suite Setup
Suite Teardown       Customer Sutie Teardown
Test Setup           Customer Case Setup
Test Teardown        Customer Case Teardown
Force Tags           customer
Resource             ../../../resources/keywords/kw_common.robot

*** Test Cases ***
customer006
    [Documentation]    全部顾客列表显示注册用户
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Go To First Product C Interface
    Wait And Mouse Over    ${locatorC_customerRegister_icon_userIcon}
    Wait And Click Element    ${locatorC_customerRegister_link_userRegister}
    Customer Register C Interface    lily    jane    qazwsx123@qq.com    qazwsx123
    Wait And Click Element    ${locatorC_customerRegister_checkbox_checkboxRegister}
    Wait And Click Element    ${locatorC_customerRegister_button_RegisterBtn}
    Wait Until Page Contains Text    Congratulations! You have successfully registered
    Go To    https://admin.shoplazza.com/customers
    Reload Page And Start Ajax
    Wait Until Page Contains Text    lily jane

customer007
    [Documentation]    全部顾客列表显示订阅用户
    [tags]    P0    threshold
    Wait And Click Element    ${locatorB_customerMes_button_addCustomer}
    Add Customer B Interface
    Wait And Click Element    ${locatorB_customerNews_button_confirm}
    Wait Until Page Not Contains Locator    ${locatorB_customerNews_button_confirm}
    Wait And Click Element    ${locatorB_customerMes_tab_AllCustomer}
    Text Of Element Should Contain With Wait    ${locatorB_customerMes_list_firstCustomerEmail}    已订阅

customer008
    [Documentation]    全部顾客列表显示下单但未注册用户
    [Tags]    P0    threshold
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    ${locatorB_customerMes_list_firstCustomer}

customer012
    [Documentation]    顾客手机号显示区号
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_customerMes_button_addCustomer}
    Add Customer B Interface
    Wait And Click Element    ${locatorB_customerNews_button_confirm}
    Text Of Element Should Contain With Wait    ${locatorB_customerMes_list_firstCustomerPhone}    +86 13098765432

customer026
    [Documentation]    顾客列表上下翻页
    [Tags]    P0    threshold
    :FOR    ${ONE}    IN RANGE    30
    \    kwcustomer.add_customer_with_conf_py
    Reload Page And Start Ajax
    Sleep And Click Element    ${locatorB_customerMes_icon_paginationNext}
    Element Attribute Should Be Equal With Wait    ${locatorB_customerMes_text_paginationItem}    class    ant-pagination-item ant-pagination-item-1
    Sleep And Click Element    ${locatorB_customerMes_icon_paginationprev}
    Element Attribute Should Be Equal With Wait    ${locatorB_customerMes_text_paginationItem}    class    ant-pagination-item ant-pagination-item-1 ant-pagination-item-active

customer035
    [Documentation]    输入姓名搜索
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_customerMes_button_addCustomer}
    Add Customer B Interface
    Wait And Input Text    ${locatorB_customerNews_input_firstname}    测试名字搜索
    Wait And Input Text    ${locatorB_customerNews_input_lastname}    test001
    Wait And Click Element    ${locatorB_customerNews_button_confirm}
    Wait Until Page Not Contains Locator    ${locatorB_customerNews_button_confirm}
    Wait And Input Text    ${locatorB_customerMes_input_searchNameEailPhone}    测试名字搜索
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Text Of Element Should Contain With Wait    ${locatorB_customerMes_list_firstCustomerName}    测试名字搜索 test001

customer036
    [Documentation]    输入邮箱搜索
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_customerMes_button_addCustomer}
    Add Customer B Interface
    Wait And Input Text    ${locatorB_customerNews_input_email}    ceshiemail001@qq.com
    Wait And Click Element    ${locatorB_customerNews_button_confirm}
    Wait Until Page Not Contains Locator    ${locatorB_customerNews_button_confirm}
    Wait And Input Text    ${locatorB_customerMes_input_searchNameEailPhone}    ceshiemail001@qq.com
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Text Of Element Should Contain With Wait    ${locatorB_customerMes_list_firstCustomerEmail}    ceshiemail001@qq.com

customer037
    [Documentation]    输入手机号搜索
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_customerMes_button_addCustomer}
    Add Customer B Interface
    Wait And Input Text    ${locatorB_customerNews_input_phone}    18229476705
    Wait And Click Element    ${locatorB_customerNews_button_confirm}
    Wait Until Page Not Contains Locator    ${locatorB_customerNews_button_confirm}
    Wait And Input Text    ${locatorB_customerMes_input_searchNameEailPhone}    18229476705
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Text Of Element Should Contain With Wait    ${locatorB_customerMes_list_firstCustomerPhone}    18229476705

customer042
    [Documentation]    选择加入时间和结束时间一致搜索
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_customerMes_icon_anticonCalendar}
    Sleep    2
    ${yyyy}    ${mm}    ${dd}=    Get Time    year,month,day
    ${addTime}=    Evaluate    '${yyyy}' + '-' + '${mm}' + '-' + '${dd}'
    Wait And Input Text    ${locatorB_customerMes_input_addTime}    ${addTime}
    Wait And Input Text    ${locatorB_customerMes_input_EndTime}    ${addTime}
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Text Of Element Should Contain With Wait    ${locatorB_customerMes_list_firstCustomerTime}    ${addTime}

customer043
    [Documentation]    选中加入时间和结束时间不一致搜索
    [Tags]    P0    threshold
    Sleep    2
    ${addTime}=    Evaluate    '${2018}' + '-' + '${12}' + '-' + '${05}'
    ${yyyy}    ${mm}    ${dd}=    Get Time    year,month,day
    ${EndTime}=    Evaluate    '${yyyy}' + '-' + '${mm}' + '-' + '${dd}'
    Wait And Click Element    ${locatorB_customerMes_icon_anticonCalendar}
    Wait And Input Text    ${locatorB_customerMes_input_EndTime}    ${EndTime}
    Wait And Input Text    ${locatorB_customerMes_input_addTime}    ${addTime}
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Text Of Element Should Contain With Wait    ${locatorB_customerMes_list_firstCustomerTime}    ${EndTime}

customer044
    [Documentation]     选择已订阅搜索
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_customerMes_button_addCustomer}
    Add Customer B Interface
    Wait And Click Element    ${locatorB_customerNews_checkbox_purchased}
    Wait And Click Element    ${locatorB_customerNews_button_confirm}
    Wait Until Page Not Contains Locator    ${locatorB_customerNews_button_confirm}
    Wait And Click Element    ${locatorB_customerMes_select_Ifsubscribe}
    Wait And Click Element    ${locatorB_customerMes_select_subscribed}
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Text Of Element Should Contain With Wait    ${locatorB_customerMes_list_firstCustomerEmail}    已订阅

customer045
    [Documentation]     选择未订阅搜索
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_customerMes_button_addCustomer}
    Add Customer B Interface
    Wait And Click Element    ${locatorB_customerNews_checkbox_purchased}
    Wait And Click Element    ${locatorB_customerNews_button_confirm}
    Wait Until Page Not Contains Locator    ${locatorB_customerNews_button_confirm}
    Wait And Click Element    ${locatorB_customerMes_select_Ifsubscribe}
    Wait And Click Element    ${locatorB_customerMes_select_Nosubscribe}
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Text Of Element Should Be Equal With Wait    ${locatorB_customerMes_list_firstCustomerEmail}    ceshi001test@qq.com

customer046
    [Documentation]    地区选择国家搜索
    [Tags]    P0    threshold
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_customerMes_select_country}
    Wait And Click Element    ${locatorB_customerMes_select_selectChina}
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Text Of Element Should Be Equal With Wait    ${locatorB_customerMes_list_firstCustomerCountry}    China Beijing

customer047
    [Documentation]    地区选择国家地区搜索
    [Tags]    P0    threshold
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_customerMes_select_country}
    Wait And Click Element    ${locatorB_customerMes_select_selectChina}
    Wait And Click Element    ${locatorB_customerMes_select_selectBeiJing}
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Text Of Element Should Be Equal With Wait    ${locatorB_customerMes_list_firstCustomerCountry}    China Beijing

customer048
    [Documentation]    输入起始金额为[0,+∞]搜索
    [Tags]    P0    threshold
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Wait And Input Text    ${locatorB_customerMes_input_minTotal}    0
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Text Of Element Should Be Equal With Wait    ${locatorB_customerMes_list_firstCustomerTotal}    0.0 USD

customer062
    [Documentation]     全部页面重置搜索条件
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_customerMes_button_addCustomer}
    Add Customer B Interface
    Wait And Click Element    ${locatorB_customerNews_checkbox_purchased}
    Wait And Click Element    ${locatorB_customerNews_button_confirm}
    Wait Until Page Not Contains Locator    ${locatorB_customerNews_button_confirm}
    Wait And Click Element    ${locatorB_customerMes_select_Ifsubscribe}
    Wait And Click Element    ${locatorB_customerMes_select_Nosubscribe}
    Wait And Click Element    ${locatorB_customerMes_button_searchBth}
    Sleep    2
    Wait And Click Element    ${locatorB_customerMes_button_resetBth}
    Text Of Element Should contain With Wait    ${locatorB_customerMes_list_firstCustomerEmail}[1]    已订阅

 customer063
     [Documentation]     订购顾客页面重置搜索条件
     [Tags]    P0    threshold
     Wait And Click Element    ${locatorB_customerMes_button_addCustomer}
     Add Customer B Interface
     Wait And Click Element    ${locatorB_customerNews_button_confirm}
     Wait Until Page Not Contains Locator    ${locatorB_customerNews_button_confirm}
     Wait And Click Element    ${locatorB_customerMes_tab_subscribeCustomer}
     Wait And Input Text    ${locatorB_customerMes_input_searchNameEailPhone}    ceshi001
     Wait And Click Element    ${locatorB_customerMes_button_searchBth}
     Sleep    2
     Wait And Click Element    ${locatorB_customerMes_button_resetBth}
     Text Of Element Should contain With Wait    ${locatorB_customerMes_list_firstCustomerName}[1]    firstname lastname
     Element Attribute Should Be Equal With Wait    ${locatorB_customerMes_select_defaultSubscribe}    title    是

#customer068
#    [Documentation]    连续超过5次导出
#    [Tags]    P0    threshold
#    :FOR    ${ONE}    IN RANGE    6
#     \    kwcustomer.add_customer_with_conf_py
#     Reload Page And Start Ajax
#    :FOR    ${ONE}    IN RANGE    6
#     \    Wait And Click Element    ${locatorB_customerMes_icon_fileExport}
#     \    Wait And Input Text    ${locatorB_fileExport_input_email}    1424468248@qq.com
#     \    Wait And Click Element    ${locatorB_fileExport_button_confirmBtn}
#     \    Sleep    2
#     Wait Until Page Contains Text    已有5个文件正在导出，请5分钟后再试
