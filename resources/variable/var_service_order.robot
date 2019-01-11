*** Settings ***
Resource          var_common.robot

*** Variables ***
# locatorB_orderService
${locatorB_orderService_tab_dealingOrder}    dom:document.querySelectorAll('[role="tab"]')[0]    # 售后订单 - 待处理tab
${locatorB_orderService_tab_dealingInHand}    dom:document.querySelectorAll('[role="tab"]')[1]    # 售后订单 - 处理中tab
${locatorB_orderService_tab_dealingFinish}    dom:document.querySelectorAll('[role="tab"]')[2]    # 售后订单 - 已完成tab

${locatorB_orderService_input_orderSearch}    dom:document.querySelectorAll('[id="post_sale_input"]')[0]    # 售后订单 - 搜索输入框
${locatorB_orderService_button_orderSearch}    dom:document.querySelectorAll('[class*="ant-btn confirm_btn"]')[0]    # 售后订单 - 搜索按钮

${locatorB_orderService_list_orderfirst}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr:nth-child(1)')[0]    # 售后订单 - list第一行
${locatorB_orderService_list_firstAfter-saleOrder}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr:nth-child(1) td')[0]    # 售后订单 - list第一行 - 售后单号
${locatorB_orderService_list_firstTime}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr:nth-child(1) td')[1]    # 售后订单 - list第一行 - 售后时间
${locatorB_orderService_list_firstNumber}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr:nth-child(1) td')[2]    # 售后订单 - list第一行 - 订单编号
${locatorB_orderService_list_firstName}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr:nth-child(1) td')[3]    # 售后订单 - list第一行 - 收货人姓名
${locatorB_orderService_list_firstPrice}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr:nth-child(1) td')[4]    # 售后订单 - list第一行 - 订单金额
${locatorB_orderService_list_firstChannelWay}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr:nth-child(1) td')[5]    # 售后订单 - list第一行 - 支付渠道

# locatorB_serviceDetail
${locatorB_serviceDetail_button_detailCard}    dom:document.querySelectorAll('[class*="detail_card_a"]')[0]    # 售后订单 - 取消售后 按钮
${locatorB_serviceDetail_button_refund}    dom:document.querySelectorAll('[class*="headerExtra"] [class*="ant-btn default_btn"]')[0]    # 售后订单 - 仅退款 按钮
${locatorB_serviceDetail_button_refundReturn}    dom:document.querySelectorAll('[class*="headerExtra"] [class*="ant-btn default_btn"]')[1]    # 售后订单 - 退款退货 按钮







