*** Variables ***
#.locator







${locatorB_checkout_shippingcart_cartBut}    dom:document.querySelectorAll("[class*='btn-primary']")[0]     #.添加购物车按钮
${locatorB_checkout_by_now_btn}    dom:document.querySelectorAll("[class*='btn-secondary']")[0]    #.by-now按钮
${locatorB_checkout_submit_btn_s}    dom:document.querySelectorAll('[class*="checkout-btn"]')[0]    #.点击by-now后的submit按钮
${locatorB_checkout_submit_shippingCart}    dom:document.querySelectorAll('[class*="checkout"]')[0]   #.购物车-checkout提交按钮
${locatorB_checkout_search_btn}    dom:document.querySelectorAll("[class*='sep-font sep-font-search-thin']")[0]    #.checkout搜索按钮
${locatorB_checkout_member_btn}     dom:document.querySelectorAll("[class*='sep-font sep-font-user-thin']")[0]    #.checkout个人中心图标按钮
${locatorB_checkout_card_img_btn}    dom:document.querySelectorAll("[class*='sep-font sep-font-cart-thin']")[0]    #.checkout购物车图标按钮

${locatorB_checkout_user_name}   dom:document.querySelectorAll("[class='text-truncate']")[0]    #.checkout顶部顶部店铺名
#${locatorB_checkout_selectColor_elm}    dom:document.querySelectorAll(".variant_select_all")[0]    #.checkout主页-选择颜色，尺寸    移动端
${locatorC_checkout_qty_input_num}    dom:document.querySelectorAll("[class*='form-control product-info__qty_num']")[0]    #商品购买数量输入框
#${locatorB_checkout_shippingcart_checkoutCart}    dom:document.querySelectorAll("[class*='checkout']")[0]   #.购物车checkout提交按钮
#.checkout - order
${locatorB_checkout_product_addToCart}    dom:document.querySelectorAll("div[class*='footer-add']")[0]     #.c端订单-添加到购物车 add to cart
#${locatorC_checkout_submit_bynow}    dom:document.querySelectorAll("[class='footer-submit']")[0]     #.c端订单-by-now按钮
#.checkout - input
${locatorC_checkout_input_quantity}    dom:document.querySelectorAll("input[data-track-type='input']")[0]     #.购物车购买商品数量输入框

${locatorC_checkout_icon_cancel}    dom:document.querySelectorAll("[class='sep-font sep-font-close-circle-thin']")[0]    #.取消购物车订单按钮
${locatorC_checkout_input_checkNum}    dom:document.querySelectorAll("input[class='qty-num']")[0]   #订单页-订单输入数量框
${locatorB_checkout_shippingcart_checkoutCart}    dom:document.querySelectorAll("[class*='cart__checkout']")[0]    #.checkout 购物车提交按钮


#.checkout - address
${locatorB_productsMgmt_icon_preview}      dom:document.querySelectorAll('.dj-preview')[0]  #B端商品预览按钮
${locatorB_checkout_addressCoupon_ipt}    dom:document.querySelectorAll("[id='coupon_code_input']")[0]    #.checkout 输入优惠券框
${locatorB_checkout_addressClickCoupon_btn}    dom:document.querySelectorAll("[id='coupon_apply']")[0]    #.checkout 填写地址页面 - 点击应用优惠券按钮
${locatorB_checkout_address_btn}    dom:document.querySelectorAll(".address_btn")[0]    #.checkout点击by-now后的添加地址按钮
${locatorC_checkout_text_price}    dom:document.querySelectorAll('[class="checkout-item__price"]')[0]    #.商品的单价

