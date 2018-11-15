*** Settings ***
Variables         ${CURDIR}/../../lib/customlib/variable.py
Resource          var_account.robot
Resource          var_checkout.robot
Resource          var_coupon_code.robot
Resource          var_login.robot
Resource          var_order.robot
Resource          var_product_collection.robot
Resource          var_product_comment.robot
Resource          var_product_management.robot
Resource          var_settings_page.robot
Resource          var_shipping.robot
Resource          var_store.robot
Resource          var_tax.robot
Resource          var_uploadfile.robot
Resource          var_application.robot
Resource          var_navmenu.robot
Resource          var_payment_channel.robot
*** Variables ***
### 未分类，需要分类并清理
${home_page}      ${home_page_url}
${error_msg}      出错啦！    #.自定义错误提示

${locatorB_global_alert_confirm}    dom:document.querySelectorAll('button[data-robot="pop_confirm"]')[0]    #.全局弹窗 确定 按钮
${locatorB_global_alert_cancel}    dom:document.querySelectorAll('button[data-robot="pop_cancal"]')[0]    #.全局弹窗 取消 按钮
### 菜单栏 locator
${locatorB_overview}    dom:document.querySelectorAll('a[href="/"]')[0]    # 导航栏-概览（即主页）
${locatorB_order}    dom:document.querySelectorAll('span[data-robot="order"]')[0]    # 导航栏-订单
${locatorB_order_dealing}    dom:document.querySelectorAll('a[href="/order/_dealing"]')[0]    # 导航栏-待处理订单
${locatorB_order_undeal}    dom:document.querySelectorAll('a[href="/order/_undeal"]')[0]    # 导航栏-未完成订单
${locatorB_products}    dom:document.querySelectorAll('span[data-robot="products"]')[0]    # 导航栏-商品
${locatorB_product_management}    dom:document.querySelectorAll('a[href="/products"]')[0]    # 导航栏-商品管理
${locatorB_product_collection}    dom:document.querySelectorAll('a[href="/collection"]')[0]    # 导航栏-商品专辑
${locatorB_product_reviews}    dom:document.querySelectorAll('a[href="/reviews"]')[0]    # 导航栏-商品评论
${locatorB_marketing}    dom:document.querySelectorAll('span[data-robot="marketing"]')[0]    # 导航栏-营销
${locatorB_marketing_subtraction}    dom:document.querySelectorAll('a[href="/subtraction"]')[0]    # 导航栏-营销-满减活动
${locatorB_marketing_coupon_code}    dom:document.querySelectorAll('a[href="/coupon_code"]')[0]    # 导航栏-营销-优惠券
${locatorB_store}    dom:document.querySelectorAll('span[data-robot="decoration"]')[0]    #.导航栏-店铺
${locatorB_setting}    dom:document.querySelectorAll('span[data-robot="setting"]')[0]    # 导航栏-设置
${locatorB_setting_menus}    dom:document.querySelectorAll(".ant-menu-submenu-title")    # 导航栏-设置-含自菜单的元素
${locatorB_setting_shipping}    dom:document.querySelectorAll('a[href="/shipping"]')[0]    # 导航栏-设置-物流
${locatorB_setting_taxPrice}    dom:document.querySelectorAll('a[href="/taxPrice"]')[0]    # 导航栏-设置-税费
${locatorB_setting_payment}    dom:document.querySelectorAll('a[href="/pay"]')[0]    # 导航栏-设置-收款渠道
${locatorB_setting_employee}    dom:document.querySelectorAll('a[href="/accounts"]')[0]    # 导航栏-设置-员工账号
${locatorB_setting_store}    dom:document.querySelectorAll('a[href="/store"]')[0]    # 导航栏-设置-基础信息
${locatorB_setting_upfile}    dom:document.querySelectorAll('a[href="/uploadFile"]')[0]    # 导航栏-设置-文件管理
${locatorB_decoration}    dom:document.querySelectorAll('span[data-robot="decoration"]')[0]    # 导航栏-店铺装修
${locatorB_decoration_checkoutSettings}    dom:document.querySelectorAll('a[href="/checkout"]')[0]    # 导航栏-店铺装修-结账流程
${locatorB_decoration_navigationMenu}    dom:document.querySelectorAll('a[href="/menus"]')[0]    # 导航栏-店铺装修-菜单导航

${locatorB_decoration_custom_button_NewPage}    dom:document.querySelectorAll('[class*="ant-btn large_btn_"]')    # 导航栏-店铺装修-自定义页面-新建页面按钮
${locatorB_decoration_addPage_input_pageName}    dom:document.querySelectorAll('[class="ant-input"]')    # 导航栏-店铺装修-自定义页面-页面设置-名称

