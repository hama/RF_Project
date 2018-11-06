*** Variables ***

#.locatorC_cart
${locatorC_cart_button_checkout}    dom:document.querySelectorAll('[class*="checkout"]')[0]   #.购物车-checkout提交按钮

#.locatorC_checkoutShipping

#order summary

${locatorC_checkoutShipping_locator_order}    dom:document.querySelectorAll('[data-track="item"]')[0]     #。购买的商品列表 元素
${locatorC_checkoutShipping_locator_address}    dom:document.querySelectorAll('[class="form-container"]')[0]    #.地址  元素

${locatorC_checkoutShipping_locator_special}    dom:document.querySelectorAll('[class="checkout-instruction"]')[0]    #.买家留言  元素
${locatorC_checkoutShipping_locator_total}    dom:document.querySelectorAll('[class="checkout__prices-table"] tfoot tr')[0]    #.显示总价  元素

${locatorC_checkoutShipping_input_discountCode}    dom:document.querySelectorAll('[id="coupon_code_input"]')[0]
${locatorC_checkoutShipping_button_apply}    dom:document.querySelectorAll('[id="coupon_apply"]')[0]
${locatorC_checkoutShipping_icon_couponClose}    dom:document.querySelectorAll('[class~="coupon__close"]')[0]


${locatorC_checkoutShipping_text_itemProductTitle}    dom:document.querySelectorAll('[class*="checkout-item__sku-title"]')[0]
${locatorC_checkoutShipping_text_itemQtyNum}    dom:document.querySelectorAll("[class*='checkout-item__quantity']")[0]
${locatorC_checkoutShipping_text_itemPrice}    dom:document.querySelectorAll("[class='checkout-item__price']")[0]
${locatorC_checkoutShipping_text_subtotalPrice}    dom:document.querySelectorAll(".checkout__prices-table-value")[0]
${locatorC_checkoutShipping_text_shippingPrice}   dom:document.querySelectorAll(".checkout__prices-table-value")[1]      #.运费shipping
${locatorC_checkoutShipping_text_taxPrice}   dom:document.querySelectorAll(".checkout__prices-table-value")[2]      #.tax
${locatorC_checkoutShipping_text_totalPrice}    dom:document.querySelectorAll('[class*="checkout-prices"] tfoot td')[1]      #.总金额
${locatorC_checkout_prices_shippingValue}     dom:document.querySelectorAll('[class*="prices-table-value"]')      #.shipping 金额信息显示



${locatorC_checkoutShipping_address_input_firstName}    dom:document.querySelectorAll("input[name='first_name']")[0]    #.添加地址后-first_name输入框
${locatorC_checkoutShipping_address_input_lastName}    dom:document.querySelectorAll("input[name='last_name']")[0]    #.添加地址后-last_name输入框
${locatorC_checkoutShipping_address_select_country}    dom:document.querySelectorAll('[id="shipping_country_select"]')[0]    #.添加地址后选择国家下拉框
${locatorC_checkoutShipping_address_select_province}    dom:document.querySelectorAll('[id="shipping_province_select"]')[0]  #.添加地址后选择省份下拉框
${locatorC_checkoutShipping_address_select_code}    dom:document.querySelectorAll('[id*="shipping_phone_select"]')[0]    #电话区号下拉列表
${locatorC_checkoutShipping_address_input_city}    dom:document.querySelectorAll("input[name='city']")[0]    #.添加地址后选择城市
${locatorC_checkoutShipping_address_input_addr}    dom:document.querySelectorAll("input[name='address']")[0]    #.添加地址后填写地址
${locatorC_checkoutShipping_address_input_postalCode}    dom:document.querySelectorAll("input[name='zip']")[0]    #.添加地址后zip框
${locatorC_checkoutShipping_address_input_email}    dom:document.querySelectorAll("input[name='email']")[0]    #.添加地址后email框
${locatorC_checkoutShipping_address_input_phone}    dom:document.querySelectorAll("input[name='phone']")[0]    #.添加地址后phone框
${locatorC_checkoutShipping_address_input_company}    dom:document.querySelectorAll("input[name='company']")[0]    #.添加地址后copmany框
${locatorC_checkoutShipping_address_input_apartment}     dom:document.querySelectorAll('input[name="address1"]')[0]   #添加apartment

