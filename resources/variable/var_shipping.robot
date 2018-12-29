*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator shipping
${locatorB_shipping_tab_PriceSettings}    dom:document.querySelectorAll('[role="tab"]')[0]    # 物流 - 运费设置tab
${locatorB_shipping_tab_shippingSettings}    dom:document.querySelectorAll('[role="tab"]')[1]    # 物流 - 物流设置tab

# locator PriceSettings
${locatorB_priceSettings_button_addAreaPlan}    dom:document.querySelectorAll('[class*="ant-btn large_btn"]')    # 运费设置 - 添加区域方案 按钮
${locatorB_shipping_button_EidtShipping}    dom:document.querySelectorAll('[href*="/shipping"]')[0]    # 物流 - 编辑方案 按钮
${locatorB_priceSettings_icon_EidtShipping}    dom:document.querySelectorAll('[class*="icon_edit"]')[0]    # 运费设置 - 编辑 按钮
${locatorB_priceSettings_checkbox_supportCOD}    dom:document.querySelectorAll('span[class*="ant-checkbox"]')[0]    # 运费设置 - 支持货到付款 复选框

${locatorB_priceSettings_radio_firstWeight}    dom:document.querySelectorAll('span[class*="ant-radio"]')[2]    # 运费设置 - 首重+续重 单选项

${locatorB_priceSettings_input_firstWeightPrice}    dom:document.querySelectorAll('[id="rate_amount"]')    # 运费设置 - 首重运费 输入框
${locatorB_priceSettings_input_firstWeightRange}    dom:document.querySelectorAll('[id="rate_first_range"]')    # 运费设置 - 首重范围 输入框
${locatorB_priceSettings_select_firstWeightUnit}    dom:document.querySelectorAll('[id="rate_first_unit"]')[0]    # 运费设置 - 首重单位选择框
${locatorB_priceSettings_input_firstWeightUnit}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[1]    # 运费设置 - 首重单位kg

${locatorB_priceSettings_input_continuousWeightPrice}    dom:document.querySelectorAll('[id="rate_additional_amount"]')    # 运费设置 - 续重运费 输入框
${locatorB_priceSettings_input_continuousWeightRange}    dom:document.querySelectorAll('[id="rate_additional_range"]')    # 运费设置 - 续重范围 输入框
${locatorB_priceSettings_select_continuousWeightUnit}    dom:document.querySelectorAll('[id="rate_additional_unit"]')[0]     # 运费设置 - 续重单位选择框
${locatorB_priceSettings_input_continuousWeightUnit}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[5]    # 运费设置 - 续重单位kg

${locatorB_priceSettings_button_popUpsave}    dom:document.querySelectorAll('[class="ant-drawer-body"] [class*="ant-btn middle_btn"]')[2]    # 运费设置 -  保存 按钮

# locator NewPriceSettings
${locatorB_NewPriceSettings_input_areaName}    dom:document.querySelectorAll('[id="shipping_name"]')    # 添加运费方案 - 区域方案名称 输入框

${locatorB_NewPriceSettings_button_addCountry}    dom:document.querySelectorAll('[class*="operation"] [class*="ant-btn middle_btn"]')    # 添加运费方案 - 添加国家 按钮
${locatorB_NewPriceSettings_input_countrySelect}    dom:document.querySelectorAll('[class="ant-drawer-body"] [class="ant-input"]')[0]    # 添加国家 - 搜索 输入框
${locatorB_NewPriceSettings_button_countrySelect}    dom:document.querySelectorAll('[class="ant-drawer-body"] [class*="ant-btn middle_btn"]')[0]    # 添加国家 - 搜索 按钮
${locatorB_NewPriceSettings_checkout_countrySelect}    dom:document.querySelectorAll('span[class*="ant-tree-checkbox"]')[0]    # 添加国家 - 第一个复选框
${locatorB_NewPriceSettings_button_countrySave}     dom:document.querySelectorAll('[class="ant-drawer-body"] [class*="ant-btn middle_btn"]')[1]    # 添加国家 - 确定 按钮