${locatorB_application}    dom:document.querySelectorAll('a[href="/tools"]')[0]    #.导航栏-应用市场
${locatorB_application}    dom:document.querySelectorAll('a[href="/app_store"]')[0]    #.导航栏-应用市场

${locatorB_setting_menus}    dom:document.querySelectorAll(".ant-menu-submenu-title")    # 导航栏-设置-含自菜单的元素



${isExistB_setting_orderMenus_expanded}    dom:document.querySelectorAll('div[aria-expanded="true"] span[data-robot="order"]')[0]    # 判断order菜单展开的元素是否存在
${isExistB_setting_productMenus_expanded}    dom:document.querySelectorAll('div[aria-expanded="true"] span[data-robot="products"]')[0]    # 判断product菜单展开的元素是否存在
${isExistB_setting_marketingMenus_expanded}    dom:document.querySelectorAll('div[aria-expanded="true"] span[data-robot="marketing"]')[0]    # 判断marketing菜单展开的元素是否存在
${isExistB_setting_decorationMenus_expanded}    dom:document.querySelectorAll('div[aria-expanded="true"] span[data-robot="decoration"]')[0]    # 判断decoration菜单展开的元素是否存在
${isExistB_setting_settingMenus_expanded}    dom:document.querySelectorAll('div[aria-expanded="true"] span[data-robot="setting"]')[0]    # 判断setting菜单展开的元素是否存在


### locator selects
${locatorB_selects}    dom:document.querySelectorAll("div[class~='ant-select-selection']")    # 下拉页面所有选框
### locator checkbox
${locatorB_checkbox00}    dom:document.querySelectorAll(".ant-checkbox-input")[0]    #定位当前页面第0个checkbox
${locatorB_checkbox01}    dom:document.querySelectorAll(".ant-checkbox-input")[1]
### locator button
${locatorB_button_add}    dom:document.querySelectorAll('button[class*="large_btn"]')[0]        #添加按钮
${locatorB_button_save}    dom:document.querySelectorAll('button[data-robot="btn_save"]')[0]        #保存按钮
${locatorB_button_save00}    dom:document.querySelectorAll('button[class*="middle_btn"]')[0]        #保存按钮
${locatorB_button_canecl}    dom:document.querySelectorAll('button[class*="cancel"]')[0]        #取消按钮
${locatorB_button_canecl00}    dom:document.querySelectorAll('button[class*="default_btn"]')[0]        #取消按钮
${locatorB_button_close}    dom:document.querySelectorAll('button[class*="close"]')[0]        #close按钮
${locatorB_icon_back}    dom:document.querySelectorAll('i[class="djfont dj-back"]')[0]        #返回icon
${locatorB_icon_back00}    dom:document.querySelectorAll('i[class="djfont back"]')[0]        #返回icon
${locatorB_icon_edit}    dom:document.querySelectorAll('i[class*="edit_icon"]')[0]        #编辑icon
### locator popUps
${locatorB_popUps_title}    dom:document.querySelectorAll('[class~="ant-modal-title"]')[0]    #弹窗title
${locatorB_popUps_body}    dom:document.querySelectorAll(".ant-modal-body")[0]    #弹窗body(判断弹窗是否存在)
${locatorB_popUps_footer}    dom:document.querySelectorAll(".ant-modal-footer")[0]    #弹窗footer判断弹窗是否存在)
${locatorB_popUps_button_footermiddle}    dom:document.querySelectorAll(".ant-modal-footer button[class*='middle']")[0]    #弹窗footer的中间按钮
${locatorB_popUps_button_bodymiddle}    dom:document.querySelectorAll(".ant-modal-body button[class*='middle']")[0]    #弹窗body的中间按钮
${locatorB_popUps_button_footerdefault}    dom:document.querySelectorAll(".ant-modal-footer button[class*='default']")[0]    #弹窗footer的默认按钮
${locatorB_popUps_button_bodydefault}    dom:document.querySelectorAll(".ant-modal-body button[class*='default']")[0]    #弹窗body的默认按钮
${locatorB_popUps_allCheckbox}    dom:document.querySelectorAll('.ant-modal-body span[class~="ant-checkbox"]')    #弹窗的所有checkbox
${locatorB_popUps_allUncheckedCheckbox}    dom:document.querySelectorAll('.ant-modal-body span[class="ant-checkbox"]')    #弹窗的所有没有被选中checkbox
${locatorB_popUps_allCheckedCheckbox}    dom:document.querySelectorAll('.ant-modal-body span[class="ant-checkbox ant-checkbox-checked"]')    #弹窗的所有被选中checkbox
${locatorB_popUps_inputs}    dom:document.querySelectorAll('.ant-modal-body input[class="ant-select-search__field"]')    #弹窗的所有input
${locatorB_popUps_checkbox}    dom:document.querySelectorAll('.ant-modal-body .ant-checkbox-input')    #弹窗的所有checkbox
${locatorB_popUps_icon_up}    dom:document.querySelectorAll('[class="ant-table-tbody"] .anticon-up')
${locatorB_popUps_icon_down}    dom:document.querySelectorAll('[class="ant-table-tbody"] .anticon-down')
### locator page
${locatorB_page_text_totalRecord}    dom:document.querySelectorAll(".ant-pagination-total-text")[0]      #页面分页按钮-"N 条记录"
### locator tag
${locatorB_antTags}    dom:document.querySelectorAll('div[class="ant-tag ant-tag-checkable"]')    #获取所有antTags。（参考product批量操作的删除标签中一个个小模块）
${locatorB_tagboxs}    dom:document.querySelectorAll('div[class="ant-select-selection__choice__content"]')    #获取所有tagbox。（参考product编辑的标签输入框中一个个小模块）
### locator table
${locatorB_table_listItems}    dom:document.querySelectorAll(".ant-table-row")    # 列表页面table中的listitem
### locator tag
${locatorB_select_batchOperations}    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]    #批量操作下拉框
${locatorB_couponLst_couponText}    全部
### 页面模块 url
${url_home_page}    ${home_page}/    # home page
${url_order}      ${home_page}/order    # order page
${url_order_dealing}      ${home_page}/order/_dealing
${url_order_undeal}      ${home_page}/order/_undeal
${url_products}    ${home_page}/products    # products page
${url_marketing}    ${home_page}/subtraction    # marketing page
${url_tax_price}    ${home_page}/taxPrice    # tax price
${url_shipping}    ${home_page}/shipping    # shipping
${url_subtraction}    ${home_page}/subtraction    # subtraction
${url_coupon_code}    ${home_page}/coupon_code    # coupon
${url_coupon_store}    ${home_page}/store    # store
${url_accounts}    ${home_page}/accounts   # accounts
${url_collection}    ${home_page}/collection   # collection
${url_reviews}    ${home_page}/reviews   # reviews
${url_seoimage}    ${home_page}/seoImage    #. seoimage
${url_uploadFile}    ${home_page}/uploadFile    #. uploadFile
${url_checkoutSettings}    ${home_page}/checkout    #. checkout
${url_pay}    ${home_page}/pay    #. pay
${url_menus}    ${home_page}/menus    #.menus
${url_page}     ${home_page}/page    #.page
${url_img_seo}    ${home_page}/app_store    #. img_seo
### 测试用户

