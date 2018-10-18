*** Variables ***
# locator

${locatorB_store_input_storeName}    id:name    #.店铺名称-输入框
${locatorB_store_input_storeEmail}    id:email    #.店铺邮箱-输入框
${locatorB_store_store_input_serviceEmail}    id:service_email    #.客服邮箱-输入框
${locatorB_store_select_currency}    id:currency    #. 店铺货币
${locatorB_store_select_timezone}    id:time_zone    #. 店铺时区
${locatorB_store_select_country}    id:country_id    #. 店铺国家


# locator input text

${locatorB_store_input_storeLink}     dom:document.querySelectorAll('[class*="ant-input ant-input-disabled"]')[0]      #.店铺链接 input 输入框
${locatorB_store_select_currency}     dom:document.querySelectorAll('[class*="ant-select-selection"]')[0]       #.店铺货币 时区 设置
${locatorB_store_option_setCurrency}     dom:document.querySelectorAll('[class="ant-select-dropdown-menu-item"]')     #.选择货币
${locatorB_store_select_timeZone}     dom:document.querySelectorAll('[class*="ant-select-selection"]')[1]       #.店铺货币 设置
#locator button
${contextB_store_storeInfo}    店铺信息