${locatorB_checkout_address_first_name}    dom:document.querySelectorAll("input[name='first_name']")[0]    #.添加地址后-first_name输入框
${locatorB_checkout_address_last_name}    dom:document.querySelectorAll("input[name='last_name']")[0]    #.添加地址后-last_name输入框
${locatorB_checkout_address_select_country}    dom:document.querySelectorAll('[id*="shipping_country_select"]')[0]    #.添加地址后选择国家下拉框
${locatorB_checkout_address_select_province}    dom:document.querySelectorAll('[id*="shipping_province_select"]')[0]  #.添加地址后选择省份下拉框
${locatorB_checkout_address_city}    dom:document.querySelectorAll("input[name='city']")[0]    #.添加地址后选择城市
${locatorB_checkout_address_add}    dom:document.querySelectorAll("input[name='address']")[0]    #.添加地址后填写地址
${locatorB_checkout_address_zip}    dom:document.querySelectorAll("input[name='zip']")[0]    #.添加地址后zip框
${locatorB_checkout_address_email1}    dom:document.querySelectorAll("input[name='email']")[0]    #.添加地址后email框
${locatorB_checkout_address_phone}    dom:document.querySelectorAll("input[name='phone']")[0]    #.添加地址后phone框
${locatorB_checkout_address_company}    dom:document.querySelectorAll("input[name='company']")[0]    #.添加地址后copmany框
${locatorC_checkout_address_postalCode}     dom:document.querySelectorAll('input[name="address1"]')[0]   #添加apartment
${locatorC_checkout_address_Code}    dom:document.querySelectorAll('[id*="shipping_phone_select"]')[0]    #电话区号下拉列表
#contact Email
${locatorB_checkout_address_email}    dom:document.querySelectorAll("input[name='contact_email']")[0]    #.添加地址后email框
${locatorC_checkout_input_special}    dom:document.querySelectorAll('[class="checkout-instruction"]')[0]    #.留言信息
${locatorC_checkout_input_specialInstruction}    dom:document.querySelectorAll('[class="checkout-instruction__textarea"]')[0]    #.留言信息输入框
${locatorC_checkout_button_paymentMethod}    dom:document.querySelectorAll('[class*="btn btn-primary checkout-footer"]')[0]    #.payment method  提交按钮

${locatorC_checkout_button_comleteOrder}     dom:document.querySelectorAll('[class*="btn btn-primary payment-footer__btn"]')[0]    #//complete Order 提交按钮
${locatorC_checkout_button_completeReturn}     dom:document.querySelectorAll('[class*="payment-footer__back payment__pc"]')[0]     #.complete return 返回
${locatorB_checkout_address_error}    dom:document.querySelectorAll(".not_none")[0]    #.添加地址错误类
${locatorB_checkout_address_close_address}    dom:document.querySelectorAll(".close_icon")[1]    #.关闭地址按钮
${locatorB_checkout_address_buyMesg_elm}    id:instructionToggle    #.买家留言
${locatorC_checkout_address_offersAndDiscounts}    dom:document.querySelectorAll('.checkbox')[0]    #.订阅优惠活动多选按钮
${locatorC_checkout_address_saveInformation}    dom:document.querySelectorAll('.checkbox')[1]    #.保存信息多选按钮
${locatorC_checkout_delivery_shippingLine}     dom:document.querySelectorAll('[class*="checkout-shipping-line__grid"]')[0]     #.订单物流信息运费显示

# Billing address
${locatorB_checkout_creditCard_input_name}    dom:document.querySelectorAll('[name="first_name"]')[0]    #.Billing address name
${locatorB_checkout_creditCard_input_lastName}    dom:document.querySelectorAll('[name="last_name"]')[0]    #.Billing address last name
${locatorB_checkout_creditCard_input_address}    dom:document.querySelectorAll('[name="address"]')[0]    #.Billing address 卡address
${locatorB_checkout_creditCard_input_address1}    dom:document.querySelectorAll('[name="address1"]')[0]    #.Billing address address1
${locatorB_checkout_creditCard_input_city}    dom:document.querySelectorAll('[name="city"]')[0]    #.Billing address city
${locatorB_checkout_creditCard_input_shipping_country}    dom:document.querySelectorAll('[id="shipping_country"]')[0]    #.Billing address   国家下拉选择
${locatorB_checkout_creditCard_input_shipping_province}    dom:document.querySelectorAll('[id="shipping_province"]')[0]    #.Billing address   国家下拉选择
${locatorB_checkout_creditCard_input_zip}    dom:document.querySelectorAll('[name="zip"]')[0]      #.Billing address  postal code



