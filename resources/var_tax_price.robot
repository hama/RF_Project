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
${nothingUser}    18825260804
${nothingUserPassword}    18825260804
${nothingUserDomain}    diu
${tax_price_setting}    税费设置
${tax_shipping_setting}    前往运费设置
${tax_shipping_setting_title}    物流
${tax_shipping_setting_msg}    设置你的物流方案
${tax_shipping_tab1}    物流方案
${tax_shipping_tab2}    物流商
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
${shipping_add_country}    test_shipping_country_add_btn    #.设置物流-添加国家按钮
${add_shipping_btn}    //*[@id="dj"]/div/div/div[2]/div[1]/div/div[4]/button    #.添加物流按钮
${order_list_btn}    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[2]/a    #.导航栏-订单 按钮
${order_all_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[1]/span[2]    #.订单-全部 按钮
${order_already_pay_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[2]/span[2]    #.订单-已支付 按钮
${order_delivered_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[3]/span[2]    #. 订单-待发货 按钮
${order_alerady_send_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[4]/span[2]    #.订单-已发货 按钮
${order_alerady_mission_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[5]/span[2]    #.订单-已完成 按钮
${order_not_payment_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[6]/span[2]    #.订单-未支付 按钮
${order_alerady_cencel_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[7]/span[2]    #.订单-已取消 按钮
${order_alerady_refund_btn}    //*[@id="dj"]/div/div[2]/div[1]/div/label[7]/span[2]    #.订单-已退款 按钮
${order_detail_element}    //*[@id="root"]/div/div/div[1]/div[2]/div[1]/div/div[1]    #.订单详情顶部元素
${order_list_first_tr}    dom:document.querySelectorAll("table tbody tr")[1]    #.订单列表table第一个tr
${order_dateil_update_send}    class:header_left___2PRCj    #.订单详情-更新运单号
${order_dateil_cencel_send}    dom:document.querySelectorAll(".icon_cancel___miRJp")[0]    #.订单详情-取消本次发货
${order_list_search}    //*[@id="dj"]/div/div[3]/div/div[3]/button[1]    #.订单列表搜索按钮
${order_list_api}    http://admin1024.shoplazza.com/api/order/list?start_create_time=1520092800&end_create_time=1528127999&page=0&size=20    #.订单列表api
${order_list_export}    //*[@id="dj"]/div/div[1]/a    #.订单列表 导出按钮
${error_msg}      出错啦！    #.自定义错误提示
${login_btn}      class:logBtn___3pRgJ    #.登陆按钮
${recover_pwd_btn}    //*[@id="root"]/div/div/form/div[4]/div/div/a[1]    #.忘记密码按钮
${register_btn}    //*[@id="root"]/div/div/form/div[4]/div/a    #.注册按钮
${shipping_name}    物流1    #>.物流名称
${shipping_first_element}    dom:document.querySelectorAll("#test_shipping_list_0 li")[0]    #.物流列表第一个元素
${del_shipp_btn}    id:test_shipping_delete_btn    #.删除物流按钮
${add_products_btn}    id:test_product    #.添加商品按钮
${add_products_title}    ceshi1    #.添加商品的标题
${add_products_img}    ./images/tm.jpg    #.添加商品的图片
${register_btn}    link:免费注册    #.注册按钮