#.验证 只有单一Name时
${locatorC_checkoutShipping_address_input_onlyName}    dom:document.querySelectorAll("input[name='name']")[0]

${locatorC_checkoutShipping_input_contactEmail}    dom:document.querySelectorAll("input[name='contact_email']")[0]    #.添加地址后email框
${locatorC_checkoutShipping_button_specialInstruction}    dom:document.querySelectorAll('[class="checkout-instruction"]')[0]    #.留言信息
${locatorC_checkoutShipping_input_specialInstruction}    dom:document.querySelectorAll('[class="checkout-instruction__textarea"]')[0]    #.留言信息输入框
${locatorC_checkoutShipping_button_paymentMethod}    dom:document.querySelectorAll('[class*="btn btn-primary checkout-footer"]')[0]    #.payment method  提交按钮

${locatorC_checkoutShipping_input_couponCode}    dom:document.querySelectorAll("[id='coupon_code_input']")[0]    #.checkout 输入优惠券框
${locatorC_checkoutShipping_button_couponApply}    dom:document.querySelectorAll("[id='coupon_apply']")[0]    #.checkout 填写地址页面 - 点击应用优惠券按钮

${locatorC_checkoutShipping_items_listShippingAndDelivery}     dom:document.querySelectorAll('[class*="checkout-shipping-line"] [class*="row checkout-shipping-line__item"]')     #.订单物流信息运费显示
${locatorC_checkoutShipping_text_listShippingAndDeliveryName}     dom:document.querySelectorAll('[class*="checkout-shipping-line"] [class*="row checkout-shipping-line__item"] [class*="item-name"]')     #.订单物流信息运费显示
${locatorC_checkoutShipping_text_listShippingAndDeliveryFee}   dom:document.querySelectorAll('[class*="checkout-shipping-line"] [class*="row checkout-shipping-line__item"] [class*="item-desc"]')      #shipping delivery 运费价格

${locatorC_checkoutShipping_button_return}    dom:document.querySelectorAll('a[class~="checkout-back"]')[0]    #shipping return 返回
${locatorC_checkoutShipping_button_paymentReturn}    dom:document.querySelectorAll('a[class~="payment-footer__back"]')[0]    #payment return 返回

#.locatorC_checkoutPayment
${locatorC_checkoutPayment_text_itemProductTitle}    ${locatorC_checkoutShipping_text_itemProductTitle}
${locatorC_checkoutPayment_text_itemQtyNum}    ${locatorC_checkoutShipping_text_itemQtyNum}
${locatorC_checkoutPayment_text_itemPrice}    ${locatorC_checkoutShipping_text_itemPrice}
${locatorC_checkoutPayment_text_subtotalPrice}    ${locatorC_checkoutShipping_text_subtotalPrice}
${locatorC_checkoutPayment_text_shippingPrice}   ${locatorC_checkoutShipping_text_shippingPrice}   #.运费shipping
${locatorC_checkoutPayment_text_taxPrice}   ${locatorC_checkoutShipping_text_taxPrice}      #.tax
${locatorC_checkoutPayment_text_totalPrice}    ${locatorC_checkoutShipping_text_totalPrice}      #.总金额

${locatorC_checkoutPayment_button_completeOrder}    dom:document.querySelectorAll('[class*="btn btn-primary payment-footer"]')[0]    #.completOrder 提交按钮


${locatorC_checkoutPayment_link_change}    dom:document.querySelectorAll('[class="payment__pc"]')[0]
#.payment ship to
${locatorC_checkoutPayment_text_shippingDetail}    dom:document.querySelectorAll('[class="payment-address__value"]')     #.shipping to 用户地址信息