${locatorB_NewPriceSettings_button_addPricePlan}    dom:document.querySelectorAll('[class*="operation"] [class*="ant-btn large_btn"]')    # 添加运费方案 - 添加运费方案 按钮
${locatorB_NewPriceSettings_input_PlanName}    dom:document.querySelectorAll('[id="name"]')[0]    # 添加运费方案 - 方案名称 输入框
${locatorB_NewPriceSettings_input_PlanDesc}    dom:document.querySelectorAll('[id="desc"]')[0]    # 添加运费方案 - 方案说明 输入框
${locatorB_NewPriceSettings_select_ruleSettings}    dom:document.querySelectorAll('[id="rule_type"]')[0]     # 添加运费方案 - 规则设置 - 订单类型下拉框
${locatorB_NewPriceSettings_select_orderPrice}    dom:document.querySelectorAll('[id="rule_type"] + div li:nth-child(1)')[0]    # 添加运费方案 - 规则设置 - 订单价格
${locatorB_NewPriceSettings_select_productNum}     dom:document.querySelectorAll('[id="rule_type"] + div li:nth-child(2)')[0]    # 添加运费方案 - 规则设置 - 商品数量
${locatorB_NewPriceSettings_select_orderWeight}     dom:document.querySelectorAll('[id="rule_type"] + div li:nth-child(3)')[0]    # 添加运费方案 - 规则设置 - 订单重量

${locatorB_NewPriceSettings_input_ruleSettingsMin}    dom:document.querySelectorAll('[id="rule_range_min"]')[0]    # 添加运费方案 - 规则设置 - 最小值
${locatorB_NewPriceSettings_input_ruleSettingsMax}    dom:document.querySelectorAll('[id="rule_range_max"]')[0]    # 添加运费方案 - 规则设置 - 最大值

${locatorB_NewPriceSettings_button_pricePlanSave}    ${locatorB_button_save00}    #运费设置 - 添加运费方案 - 保存 按钮

# locator settingShipping
${locatorB_settingShipping_button_addressSet}    dom:document.querySelectorAll('[class*="shipping_address"] [type="button"]')[0]    # 物流设置 - 开始设置 按钮
${locatorB_settingShipping_button_merchantSet}    dom:document.querySelectorAll('[class*="shipping_address"] ~ div[class*="container"] [type="button"]')[0]    # 物流设置 - 物流商 开始设置 按钮
${locatorB_settingShipping_button_addMerchant}    dom:document.querySelectorAll('[class*="shipping_address"] + div[class*="head_4cd8 common_title"] [type="button"]')[0]    # 物流设置 - 物流商 添加物流商 按钮

# locator addressSettings
${locatorB_addressSettings_select_country}    dom:document.querySelectorAll('[id="country_code"]')[0]    # 发货地址 - 国家 选择框
${locatorB_addressSettings_select_province}    dom:document.querySelectorAll('[id="province_code"]')[0]    # 发货地址 - 省份 选择框
${locatorB_addressSettings_input_city}    dom:document.querySelectorAll('[id="city"]')[0]    # 发货地址 - 城市输入框
${locatorB_addressSettings_input_address}    dom:document.querySelectorAll('[id="address"]')[0]    # 发货地址 - 地址输入框
${locatorB_addressSettings_input_zipCode}    dom:document.querySelectorAll('[id="zip"]')[0]    # 发货地址 - 邮编输入框
${locatorB_addressSettings_input_phone}    dom:document.querySelectorAll('[id="phone"]')[0]    # 发货地址 - 电话号码输入框
${locatorB_addressSettings_button_addressSave}    dom:document.querySelectorAll('[class*="shipping_address"] [type="button"]')[0]    # 发货地址 - 保存按钮
${locatorB_addressSettings_button_addressCancel}    dom:document.querySelectorAll('[class*="shipping_address"] [type="button"]')[1]    # 发货地址 - 取消按钮

# locator merchantSettings
${locatorB_merchantSettings_button_addUaiBest}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_e01e btn_add"]')[0]    # 物流商 - 汉邮物流 添加 按钮
${locatorB_merchantSettings_link_uaibestLink}    dom:document.querySelectorAll('[href=" http://uaibest.com/"]')[0]    # 汉邮物流 - 查看官网了解更多 链接

${locatorB_merchantSettings_button_addHSD}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_e01e btn_add"]')[1]    # 物流商 - 鸿速达 添加 按钮
${locatorB_merchantSettings_link_HSDLink}    dom:document.querySelectorAll('[href=" http://www.hsd-express.cn/"]')[0]    # 鸿速达 - 查看官网了解更多 链接
${locatorB_merchantSettings_link_HSDregister}     dom:document.querySelectorAll('[href=" http://www.hsd-express.cn/"]')[1]    # 鸿速达 - 无账号？点击注册 链接

