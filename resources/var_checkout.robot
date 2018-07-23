*** Variables ***
#.locator
${first_name}     //*[@id="verify_form"]/div[2]/div[1]/input[1]
${last_name}      //*[@id="verify_form"]/div[2]/div[1]/input[2]
${city}           //*[@id="verify_form"]/div[2]/div[4]/input
${address}        //*[@id="verify_form"]/div[2]/div[5]/input
${post_code}      //*[@id="verify_form"]/div[2]/div[6]/input
${email}          //*[@id="verify_form"]/div[2]/div[7]/input
${phone}          //*[@id="verify_form"]/div[2]/div[8]/input
${company}        //*[@id="verify_form"]/div[2]/div[9]/input


${locator_checkout_add_card_btn}    dom:document.querySelectorAll(".submit_mb span")[0]    #.添加购物车按钮
${locator_checkout_by_now_btn}    dom:document.querySelectorAll(".buy-now")[0]    #.by-now按钮
${locator_checkout_submit_btn_s}    dom:document.querySelectorAll(".footer-submit")[0]    #.点击by-now后的submit按钮
${locator_checkout_search_btn}    dom:document.querySelectorAll("a[alt='sousuo1']")[0]    #.checkout搜索按钮
${locator_checkout_user_name}    dom:document.querySelectorAll("div[alt='logo']")[0]    #.checkout顶部店铺名
${locator_checkout_card_img_btn}    dom:document.querySelectorAll("a[alt='bag']")[0]    #.checkout购物车图标按钮
${locator_checkout_member_btn}    dom:document.querySelectorAll("a[alt='account']")[0]    #.checkout顶部个人中心图标按钮

#.checkout - address
${locator_checkout_address_btn}    dom:document.querySelectorAll(".address_btn")[0]    #.checkout点击by-now后的添加地址按钮
${locator_checkout_address_first_name}    dom:document.querySelectorAll("input[name='first_name']")[0]    #.添加地址后-first_name输入框
${locator_checkout_address_last_name}    dom:document.querySelectorAll("input[name='last_name']")[0]    #.添加地址后-last_name输入框
${locator_checkout_address_select_country}    id:shipping_country_id    #.添加地址后选择国家下拉框
${locator_checkout_address_select_city}    id:shipping_zone_id    #.添加地址后选择城市下拉框
${locator_checkout_address_city}    dom:document.querySelectorAll("input[name='city']")[0]    #.添加地址后选择城市
${locator_checkout_address_add}    dom:document.querySelectorAll("input[name='address']")[0]    #.添加地址后填写地址
${locator_checkout_address_zip}    dom:document.querySelectorAll("input[name='zip']")[0]    #.添加地址后zip框
${locator_checkout_address_email}    dom:document.querySelectorAll("input[name='email']")[0]    #.添加地址后email框
${locator_checkout_address_phone}    dom:document.querySelectorAll("input[name='phone']")[0]    #.添加地址后phone框
${locator_checkout_address_company}    dom:document.querySelectorAll("input[name='company']")[0]    #.添加地址后copmany框
${locator_checkout_address_error}    dom:document.querySelectorAll(".not_none")[0]    #.添加地址错误类
${locator_checkout_address_close_address}    dom:document.querySelectorAll(".close_icon")[1]    #.关闭地址按钮

${locator_checkout_address_save_address_btn}    dom:document.querySelectorAll(".form-footer")[0]    #.保存地址按钮
${locator_checkout_address_save_checkout_btn}    id:submitMbPay    #.保存地址后的提交按钮
${locator_checkout_write_review}    dom:document.querySelectorAll(".review_write")[0]    #.checkout-留言按钮

${locator_checkout_down_price_eml}    dom:document.querySelectorAll(".detail")[0]    #.checkout-底部价格元素
${locator_checkout_submit_save_btn}    id:submitPaymentMb    #.checkout-提交地址后的保存按钮
${locator_checkout_payment_ipaylinks_elm}    dom:document.querySelectorAll("label[for='ipaylinks']")[0]    #.checkout-选择支付方式 ipaylinks 元素
${locator_checkout_payment_cod_elm}    dom:document.querySelectorAll("label[for='cod']")[0]    #.checkout-选择支付方式 cod 元素