*** Settings ***
Resource          var_common.robot

*** Variables ***
# api
${apiB_products_add}    ${home_page}/api/product/add    # 保存商品
${apiB_products_upload}    ${home_page}/api/file/upload    # 上传图片
${apiB_products_addProductsType}    ${home_page}/productType    # 增加商品分类
${apiB_products_list}    ${home_page}/api/product/search?page=0&limit=20    # 获取商品列表
${apiB_products_list_shelf}    ${home_page}/api/product/search?status=1&page=0&limit=20    # 选择所有上架商品
${apiB_products_list_drop}    ${home_page}/api/product/search?status=0&page=0&limit=20    # 选择所有下架商品
${apiB_products_update_status}    ${home_page}/api/product/updatestatus    # 上架/下架 更新状态
# locator_products
${locatorB_products_popUps_content}      dom:document.querySelectorAll(".ant-modal-content")[0]      #弹窗_content
${locatorB_products_popUps_body}    dom:document.querySelectorAll(".ant-modal-body")[0]    #弹窗_body
${locatorB_products_button_cancel}    ${locatorB_popUps_button_default}    #商品弹窗-默认按钮
${locatorB_products_button_confirm}    ${locatorB_popUps_button_middle}    #商品弹窗-确定按钮

# locator_productsMgmt
${locatorB_productsMgmt_button_addProduct}    ${locatorB_button_add}    #商品列表页的新增商品按钮
${locatorB_productsMgmt_checkbox_chooseProducets}    ${locatorB_checkbox00}    #点击checkbox按钮，选中当前页面所有商品
${locatorB_productsMgmt_checkbox_chooseFirstProduct}    ${locatorB_checkbox01}    #点击checkbox按钮，选中当前页面第一个商品
${locatorB_productsMgmt_select_batchOperations}    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]    #批量操作下拉框
${locatorB_productsMgmt_select_launch}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[0]    #下拉框-上架
${locatorB_productsMgmt_select_discontinue}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]    #下拉框-下架
${locatorB_productsMgmt_select_batchDel}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[2]    #下拉框-删除商品
${locatorB_productsMgmt_select_addTags}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    #下拉框-添加标签
${locatorB_productsMgmt_select_delTags}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[4]    #下拉框-移除标签
${locatorB_productsMgmt_select_addtoCategory}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    #下拉框-添加到专辑
${locatorB_productsMgmt_select_delfromCategory}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[6]    #下拉框-从专辑移除
${locatorB_productsMgmt_button_all}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]    # 商品管理页面，全部商品
${locatorB_productsMgmt_button_launched}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[1]    # 商品管理页面，已上架商品
${locatorB_productsMgmt_button_discontinued}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[2]    # 商品管理页面，已下架商品
${locatorB_productsMgmt_icon_grabProduct}    dom:document.querySelectorAll(".icon_custom_left___GO944")[0]    #商品列表页的商品抓取按钮
${locatorB_productsMgmt_icon_migrateProduct}    dom:document.querySelectorAll(".icon_custom_left___GO944")[1]    #商品列表页的店铺搬迁按钮
${locatorB_productsMgmt_icon_uploadProduct}    dom:document.querySelectorAll(".icon_custom_left___GO944")[2]    #商品列表页的上传商品按钮
${locatorB_productsMgmt_button_editTableHead}    dom:document.querySelectorAll(".edit_head___2-5Ey")[0]     #编辑表头
${locatorB_productsMgmt_tabindex_firstSwitch}    dom:document.querySelectorAll(".ant-switch")[0]    # 列表第一个商品的上架按钮
${locatorB_productsMgmt_input_name}    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2]    #"商品名称/商品SKU/标签"输入框
${locatorB_productsMgmt_image_firstProductThumbnails}    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[1].querySelectorAll("img")[0]     #商品列表第一个商品的图片
${locatorB_productsMgmt_text_firstProductName}    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[2].querySelectorAll("span")[0]    #商品列表第一个商品的商品名称
${locatorB_productsMgmt_text_firstProductInventoryQuantity}    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[3]    #商品列表第一个商品的库存(只能在Show All Header关键字执行之后使用)
${locatorB_productsMgmt_text_firstProductSku}    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[4]    #商品列表第一个商品的SKU(只能在Show All Header关键字执行之后使用)
${locatorB_productsMgmt_icon_listPreview}    dom:document.querySelectorAll("i[class*='preview']")    #所有条目的预览icon,第0个为第一条商品的
${locatorB_productsMgmt_icon_listDelete}    dom:document.querySelectorAll("i[class*='delete']")    #所有条目的删除icon,第0个为第一条商品的
${locatorB_productsMgmt_text_listCreateTime}    dom:document.querySelectorAll('td[class="vendor___2VuW9"]')    #所有条目的创建时间，第0个为第一条商品的
${locatorB_productsMgmt_switch_listLaunched}    dom:document.querySelectorAll('span[class="ant-switch ant-switch-checked"]')    #所有上架条目的switch按钮
${locatorB_productsMgmt_switch_listDiscontinued}    dom:document.querySelectorAll('span[class="ant-switch"]')    #所有下架条目的switch按钮