${locatorB_merchantSettings_button_addYokesi}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_e01e btn_add"]')[2]    # 物流商 - Yokesi 添加 按钮
${locatorB_merchantSettings_link_YokesiLink}    dom:document.querySelectorAll('[href="http://www.yokesi.com"]')[0]    # Yokesi - 查看官网了解更多 链接
${locatorB_merchantSettings_link_Yokesiregister}    dom:document.querySelectorAll('[href="http://z.yokesi.com:8088/Home/Registration"]')[0]    # Yokesi - 无账号？点击注册 链接

${locatorB_merchantSettings_button_addPFC}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_e01e btn_add"]')[3]    # 物流商 - 皇家物流 添加 按钮
${locatorB_merchantSettings_link_PFCLink}    dom:document.querySelectorAll('[href="http://www.pfcexpress.com/"]')[0]    # 皇家 - 查看官网了解更多 链接

${locatorB_merchantSettings_button_addRCT}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_e01e btn_add"]')[4]    # 物流商 - 润成通国际 添加 按钮
${locatorB_merchantSettings_link_RCTLink}    dom:document.querySelectorAll('[href=" http://www.rct56.com/"]')[0]    # 润成通 - 查看官网了解更多 链接

${locatorB_merchantSettings_button_addAN}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_e01e btn_add"]')[5]    # 物流商 - 泛亚国际 添加 按钮

${locatorB_merchantSettings_button_addLX}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_e01e btn_add"]')[6]    # 物流商 - 龙讯国际 添加 按钮
${locatorB_merchantSettings_link_LXLink}    dom:document.querySelectorAll('[href="http://www.ldlog.com.cn/"]')[0]    # 龙讯 - 查看官网了解更多 链接

${locatorB_merchantSettings_button_addBuffalo}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_e01e btn_add"]')[7]    # 物流商 - BUFFALO 添加 按钮
${locatorB_merchantSettings_link_BuffaloLink}    dom:document.querySelectorAll('[href="http://www.buffaloex.com/"]')[0]    # BUFFALO - 查看官网了解更多 链接
${locatorB_merchantSettings_text_Buffalopwd}    MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCIFg9XBp89SljRR1gbOgY7pxLHJ+r8o+GIE/ZylB2+VoFGYbwoG1ANT0wOJup7AcgbKEdVl9RnoaZRp8zumRqxBqCLbzhWC9MIqRZvFr2/IqC7G5EuSqdo/Urd7kgT0IFaUKeYVzfvkJYYcpghnc/q2rlj52edmmOBWMTjYgmLp8LbWQJ+ariMJN0vwKXkLO5BwpYV3lts66H8Etc80cwyWkmKHnJYNS01Fl2TTHnPZi92aMeFlM3CLqBrKMTLWI6Y3s6OKxFg7mrDc+3IE0TrziNd4U2jD1pwiv3YTcfKNQsgtvxmPX9NCBJEup6mqBHkgvGqKHJC1QSdpLrYeHSDAgMBAAECggEAFem/dJr7X0oufRyI4nF4eXiQvIMAAsh804WrZI3XMEQLswKf4rFrNYl0TL8VeNMznrPgsLavHDTabEGh7TW4J5NSnME/CBQFWlqn4yF9Ul7IFPj+ar7YsD5BJPVuo8oqWhmsswowVqIomS0ytA8OYNnxilXDyIwIw9ZAdgDeWp9f0nukQ6wYRkuRLuqLojSVloonLuzJWtuXv0S1vt/cIBb83KTgeBcIKfCV2yLH4/Rvby1pgC0RN5cfrWsdLH6jDnQQwUp5V02agIjJKFAO54hevOXjTskYWUSAyomoIZe/nK9QFE2hSZ6qEDhDaUuD0hVKdiV5790dlq5cRO9gUQKBgQC9EdoG2pINs+ApSURJjQMycx4jtGvqLIWTGzqVamK8lQae27zoG+4pxmFDvhef0p52Uy/kBH4JTikcLScQAbs9qxMMwdoKhBQRoX2v5nzdyV76WVlKzjmD3B11kEnrySg6Dq8Uh/1WWfAY3SqqeosqNlLUDPVWylhXnHEpgmO+yQKBgQC4Qqfv/QMMWsI6mJkqndjWJh/0HP2CdZ+DCAkQnJC1Ia2w8uSz9f0E0N0JDX630Eg8PWzVfioE5GDwvMMte60xLBzx94PuGaVlhoGjeTKrv1sXhVQqZ6mJ9m+RkkJuG2XQ8EoEENxlCCa08yl+rMHuzEQK/0c9ZmnEd7SZk7TC6wKBgHd+bNmgEmbupGHzmGET6k1cTFQsl3etI87RirkcP8MIPOLx5fackG1+n8J8xdmQ9+24ra/i1vVynLDeKK4JKhnToXqSmgfDahuqgRFHDuvtdUWsaq7In7kiyMugodePjwkCdsz3FboZpZFRVsHgKUxIgRjcB8MOp77XdP3TFs9hAoGAR3vMjSU6FoPrUDI9UbQ1GDdoNBs/GmqpfHsUkTY8SZkMOlaw9UQcac7hwY5Tt9n8/CnUXCr7ADTdiuegTLfrY+U6QYEF1MxsRyvchWASkWDGZSSbl2vp8RUDCZWVYgQNBvcBr/welK+J3K9tTLCW+B6U0zNgHujpZYgPL3mHKgsCgYBLZuuYZEJ8qKTYmHigJUF0GUamHKteD3POJtV6wYFp/YbSHdmDOoWPwR4kzDC36oFwHGlxPXM6DXZTCPnCeXvyLyDfMs4sdUCxs1zq6vgZrKO3cfRRi0lHdzEEExzlCJArqGbGOrI5y551KKBNmzqeRVpYHhBP7PLTQ/8dgVwS6Q==

