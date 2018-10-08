*** Variables ***
# content
${contentB_order_title}    全部

# locator
${locatorB_orderDealing_button_all}    dom:document.querySelectorAll(".ant-tabs-tab")[0]    # 待处理订单，全部
${locatorB_orderDealing_button_alreadyToDeliver}    dom:document.querySelectorAll(".ant-tabs-tab")[1]    # 待处理订单，待发货
${locatorB_orderDealing_button_delivered}    dom:document.querySelectorAll(".ant-tabs-tab")[2]    # 待处理订单，已发货
${locatorB_orderDealing_button_finished}    dom:document.querySelectorAll(".ant-tabs-tab")[3]    # 待处理订单，已完成



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