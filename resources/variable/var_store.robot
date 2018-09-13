*** Variables ***
# locator
${store_email}    171869092@163.com    #.店铺信息测试的邮箱

${locatorB_storeLst_storeText}    店铺信息
${locatorB_storeLst_icon_btn}    class:uploadbtn_566a    #,图片添加icon
${locatorB_storeLst_storename_ipt}    id:name    #.店铺名称-输入框
${locatorB_storeLst_storeurl_ipt}    id:domain    #.店铺url-输入框
${locatorB_storeLst_storeemail_ipt}    id:email    #.店铺邮箱-输入框
${locatorB_storeLst_store_seremail_ipt}    id:service_email    #.客服邮箱-输入框
${locatorB_storeLst_storedomain_txt}    dom:document.querySelectorAll(".link_c21b")[0]    #. 域名配置-字体    
${locatorB_storeLst_first_tr_eml}    dom:document.querySelectorAll("table tbody tr")[0]    #.第一tr元素
${locatorB_storeLst_cancel_btn}    dom:document.querySelectorAll("button span")[0]    #.取消按钮
${locatorB_storeLst_save_btn}    dom:document.querySelectorAll("button")[1]    #.保存按钮
${locatorB_storeLst_moneda_elm}    dom:document.querySelectorAll(".ant-select-selection__rendered")[0]    #. 店铺货币
${locatorB_storeLst_timezone_elm}    dom:document.querySelectorAll(".ant-select-selection__rendered")[1]    #. 店铺时区
${locatorB_storeLst_country_elm}    dom:document.querySelectorAll(".ant-select-selection__rendered")[2]    #. 店铺国家
${locatorB_storeLst_error_msg}    dom:document.querySelectorAll(".ant-form-explain")[0]    #.错误提示

${img_file}    ${CURDIR}/mv.jpg    # 添加商品图片