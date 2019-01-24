*** Settings ***
Suite Setup       Dealing Order Suite Setup
Suite Teardown    Dealing Order Suite Teardown
Test Setup        Dealing Order Case Setup
Test Teardown     Teardown Test Case
Force Tags        Dealing Order
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
order001
    [Documentation]    验证B端订单菜单栏可正常展开
    [Tags]    P0    threshold
    Text Of Element Should Contain With Wait    ${locatorB_order_dealing}    待处理订单
    Text Of Element Should Contain With Wait    ${locatorB_order_undeal}    未完成订单
    Text Of Element Should Contain With Wait    ${locatorB_order_postSale}    售后订单

order002
	[Documentation]     验证在菜单栏点击订单时，默认选中并进入订单的第一个子菜单：待处理订单
    [tags]    P0    threshold    smoke
    ${text00}    Wait And Get Text    ${locatorB_orderDealing_button_toDeliver}
    Should Be Equal    ${text00}    待发货

order004
    [Documentation]     验证售后订单列表可正常进入
    [tags]    P0    threshold
    Wait And Click Element    ${locatorB_order_postSale}
    Wait Until Page Contains Text    售后订单
    Wait Until Page Contains Text    售后时间

order009
    [Documentation]     验证C端购买商品选择COD支付方式，并且提交成功后会在B端待处理订单中生成新订单
    [tags]    P0    threshold    smoke
    ${count00}    kworder.get_dealing_order_count_py
    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${count01}    kworder.get_dealing_order_count_py
	${difference}    Evaluate    ${count01}-${count00}
	Should Be Equal    ${difference}    ${1}

order014
    [Documentation]    验证进入待处理订单列表时，默认选择第一个tab，全部
    [tags]    P0
    kworder.add_deading_order_with_delivering_status_py
    Reload Page And Start Ajax
    Element Attribute Should Be Equal With Wait    ${locatorB_orderDealing_button_all}    class    ant-tabs-tab-active ant-tabs-tab

order015
    [Documentation]     验证待处理订单列表中，可通过切换tab查看未发货的订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    kworder.add_deading_order_with_some_delivered_status_py
    kworder.add_deading_order_with_all_delivered_status_py
    Reload Page And Start Ajax
    Select To Deliver Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[0]
    ${text01} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[1]
    Should Be Equal    ${text00}    部分发货
    Should Be Equal    ${text01}    待发货

order016
    [Documentation]     验证待处理订单列表中，可通过切换tab查看已发货的订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_all_delivered_status_py
    kworder.add_deading_order_with_some_finished_status_py
    kworder.add_deading_order_with_some_delivered_status_py
    Reload Page And Start Ajax
    Select Delivered Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[0]
    ${text01} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[1]
    Should Be Equal    ${text00}    部分完成
    Should Be Equal    ${text01}    全部发货

order017
    [Documentation]     验证待处理订单列表中，可通过切换tab查看已完成的订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_all_delivered_status_py
    kworder.add_deading_order_with_finished_status_py
    Reload Page And Start Ajax
    Select Finished Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[0]
    Should Be Equal    ${text00}    全部完成

order034
    [Documentation]    验证待处理订单列表中，搜索按钮可点击
    [Tags]    P0
    kworder.add_deading_order_with_delivering_status_py
    ${orderNum}=    kworder.get_latest_dealing_order_num_py
    Wait And Input Text    ${locatorB_order_input_searchText}    ${orderNum}
    Wait And Click Element    ${locatorB_order_button_searchBtn}
    Text Of Element Should Be Equal With Wait    ${locatorB_orderDealing_text_firstOrder_orderNum}    ${orderNum}

order039
    [Documentation]     验证待处理订单列表中，订单编号显示为checkout发起订单时的订单编号
    [tags]    P0    threshold    smoke
    ${count00}    kworder.get_dealing_order_count_py
    ${order_token}    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${count01}    kworder.get_dealing_order_count_py
	${difference}    Evaluate    ${count01}-${count00}
	Should Be Equal    ${difference}    ${1}
	${order_num00}    kworder.get_latest_dealing_order_num_py
	${order_num01}    kworder.get_order_num_by_order_token_py    ${order_token}
	Should Be Equal    ${order_num00}    ${order_num01}

order040
    [Documentation]     验证待处理订单列表中，订单栏日期显示为在checkout生成订单的时间
    [tags]    P0    threshold    smoke
    ${order_token}    kworder.add_dealing_order_with_products_py
	# 创建订单的时间戳
    ${createtime1}    Get Time
    Sleep    5
    Reload Page And Start Ajax
    ${tmptime} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_date}
    ${createtime2} =    Convert Date    ${tmptime}    result_format=%Y-%m-%d %H:%M:%S
    # 通过订单号，判断是否创建了一个新的订单
	${order_num00}    kworder.get_latest_dealing_order_num_py
	${order_num01}    kworder.get_order_num_by_order_token_py    ${order_token}
	Should Be Equal    ${order_num00}    ${order_num01}
	${result} =    lib_utils.compare_time_py    ${createtime1}    ${createtime2}
	${status} =    Evaluate    0<${result}<30
	Should Be Equal    '${status}'    'True'

