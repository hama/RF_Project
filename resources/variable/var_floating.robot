*** Settings ***
Resource          var_common.robot

*** Variables ***
${locatorB_headerTop_link_storeHome}    dom:document.querySelectorAll('[class*="header_right"] [class*="header_btn"]')[0]    # 店铺主页

# locator_floatingMgmt
${locatorB_floatingMgmt_button_floatingOpen}    dom:document.querySelectorAll('[class*="ant-btn middle_btn"]')[0]    # 浮窗通知 - 去开启 按钮
${locatorB_floatingMgmt_button_floatingSettings}    dom:document.querySelectorAll('[class*="ant-btn large_btn"]')[0]    # 浮窗通知 - 设置 按钮

# locator_floatingSettings
${locatorB_floatingSettings_icon_floatinglistBack}    dom:document.querySelectorAll('[class="djfont dj-back"]')[0]    # 浮窗设置 - 返回浮窗列表 图标
${locatorB_floatingSettings_button_OpenInform}    dom:document.querySelectorAll('[id="status"]')[0]    # 浮窗设置 - 开启浮窗通知 按钮

${locatorB_floatingSettings_tab_floatingModule}    dom:document.querySelectorAll('[role="tab"]')[0]    # 浮窗设置 - 浮窗模版tab

${locatorB_floatingSettings_tab_reviewSettings}    dom:document.querySelectorAll('[role="tab"]')[1]    # 浮窗设置 - 展示设置tab
${locatorB_floatingSettings_input_firstDelay}    dom:document.querySelectorAll('[id="first_delay"]')[0]    #展示设置 - 打开页面，第一次展示浮窗延时 输入框
${locatorB_floatingSettings_input_duration}    dom:document.querySelectorAll('[id="duration"]')[0]    #展示设置 - 每个浮窗展示 输入框
${locatorB_floatingSettings_input_interval}    dom:document.querySelectorAll('[id="interval"]')[0]    #展示设置 - 浮窗间隔 输入框

${locatorB_floatingSettings_checkout_floatingLimit}    dom:document.querySelectorAll('span[class*="ant-checkbox"]')[1]    #展示设置 - 限制浮窗展示次数 复选框
${locatorB_floatingSettings_input_floatingMaxTimes}    dom:document.querySelectorAll('[id="max_times"]')[0]    #展示设置 - 展示浮窗次数 输入框

${locatorB_floatingSettings_checkout_floatingCircle}     dom:document.querySelectorAll('span[class*="ant-checkbox"]')[2]    #展示设置 - 循环 复选框


${locatorB_floatingSettings_select_reviewSettings}    dom:document.querySelectorAll('[id="locate"]')[0]    #展示设置 - 展示设置选择框
${locatorB_floatingSettings_option_bottomLeft}    dom:document.querySelectorAll('[id="locate"] + div li:nth-child(1)')[0]    #展示设置 - 左下
${locatorB_floatingSettings_option_bottomRight}    dom:document.querySelectorAll('[id="locate"] + div li:nth-child(2)')[0]    #展示设置 - 右下
${locatorB_floatingSettings_option_upperLeft}     dom:document.querySelectorAll('[id="locate"] + div li:nth-child(3)')[0]     #展示设置 - 左上
${locatorB_floatingSettings_option_upperRight}    dom:document.querySelectorAll('[id="locate"] + div li:nth-child(4)')[0]    #展示设置 - 右上

${locatorB_floatingSettings_tab_productRange}    dom:document.querySelectorAll('[role="tab"]')[2]    # 浮窗设置 - 商品范围tab

${locatorB_floatingSettings_button_defaultSettings}    dom:document.querySelectorAll('[class*="ant-btn confirm_btn"]')[0]    # 浮窗设置 - 恢复默认设置 按钮
${locatorB_floatingSettings_input_styleTitle}    dom:document.querySelectorAll('[id="template_config.title"]')[0]    # 浮窗设置 - 标题 输入框
${locatorB_floatingSettings_button_textReplace}    dom:document.querySelectorAll('[id="template_config.replace_switch"]')[0]    # 浮窗设置 - 文案替换购买时间 按钮
${locatorB_floatingSettings_button_customerHide}    dom:document.querySelectorAll('[id="template_config.anonymity_switch"]')[0]    # 浮窗设置 - 顾客隐私保护 按钮

${locatorB_floatingSettings_span_backgroundColor}    dom:document.querySelectorAll('[class*="colorPicker"]')[0]    # 浮窗设置 - 背景颜色
${locatorB_floatingSettings_span_titleColor}    dom:document.querySelectorAll('[class*="colorPicker"]')[1]    # 浮窗设置 - 标题颜色
${locatorB_floatingSettings_span_productColor}    dom:document.querySelectorAll('[class*="colorPicker"]')[2]    # 浮窗设置 - 商品名称
${locatorB_floatingSettings_span_TimeColor}    dom:document.querySelectorAll('[class*="colorPicker"]')[3]    # 浮窗设置 - 时间颜色

${locatorB_floatingSettings_input_colorR}    dom:document.querySelectorAll('input[spellcheck="false"]')[1]    # 浮窗设置 - 背景颜色 - R
${locatorB_floatingSettings_input_colorG}    dom:document.querySelectorAll('input[spellcheck="false"]')[2]    # 浮窗设置 - 背景颜色 - G
${locatorB_floatingSettings_input_colorB}    dom:document.querySelectorAll('input[spellcheck="false"]')[3]    # 浮窗设置 - 背景颜色 - B
${locatorB_floatingSettings_input_colorA}    dom:document.querySelectorAll('input[spellcheck="false"]')[4]    # 浮窗设置 - 背景颜色 - A

${locatorB_floatingSettings_button_settingsSave}    ${locatorB_button_save00}     # 浮窗设置 - 保存 按钮
${locatorB_floatingSettings_button_settingsCancel}    ${locatorB_button_canecl00}    # 浮窗设置 - 取消 按钮

# locatorC_floating
${locatorC_floating_upPop_floatingPop}    dom:document.querySelectorAll('[id="sales-pop__container"] > div')[0]    #C端 - 浮窗展示
${locatorC_floating_upPop_floatingTitle}    dom:document.querySelectorAll('[id="sales-pop__container"] p:nth-child(1)')[0]    #C端 - 浮窗标题
${locatorC_floating_upPop_floatingProductName}    dom:document.querySelectorAll('[id="sales-pop__container"] p:nth-child(2)')[0]    #C端 - 浮窗商品名称
${locatorC_floating_upPop_floatingTime}    dom:document.querySelectorAll('[id="sales-pop__container"] p:nth-child(3)')[0]    #C端 - 浮窗时间

