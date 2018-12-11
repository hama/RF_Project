*** Settings ***
Resource          var_common.robot

*** Variables ***
#.locatorB_customerMes
${locatorB_customerMes_icon_fileImport}    dom:document.querySelectorAll('[class*="file_import"]')[0]    # 导入 按钮
${locatorB_customerMes_icon_fileExport}    dom:document.querySelectorAll('[class*="file_export"]')[0]    # 导出 按钮

${locatorB_fileExport_input_email}    dom:document.querySelectorAll('[class="ant-input"]')[1]    # 导出 - 接收邮箱 输入框
${locatorB_fileExport_button_confirmBtn}    dom:document.querySelectorAll('[class*="ant-btn middle_btn"]')[0]    # 导出 - 确定 按钮

${locatorB_customerMes_button_addCustomer}    dom:document.querySelectorAll('[class*="ant-btn large_btn"]')[0]    # 新建顾客 按钮
${locatorB_customerMes_tab_AllCustomer}     dom:document.querySelectorAll('[role="tab"]')[0]    # 全部tab
${locatorB_customerMes_tab_subscribeCustomer}    dom:document.querySelectorAll('[role="tab"]')[1]    # 订阅顾客tab
${locatorB_customerMes_tab_purchasedCustomer}    dom:document.querySelectorAll('[role="tab"]')[2]    # 已购顾客tab
${locatorB_customerMes_tab_RepurchaseCustomer}    dom:document.querySelectorAll('[role="tab"]')[3]    # 复购顾客tab
${locatorB_customerMes_input_searchNameEailPhone}    dom:document.querySelectorAll('[id="name"]')[0]    # 姓名/邮箱/手机 搜索输入框

${locatorB_customerMes_input_addTime}   dom:document.querySelectorAll('input[class*="ant-calendar-input"]')[0]     # 加入时间 搜索输入框
${locatorB_customerMes_input_EndTime}    dom:document.querySelectorAll('input[class*="ant-calendar-input"]')[1]    # 结束时间 搜索输入框
${locatorB_customerMes_icon_anticonCalendar}    dom:document.querySelectorAll('[class*="anticon anticon-calendar"]')[0]    #日期 图标
${locatorB_customerMes_icon_clearCalendar}    dom:document.querySelectorAll('[id="created_at_start_end"] [class*="anticon-close-circle"]')[0]    # 时间 - "x" 图标

${locatorB_customerMes_select_Ifsubscribe}    dom:document.querySelectorAll('[id="subscribed"]')[0]    # 是否订阅 下拉框
#${locatorB_customerMes_icon_selectSubscribe}    dom:document.querySelectorAll('[class*="djfont tw-Unfold"]')[0]    # 是否订阅 下拉图标
${locatorB_customerMes_select_subscribed}    dom:document.querySelectorAll('[role="option"]')[0]    # 是否订阅 - 选择 - 是
${locatorB_customerMes_select_Nosubscribe}    dom:document.querySelectorAll('[role="option"]')[1]    # 是否订阅 - 选择 - 否
${locatorB_customerMes_icon_clearSubscribe}    dom:document.querySelectorAll('[id="subscribed"] [class*="anticon-close-circle"]')[0]    # 是否订阅 - "x" 图标

${locatorB_customerMes_select_defaultSubscribe}     dom:document.querySelectorAll('[id="subscribed"] [class*="selection-selected-value"]')[0]    # 订阅顾客tab - 是否订阅下拉框 -  文本显示


${locatorB_customerMes_select_country}    dom:document.querySelectorAll('[id="country_province"]')[0]    # 所在地区 下拉框
${locatorB_customerMes_select_selectChina}    dom:document.querySelectorAll('[class="ant-cascader-menu"] li[title="中国"]')[0]    # 所在地区 - 选择中国
${locatorB_customerMes_select_selectBeiJing}    dom:document.querySelectorAll('[class="ant-cascader-menu"] li[title="北京市"]')[0]    # 所在地区 - 选择北京市
${locatorB_customerMes_icon_clearCountry}    dom:document.querySelectorAll('[id="country_province"] ~ [class*="anticon-close-circle"]')[0]    # 所在地区 - 'x' 图标

