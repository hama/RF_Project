*** Variables ***
# locator

${locator_shipping_btn}    dom:document.querySelectorAll("button")[1]    #.开始设置物流按钮
${locator_shipping_first_element}    dom:document.querySelectorAll("#test_shipping_list_0 li")[0]    # 物流列表第一个元素
${locator_shipping_add_country}    id:test_shipping_country_add_btn    # 设置物流-添加国家按钮
${locator_shipping_add_shipping}    dom:document.querySelectorAll("button")[0]    # 添加物流按钮
${locator_shipping_del_shipping}    id:test_shipping_delete_btn    # 删除物流按钮
${locator_shipping_add_price_btn}    id:test_shipping_add_price_btn    #.添加价格运费按钮
${locator_shipping_add_quantity_btn}    id:test_shipping_add_quantity_btn    #.添加数量运费按钮
${locator_shipping_add_weight_btn}    id:test_shipping_add_weight_btn    #. 添加重量运费按钮


# page content
${contentB_shipping_tab1}    物流方案    # 物流页面两个基本标签页 物流方案/物流商
${contentB_shipping_tab2}    物流商    # 物流页面两个基本标签页 物流方案/物流商
${contentB_shipping_name}    物流1    # 物流名称
${contentB_shipping_setup}    设置你的物流方案    # 没有物流方案时，页面提示设置物流

${locatorB_shipping_list_api}    ${home_page}/api/shipping/list
${locatorB_shipping_first_input}    dom:document.querySelectorAll('#name')[0]    #.输入物流名称框
${locatorB_shipping_description}    dom:document.querySelectorAll("#desc")[0]    #.添加运费- 说明框
${locatorB_shipping_price}    id:rate_amount    #.价格运费框
${locatorB_shipping_range_min}    id:range_min    #.添加数量运费-最小订单数量输入框
${locatorB_shipping_range_max}    id:range_max    #.添加数量运费-最大订单数量输入框

# add country
${locatorB_shipping_country_element}    dom:document.getElementsByClassName("ant-tree-checkbox")[0]    #.国家列表-选择非洲这一行的元素
${locatorB_shipping_country_select}    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]    #.国家列表-列出非洲 代表的元素
${locatorB_shipping_country_nums}    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]    #.国家列表-南极洲 元素
${locatorB_shipping_country_save_btn}    dom:document.getElementById("test_shipping_country_modal_sure_btn")    #.国家列表-保存按钮
${locatorB_shipping_country_data}    class:ant-table-body    #.国家显示数据的地方
${locatorB_shipping_country_close_btn}    dom:document.querySelectorAll(".ant-modal-close-x")[0]    #.国家列表-关闭按钮
${locatorB_shipping_country_other}    return document.getElementsByClassName("ant-checkbox-input")[0].click()    #.国家列表-选择其他国家 元素
${locatorB_shipping_country_get_other}    dom:document.querySelectorAll(".name_wrapper___Kkqpr p")[1]    #.获取物流列表显示其他国家的位置

# shipping setting page
${locatorB_shipping_send_address}    class:title___29mch    #.物流界面-发货地址-


# add price shipping freight
${locatorB_shipping_freight_save}    id:test_shipping_edit_modal_sure_btn    #.添加运费- 保存-按钮
${locatorB_shipping_freight_first_input}    dom:document.querySelectorAll('#name')[1]    # 添加价格运费-物流名称输入框
${locatorB_shipping_freight_content_elm}    dom:document.querySelectorAll(".ant-table-tbody")[1]    # 添加价格运费-显示价格运费的地方的元素
${locatorB_shipping_freight_error_elm}    class:ant-form-explain    # 添加价格运费- 提示错误文案的元素
${locatorB_shipping_freight_free_freight_btn}    return document.querySelectorAll(".ant-checkbox-input")[0].click()    # 添加价格运费-免运费-按钮

# add quantity shipping freight
${locatorB_shipping_quantity_first_input}    dom:document.querySelectorAll("#name")[1]     #.添加数量运费-物流名称输入框


# shipping case variable
${shipping_first_button}    dom:document.querySelectorAll("button")[1]    #.对应 shipping_case 的 button[1]
${shipping_first_input}    dom:document.querySelectorAll("#name")[1]    #.对应shipping_case 的 物流名称输入框

# add weight shipping
${locatorB_shipping_weight_first_input}    dom:document.querySelectorAll('#name')[1]    #.添加重量运费-物流名称输入框