${locatorB_checkout_creditCard_input_phone}    dom:document.querySelectorAll('[name="phone"]')[0]      #.信用卡phone  手机
${locatorB_checkout_creditCard_input_post}    dom:document.querySelectorAll('[name="postcode"]')[0]    #.信用卡postcode
${locatorB_checkout_creditCard_input_number}    dom:document.querySelectorAll('[name="number"]')[0]    #.信用卡number
${locatorB_checkout_creditCard_input_expireDate}    dom:document.querySelectorAll('[name="date"]')[0]      #.信用卡date
${locatorB_checkout_creditCard_input_securityCode}    dom:document.querySelectorAll('[name="code"]')[0]    #.信用卡code


${locatorB_checkout_address_save_address_btn}    dom:document.querySelectorAll(".form-footer")[0]    #.保存地址按钮
${locatorB_checkout_address_save_checkout_btn}    id:submitMbPay    #.保存地址后的提交按钮
${locatorB_checkout_write_review}    dom:document.querySelectorAll(".review_write")[0]    #.checkout-留言按钮
${locatorB_checkout_address_showProduct_eml}    dom:document.querySelectorAll('[class="order_summary"]')[0]   #.checkout-添加地址页面的顶部查看商品详情(向下箭头)



${locatorB_checkout_down_price_eml}    dom:document.querySelectorAll(".detail")[0]    #.checkout-底部价格元素
${locator_checkout_submit_save_btn}    id:submitPaymentMb    #.checkout-提交地址后的保存按钮
${locator_checkout_payment_ipaylinks_elm}    dom:document.querySelectorAll("[class*='sep-font sep-font-bank-card']")[0]    #.checkout-选择支付方式 ipaylinks 元素
${locator_checkout_payment_cod_elm}    dom:document.querySelectorAll("[class*='payment-method__item-grid']")[0]    #.checkout-选择支付方式 cod 元素

${locatorB_checkout_submitOrderPass_msg}    Your order has been submitted successfully.    #.提交订单成功的页面出现的字体
${locatorB_checkout_Cod_font}    Cash on Delivery    #.货到付款 字体

${locatorC_checkout_link_change}    dom:document.querySelectorAll('a[class="fr"]')[0]   #change  返回上一步
${locatorC_checkout_link_return}     dom:document.querySelectorAll('a[id="checkout-back"]')[0]          #支付页返回按钮
${locator_checkout_button_checkoutBack}     dom:document.querySelectorAll("#checkout-back")[0]          #
${locatorC_checkout_input_discountCode}     dom:document.querySelectorAll('input[id="coupon_code_input"]')[0]       #优惠码输入框
${locatorC_checkout_submit_apply}     dom:document.querySelectorAll('button[id="coupon_apply"]')[0]     #优惠码提交按钮
${locatorC_checkout_submit_couponClose}      dom:document.querySelectorAll('[class*="card-checkout-close"]')[0]     #取消优惠码按钮
${locatorC_checkout_shipping_price}     dom:document.querySelectorAll('span[class="fr"]')[0]
${locatorC_checkout_shipping_submitCheckout}     dom:document.querySelectorAll('[class*="btn btn-primary checkout-footer"]')[0]        #type="submit"    checkout  提交到shipping method
${locatorC_checkout_payment_cashOnDelivery}     dom:document.querySelectorAll('[class*="method__item_selected"]')[0]        #支付方式-货到付款
${locatorC_checkout_shipping_orderSubmit}      dom:document.querySelectorAll('[class*="btn-primary payment-footer__btn"]')[0]     #order checkout 提交按钮
${locatorC_checkout_shipping_total}    dom:document.querySelectorAll('[class*="checkout-prices"] tfoot td')[1]      #.总金额


${locatorC_checkout_paymentCard_change}   dom:document.querySelectorAll('[class*="payment-footer__back"]')[0]    #change 返回
${locatorC_checkout_paymentCard_return}    dom:document.querySelectorAll('[class*="checkout-footer__back"]')[0]    #return 返回
#locatorC checkout method
${locatorC_checkout_shipping_method}    dom:document.querySelectorAll('.checkout-prices-name')[0]       #shipping  显示物流价格

${locatorC_checkout_shipping_preferential}    dom:document.querySelectorAll('[class*="checkout__prices-table-value"]')[2]    #.订单运费
${locatorC_checkout_text_order}     dom:document.querySelectorAll(".item-sku-title")[0]     #.商品标题
${locatorC_checkout_shipping_delivery}   dom:document.querySelectorAll("[class*='fr']")[3]        #shipping delivery 运费价格

