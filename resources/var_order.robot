*** Variables ***
# content
${content_order_title}    全部
# locator
${order_list_btn}    dom:document.querySelectorAll("a[href='/order']")[0]    #.导航栏-订单 按钮
${order_all_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[2]    #.订单-全部 按钮
${order_already_pay_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[5]    #.订单-待付款 按钮
${order_delivered_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[8]    #.订单-待发货 按钮
${order_alerady_send_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[11]    #.订单-已发货 按钮
${order_alerady_mission_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[14]    #.订单-已完成 按钮
${order_not_payment_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[5]    #.订单-待付款 按钮
${order_alerady_cencel_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[17]    #.订单-已取消 按钮
${order_alerady_refund_btn}    dom:document.querySelectorAll(".ant-radio-button-wrapper span")[20]    #.订单-已退款 按钮
${order_detail_element}    dom:document.querySelectorAll(".header_left___3RMen span")[0]    #.订单详情顶部元素
${order_list_first_tr}    dom:document.querySelectorAll("table tbody tr")[0]    #.订单列表table第一个tr
${order_dateil_update_send}    dom:document.querySelectorAll(".header_left___2PRCj")[0]    #.订单详情-更新运单号
${order_dateil_cencel_send}    dom:document.querySelectorAll(".icon_cancel___miRJp")[0]    #.订单详情-取消本次发货
${order_list_search}    dom:document.querySelectorAll("button")[0]    #.订单列表搜索按钮
${order_list_searchs}    dom:document.querySelectorAll("button")[0]    #.订单列表搜索按钮
${order_list_api}    ${home_page}/api/order/list?start_create_time=1521561600&end_create_time=1529596799&page=0&size=20    #.订单列表api
${order_list_export}    dom:document.querySelectorAll(".export___22t6f")[0]    #.订单列表 导出按钮
${start_time}     1521561600    #.开始时间
${end_time}       1529596799    #.结束时间