${locatorB_merchantSettings_input_channelName}    dom:document.querySelectorAll('[id="channel_name"]')[0]    # 物流商 - 代名称输入框
${locatorB_merchantSettings_input_clientID}    dom:document.querySelectorAll('[id="client_id"]')[0]    # 物流商 - 账户ID输入框
${locatorB_merchantSettings_input_secretKey}    dom:document.querySelectorAll('[id="secret_key"]')[0]    # 物流商 - 账户密钥输入框
${locatorB_merchantSettings_button_addSave}    dom:document.querySelectorAll('[class*="footer"] [type="button"]')[0]        # 物流商 - 确定添加 按钮
${locatorB_merchantSettings_icon_uaiBestClose}    dom:document.querySelectorAll('[class="ant-drawer-close-x"]')[1]    # 添加物流商 - 关闭（x图标）

${locatorB_merchantSettings_icon_shipiingWay}    dom:document.querySelectorAll('[class*="type"]')    # 物流商 - 物流渠道icon
${locatorB_merchantSettings_checkbox_waySelect}    dom:document.querySelectorAll('span[class*="ant-checkbox"]')    # 物流渠道 - 渠道选择
${locatorB_merchantSettings_icon_shipiingWayClose}    dom:document.querySelectorAll('[class="ant-drawer-close-x"]')[2]    # 物流渠道 - 关闭（x图标）
${locatorB_merchantSettings_button_shipiingWaySave}    dom:document.querySelectorAll('[class*="footer"] [class*="ant-btn middle_btn"]')[1]    # 物流渠道 - 确定 按钮


${locatorB_merchantSettings_icon_changeAccount}    dom:document.querySelectorAll('span[class*="account_icon"]')    # 物流商 - 切换账号 图标
${locatorB_merchantSettings_icon_deleteAccount}    dom:document.querySelectorAll('span[class*="delete_icon"]')    # 物流商 - 移除账号 图标







