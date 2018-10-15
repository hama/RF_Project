*** Variables ***
#.locator







${locatorB_checkout_add_card_btn}    dom:document.querySelectorAll(".submit_mb span")[0]    #.添加购物车按钮
${locatorB_checkout_by_now_btn}    dom:document.querySelectorAll(".second_btn")[0]    #.by-now按钮
${locatorB_checkout_submit_btn_s}    dom:document.querySelectorAll('.checkout-btn')[0]    #.点击by-now后的submit按钮
${locatorB_checkout_submit_shippingCart}    dom:document.querySelectorAll('#checkout-btn')[0]   #.购物车-checkout提交按钮
${locatorB_checkout_search_btn}    dom:document.querySelectorAll("a[alt='Search']")[0]    #.checkout搜索按钮
${locatorB_checkout_user_name}    dom:document.querySelectorAll("div[alt='Logo']")[0]    #.checkout顶部店铺名
${locatorB_checkout_card_img_btn}    dom:document.querySelectorAll("a[alt='Cart']")[0]    #.checkout购物车图标按钮
${locatorB_checkout_member_btn}    dom:document.querySelectorAll("a[alt='Account']")[0]    #.checkout顶部个人中心图标按钮
${locatorB_checkout_selectColor_elm}    dom:document.querySelectorAll(".variant_select_all")[0]    #.checkout主页-选择颜色，尺寸

#.checkout - order

${locatorB_checkout_selectColor_elm}    dom:document.querySelectorAll("div[class='footer-add']")[0]     #.c端订单-添加到购物车 add to cart
${locatorC_checkout_submit_bynow}    dom:document.querySelectorAll(".footer-submit")[0]     #.c端订单-by-now按钮
#.checkout - input
${locatorC_checkout_input_quantity}    dom:document.querySelectorAll("input[data-track-type='input']")[0]     #.购物车购买商品数量输入框
${locatorC_checkout_input_checkNum}    dom:document.querySelectorAll("input[class='qty-num']")[0]   #订单页-订单输入数量框

#.checkout - address
${locatorB_productsMgmt_icon_preview}      dom:document.querySelectorAll('.dj-preview')[0]  #B端商品预览按钮

${locatorB_checkout_addressCoupon_ipt}    dom:document.querySelectorAll("#coupon_code_input")[0]    #.checkout 输入优惠券框
${locatorB_checkout_addressClickCoupon_btn}    dom:document.querySelectorAll("#coupon_apply")[0]    #.checkout 填写地址页面 - 点击应用优惠券按钮
${locatorB_checkout_address_btn}    dom:document.querySelectorAll(".address_btn")[0]    #.checkout点击by-now后的添加地址按钮
${locatorB_checkout_address_first_name}    dom:document.querySelectorAll("input[name='first_name']")[0]    #.添加地址后-first_name输入框
${locatorB_checkout_address_last_name}    dom:document.querySelectorAll("input[name='last_name']")[0]    #.添加地址后-last_name输入框
${locatorB_checkout_address_select_country}    dom:document.querySelectorAll('#shipping_country_select')[0]    #.添加地址后选择国家下拉框
${locatorB_checkout_address_select_province}    dom:document.querySelectorAll('#shipping_province_select')[1]  #.添加地址后选择省份下拉框

${locatorB_checkout_address_city}    dom:document.querySelectorAll("input[name='city']")[0]    #.添加地址后选择城市
${locatorB_checkout_address_add}    dom:document.querySelectorAll("input[name='address']")[0]    #.添加地址后填写地址
${locatorB_checkout_address_zip}    dom:document.querySelectorAll("input[name='zip']")[0]    #.添加地址后zip框
${locatorB_checkout_address_email}    dom:document.querySelectorAll("input[name='email']")[0]    #.添加地址后email框
${locatorB_checkout_address_phone}    dom:document.querySelectorAll("input[name='phone']")[0]    #.添加地址后phone框
${locatorB_checkout_address_company}    dom:document.querySelectorAll("input[name='company']")[0]    #.添加地址后copmany框
${locatorC_checkout_address_postalCode}     dom:document.querySelectorAll('input[name="address1"]')[0]   #添加apartment

