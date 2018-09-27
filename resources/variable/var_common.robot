*** Settings ***
Variables         ${CURDIR}/../../lib/customlib/variable.py

*** Variables ***
### 未分类，需要分类并清理
${home_page}      ${home_page_url}
${error_msg}      出错啦！    #.自定义错误提示

${locatorB_global_alert_confirm}    dom:document.querySelectorAll('button[data-robot="pop_confirm"]')[0]    #.全局弹窗 确定 按钮
${locatorB_global_alert_cancel}    dom:document.querySelectorAll('button[data-robot="pop_cancal"]')[0]    #.全局弹窗 取消 按钮
### 菜单栏 locator
${locatorB_overview}    dom:document.querySelectorAll('span[data-robot="overview"]')[0]    # 导航栏-概览（即主页）
${locatorB_order}    dom:document.querySelectorAll('span[data-robot="order"]')[0]    # 导航栏-订单
${locatorB_products}    dom:document.querySelectorAll('span[data-robot="products"]')[0]    # 导航栏-商品
${locatorB_product_management}    dom:document.querySelectorAll('a[href="/products"]')[0]    # 导航栏-商品管理
${locatorB_product_collection}    dom:document.querySelectorAll('a[href="/collection"]')[0]    # 导航栏-商品专辑
${locatorB_product_reviews}    dom:document.querySelectorAll('href="/reviews"')[0]    # 导航栏-商品评论
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
${locatorB_Application}    dom:document.querySelectorAll('a[href="/tools"]')[0]    #.导航栏-应用市场
${locatorB_setting_menus}    dom:document.querySelectorAll(".ant-menu-submenu-title")    # 导航栏-设置-含自菜单的元素
${locatorB_Application_seoimg}    dom:document.querySelectorAll('.item___3Js4k')[4]    #.应用市场-图片seo
${locatorB_Application_invitaion}    dom:document.querySelectorAll('.item___3Js4k')[0]    #.应用市场-邀请码工具

${isExistB_setting_orderMenus_expanded}    dom:document.querySelectorAll('div[aria-expanded="true"] span[data-robot="order"]')[0]    # 判断order菜单展开的元素是否存在
${isExistB_setting_productMenus_expanded}    dom:document.querySelectorAll('div[aria-expanded="true"] span[data-robot="products"]')[0]    # 判断product菜单展开的元素是否存在
${isExistB_setting_marketingMenus_expanded}    dom:document.querySelectorAll('div[aria-expanded="true"] span[data-robot="marketing"]')[0]    # 判断marketing菜单展开的元素是否存在
${isExistB_setting_decorationMenus_expanded}    dom:document.querySelectorAll('div[aria-expanded="true"] span[data-robot="decoration"]')[0]    # 判断decoration菜单展开的元素是否存在
${isExistB_setting_settingMenus_expanded}    dom:document.querySelectorAll('div[aria-expanded="true"] span[data-robot="setting"]')[0]    # 判断setting菜单展开的元素是否存在

${locatorB_selects}    dom:document.querySelectorAll("div[class~='ant-select-selection']")    # 下拉页面所有选框
### locator checkbox
${locatorB_checkbox00}    dom:document.querySelectorAll(".ant-checkbox-input")[0]    #定位当前页面第0个checkbox
${locatorB_checkbox01}    dom:document.querySelectorAll(".ant-checkbox-input")[1]
### locator button
${locatorB_button_add}    dom:document.querySelectorAll(".large_btn___3RbRK")[0]        #添加按钮
${locatorB_button_save}    dom:document.querySelectorAll('button[data-robot="btn_save"]')[0]        #保存按钮
### locator popUps
${locatorB_popUps_button_middle}    dom:document.querySelectorAll("button[class*='middle']")[0]    #弹窗的中间按钮
${locatorB_popUps_button_default}    dom:document.querySelectorAll("button[class*='default']")[0]    #弹窗的默认按钮
${locatorB_popUps_allCheckbox}    dom:document.querySelectorAll('.ant-modal-body span[class~="ant-checkbox"]')    #弹窗的所有checkbox
${locatorB_popUps_allUncheckedCheckbox}    dom:document.querySelectorAll('.ant-modal-body span[class="ant-checkbox"]')    #弹窗的所有没有被选中checkbox
${locatorB_popUps_allCheckedCheckbox}    dom:document.querySelectorAll('.ant-modal-body span[class="ant-checkbox ant-checkbox-checked"]')    #弹窗的所有被选中checkbox
${locatorB_popUps_inputs}    dom:document.querySelectorAll('.ant-modal-body input[class="ant-select-search__field"]')    #弹窗的所有input
### locator page
${locatorB_page_text_totalRecord}    dom:document.querySelectorAll(".ant-pagination-total-text")[0]      #页面分页按钮-"N 条记录"
### locator tag
${locatorB_antTags}    dom:document.querySelectorAll('div[class="ant-tag ant-tag-checkable"]')    #获取所有antTags。（参考product批量操作的删除标签中一个个小模块）
${locatorB_tagboxs}    dom:document.querySelectorAll('div[class="ant-select-selection__choice__content"]')    #获取所有tagbox。（参考product编辑的标签输入框中一个个小模块）
### 页面模块 url
${url_home_page}    ${home_page}/    # home page
${url_order}      ${home_page}/order    # order page
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
### 图片文件
${file_products_addImg}    ${CURDIR}/../images/tm.jpg    # 添加商品图片
${file_products_addImg2}    ${CURDIR}/../images/mv.jpg    # 添加商品图片