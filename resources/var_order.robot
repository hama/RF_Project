*** Variables ***
# api
# content
${content_order_title}    全部
# locator
${order_list_btn}    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[2]/a    #.导航栏-订单 按钮
${order_all_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[1]/span[2]    #.订单-全部 按钮
${order_already_pay_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[2]/span[2]    #.订单-已支付 按钮
${order_delivered_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[3]/span[2]    #.订单-待发货 按钮
${order_alerady_send_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[4]/span[2]    #.订单-已发货 按钮
${order_alerady_mission_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[5]/span[2]    #.订单-已完成 按钮
${order_not_payment_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[6]/span[2]    #.订单-未支付 按钮
${order_alerady_cencel_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[7]/span[2]    #.订单-已取消 按钮
${order_alerady_refund_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[7]/span[2]    #.订单-已退款 按钮
${order_detail_element}    //*[@id="root"]/div/div/div[1]/div[2]/div[1]/div/div[1]    #.订单详情顶部元素
${order_list_first_tr}    dom:document.querySelectorAll("table tbody tr")[0]    #.订单列表table第一个tr
${order_dateil_update_send}    class:header_left___2PRCj    #.订单详情-更新运单号
${order_dateil_cencel_send}    dom:document.querySelectorAll(".icon_cancel___miRJp")[0]    #.订单详情-取消本次发货
${order_list_search}    //*[@id="dj"]/div/div[3]/div/div[3]/button[1]    #.订单列表搜索按钮
${order_list_api}    http://admin1024.shoplazza.com/api/order/list?start_create_time=1521561600&end_create_time=1529596799&page=0&size=20    #.订单列表api
${order_list_export}    //*[@id="dj"]/div/div[1]/a    #.订单列表 导出按钮
${start_time}     1521561600    #.开始时间
${end_time}       1529596799    #.结束时间
