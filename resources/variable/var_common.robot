*** Settings ***
Variables         ${CURDIR}/../../lib/customlib/variable.py

*** Variables ***
### 未分类，需要分类并清理
${home_page}      ${home_page_url}
${error_msg}      出错啦！    #.自定义错误提示


### 菜单栏 locator
${locatorB_overview}    id:test_overview    # 导航栏-概览（即主页）
${locatorB_order}    dom:document.querySelectorAll('a[href="/order"]')[0]    # 导航栏-订单
${locatorB_products}    id:test_product    # 导航栏-商品
${locatorB_product_manage}    dom:document.querySelectorAll('a[href="/products"]')[0]    # 导航栏-商品管理
${locatorB_product_collection}    dom:document.querySelectorAll('a[href="/collection"]')[0]    # 导航栏-商品专辑
${locatorB_product_review}    dom:document.querySelectorAll('href="/reviews"')[0]    # 导航栏-商品评论
${locatorB_marketing}    id:test_marketing    # 导航栏-营销
${locatorB_marketing_subtraction}    dom:document.querySelectorAll('a[href="/subtraction"]')[0]    # 导航栏-营销-满减活动
${locatorB_marketing_coupon_code}    dom:document.querySelectorAll('a[href="/coupon_code"]')[0]    # 导航栏-营销-优惠券
${locatorB_store}    id:test_store    #.导航栏-店铺
${locatorB_setting}    id:test_setting    # 导航栏-设置
${locatorB_setting_shipping}    dom:document.querySelectorAll('a[href="/shipping"]')[0]    # 导航栏-设置-物流
${locatorB_setting_taxPrice}    dom:document.querySelectorAll('a[href="/taxPrice"]')[0]    # 导航栏-设置-税费
${locatorB_setting_payment}    dom:document.querySelectorAll('a[href="/pay"]')[0]    # 导航栏-设置-收款渠道
${locatorB_setting_store}    dom:document.querySelectorAll('a[href="/store"]')[0]    # 导航栏-设置-基础信息

### locator checkbox
${locatorB_checkbox00}    dom:document.querySelectorAll(".ant-checkbox-input")[0]    #定位当前页面第0个checkbox
${locatorB_checkbox01}    dom:document.querySelectorAll(".ant-checkbox-input")[1]
### locator button
${locatorB_button_add}    dom:document.querySelectorAll(".large_btn___3RbRK")[0]        #添加按钮
### locator popUps
${locatorB_popUps_button_middle}    dom:document.querySelectorAll("button[class*='middle']")[0]    #弹窗的中间按钮
${locatorB_popUps_button_default}    dom:document.querySelectorAll("button[class*='default']")[0]    #弹窗的默认按钮
${locatorB_popUps_allCheckbox}    dom:document.querySelectorAll('.ant-modal-body span[class="ant-checkbox"]')    #弹窗的所有checkbox
${locatorB_popUps_inputs}    dom:document.querySelectorAll('.ant-modal-body input[class="ant-select-search__field"]')    #弹窗的所有input
### locator page
${locatorB_page_text_totalRecord}    dom:document.querySelectorAll(".ant-pagination-total-text")[0]      #页面分页按钮-"N 条记录"
### locator tagboxs
${locatorB_productsMgmt_tagboxs}    dom:document.querySelectorAll('div[class="ant-select-selection__choice__content"]')    #获取所有tagbox。（参考product的标签输入框中一个个小模块）
### 页面模块 url
${url_home_page}    ${home_page}/    # home page
${url_order}      ${home_page}/order    # order page
${url_products}    ${home_page}/products    # products page
${url_marketing}    ${home_page}/subtraction    # marketing page
${url_tax_price}    ${home_page}/taxPrice    # tax price
${url_shipping}    ${home_page}/shipping    # shipping
${url_subtraction}    ${home_page}/subtraction    # subtraction
${url_coupon_code}    ${home_page}/coupon_code    # coupon
${url_coupon_store}    ${home_page}/store    # coupon
### 测试用户

${user_default_contact}    ${datas_contact}    # 默认使用的用户信息，用于跑大部分用例
${user_default_pwd}    ${datas_password}
${user_default_domain}    ${datas_domain}
${user_default_inviteCode}    ${datas_invite_code}
### keybord_key
${keybord_enter}    \\13
### 注册用户
${register_contact}    gt1zwkp@abctest.com
${register_domain}    gt1zwkp
${register_pwd}    ${datas_password}