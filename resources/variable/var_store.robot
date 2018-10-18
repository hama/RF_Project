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
${locatorB_store_select_currency}     dom:document.querySelectorAll('[id="currency"] [class*="ant-select-selection"]')[0]       #.店铺货币 设置
${locatorB_store_select_childSetCurrency}   dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')
#id="time_zone" ant-select-selection-selected-value
${locatorB_store_select_timeZone}     dom:document.querySelectorAll('[id="time_zone"] [class*="ant-select-selection"]')[0]       #.店铺时区 设置
${locatorB_store_select_childCurrency}     dom:document.querySelectorAll('#dj div.container_8707.setting_c8ce > div:nth-child(1) div:nth-child(1)  div.ant-form-item-control-wrapper div:nth-child(1) li.ant-select-dropdown-menu-item')    #.货币 下拉选择
${locatorB_store_select_childTime}     dom:document.querySelectorAll('#dj div.container_8707.setting_c8ce > div:nth-child(2) div:nth-child(2)  div.ant-form-item-control-wrapper div:nth-child(2) li.ant-select-dropdown-menu-item')    #.时区 下拉选择
#locator button
${contextB_store_storeInfo}    店铺信息

#ant-select-dropdown-menu  ant-select-dropdown-menu-root ant-select-dropdown-menu-vertical
#ant-select-dropdown-menu-item
#ant-form-item-children
#ant-row ant-form-item
#container

#ant-select-dropdown-menu  ant-select-dropdown-menu-root ant-select-dropdown-menu-vertical
#ant-select-dropdown-menu-item


#class="ant-select-dropdown-menu-item"

#dom:document.querySelectorAll('#dj > form > div.container_8707.setting_c8ce > div:nth-child(1) > div > div:nth-child(2) li')
#dom:document.querySelectorAll('div.container_8707.setting_c8ce > div:nth-child(2) > div > div:nth-child(2) li.ant-select-dropdown-menu-item')
#dom:document.querySelectorAll('div.container_8707.setting_c8ce div:nth-child(1) div.ant-form-item-control-wrapper div:nth-child(2) li.ant-select-dropdown-menu-item')

#'div[class="container"] div:nth-child(2) li.ant-select-dropdown-menu-item'
#dj > form > div.container_8707.setting_c8ce > div:nth-child(2) > div > div:nth-child(2) > div > div.ant-form-item-control-wrapper > div > span > div > div:nth-child(2) > div > div > div > ul > li.ant-select-dropdown-menu-item.ant-select-dropdown-menu-item-selected
#dj > form > div.container_8707.setting_c8ce > div:nth-child(2) > div > div:nth-child(2) > div > div.ant-form-item-control-wrapper > div > span > div > div:nth-child(2) > div > div > div > ul > li.ant-select-dropdown-menu-item
#dj > form > div.container_8707.setting_c8ce > div:nth-child(2) > div > div:nth-child(1) > div > div.ant-form-item-control-wrapper > div > span > div > div:nth-child(2) > div > div > div > ul > li:nth-child(1)
#dj > form > div.container_8707.setting_c8ce > div:nth-child(2) > div > div:nth-child(1) > div > div.ant-form-item-control-wrapper > div > span > div > div:nth-child(2) > div > div > div > ul > li:nth-child(3)
#dj > form > div.container_8707.setting_c8ce > div:nth-child(2) > div > div:nth-child(1) > div > div.ant-form-item-control-wrapper > div > span > div > div:nth-child(2) > div > div > div > ul > li:nth-child(1)