#.shipping method  显示
${locatorC_checkoutPayment_text_shippingMethod}    dom:document.querySelectorAll('[class*="text-truncate"]')[0]
${locatorC_checkoutPayment_icon_bankCard}    dom:document.querySelectorAll('[class~="sep-font-bank-card"]')
${locatorC_checkoutPayment_icon_cash}    dom:document.querySelectorAll('[class~="sep-font-cash"]')

#locatorC Billing address
${locatorC_checkoutPayment_select_billingAddress}    dom:document.querySelectorAll("select[id='billingSelect']")[0]       #.billingAddress  扩展select
${locatorC_checkoutPayment_input_firstName}    dom:document.querySelectorAll("input[name='first_name']")[0]        #.billingAddress /first_name输入框
${locatorC_checkoutPayment_input_lastName}    dom:document.querySelectorAll("input[name='last_name']")[0]          #.billingAddress / last_name输入框
${locatorC_checkoutPayment_input_address}    dom:document.querySelectorAll("input[name='address']")[0]     #.billingAddress   /address 输入框
${locatorC_checkoutPayment_input_address1}    dom:document.querySelectorAll("input[name='address1']")[0]       #.billingAddress /address1 输入框
${locatorC_checkoutPayment_input_city}    dom:document.querySelectorAll("input[name='city']")[0]       #.billingAddress    /city 城市输入框
${locatorC_checkoutPayment_input_countyCode}    dom:document.querySelectorAll("select[name='country_code']")[0]        #.billingAddress    /county 国家下拉选择
${locatorC_checkoutPayment_input_provinceCode}    dom:document.querySelectorAll("select[name='province_code']")[0]        #.billingAddress   /province  省份下拉选择
${locatorC_checkoutPayment_input_zip}    dom:document.querySelectorAll("input[name='zip']")[0]        #.billingAddress    /zip 输入框

#.locatorC payment successful
${locatorC_checkout_text_shippingInformationDetail}    dom:document.querySelectorAll("[class*='text-truncate']")     #.payment successful  shipping information
${locatorC_checkout_button_viewOrders}    dom:document.querySelectorAll("[class*='btn-secondary']")[0]        #.订单成功-订单详情按钮 viewOrders
${locatorC_checkout_button_continueShopping}    dom:document.querySelectorAll("[class*='btn-primary']")[0]       #.订单成功-跳转到首页 continue shopping
#locatorC home
${locatorC_checkout_homeBanner}    dom:document.querySelectorAll("[class*='text-truncate']")[0]       #首页banner图元素模块


#locatorC payment  有用
${locatorC_checkout_payment_creditCard}     dom:document.querySelectorAll('[class*="sep-font sep-font-bank-card"]')[0]        #支付方式-信用卡支付
${locatorC_checkout_paymentCard_fristName}    dom:document.querySelectorAll('input[name="card_first_name"]')[0]    #first_name 姓名
${locatorC_checkout_paymentCard_cardEmail}     dom:document.querySelectorAll('input[name="card_email"]')[0]     #card email 邮箱
${locatorC_checkout_paymentCard_phone}     dom:document.querySelectorAll('input[name="card_phone"]')[0]       #.card phone 手机
${locatorC_checkout_paymentCard_cardPostcode}     dom:document.querySelectorAll('input[name="card_postcode"]')[0]      #card_postcode  邮编号码
${locatorC_checkout_paymentCard_cardNumber}     dom:document.querySelectorAll('input[name="card_number"]')[0]        #card_number 信用卡 卡号
${locatorC_checkout_paymentCard_cardDate}     dom:document.querySelectorAll('input[name="card_date"]')[0]      #.card_date  有效日期
${locatorC_checkout_paymentCard_card_code}     dom:document.querySelectorAll('input[name="card_code"]')[0]     #.card_code  安全码