## locator shippingNew
#${locatorB_shippingNew_input_shippingName}    dom:document.querySelectorAll('input[data-robot="shipping_ph_name"]')[0]    #.输入物流名称框
#${locatorB_shippingNew_btn_addCountry}    dom:document.querySelectorAll('button[data-robot="shipping_add_country"]')[0]    # 设置物流-添加国家按钮
#${locatorB_shippingNew_btn_popUpConfirm}    dom:document.querySelectorAll('[id="test_shipping_country_modal_sure_btn"]')    #.国家列表-保存按钮
#${locatorB_shippingNew_text_listCountryName}    dom:document.querySelectorAll('[class*="country_item"] [class*="name"]')    #.国家名
#${locatorB_shippingNew_btn_addPriceShipping}    dom:document.querySelectorAll('[data-robot="shipping_add_price"]')    #.
#${locatorB_shippingNew_btn_addWeightShipping}    dom:document.querySelectorAll('[data-robot="shipping_add_weight"]')    #.
#${locatorB_shippingNew_btn_addQuantityShipping}    dom:document.querySelectorAll('[data-robot="shipping_add_quantity"]')    #.
#${locatorB_shippingNew_items_listItemsOfPrice}    dom:document.querySelectorAll('[class*="translatedContent2"] [class~="ant-table-row"]')    #.
#${locatorB_shippingNew_icon_listDelCountryItem}    dom:document.querySelectorAll('[id="test_shipping_country_delete_icon"]')    #.
#${locatorB_shippingNew_btn_delShipping}    dom:document.querySelectorAll('[id="test_shipping_delete_btn"]')    #.
#
#
#
#
## locator shippingNew popUp add country
#${locatorB_shippingNew_popUp_arrow_listArrow}    dom:document.querySelectorAll('[class*="show_tree"] [class~="ant-tree-switcher"]')    #.国家列表-箭头list
#${locatorB_shippingNew_popUp_checkbox_firstCountry}    dom:document.querySelectorAll('[class*="show_tree"] [class~="ant-tree-child-tree"] span[class="ant-tree-checkbox-inner"]')    #.国家列表-第一个国家checkbox
#${locatorB_shippingNew_popUp_checkbox_secondCountry}    dom:document.querySelectorAll('[class*="show_tree"] [class~="ant-tree-child-tree"] span[class="ant-tree-checkbox-inner"]')[1]    #.国家列表-第一个国家checkbox
#${locatorB_shippingNew_popUp_checkbox_listContinents}    dom:document.querySelectorAll('[class~="ant-tree"] > li > span.ant-tree-checkbox > span')    #.国家列表-list of Continents checkbox
#${locatorB_shippingNew_popUp_ul_listContinent}     css:li[class="show_tree___3ecgg"]   #.国家列表-第一列内容
#
#${locatorB_shippingNew_popUp_input_countryName}    dom:document.querySelectorAll('input[placeholder="国家名"]')[0]    #.添加国家-顶部输入国家输入框
#${locatorB_shippingNew_popUp_btn_search}    id:test_shipping_country_modal_search_btn    #.添加国家-搜索按钮
#${locatorB_shippingNew_popUp_checkbox_otherCountry}    dom:document.querySelectorAll('[class="ant-checkbox"]')[0]    #.国家列表-其他国家checkbox
#${locatorB_shippingNew_popUp_span_selectedContent}    css:span[class="country_selected___1wa_o"]    #.添加国家-已选国家个数显示
#${locatorB_shippingNew_popUp_btn_cancel}    dom:document.querySelectorAll('button[class="ant-modal-close"]')[0]    #.添加国家-关闭按钮
#
## locator shippingNew popUp addPriceShipping
#${locatorB_shippingNew_popUp_input_shippingName}    dom:document.querySelectorAll('[placeholder="Standard Shipping"]')[0]    # 添加价格运费-物流名称输入框
#${locatorB_shippingNew_popUp_input_minPrice}    dom:document.querySelectorAll('[id="range_min"]')[0]    # 最小订单价格
#${locatorB_shippingNew_popUp_input_maxPrice}    dom:document.querySelectorAll('[id="range_max"]')[0]    # 最大订单价格
#${locatorB_shippingNew_popUp_btn_save}    id:test_shipping_edit_modal_sure_btn    #.添加运费- 保存-按钮
#${locatorB_shippingNew_popUp_btn_cancel}    id:test_shipping_edit_modal_cancel_btn    #. 添加运费-取消-按钮
#${locatorB_shippingNew_popUp_checkbox_freeShipping}    dom:document.querySelectorAll('div:nth-child(4) span.ant-checkbox')     #.免运费
#${locatorB_shippingNew_popUp_checkbox_supportCOD}    dom:document.querySelectorAll('div:nth-child(5) span.ant-checkbox')      #.支持货到付款
#${locatorB_shippingNew_popUp_input_shippingPrice}    dom:document.querySelectorAll('[id="rate_amount"]')      #.运费价格
#${locatorB_shippingNew_icon_listEditPriceShippingItem}    dom:document.querySelectorAll('[id="test_shipping_price_edit_icon"]')    #.
#${locatorB_shippingNew_icon_listDelPriceShippingItem}    dom:document.querySelectorAll('[id="test_shipping_price_delete_icon"]')    #.
#
#
#
#
#${locatorB_shipping_first_element}    dom:document.querySelectorAll("#test_shipping_list_0 li")[0]    # 物流列表第一个元素
#${locatorB_shipping_add_shipping}    dom:document.querySelectorAll("button")[1]    # 添加物流按钮
#${locatorB_shipping_del_shipping}    id:test_shipping_delete_btn    # 删除物流按钮
#${locatorB_shipping_add_price_btn}    dom:document.querySelectorAll('button[data-robot="shipping_add_price"]')[0]    #.添加价格运费按钮
#${locatorB_shipping_add_quantity_btn}    dom:document.querySelectorAll('button[data-robot="shipping_add_quantity"]')[0]    #.添加数量运费按钮
#${locatorB_shipping_add_weight_btn}    dom:document.querySelectorAll('button[data-robot="shipping_add_weight"]')[0]    #. 添加重量运费按钮
#${locatorB_shipping_del_country_btn}    dom:document.querySelectorAll(".icon_delete___ITXOZ")[0]    #. 删除国家按钮
#${locatorB_shipping_edit_priceFgt_btn}    dom:document.querySelectorAll("#test_shipping_price_edit_icon")[0]    #. 价格运费编辑按钮
#${locatorB_shipping_del_priceFgt_btn}    dom:document.querySelectorAll("#test_shipping_price_delete_icon")[0]    #. 加个运费删除按钮
#
## page content
#${contentB_shipping_tab1}    物流方案    # 物流页面两个基本标签页 物流方案/物流商
#${contentB_shipping_tab2}    物流商    # 物流页面两个基本标签页 物流方案/物流商
#${contentB_shipping_name}    物流1    # 物流名称
#${contentB_shipping_setup}    设置你的物流方案    # 没有物流方案时，页面提示设置物流
#
#${locatorB_shipping_list_api}    ${home_page}/api/shipping/list
#
#${locatorB_shipping_description}    dom:document.querySelectorAll("#desc")[0]    #.添加运费- 说明框
#${locatorB_shipping_price}    id:rate_amount    #.价格运费框
#${locatorB_shipping_range_min}    id:range_min    #.添加数量运费-最小订单数量输入框
#${locatorB_shipping_range_max}    id:range_max    #.添加数量运费-最大订单数量输入框
#${locatorB_shipping_save_btn}    ${locatorB_button_save}    #.添加物流-保存-按钮
#
## add country
#
#
#${locatorB_shipping_country_element}    dom:document.getElementsByClassName("ant-tree-checkbox")[0]    #.国家列表-选择非洲这一行的元素
#
#${locatorB_shipping_country_nums}    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]    #.国家列表-南极洲 元素
#${locatorB_shipping_country_data}    class:ant-table-body    #.国家显示数据的地方
#${locatorB_shipping_country_close_btn}    dom:document.querySelectorAll(".ant-modal-close-x")[0]    #.国家列表-关闭按钮
#${locatorB_shipping_country_other}    return document.getElementsByClassName("ant-checkbox-input")[0].click()    #.国家列表-选择其他国家 元素
#${locatorB_shipping_country_get_other}    dom:document.querySelectorAll(".name_wrapper___9BdrG p")[1]    #.获取物流列表显示其他国家的位置
#
## shipping setting page
#${locatorB_shipping_send_address}    class:title___29mch    #.物流界面-发货地址-
#
#
## kwshipping.add_price_fee_shipping_py freight
#${locatorB_shipping_freight_save}    id:test_shipping_edit_modal_sure_btn    #.添加运费- 保存-按钮
#${locatorB_shipping_freight_cancel_btn}    id:test_shipping_edit_modal_cancel_btn    #. 添加运费-取消-按钮
#${locatorB_shipping_freight_content_elm}    dom:document.querySelectorAll(".ant-table-tbody")[1]    # 添加价格运费-显示价格运费的地方的元素
#${locatorB_shipping_freight_error_elm}    class:ant-form-explain    # 添加价格运费- 提示错误文案的元素
#${locatorB_shipping_freight_free_freight_btn}    return document.querySelectorAll(".ant-checkbox-input")[0].click()    # 添加价格运费-免运费-按钮
#
## kwshipping.add_quantity_fee_shipping_py freight
#${locatorB_shipping_quantity_first_input}    dom:document.querySelectorAll("#name")[1]     #.添加数量运费-物流名称输入框
#
#
## shipping case variable
#${shipping_first_button}    dom:document.querySelectorAll("button")[1]    #.对应 shipping_case 的 button[1]
#${shipping_first_input}    dom:document.querySelectorAll("#name")[1]    #.对应shipping_case 的 物流名称输入框
#
## kwshipping.add_weight_fee_shipping_py
#${locatorB_shipping_weight_first_input}    dom:document.querySelectorAll('#name')[1]    #.添加重量运费-物流名称输入框