${locatorB_customerMes_input_minTotal}    dom:document.querySelectorAll('[id="min_finished_order_total"]')[0]    # 最低金额 搜索输入框
${locatorB_customerMes_input_maxTotal}    dom:document.querySelectorAll('[id="max_finished_order_total"]')[0]    # 最高金额 搜索输入框
${locatorB_customerMes_input_mixOrder}    dom:document.querySelectorAll('[id="min_finished_order_count"]')[0]    # 最小订单数 搜索输入框
${locatorB_customerMes_input_maxOrder}    dom:document.querySelectorAll('[id="max_finished_order_count"]')[0]    # 最大订单数 搜索输入框
${locatorB_customerMes_button_searchBth}    dom:document.querySelectorAll('[data-robot="btn_search"]')[0]    # 搜索 按钮
${locatorB_customerMes_button_resetBth}    dom:document.querySelectorAll('[data-robot="btn_reset"]')[0]    # 重置 按钮

${locatorB_customerMes_list_firstCustomer}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr:nth-child(1)')    # 顾客列表 - 第一行
${locatorB_customerMes_list_firstCustomerEmail}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(1)')    # 顾客邮箱
${locatorB_customerMes_list_firstCustomerName}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(2)')    # 顾客姓名
${locatorB_customerMes_list_firstCustomerPhone}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(3)')    # 顾客手机号
${locatorB_customerMes_list_firstCustomerCountry}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(4)')    # 国家地区
${locatorB_customerMes_list_firstCustomerTime}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(5)')    # 加入时间
${locatorB_customerMes_list_firstCustomerBuyCount}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(6)')    # 购买次数
${locatorB_customerMes_list_firstCustomerTotal}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(7)')    # 累计金额

${locatorB_customerMes_icon_paginationprev}    dom:document.querySelectorAll('[class="ant-pagination-item-link"]')[0]    # 顾客列表 - 上一页 图标
${locatorB_customerMes_icon_paginationNext}     dom:document.querySelectorAll('[class="ant-pagination-item-link"]')[1]    # 顾客列表 - 下一页 图标
${locatorB_customerMes_text_paginationItem}    dom:document.querySelectorAll('[class*="ant-pagination-item"]')[1]    # 顾客列表 - 第一页

#.locatorB_customerNews
${locatorB_customerNews_input_firstname}    dom:document.querySelectorAll('[id="first_name"]')[0]    # 新建顾客 - 名
${locatorB_customerNews_input_lastname}    dom:document.querySelectorAll('[id="last_name"]')[0]    # 新建顾客 - 姓
${locatorB_customerNews_input_email}    dom:document.querySelectorAll('[id="email"]')[0]    # 新建顾客 - 邮箱
${locatorB_customerNews_input_phone}     dom:document.querySelectorAll('[id="phone"]')[0]    # 新建顾客 - 手机
${locatorB_customerNews_input_phoneAreaCode}    dom:document.querySelectorAll('[id="phone_area_code"]')[0]    # 新建顾客 - 手机区号
${locatorB_customerNews_input_chinaAreaCode}    dom:document.querySelectorAll('[selected_label="+86"]')[0]    # 新建顾客 - 手机区号 - 中国
${locatorB_customerNews_checkbox_purchased}    dom:document.querySelectorAll('span[class*="ant-checkbox"]')[0]    # 新建顾客 - 已订阅 复选框
${locatorB_customerNews_button_cancel}    dom:document.querySelectorAll('[class*="ant-btn default"]')[0]    # 新建顾客 - 取消 按钮
${locatorB_customerNews_button_confirm}    dom:document.querySelectorAll('[class*="ant-btn middle"]')[0]    # 新建顾客 - 确定 按钮

#.locatorC_customerRegister
${locatorC_customerRegister_icon_userIcon}    dom:document.querySelectorAll('[class*="sep-font sep-font-user-thin"]')[0]    # C端 - 用户登陆/注册入口 图标
${locatorC_customerRegister_link_userRegister}     dom:document.querySelectorAll('li [href="/account/register"]')[0]    # C端 - 用户注册
${locatorC_customerRegister_input_userFirstname}    dom:document.querySelectorAll('[id="firstName"]')[0]    # C端 - 用户注册 - 顾客 - 名
${locatorC_customerRegister_input_userLastname}    dom:document.querySelectorAll('[id="lastName"]')[0]    # C端 - 用户注册 - 顾客 - 姓
${locatorC_customerRegister_input_userEmail}    dom:document.querySelectorAll('[id="userName"]')[0]    # C端 - 用户注册 - 顾客 - 邮箱
${locatorC_customerRegister_input_userPassword}    dom:document.querySelectorAll('[id="password"]')[0]    # C端 - 用户注册 - 顾客 - 密码
${locatorC_customerRegister_checkbox_checkboxRegister}    dom:document.querySelectorAll('[class*="checkbox fl register"]')[0]    # C端 - 注册 复选框

${locatorC_customerRegister_button_RegisterBtn}    dom:document.querySelectorAll('[class*="btn btn-primary"]')[0]    # C端 - 注册 按钮
