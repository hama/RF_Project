*** Variables ***
${tax_price_setting}    税费设置
${tax_shipping_setting}    前往运费设置
${tax_shipping_setting_title}    物流设置
${tax_shipping_setting_msg}    设置你的物流方案
${tax_shipping_tab1}    物流方案设置
${tax_shipping_tab2}    物流商设置
${tax_page_country}    国家
${tax_page_country_price}    国家税率
${tax_page_location}    分地区
${tax_page_operation}    操作
${tax_page_list_interface}    http://admin1024.shoplazza.com/api/tax/list
${tax_page_tips}    只有在运费设置中添加过的国家，才会出现在下面列表中
${tax_page_count_tips}    税=（税率 x 价格）／（1+税率）。例如：$1.00，20%的增值税是$0.17（四舍五入）
${tax_page_setting_ok}    设置成功
${tax_page_setting_hover_tips}    设置
${tax_page_zone_total_all}    全部
${navigation_setting}    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div    #.导航栏-设置 按钮
${navigation_shipping}    //*[@id="9$Menu"]/li[3]/a    #.导航栏-物流 按钮
${navagation_payment}    //*[@id="9$Menu"]/li[4]/a    #.导航栏-支付设置 按钮
${add_shipping_btn}    test_add_btn    #.添加物流按钮