order041
    [Documentation]     验证待处理订单列表中，订单栏顾客姓名显示为在checkout下单时填写的顾客姓名
    [tags]    P0    threshold    smoke
    &{shipping_address} =    Create Dictionary    first_name=auto    last_name=test
    &{place_order_data} =    Create Dictionary    shipping_address=&{shipping_address}
    &{conf} =    Create Dictionary    place_order_data=&{place_order_data}
    kworder.add_deading_order_with_conf_py    ${conf}
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_receiverName}
	Should Be Equal    ${text}    auto test

order042
    [Documentation]     验证待处理订单列表中，订单使用COD支付时，支付方式显示为：COD
    [tags]    P0    threshold    smoke
    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_paymentMethod}
	Should Be Equal    ${text}    COD支付

order046
    [Documentation]     验证在C端使用COD完成支付的订单，在待处理订单列表中的支状态显示为：待支付
    [tags]    P0    threshold    smoke
    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_paymentStatus}
	Should Be Equal    ${text}    待支付

order047
    [Documentation]     验证已经完成支付的新订单，待处理订单列表中，物流状态显示为：待发货
    [tags]    P0    threshold    smoke
    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_shippingStatus}
	Should Be Equal    ${text}    待发货

order048
    [Documentation]     验证在订单详情将此订单部分商品发货时，订单列表中显示的物流状态为：部分发货
    [tags]    P0
    kworder.add_deading_order_with_some_delivered_status_py
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_shippingStatus}
	Should Be Equal    ${text}    部分发货

order052
    [Documentation]     验证订单未确认收货前，待处理订单列表中订单住状态显示为：进行中
    [tags]    P0    threshold    smoke
    kworder.add_dealing_order_with_products_py
    Reload Page And Start Ajax
    ${text} =    Sleep And Get Text    ${locatorB_orderDealing_text_firstOrder_orderStatus}
	Should Be Equal    ${text}    进行中

order055
    [Documentation]     验证待处理订单列表中，未发货栏下含有搜索框：支付方式、支付状态、物流状态
    [tags]    P0    threshold    smoke
    Select To Deliver Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_paymentMethod}
    ${text01} =    Wait And Get Text    ${locatorB_orderDealing_text_financialStatus}
    ${text02} =    Wait And Get Text    ${locatorB_orderDealing_text_shippingStatus}
	Should Be Equal    ${text00}    支付方式
	Should Be Equal    ${text01}    支付状态
	Should Be Equal    ${text02}    物流状态

order065
    [Documentation]     验证待处理订单列表，已发货栏下含有搜索框：支付方式、支付状态、物流状态
    [tags]    P0    threshold    smoke
    Select Delivered Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_paymentMethod}
    ${text01} =    Wait And Get Text    ${locatorB_orderDealing_text_financialStatus}
    ${text02} =    Wait And Get Text    ${locatorB_orderDealing_text_shippingStatus}
    Should Be Equal    ${text00}    支付方式
    Should Be Equal    ${text01}    支付状态
    Should Be Equal    ${text02}    物流状态

order085
    [Documentation]     验证待处理订单列表，未发货栏下，只显示未发货和部分发货的订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    kworder.add_deading_order_with_some_delivered_status_py
    kworder.add_deading_order_with_all_delivered_status_py
    kworder.add_deading_order_with_some_finished_status_py
    kworder.add_deading_order_with_finished_status_py
    Reload Page And Start Ajax
    Select To Deliver Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[0]
    ${text01} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[1]
    Should Be Equal    ${text00}    部分发货
    Should Be Equal    ${text01}    待发货

order087
    [Documentation]     验证待处理订单列表，已发货栏下，只显示全部发货和部分完成的订单
    [tags]    P0    threshold    smoke
    kworder.add_deading_order_with_delivering_status_py
    kworder.add_deading_order_with_some_delivered_status_py
    kworder.add_deading_order_with_all_delivered_status_py
    kworder.add_deading_order_with_some_finished_status_py
    kworder.add_deading_order_with_finished_status_py
    Reload Page And Start Ajax
    Select Delivered Dealing Order Tag
    ${text00} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[0]
    ${text01} =    Wait And Get Text    ${locatorB_orderDealing_text_listShippingStatus}[1]
    Should Be Equal    ${text00}    部分完成
    Should Be Equal    ${text01}    全部发货