${locatorB_checkout_address_error}    dom:document.querySelectorAll(".not_none")[0]    #.添加地址错误类
${locatorB_checkout_address_close_address}    dom:document.querySelectorAll(".close_icon")[1]    #.关闭地址按钮
${locatorB_checkout_address_buyMesg_elm}    id:instructionToggle    #.买家留言

# 信用卡信息
${locatorB_checkout_creditCard_input_name}    dom:document.querySelectorAll('[name="card_first_name"]')[0]    #.信用卡name
${locatorB_checkout_creditCard_input_email}    dom:document.querySelectorAll('[name="card_email"]')[0]
${locatorB_checkout_creditCard_input_phone}    dom:document.querySelectorAll('[name="card_phone"]')[0]
${locatorB_checkout_creditCard_input_post}    dom:document.querySelectorAll('[name="card_postcode"]')[0]
${locatorB_checkout_creditCard_input_number}    dom:document.querySelectorAll('[name="card_number"]')[0]
${locatorB_checkout_creditCard_input_expireDate}    dom:document.querySelectorAll('[name="card_date"]')[0]
${locatorB_checkout_creditCard_input_securityCode}    dom:document.querySelectorAll('[name="card_code"]')[0]


${locatorB_checkout_address_save_address_btn}    dom:document.querySelectorAll(".form-footer")[0]    #.保存地址按钮
${locatorB_checkout_address_save_checkout_btn}    id:submitMbPay    #.保存地址后的提交按钮
${locatorB_checkout_write_review}    dom:document.querySelectorAll(".review_write")[0]    #.checkout-留言按钮
${locatorB_checkout_address_showProduct_eml}    class:order_summary    #.checkout-添加地址页面的顶部查看商品详情(向下箭头)



${locatorB_checkout_down_price_eml}    dom:document.querySelectorAll(".detail")[0]    #.checkout-底部价格元素
${locator_checkout_submit_save_btn}    id:submitPaymentMb    #.checkout-提交地址后的保存按钮
${locator_checkout_payment_ipaylinks_elm}    dom:document.querySelectorAll("label[for='ipaylinks']")[0]    #.checkout-选择支付方式 ipaylinks 元素
${locator_checkout_payment_cod_elm}    dom:document.querySelectorAll("label[for='cod']")[0]    #.checkout-选择支付方式 cod 元素

${locatorB_checkout_submitOrderPass_msg}    Your order has been submitted successfully.    #.提交订单成功的页面出现的字体
${locatorB_checkout_Cod_font}    Cash on Delivery    #.货到付款 字体

${locatorC_checkout_link_change}    dom:document.querySelectorAll('a[class="fr"]')[0]   #change  返回上一步
${locatorC_checkout_link_return}     dom:document.querySelectorAll('a[id="checkout-back"]')[0]          #支付页返回按钮
${locator_checkout_button_checkoutBack}     dom:document.querySelectorAll("#checkout-back")[0]          #
${locatorC_checkout_input_discountCode}     dom:document.querySelectorAll('input[id="coupon_code_input"]')[0]       #优惠码输入框
${locatorC_checkout_submit_apply}     dom:document.querySelectorAll('button[id="coupon_apply"]')[0]     #优惠码提交按钮

