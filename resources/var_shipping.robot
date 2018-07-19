*** Variables ***
# locator
${locatorB_shipping_btn}    dom:document.querySelectorAll("button")[1]    #.开始设置物流按钮
${locatorB_shipping_first_element}    dom:document.querySelectorAll("#test_shipping_list_0 li")[0]    # 物流列表第一个元素
${locatorB_shipping_add_country}    id:test_shipping_country_add_btn    # 设置物流-添加国家按钮
${locatorB_shipping_add_shipping}    dom:document.querySelectorAll("button")[1]    # 添加物流按钮
${locatorB_shipping_del_shipping}    id:test_shipping_delete_btn    # 删除物流按钮
${locatorB_shipping_add_price_btn}    id:test_shipping_add_price_btn    #.添加价格运费按钮
${locatorB_shipping_add_quantity_btn}    id:test_shipping_add_quantity_btn    #.添加数量运费按钮
# page content
${contentB_shipping_tab1}    物流方案    # 物流页面两个基本标签页 物流方案/物流商
${contentB_shipping_tab2}    物流商    # 物流页面两个基本标签页 物流方案/物流商
${contentB_shipping_name}    物流1    # 物流名称
${contentB_shipping_setup}    设置你的物流方案    # 没有物流方案时，页面提示设置物流
${page_list_api}    ${home_page}/api/shipping/list
