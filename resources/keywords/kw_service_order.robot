*** Settings ***
Documentation     service order keyword

Resource          kw_common.robot

*** keyword ***
Service Order Suite Setup
    [Documentation]
    Login With Default User
    kwproduct.del_all_products_py

Service Order Suite Teardown
    [Documentation]
    kwproduct.del_all_products_py
    Close Test Suite Browser

Service Order Case Setup
    [Documentation]
    Go To Customer Service Order Page

Select To Dealing Order Tag
    Wait And Click Element    ${locatorB_orderService_tab_dealingOrder}
    Sleep    2

Select To Inhand Order Tag
    Wait And Click Element    ${locatorB_orderService_tab_dealingInHand}
    Sleep    2

Select To Finish Order Tag
    Wait And Click Element    ${locatorB_orderService_tab_dealingFinish}
    Sleep    2

order013
    [Documentation]    验证COD支付待发货的订单，点击取消订单有弹窗提示，提示内容正确
    kworder.add_deading_order_with_delivering_status_py
    Go To Dealing Order Page
    Reload Page And Start Ajax
    Sleep    2
    Sleep And Click Element    ${locatorB_orderDealing_text_firstOrder_orderNum}
    Sleep And Click Element    ${locatorB_orderDetail_button_cancelOrder}
    Wait Until Page Contains Text    该操作无法撤回，请确认是否取消
    Sleep And Click Element    ${locatorB_orderDetail_icon_popUpClose}
    Go To Customer Service Order Page

order014
    [Documentation]    验证COD支付部分发货的订单，点击取消订单有弹窗提示，提示内容正确
    kworder.add_deading_order_with_some_delivered_status_py
    Go To Dealing Order Page
    Reload Page And Start Ajax
    Sleep    2
    Sleep And Click Element    ${locatorB_orderDealing_text_firstOrder_orderNum}
    Sleep And Click Element    ${locatorB_orderDetail_button_cancelOrder}
    Wait Until Page Contains Text    该订单已支付或已有发货物品，现在取消订单将会生成售后订单，对应的退款/物流操作请到售后订单处理，该操作无法撤回，请确认是否取消
    Sleep And Click Element    ${locatorB_orderDetail_icon_popUpClose}
    Go To Customer Service Order Page

order015
    [Documentation]    验证COD支付全部发货的订单，点击取消订单有弹窗提示，提示内容正确
    kworder.add_deading_order_with_all_delivered_status_py
    Go To Dealing Order Page
    Reload Page And Start Ajax
    Sleep    2
    Sleep And Click Element    ${locatorB_orderDealing_text_firstOrder_orderNum}
    Sleep And Click Element    ${locatorB_orderDetail_button_cancelOrder}
    Wait Until Page Contains Text    该订单已支付或已有发货物品，现在取消订单将会生成售后订单，对应的退款/物流操作请到售后订单处理，该操作无法撤回，请确认是否取消
    Sleep And Click Element    ${locatorB_orderDetail_icon_popUpClose}
    Go To Customer Service Order Page

order020
    [Documentation]    验证B端COD支付 部分发货订单取消订单后生成售后订单
    kworder.add_deading_order_with_some_delivered_status_py
    Go To Dealing Order Page
    Reload Page And Start Ajax
    Sleep    2
    Sleep And Click Element    ${locatorB_orderDealing_text_firstOrder_orderNum}
    ${dealingorderNumber}=    Wait And Get Text    ${locatorB_orderDetail_text_orderNum}
    Wait And Click Element Then Cancel    ${locatorB_orderDetail_button_cancelOrder}
    Go To Customer Service Order Page
    Reload Page And Start Ajax
    Sleep    2
    ${serviceorderNumber}=    Wait And Get Text    ${locatorB_orderService_list_firstNumber}
    Should Be True    '${dealingorderNumber}'=='${serviceorderNumber}'

