*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator shipping

${locatorB_shipping_btn_startSet}    dom:document.querySelectorAll("button")[1]    #.开始设置物流按钮
${locatorB_shipping_items_listShippingItems}    dom:document.querySelectorAll('ul[id*="test_shipping_list"]')    #.list物流方案
${locatorB_shipping_text_listShippingItemsName}    dom:document.querySelectorAll('[id*="test_shipping_list"] [class*="title"]')  # 物流方案名

# locator shippingNew
${locatorB_shippingNew_input_shippingName}    dom:document.querySelectorAll('input[data-robot="shipping_ph_name"]')[0]    #.输入物流名称框
${locatorB_shippingNew_btn_addCountry}    dom:document.querySelectorAll('button[data-robot="shipping_add_country"]')[0]    # 设置物流-添加国家按钮
${locatorB_shippingNew_btn_popUpConfirm}    dom:document.querySelectorAll('[id="test_shipping_country_modal_sure_btn"]')    #.国家列表-保存按钮
${locatorB_shippingNew_text_listCountryName}    dom:document.querySelectorAll('[class*="country_item"] [class*="name"]')    #.国家名
${locatorB_shippingNew_btn_addPriceShipping}    dom:document.querySelectorAll('[data-robot="shipping_add_price"]')    #.
${locatorB_shippingNew_btn_addWeightShipping}    dom:document.querySelectorAll('[data-robot="shipping_add_weight"]')    #.
${locatorB_shippingNew_btn_addQuantityShipping}    dom:document.querySelectorAll('[data-robot="shipping_add_quantity"]')    #.
${locatorB_shippingNew_items_listItemsOfPrice}    dom:document.querySelectorAll('[class*="translatedContent2"] [class~="ant-table-row"]')    #.
${locatorB_shippingNew_icon_listDelCountryItem}    dom:document.querySelectorAll('[id="test_shipping_country_delete_icon"]')    #.
${locatorB_shippingNew_btn_delShipping}    dom:document.querySelectorAll('[id="test_shipping_delete_btn"]')    #.



# locator shippingNew popUp add country
${locatorB_shippingNew_popUp_arrow_listArrow}    dom:document.querySelectorAll('[class*="show_tree"] [class~="ant-tree-switcher"]')    #.国家列表-箭头list
${locatorB_shippingNew_popUp_checkbox_firstCountry}    dom:document.querySelectorAll('[class*="show_tree"] [class~="ant-tree-child-tree"] span[class="ant-tree-checkbox-inner"]')[0]    #.国家列表-第一个国家checkbox
${locatorB_shippingNew_popUp_checkbox_secondCountry}    dom:document.querySelectorAll('[class*="show_tree"] [class~="ant-tree-child-tree"] span[class="ant-tree-checkbox-inner"]')[1]    #.国家列表-第一个国家checkbox
${locatorB_shippingNew_popUp_checkbox_listContinents}    dom:document.querySelectorAll('[class~="ant-tree"] > li > span.ant-tree-checkbox > span')    #.国家列表-list of Continents checkbox

${locatorB_shippingNew_popUp_input_countryName}    dom:document.querySelectorAll('input[placeholder="国家名"]')[0]    #.添加国家-顶部输入国家输入框
${locatorB_shippingNew_popUp_btn_search}    id:test_shipping_country_modal_search_btn    #.添加国家-搜索按钮
${locatorB_shippingNew_popUp_checkbox_otherCountry}    dom:document.querySelectorAll('[class="ant-checkbox"]')[0]    #.国家列表-其他国家checkbox

# locator shippingNew popUp addPriceShipping
${locatorB_shippingNew_popUp_input_shippingName}    dom:document.querySelectorAll('[placeholder="Standard Shipping"]')[0]    # 添加价格运费-物流名称输入框
${locatorB_shippingNew_popUp_input_minPrice}    dom:document.querySelectorAll('[id="range_min"]')[0]    # 最小订单价格
${locatorB_shippingNew_popUp_input_maxPrice}    dom:document.querySelectorAll('[id="range_max"]')[0]    # 最大订单价格
${locatorB_shippingNew_popUp_btn_save}    id:test_shipping_edit_modal_sure_btn    #.添加运费- 保存-按钮
${locatorB_shippingNew_popUp_btn_cancel}    id:test_shipping_edit_modal_cancel_btn    #. 添加运费-取消-按钮
${locatorB_shippingNew_popUp_checkbox_freeShipping}    dom:document.querySelectorAll('div:nth-child(4) span.ant-checkbox')     #.免运费
${locatorB_shippingNew_popUp_checkbox_supportCOD}    dom:document.querySelectorAll('div:nth-child(5) span.ant-checkbox')      #.支持货到付款
${locatorB_shippingNew_popUp_input_shippingPrice}    dom:document.querySelectorAll('[id="rate_amount"]')      #.运费价格
${locatorB_shippingNew_icon_listEditPriceShippingItem}    dom:document.querySelectorAll('[id="test_shipping_price_edit_icon"]')    #.
${locatorB_shippingNew_icon_listDelPriceShippingItem}    dom:document.querySelectorAll('[id="test_shipping_price_delete_icon"]')    #.




