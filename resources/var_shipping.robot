*** Variables ***
${shipping_name}    物流1    #>.物流名称
${shipping_first_element}    dom:document.querySelectorAll("#test_shipping_list_0 li")[0]    #.物流列表第一个元素
${del_shipp_btn}    id:test_shipping_delete_btn    #.删除物流按钮
${navigation_setting}    id:test_setting    #.导航栏-设置 按钮
${navigation_shipping}    dom:document.querySelectorAll('a[href="/shipping"]')[0]    #.导航栏-物流 按钮
${navagation_payment}    dom:document.querySelectorAll('a[href="/pay"]')[0]    #.导航栏-支付设置 按钮
${shipping_add_country}    test_shipping_country_add_btn    #.设置物流-添加国家按钮
${add_shipping_btn}    dom:document.querySelectorAll("button")[1]    #.添加物流按钮
${shipping_url}    http://admin1024.shoplazza.com/shipping