##周莉编写
#order045
#    [Documentation]    验证在C端使用线上支付支付成功的订单，待处理顶大列表中，支付状态显示为已支付
#    [Tags]    P0
#    kworder.add_deading_order_with_finished_status_py
#    Reload Page And Start Ajax
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderDealing_text_firstOrder_paymentStatus}    已支付
#
#order049
#    [Documentation]    验证在订单详情中将此订单所有商品发货后，订单列表中显示的物流状态为：全部发货
#    [Tags]    P0
#    kworder.add_deading_order_with_all_delivered_status_py
#    Reload Page And Start Ajax
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderDealing_text_firstOrder_shippingStatus}    全部发货
#
#order050
#    [Documentation]    验证在订单详情中将此订单商品全部分开发货并且部分商品确认收货后，订单列表中显示的物流状态为：部分完成
#    [Tags]    P0
#    kworder.add_deading_order_with_some_finished_status_py
#    Reload Page And Start Ajax
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderDealing_text_firstOrder_shippingStatus}    部分完成
#
#order051
#    [Documentation]    验证在订单详情中将此订单商品发货后全部确认收货，订单列表中的物流状态为：全部完成
#    [Tags]    P0
#    kworder.add_deading_order_with_finished_status_py
#    Reload Page And Start Ajax
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderDealing_text_firstOrder_shippingStatus}    全部完成
#
#order053
#    [Documentation]     验证订单详情确认收货后，待处理订单列表中，订单状态显示为：已完成
#    [Tags]    P0
#    kworder.add_deading_order_with_finished_status_py
#    Reload Page And Start Ajax
#    Text Of Element Should Be Equal With Wait    ${locatorB_orderDealing_text_firstOrder_orderStatus}    已完成
#
#order056
#    [Documentation]     验证待处理订单列表，未发货栏下，支付方式筛选框可展开以及筛选项显示
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_orderDealing_button_toDeliver}
#    Reload Page And Start Ajax
#    Sleep And Click Element    ${locatorB_orderDealing_select_paymentMethod}
#    Wait Until Page Contains Text    全部
#    Wait Until Page Contains Text    线上支付
#    Wait Until Page Contains Text    COD支付
#
#order057
#    [Documentation]    验证待处理订单列表，未发货栏下，支付状态筛选框可展开以及筛选项显示
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_orderDealing_button_toDeliver}
#    Reload Page And Start Ajax
#    Sleep And Click Element    ${locatorB_orderDealing_select_financialStatus}
#    Wait Until Page Contains Text    全部
#    Wait Until Page Contains Text    待支付
#    Wait Until Page Contains Text    已支付
#
#order058
#    [Documentation]    验证待处理订单列表，未发货栏下，物流状态筛选框可展开以及筛选项显示
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_orderDealing_button_toDeliver}
#    Reload Page And Start Ajax
#    Sleep And Click Element    ${locatorB_orderDealing_select_shippingStatus}
#    Wait Until Page Contains Text    全部
#    Wait Until Page Contains Text    待发货
#    Wait Until Page Contains Text    部分发货
#
#order075
#    [Documentation]    验证待处理订单列表，已完成栏下含有搜索框：支付方式、物流状态
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_orderDealing_button_finished}
#    Reload Page And Start Ajax
#    Sleep And Click Element    ${locatorB_orderDealing_select_paymentMethod}
#    Wait Until Page Contains Text    线上支付
#    Sleep And Click Element    ${locatorB_orderDealing_select_shippingStatus}
#    Wait Until Page Contains Text    全部发货
#
#order076
#    [Documentation]    验证待处理订单列表，已完成栏下，支付方式筛选框可展开以及筛选项展示
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_orderDealing_button_finished}
#    Reload Page And Start Ajax
#    Sleep And Click Element    ${locatorB_orderDealing_select_paymentMethod}
#    Wait Until Page Contains Text    全部
#    Wait Until Page Contains Text    线上支付
#    Wait Until Page Contains Text    COD支付
#
#order077
#    [Documentation]     验证待处理订单列表，已完成栏下，物流状态筛选框可展开以及筛选项展示
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_orderDealing_button_finished}
#    Reload Page And Start Ajax
#    Sleep And Click Element    ${locatorB_orderDealing_select_shippingStatus}
#    Wait Until Page Contains Text    全部
#    Wait Until Page Contains Text    待发货
#    Wait Until Page Contains Text    部分发货
#    Wait Until Page Contains Text    全部发货
#    Wait Until Page Contains Text    部分完成
#    Wait Until Page Contains Text    全部完成
#    Wait Until Page Contains Text    无
#    Wait Until Page Contains Text    已取消
#
#order091
#    [Documentation]    验证待处理订单列表中，页脚左边的数量显示为：当前列表中订单总数
#    [Tags]    P0
#    Reload Page And Start Ajax
#    Sleep    10
#    ${orderCount}=   kworder.get_dealing_order_count_py
#    ${orderCountStr}=    Convert To String    ${orderCount}
#    Text Of Element Should Contain With Wait    ${locatorB_orderDealing_items_listNumber}    ${orderCountStr}
#
#order093
#    [Documentation]    验证待处理订单列表中，可切换每页显示的订单条数
#    [Tags]    P0
#    Reload Page And Start Ajax
#    Wait And Click Element    ${locatorB_orderDealing_items_listChangePage}
#    Wait And Click Element    ${locatorB_orderDealing_items_selectPage}[1]
#    Sleep    10
#    ${orderCount}=    Get Element Count    ${locatorB_orderDealing_items_listOrder}
#    Should Be True    $orderCount<=20