${locatorC_checkout_prices_total}   dom:document.querySelectorAll(".checkout-prices tfoot td")[1]   #.商品总价格
${locatorC_checkout_prices_itemPrice}   dom:document.querySelectorAll(".item-price")[0]     #商品单价
${locatorC_checkout_prices_shippingValue}   dom:document.querySelectorAll(".checkout-prices-value")[1]      #.运费shipping
${locatorC_checkout_prices_itemQuantity}   dom:document.querySelectorAll(".item-quantity")[0]      #.商品数量显示



#locatorC Payment Method
${locatorC_checkout_payment_shippingMethoda}    dom:document.querySelectorAll('.checkout-prices-value')[1]      #payment 订单运费数据
${locatorC_checkout_select_billingAddress}    dom:document.querySelectorAll("select[id='billingSelect']")[0]       #.billingAddress  扩展select
${locatorC_checkout_inputText_firstName}    dom:document.querySelectorAll("input[name='first_name']")[0]        #.payment method /first_name输入框
${locatorC_checkout_inputText_lastName}    dom:document.querySelectorAll("input[name='last_name']")[0]          #.payment method / last_name输入框
${locatorC_checkout_inputText_address}    dom:document.querySelectorAll("input[name='address']")[0]     #.payment method   /address 输入框
${locatorC_checkout_inputText_address1}    dom:document.querySelectorAll("input[name='address1']")[0]       #.payment method  /address1 输入框
${locatorC_checkout_inputText_city}    dom:document.querySelectorAll("input[name='city']")[0]       #.payment method    /city 城市输入框
${locatorC_checkout_inputText_countyCode}    dom:document.querySelectorAll("select[name='country_code']")[0]        #.payment method    /county 国家下拉选择
${locatorC_checkout_inputText_provinceCode}    dom:document.querySelectorAll("select[name='province_code']")[0]     #.payment method    /province 城市下拉选择
${locatorC_checkout_inputText_zip}    dom:document.querySelectorAll("input[name='zip']")[0]        #.payment method    /zip 输入框

#下面的分类过的

#locatorC payment  有用
${locatorC_checkout_payment_creditCard}     dom:document.querySelectorAll('[class*="sep-font sep-font-bank-card"]')[0]        #支付方式-信用卡支付
${locatorC_checkout_paymentCard_fristName}    dom:document.querySelectorAll('input[name="card_first_name"]')[0]    #first_name 姓名
${locatorC_checkout_paymentCard_cardEmail}     dom:document.querySelectorAll('input[name="card_email"]')[0]     #card email 邮箱
${locatorC_checkout_paymentCard_phone}     dom:document.querySelectorAll('input[name="card_phone"]')[0]       #.card phone 手机
${locatorC_checkout_paymentCard_cardPostcode}     dom:document.querySelectorAll('input[name="card_postcode"]')[0]      #card_postcode  邮编号码
${locatorC_checkout_paymentCard_cardNumber}     dom:document.querySelectorAll('input[name="card_number"]')[0]        #card_number 信用卡 卡号
${locatorC_checkout_paymentCard_cardDate}     dom:document.querySelectorAll('input[name="card_date"]')[0]      #.card_date  有效日期
${locatorC_checkout_paymentCard_card_code}     dom:document.querySelectorAll('input[name="card_code"]')[0]     #.card_code  安全码
#支付成功界面元素
#locatorC payment Method successful
${locatorC_checkout_link_viewOrders}    dom:document.querySelectorAll("[class*='btn-secondary']")[0]        #.订单成功-订单详情按钮 viewOrders
${locatorC_checkout_link_continueShopping}    dom:document.querySelectorAll("[class*='btn-primary']")[0]       #.订单成功-跳转到首页 continue shopping
#locatorC order yong hu
${locatorC_checkout_link_orderList}    dom:document.querySelectorAll("[class*='breadcrumbs']")[0]     #.个人中心里，订单详情页
#locatorC home
${locatorC_checkout_homeBanner}    dom:document.querySelectorAll("[class*='text-truncate']")[0]       #首页banner图元素模块







