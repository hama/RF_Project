*** Settings ***
Resource          var_common.robot

*** Variables ***
# api
${api_products_add}    ${home_page}/api/product/add    # 保存商品
${api_products_upload}    ${home_page}/api/file/upload    # 上传图片
${api_products_addProductsType}    ${home_page}/productType    # 增加商品分类
${api_products_list}    ${home_page}/api/product/search?page=0&limit=20    # 获取商品列表
${api_products_list_shelf}    ${home_page}/api/product/search?status=1&page=0&limit=20    # 选择所有上架商品
${api_products_list_drop}    ${home_page}/api/product/search?status=0&page=0&limit=20    # 选择所有下架商品
${api_products_update_status}    ${home_page}/api/product/updatestatus    # 上架/下架 更新状态
# locator
${locator_products_all}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]    # 商品管理页面，全部商品标签
${locator_products_shelf}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[1]    # 商品管理页面，已上架商品标签
${locator_products_drop}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[2]    # 商品管理页面，已下架商品标签
${locator_products_first}    dom:document.querySelectorAll("tr td")[1]    # 商品列表-第一个商品
${locator_products_back}    class:back    # 商品编辑，后退按钮
${locator_products_addBtn}    id:test_add_btn    # 添加商品按钮
${locator_products_saveBtn}    id:test_save_btn    # 保存商品按钮
${locator_products_uploadBtn}    id:test_upload_btn    # 上传商品图片按钮
${locator_products_status}    id:status    # 商品状态按钮
${locator_products_addTitle}    id:__title    # 添加商品页面-标题按钮
${locator_products_addSubTitle}    id:__brief    # 添加商品页面-副标题按钮
${locator_products_addDesc}    dom:document.querySelectorAll(".fr-view")[0].querySelectorAll("p")[0]    # 添加商品页面-副标题按钮
${locator_products_addPrice}    id:price    # 添加商品页面-价格输入框
${locator_products_addRawPrice}    id:compare_at_price    # 添加商品页面-原价格输入框
${locator_products_addWeight}    id:weight    # 添加商品页面-重量输入
${locator_products_addSku}    id:sku    # 添加商品页面-Sku
${locator_products_addBarcode}    id:barcode    # 添加商品页面-条形码
${locator_products_addSupplier}    dom:document.querySelectorAll(".ant-input")[1]    # 添加供应商
${locator_products_addTags}    id:tags    # 添加标签按钮
${locator_products_addCategoryItem}    dom:document.querySelectorAll(".ant-cascader-menu-item")[0]
${locator_products_chooseFile}    dom:document.querySelectorAll("input[type='file']")[0]    # 选择文件上传
${locator_products_chooseCategoryItem}    dom:document.querySelectorAll(".ant-cascader-menu-item")[0]    # 选择商品分类子项
${locator_products_editTableHead}    dom:document.querySelectorAll(".edit_head___UidlR")[0]    #编辑表头
${locator_products_cancelDelete}    ${locator_popUps_button_default}    #商品列表点击删除icon弹出框中的取消按钮
${locator_products_add_product}    ${locator_button_add}    #商品列表页的新增商品按钮
${locator_products_add_category}    ${locator_button_add}    #商品专辑页的新增专辑按钮
${locator_products_first_name}    dom:document.querySelectorAll(".product_name___Ul4W-")[0]     #列表第一个商品的名字
${locator_products_first_switch}    dom:document.querySelectorAll(".ant-switch")[0]    # 列表第一个商品的上架按钮
${locator_page_total_record}    dom:document.querySelectorAll(".ant-pagination-total-text")[0]
${locator_products_inputbox_name}    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2]
${locator_products_checkbox_chooseProducets}    ${locator_checkbox00}    #点击checkbox按钮，选中当前页面所有商品
${locator_products_checkbox_chooseFirstProducet}    ${locator_checkbox01}    #点击checkbox按钮，选中当前页面第一个商品
${locator_products_checkbox_chooseCategories}    ${locator_checkbox00}    #点击checkbox按钮，选中当前页面所有专辑
${locator_products_selection_batchOperations}    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]    #批量操作下拉框
${locator_products_dropdown_onShelf}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[0]    #下拉框-上架
${locator_products_dropdown_offShelf}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]    #下拉框-下架
${locator_products_dropdown_batchDel}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[2]    #下拉框-删除商品
${locator_products_dropdown_addTags}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    #下拉框-添加标签
${locator_products_dropdown_delTags}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[4]    #下拉框-移除标签
${locator_products_dropdown_addtoCategory}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    #下拉框-添加到专辑
${locator_products_dropdown_delfromCategory}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[6]    #下拉框-从专辑移除
${locator_products_popUps_content}      dom:document.querySelectorAll(".ant-modal-content")[0]      #弹窗_content
${locator_products_popUps_body}    dom:document.querySelectorAll(".ant-modal-body")[0]    #弹窗_body
#locator_productsMgmt
${locator_productsMgmt_button_saveProduct}    ${locator_popUps_button_middle}    #商品详情页的保存按钮
${locator_productsMgmt_button_cancelProduct}    ${locator_popUps_button_default}    #商品详情页的取消按钮
${locator_productsMgmt_icon_grabProduct}    dom:document.querySelectorAll(".icon_custom_left___GO944")[0]    #商品列表页的商品抓取按钮
${locator_productsMgmt_icon_migrateProduct}    dom:document.querySelectorAll(".icon_custom_left___GO944")[1]    #商品列表页的店铺搬迁按钮
${locator_productsMgmt_icon_uploadProduct}    dom:document.querySelectorAll(".icon_custom_left___GO944")[2]    #商品列表页的上传商品按钮
${locator_productsMgmt_image_center}    dom:document.querySelectorAll(".center___1nHSZ")[0]    #商品列表的图片
${locator_productsMgmt_icon_preview}    dom:document.querySelectorAll(".preview___37DtU")[0]    #商品列表的预览icon
${locator_productsMgmt_icon_delete}    dom:document.querySelectorAll(".delete___2xfx-")[0]    #商品列表的删除icon
${locator_productsMgmt_button_delTags}    dom:document.querySelectorAll(".ant-btn-primary")[0]    #删除标签弹框的删除button
#locator_productsCategory
${locator_productsCategory_icon_del}    dom:document.querySelectorAll(".djfont.delete")[0]    #商品专辑的第一个删除icon
${locator_productsCategory_button_delProducts}    dom:document.querySelectorAll(".batchSelectTable_btn___40HNR")[0]    #通过checkbox选中所有专辑之后，提供的删除button
${locator_productsCategory_popUps_firstCategory}    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0]    #"要添加到的专辑"弹窗的第一条条目
#locator_productsComment
# content
${content_products_all}    全部
${content_products_empty}    暂无数据
${content_products_new}    新建商品
${content_products_title}    全部
${content_products_addTitle}    此处为商品标题
${content_products_addSubTitle}    此处为商品副标题
${content_products_addPrice}    999
${content_products_addRawPrice}    9999
${content_products_addWeight}    1
${content_products_addSku}    100
${content_products_addBarcode}    9787115470416
${content_products_addSupplier}    供应商A
${content_products_input_price}    请输入价格
${content_products_AddTags}    TagA
${content_products_tips_save_ok}    保存成功
${content_products_tips_select_products}    请至少选择一个商品
${content_products_tips_saving}    页面有未保存内容
${content_store_name}     test
${content_payment_failed}     Order submission failed
${content_products_tips_shelf}    是否上架
${content_products_tips_shelf_ok}    上架成功

# file
${file_products_template}    ${CURDIR}/xlsx/product_template.xlsx    # 添加单个商品模版文件
${file_products_templates}    ${CURDIR}/xlsx/products_template.xlsx    # 添加多个商品模版文件
${file_products_wrong_template}    ${CURDIR}/xlsx/wrong_format.xlsx    # 添加单个的错误的商品模版文件
${file_products_addImg}    ${CURDIR}/images/tm.jpg    # 添加商品图片
${file_products_addImg2}    ${CURDIR}/images/mv.jpg    # 添加商品图片
