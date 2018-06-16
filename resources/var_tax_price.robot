*** Variables ***
${home_page}      http://admin1024.shoplazza.com
${main_user}      18826557090    #.没有子账户的账号
${main_pwd}       147258    #.没有子账户的密码
${recover_user}    15220581724    #.找回密码的账号
${recover_password}    123456    #.找回密码的密码
${recover_domain}    chen    #.找回密码的域名
${defaultUser}    17601298661
${defaultPassword}    111111
${defaultDomain}    baiyuan
${tax_price_setting}    税费设置
${tax_shipping_setting}    前往运费设置
${tax_shipping_setting_title}    物流
${tax_shipping_setting_msg}    设置你的物流方案
${tax_shipping_tab1}    物流方案
${tax_shipping_tab2}    物流商
${tax_price_url}    http://admin1024.shoplazza.com/taxPrice
${tax_shipping_url}    http://admin1024.shoplazza.com/shipping
${tax_page_country}    国家
${tax_page_country_price}    国家税率
${tax_page_location}    分地区
${tax_page_operation}    操作
${tax_page_list_interface}    http://admin1024.shoplazza.com/api/tax/list
${tax_page_toggle_switch_api}    http://admin1024.shoplazza.com/api/tax/toggle
${tax_page_tips}    只有在运费设置中添加过的国家，才会出现在下面列表中
${tax_page_count_tips}    税=（税率 x 价格）／（1+税率）。例如：$1.00，20%的增值税是$0.17（四舍五入）
${tax_page_setting_ok}    设置成功
${tax_page_setting_hover_tips}    设置
${tax_page_zone_total_all}    全部
