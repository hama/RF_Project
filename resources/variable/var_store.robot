*** Variables ***
# locator

${locatorB_store_input_storeName}    id:name    #.店铺名称-输入框
${locatorB_store_input_storeName_nameNum}    css:span[class='ant-input-suffix']    #.店铺名称-数字显示
${locatorB_store_input_storeEmail}    id:email    #.店铺邮箱-输入框
${locatorB_store_store_input_serviceEmail}    id:service_email    #.客服邮箱-输入框

${locatorB_store_select_currency}    id:currency    #. 店铺货币
${locatorB_store_select_currency_listIcon}    dom:document.querySelectorAll('span[class="ant-select-arrow"]')[0]    #. 店铺货币-下拉点击图标
${locatorB_store_select_currency_listContent}    dom:document.querySelectorAll('#currency ~ div ul li')    #. 店铺货币-下拉列表内容

${locatorB_store_select_timezone}    id:time_zone    #. 店铺时区
${locatorB_store_select_timezone_listIcon}    css:#time_zone span[class="ant-select-arrow"]   #. 店铺时区-下拉点击图标
${locatorB_store_select_timezone_listContent}    dom:document.querySelectorAll('#time_zone ~ div ul li')    #. 店铺时区-下拉列表内容

${locatorB_store_select_country}    id:country_id    #. 店铺国家

${locatorB_store_a_domain}    css:.icon_custom_left_0490.link_c21b    #.域名配置
${locatorB_store_a_domain_ant_btn}    css:button[class*="ant-btn middle"]   #.域名配置-"绑定已有域名"按钮
${locatorB_store_div_favion}    css:div[class*="ant-upload ant-upload-select"]    #.网站Favicon
${locatorB_store_div_favion_img}    dom:document.querySelectorAll('div[class="image_wrap_546e"] img')    #.网站Favicon-图像
${locatorB_store_i_dFelete}    dom:document.querySelectorAll('i[class*="delete_1296"]')   #.网站Favicon-删除按钮


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