${locatorB_shipping_first_element}    dom:document.querySelectorAll("#test_shipping_list_0 li")[0]    # 物流列表第一个元素
${locatorB_shipping_add_shipping}    dom:document.querySelectorAll("button")[1]    # 添加物流按钮
${locatorB_shipping_del_shipping}    id:test_shipping_delete_btn    # 删除物流按钮
${locatorB_shipping_add_price_btn}    dom:document.querySelectorAll('button[data-robot="shipping_add_price"]')[0]    #.添加价格运费按钮
${locatorB_shipping_add_quantity_btn}    dom:document.querySelectorAll('button[data-robot="shipping_add_quantity"]')[0]    #.添加数量运费按钮
${locatorB_shipping_add_weight_btn}    dom:document.querySelectorAll('button[data-robot="shipping_add_weight"]')[0]    #. 添加重量运费按钮
${locatorB_shipping_del_country_btn}    dom:document.querySelectorAll(".icon_delete___ITXOZ")[0]    #. 删除国家按钮
${locatorB_shipping_edit_priceFgt_btn}    dom:document.querySelectorAll("#test_shipping_price_edit_icon")[0]    #. 价格运费编辑按钮
${locatorB_shipping_del_priceFgt_btn}    dom:document.querySelectorAll("#test_shipping_price_delete_icon")[0]    #. 加个运费删除按钮

# page content
${contentB_shipping_tab1}    物流方案    # 物流页面两个基本标签页 物流方案/物流商
${contentB_shipping_tab2}    物流商    # 物流页面两个基本标签页 物流方案/物流商
${contentB_shipping_name}    物流1    # 物流名称
${contentB_shipping_setup}    设置你的物流方案    # 没有物流方案时，页面提示设置物流

${locatorB_shipping_list_api}    ${home_page}/api/shipping/list

${locatorB_shipping_description}    dom:document.querySelectorAll("#desc")[0]    #.添加运费- 说明框
${locatorB_shipping_price}    id:rate_amount    #.价格运费框
${locatorB_shipping_range_min}    id:range_min    #.添加数量运费-最小订单数量输入框
${locatorB_shipping_range_max}    id:range_max    #.添加数量运费-最大订单数量输入框
${locatorB_shipping_save_btn}    ${locatorB_button_save}    #.添加物流-保存-按钮

# add country


${locatorB_shipping_country_element}    dom:document.getElementsByClassName("ant-tree-checkbox")[0]    #.国家列表-选择非洲这一行的元素

${locatorB_shipping_country_nums}    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]    #.国家列表-南极洲 元素
${locatorB_shipping_country_data}    class:ant-table-body    #.国家显示数据的地方
${locatorB_shipping_country_close_btn}    dom:document.querySelectorAll(".ant-modal-close-x")[0]    #.国家列表-关闭按钮
${locatorB_shipping_country_other}    return document.getElementsByClassName("ant-checkbox-input")[0].click()    #.国家列表-选择其他国家 元素
${locatorB_shipping_country_get_other}    dom:document.querySelectorAll(".name_wrapper___9BdrG p")[1]    #.获取物流列表显示其他国家的位置

# shipping setting page
${locatorB_shipping_send_address}    class:title___29mch    #.物流界面-发货地址-


# kwshipping.add_price_fee_shipping_py freight
${locatorB_shipping_freight_save}    id:test_shipping_edit_modal_sure_btn    #.添加运费- 保存-按钮
${locatorB_shipping_freight_cancel_btn}    id:test_shipping_edit_modal_cancel_btn    #. 添加运费-取消-按钮
${locatorB_shipping_freight_content_elm}    dom:document.querySelectorAll(".ant-table-tbody")[1]    # 添加价格运费-显示价格运费的地方的元素
${locatorB_shipping_freight_error_elm}    class:ant-form-explain    # 添加价格运费- 提示错误文案的元素
${locatorB_shipping_freight_free_freight_btn}    return document.querySelectorAll(".ant-checkbox-input")[0].click()    # 添加价格运费-免运费-按钮

# kwshipping.add_quantity_fee_shipping_py freight
${locatorB_shipping_quantity_first_input}    dom:document.querySelectorAll("#name")[1]     #.添加数量运费-物流名称输入框


# shipping case variable
${shipping_first_button}    dom:document.querySelectorAll("button")[1]    #.对应 shipping_case 的 button[1]
${shipping_first_input}    dom:document.querySelectorAll("#name")[1]    #.对应shipping_case 的 物流名称输入框

# kwshipping.add_weight_fee_shipping_py
${locatorB_shipping_weight_first_input}    dom:document.querySelectorAll('#name')[1]    #.添加重量运费-物流名称输入框