order021
    [Documentation]    验证B端COD支付 全部发货订单取消订单后生成售后订单
    kworder.add_deading_order_with_all_delivered_status_py
    Go To Dealing Order Page
    Reload Page And Start Ajax
    Sleep    2
    Sleep And Click Element    ${locatorB_orderDealing_text_firstOrder_orderNum}
    ${dealingorderNumber}=    Wait And Get Text    ${locatorB_orderDetail_text_orderNum}
    Wait And Click Element Then Cancel    ${locatorB_orderDetail_button_cancelOrder}
    Go To Customer Service Order Page
    Reload Page And Start Ajax
    Sleep    2
    ${serviceorderNumber}=    Wait And Get Text    ${locatorB_orderService_list_firstNumber}
    Should Be True    '${dealingorderNumber}'=='${serviceorderNumber}'

order025
    [Documentation]    验证COD支付B端全部确认收货后，订单详情页面订单编号后面有进行售后按钮可点击
    kworder.add_deading_order_with_finished_status_py
    Go To Dealing Order Page
    Reload Page And Start Ajax
    Sleep    2
    Sleep And Click Element    ${locatorB_orderDealing_text_firstOrder_orderNum}
    Sleep And Click Element    ${locatorB_orderDetail_button_postSale}
    Wait Until Page Contains Text    是否对该订单进行售后操作？该操作无法撤回，请确认是否取消
    Sleep And Click Element    ${locatorB_orderDetail_icon_popUpClose}
    Go To Customer Service Order Page

order027
    [Documentation]    验证订单详情页面确认进行售后，售后订单页面生成一条对应售后数据
    kworder.add_deading_order_with_finished_status_py
    Go To Dealing Order Page
    Reload Page And Start Ajax
    Sleep    2
    Sleep And Click Element    ${locatorB_orderDealing_text_firstOrder_orderNum}
    ${dealingorderNumber}=    Wait And Get Text    ${locatorB_orderDetail_text_orderNum}
    Wait And Click Element Then Cancel    ${locatorB_orderDetail_button_postSale}
    Go To Customer Service Order Page
    Reload Page And Start Ajax
    Sleep    2
    ${serviceorderNumber}=    Wait And Get Text    ${locatorB_orderService_list_firstNumber}
    Should Be True    '${dealingorderNumber}'=='${serviceorderNumber}'

order028
    [Documentation]    验证订单详情页面取消进行售后，售后订单页面无对应售后数据
    kworder.add_deading_order_with_finished_status_py
    Go To Dealing Order Page
    Reload Page And Start Ajax
    Sleep    2
    Sleep And Click Element    ${locatorB_orderDealing_text_firstOrder_orderNum}
    ${dealingorderNumber}=    Wait And Get Text    ${locatorB_orderDetail_text_orderNum}
    Wait And Click Element Then Confirm    ${locatorB_orderDetail_button_postSale}
    Go To Customer Service Order Page
    Reload Page And Start Ajax
    Sleep    2
    ${serviceorderNumber}=    Wait And Get Text    ${locatorB_orderService_list_firstNumber}
    Should Be True    '${dealingorderNumber}'!='${serviceorderNumber}'

order035
    [Documentation]    验证待处理的售后订单页面有取消售后按钮可点击
    Wait And Click Element    ${locatorB_orderService_list_orderfirst}
    Sleep And Click Element    ${locatorB_serviceDetail_button_detailCard}
    Wait Until Page Contains Text    确定要取消当前订单的售后处理吗？
    Sleep And Click Element    ${locatorB_orderDetail_icon_popUpClose}
    Go To Customer Service Order Page

order036
    [Documentation]    验证待处理的售后订单页面确认取消售后，删除该售后订单
    ${befortNumber}=    Wait And Get Text    ${locatorB_orderService_list_firstNumber}
    Wait And Click Element    ${locatorB_orderService_list_orderfirst}
    Wait And Click Element Then Confirm    ${locatorB_serviceDetail_button_detailCard}
    Go To Customer Service Order Page
    Select To Dealing Order Tag
    Wait Until Page Not Contains Text    ${befortNumber}
    Select To Inhand Order Tag
    Wait Until Page Not Contains Text    ${befortNumber}
    Select To Finish Order Tag
    Wait Until Page Not Contains Text    ${befortNumber}