${locatorC_checkout_shipping_price}     dom:document.querySelectorAll('span[class="fr"]')[0]
${locatorC_checkout_shipping_submitCheckout}     dom:document.querySelectorAll('.checkout-btn')[0]        #type="submit"    checkout  提交到shipping method
${locatorC_checkout_payment_cashOnDelivery}     dom:document.querySelectorAll('.payment-line')[0]        #支付方式-货到付款
${locatorC_checkout_shipping_orderSubmit}      dom:document.querySelectorAll('button[type="submit"]')[0]     #order checkout 提交按钮
#locatorC payment
${locatorC_checkout_payment_creditCard}     dom:document.querySelectorAll('[class="djfont card-checkout-credit"]')[0]        #支付方式-信用卡支付
${locatorC_checkout_paymentCard_fristName}    dom:document.querySelectorAll('input[name="card_first_name"]')[0]    #first_name 姓名
${locatorC_checkout_paymentCard_cardEmail}     dom:document.querySelectorAll('input[name="card_email"]')[0]     #card email 邮箱
${locatorC_checkout_paymentCard_phone}     dom:document.querySelectorAll('input[name="card_phone"]')[0]       #.card phone 手机
${locatorC_checkout_paymentCard_cardPostcode}     dom:document.querySelectorAll('input[name="card_postcode"]')[0]      #card_postcode  邮编号码
${locatorC_checkout_paymentCard_cardNumber}     dom:document.querySelectorAll('input[name="card_number"]')[0]        #card_number 信用卡 卡号
${locatorC_checkout_paymentCard_cardDate}     dom:document.querySelectorAll('input[name="card_date"]')[0]      #.card_date  有效日期
${locatorC_checkout_paymentCard_card_code}     dom:document.querySelectorAll('input[name="card_code"]')[0]     #.card_code  安全码
#locatorC checkout method
${locatorC_checkout_shipping_method}    dom:document.querySelectorAll('.checkout-prices-name')[0]       #shipping  显示物流价格
${locatorC_checkout_shipping_preferential}    dom:document.querySelectorAll('.checkout-prices-value')[2]    #.订单运费
${locatorC_checkout_text_order}     dom:document.querySelectorAll(".item-sku-title")[0]     #.商品标题
${locatorC_checkout_shipping_delivery}   dom:document.querySelectorAll(".fr")[3]        #shipping delivery 运费价格

${locatorC_checkout_prices_total}   dom:document.querySelectorAll(".checkout-prices tfoot td")[1]   #.商品总价格
${locatorC_checkout_prices_itemPrice}   dom:document.querySelectorAll(".item-price")[0]     #商品单价
${locatorC_checkout_prices_shippingValue}   dom:document.querySelectorAll(".checkout-prices-value")[1]      #.运费shipping
${locatorC_checkout_prices_itemQuantity}   dom:document.querySelectorAll(".item-quantity")[0]      #.商品数量显示
#locatorC Payment Method
${locatorC_checkout_select_billingAddress}    dom:document.querySelectorAll("select[id='billingSelect']")[0]       #.billingAddress  扩展select
${locatorC_checkout_inputText_firstName}    dom:document.querySelectorAll("input[name='first_name']")[0]        #.payment method /first_name输入框
${locatorC_checkout_inputText_lastName}    dom:document.querySelectorAll("input[name='last_name']")[0]          #.payment method / last_name输入框
${locatorC_checkout_inputText_address}    dom:document.querySelectorAll("input[name='address']")[0]     #.payment method   /address 输入框
${locatorC_checkout_inputText_address1}    dom:document.querySelectorAll("input[name='address1']")[0]       #.payment method  /address1 输入框
${locatorC_checkout_inputText_city}    dom:document.querySelectorAll("input[name='city']")[0]       #.payment method    /city 城市输入框
${locatorC_checkout_inputText_countyCode}    dom:document.querySelectorAll("select[name='country_code']")[0]        #.payment method    /county 国家下拉选择
${locatorC_checkout_inputText_provinceCode}    dom:document.querySelectorAll("select[name='province_code']")[0]     #.payment method    /province 城市下拉选择
${locatorC_checkout_inputText_zip}    dom:document.querySelectorAll("input[name='zip']")[0]        #.payment method    /zip 输入框

#locatorC payment Method successful
${locatorC_checkout_link_viewOrders}    dom:document.querySelectorAll(".order-btn")[0]        #.订单成功-订单详情按钮 viewOrders
${locatorC_checkout_link_continueShopping}    dom:document.querySelectorAll(".continue-btn")[0]        #.订单成功-跳转到首页 continue shopping
#locatorC order yong hu
${locatorC_checkout_link_orderList}    dom:document.querySelectorAll('a[href="/account/order"]')[0]     #.个人中心里，订单详情页
#locatorC home
${locatorC_checkout_home}    dom:document.querySelectorAll('.swiper-wrapper')[0]      #首页banner图元素模块