${locatorB_productsMgmt_popUps_firstInput}    ${locatorB_popUps_inputs}[0]    # 弹窗第一个输入框

${locatorB_productsMgmt_popUps_antTags}    dom:document.querySelectorAll('div[class="ant-tag ant-tag-checkable"]')    # 弹窗所有antTag


# locator_productsType
${locatorB_productType_button_saveBtn}    id:test_save_btn    # 商品分类-保存按钮
# locator_productsNew
#${locatorB_productsMgmt_switch_listDiscontinued}    dom:document.querySelectorAll('div[class="ant-select-selection__rendered"]')[0]    #所有下架条目的switch按钮
${locatorB_productsNew_button_back}    class:back    # 进入编辑页面的后退按钮
${locatorB_productsNew_button_uploadBtn}    id:test_upload_btn    # 上传商品图片按钮
${locatorB_productsNew_tabindex_status}    id:status    # 商品状态按钮
${locatorB_productsNew_input_tags}    id:tags    # 添加标签按钮
${locatorB_productsNew_input_chooseFile}    dom:document.querySelectorAll("input[type='file']")[0]    # 选择文件上传
${locatorB_productsNew_input_addTitle}    id:__title    # 添加商品页面-标题按钮
${locatorB_productsNew_input_addSubTitle}    id:__brief    # 添加商品页面-副标题按钮
${locatorB_productsNew_input_addDesc}    dom:document.querySelectorAll(".fr-view")[0].querySelectorAll("p")[0]    # 添加商品页面-副标题按钮
${locatorB_productsNew_input_addPrice}    id:price    # 添加商品页面-价格输入框
${locatorB_productsNew_input_addRawPrice}    id:compare_at_price    # 添加商品页面-原价格输入框
${locatorB_productsNew_input_addWeight}    id:weight    # 添加商品页面-重量输入
${locatorB_productsNew_input_addSku}    id:sku    # 添加商品页面-Sku
${locatorB_productsNew_input_addBarcode}    id:barcode    # 添加商品页面-条形码
${locatorB_productsNew_input_addSupplier}    dom:document.querySelectorAll(".ant-input")[1]    # 添加供应商
${locatorB_productsNew_input_productType}    id:product_type_cascade    #商品专辑页的新增专辑按钮
${locatorB_productsNew_cascader_chooseCategoryItem}    dom:document.querySelectorAll(".ant-cascader-menu-item")[0]    # 选择商品分类子项
${locatorB_productsNew_button_save}    ${locatorB_popUps_button_middle}    #保存按钮
# locator_productsCategory
${locatorB_productsCategory_button_addCategory}    ${locatorB_button_add}    #商品专辑页的新增专辑按钮
${locatorB_productsCategory_icon_del}    dom:document.querySelectorAll(".djfont.delete")[0]    #商品专辑的第一个删除icon
${locatorB_productsCategory_button_delProducts}    dom:document.querySelectorAll(".batchSelectTable_btn___40HNR")[0]    #通过checkbox选中所有专辑之后，提供的删除button
${locatorB_productsCategory_popUps_firstCategory}    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0]    #"要添加到的专辑"弹窗的第一条条目
${locatorB_productsCategory_checkbox_chooseCategories}    ${locatorB_checkbox00}    #点击checkbox按钮，选中当前页面所有专辑
# locator_productsComment


# locator_productsMobile
${locatorC_products_logo}    dom:document.querySelectorAll('div[alt="Logo"]')[0]    #C端，产品logo




# content
${contentB_products_all}    全部
${contentB_products_empty}    暂无数据
${contentB_products_new}    新建商品
${contentB_products_title}    全部
${contentB_products_addTitle}    此处为商品标题
${contentB_products_addSubTitle}    此处为商品副标题
${contentB_products_addPrice}    999
${contentB_products_addRawPrice}    9999
${contentB_products_addWeight}    1
${contentB_products_addSku}    100
${contentB_products_addBarcode}    9787115470416
${contentB_products_addSupplier}    供应商A
${contentB_products_input_price}    请输入价格
${contentB_products_AddTags}    TagA
${contentB_products_tips_save_ok}    保存成功
${contentB_products_tips_select_products}    请至少选择一个商品
${contentB_products_tips_saving}    页面有未保存内容
${contentB_payment_failed}     Order submission failed
${contentB_products_tips_shelf}    是否上架
${contentB_products_tips_shelf_ok}    上架成功

# file
${file_products_template}    ${CURDIR}/xlsx/product_template.xlsx    # 添加单个商品模版文件
${file_products_templates}    ${CURDIR}/xlsx/products_template.xlsx    # 添加多个商品模版文件
${file_products_wrong_template}    ${CURDIR}/xlsx/wrong_format.xlsx    # 添加单个的错误的商品模版文件
${file_products_addImg}    ${CURDIR}/../images/tm.jpg    # 添加商品图片
${file_products_addImg2}    ${CURDIR}/../images/mv.jpg    # 添加商品图片
