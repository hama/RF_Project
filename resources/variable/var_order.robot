*** Variables ***
# content
${contentB_order_title}    全部

# locatorB_orderDealing
${locatorB_orderDealing_button_all}    dom:document.querySelectorAll(".ant-tabs-tab")[0]    # 待处理订单，全部
${locatorB_orderDealing_button_toDeliver}    dom:document.querySelectorAll(".ant-tabs-tab")[1]    # 待处理订单，待发货
${locatorB_orderDealing_button_delivered}    dom:document.querySelectorAll(".ant-tabs-tab")[2]    # 待处理订单，已发货
${locatorB_orderDealing_button_finished}    dom:document.querySelectorAll(".ant-tabs-tab")[3]    # 待处理订单，已完成

${locatorB_orderDealing_text_firstOrder_orderNum}    dom:document.querySelectorAll(".ant-table-row")[0].querySelectorAll("td")[1]    #待处理订单第一个订单的，订单编号
${locatorB_orderDealing_text_firstOrder_date}    dom:document.querySelectorAll(".ant-table-row")[0].querySelectorAll("td")[2]    #待处理订单第一个订单的，日期
${locatorB_orderDealing_text_firstOrder_receiverName}    dom:document.querySelectorAll(".ant-table-row")[0].querySelectorAll("td")[3]    #待处理订单第一个订单的，收货人姓名
${locatorB_orderDealing_text_firstOrder_paymentMethod}    dom:document.querySelectorAll(".ant-table-row")[0].querySelectorAll("td")[4]    #待处理订单第一个订单的，支付方式
${locatorB_orderDealing_text_firstOrder_paymentStatus}    dom:document.querySelectorAll(".ant-table-row")[0].querySelectorAll("td")[5]    #待处理订单第一个订单的，支付状态
${locatorB_orderDealing_text_firstOrder_shippingStatus}    dom:document.querySelectorAll(".ant-table-row")[0].querySelectorAll("td")[6]    #待处理订单第一个订单的，物流状态
${locatorB_orderDealing_text_firstOrder_orderStatus}    dom:document.querySelectorAll(".ant-table-row")[0].querySelectorAll("td")[7]    #待处理订单第一个订单的，订单状态
${locatorB_orderDealing_text_firstOrder_orderSumPrice}    dom:document.querySelectorAll(".ant-table-row")[0].querySelectorAll("td")[8]    #待处理订单第一个订单的，订单总价

${locatorB_orderDealing_text_listShippingStatus}    dom:document.querySelectorAll('td[class="show"]')    #待处理订单，物流状态list

${locatorB_orderDealing_text_paymentMethod}    dom:document.querySelectorAll('label[for="payment_method"]')    # 支付方式
${locatorB_orderDealing_text_financialStatus}    dom:document.querySelectorAll('label[for="financial_status"]')    # 支付状态
${locatorB_orderDealing_text_shippingStatus}    dom:document.querySelectorAll('label[for="fulfillment_status"]')    # 物流状态
${locatorB_orderDealing_text_orderStatus}    dom:document.querySelectorAll('label[for="status"]')    # 订单状态


${locatorB_orderDealing_select_paymentMethod}    dom:document.querySelectorAll('[id="payment_method"]')    # 支付方式select
${locatorB_orderDealing_select_financialStatus}    dom:document.querySelectorAll('[id="financial_status"]')    # 支付状态select
${locatorB_orderDealing_select_shippingStatus}    dom:document.querySelectorAll('[id="fulfillment_status"]')    # 物流状态select
${locatorB_orderDealing_select_orderStatus}    dom:document.querySelectorAll('[id="status"]')    # 订单状态select







# locatorB_orderUndeal
${locatorB_orderUndeal_button_all}    dom:document.querySelectorAll(".ant-tabs-tab")[0]    # 未完成订单，全部
${locatorB_orderUndeal_button_toPay}    dom:document.querySelectorAll(".ant-tabs-tab")[1]    # 未完成订单，待支付
${locatorB_orderUndeal_button_canceled}    dom:document.querySelectorAll(".ant-tabs-tab")[2]    # 未完成订单，已取消



${locatorB_order_already_pay_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[5]    #.订单-待付款 按钮
${locatorB_order_delivered_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[8]    #.订单-待发货 按钮
${locatorB_order_alerady_send_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[11]    #.订单-已发货 按钮
${locatorB_order_alerady_mission_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[14]    #.订单-已完成 按钮
${locatorB_order_not_payment_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[5]    #.订单-待付款 按钮
${locatorB_order_alerady_cencel_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[17]    #.订单-已取消 按钮
${locatorB_order_alerady_refund_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[20]    #.订单-已退款 按钮
${locatorB_order_detail_element}    dom:document.querySelectorAll(".header_left___3RMen span")[0]    #.订单详情顶部元素
${locatorB_order_list_first_tr}    dom:document.querySelectorAll("table tbody tr")[0]    #.订单列表table第一个tr
${locatorB_order_dateil_update_send}    dom:document.querySelectorAll(".header_left___2PRCj")[0]    #.订单详情-更新运单号
${locatorB_order_dateil_cencel_send}    dom:document.querySelectorAll(".icon_cancel___miRJp")[0]    #.订单详情-取消本次发货
${locatorB_order_list_search}    dom:document.querySelectorAll("button")[0]    #.订单列表搜索按钮
${locatorB_order_list_api}    ${home_page}/api/order/list?start_create_time=1521561600&end_create_time=1529596799&page=0&size=20    #.订单列表api
${locatorB_order_list_export}    dom:document.querySelectorAll(".export___22t6f")[0]    #.订单列表 导出按钮
${locatorB_start_time}     1521561600    #.开始时间
${locatorB_end_time}       1529596799    #.结束时间
${locatorB_order_all}    dom:document.querySelectorAll(".ant-radio-button-wrapper-checked")    #.订单显示所有

# order element
${locatorB_order_first_btn}    dom:document.querySelectorAll('button')[1]    #.订单模块的button[1]
${locatorB_order_two_btn}    dom:document.querySelectorAll("button")[2]    #. 订单模块的button[2]
${locatorB_order_three_btn}    dom:document.querySelectorAll('button')[3]    #. 订单模块的buuton[3]
${locatorB_order_four_btn}    dom:document.querySelectorAll("button")[4]    #. 订单模块的button[4]
${locatorB_order_detail_nums}    dom:document.querySelectorAll("#shipping_code")[0]    #.订单详情点击更新运单号的输入运单号输入框
${locatorB_order_waybill_information}    dom:document.querySelectorAll(".shipping_code___3Gh0j")[0]    #.订单详情的 运单信息
${locatorB_order_close_btn}    class:ant-modal-close-x    #. 订单详情弹框的关闭按钮
${locatorB_order_settint_status}    .icon_custom_left___GO944    #.订单详情设置订单状态元素
${locatorB_order_export}    class:ant-modal-body    #.订单导出元素
${locatorB_order_list_input}    dom:document.querySelectorAll(".ant-input")[4]    #. 订单列表 订单编号／顾客姓名 输入框

# order export
${locatorB_order_export_error}    dom:document.querySelectorAll(".ant-form-explain")[0]    #.订单导出错误提示元素
${locatorB_order_export_email}    dom:document.querySelectorAll("#email")[0]    #.订单导出邮箱输入框

# order list
${locatorB_order_list_minprice}    dom:document.querySelectorAll("input[placeholder='最低金额']")[0]    #.订单列表 最小金额输入框
${locatorB_order_list_maxprice}    dom:document.querySelectorAll("input[placeholder='最高金额']")[0]    #.订单列表 最大金额输入框

# order list time