${user_default_contact}    ${datas_contact}    # 默认使用的用户信息，用于跑大部分用例
${user_default_pwd}    ${datas_password}
${user_default_domain}    ${datas_domain}
${user_default_inviteCode}    ${datas_invite_code}
### keybord_key
${keybord_enter}    \\13
${keybord_delete}    \\46
${keybord_tab}    \\9
### 注册用户
${register_contact}    gt1zwkp@autotest.com
${register_domain}    gt1zwkp
${register_pwd}    ${datas_password}

### 图片文件
${file_products_addImg}    ${CURDIR}/../images/image01.jpg    # 添加商品图片
${file_products_addImg2}    ${CURDIR}/../images/image02.jpg    # 添加商品图片
${file_products_addImg3}    ${CURDIR}/../images/image03.jpeg    # 添加商品图片
${file_products_addImg4}    ${CURDIR}/../images/image04.gif    # 添加商品图片
${file_products_addImg5}    ${CURDIR}/../images/image05.png    # 添加商品图片


# C端
${locatorC_icon_card}    dom:document.querySelectorAll('[class~="d-md-block"] [href="/cart"]')[0]    #.checkout购物车图标按钮
${locatorC_input_email}    id:userName    #会员登录-email输入框

${locatorC_products_shippingAddress_payment_button_completeOrder}    dom:document.querySelectorAll('[class="btn btn-primary payment-footer__btn"]')    #payment-->complete order按钮

${locatorC_checkoutShipping_li_TextPolicy}    dom:document.querySelectorAll('[class="checkout-policy__grid-item"]')    #checkoutShipping-->条约按钮
