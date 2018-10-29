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
${locatorB_products_button_cancel}    ${locatorB_popUps_button_bodydefault}    #商品弹窗-默认按钮
${locatorB_products_button_confirm}    ${locatorB_popUps_button_bodymiddle}    #商品弹窗-确定按钮

# locator_productsMgmt
${locatorB_productsMgmt_button_addProduct}    ${locatorB_button_add}    #商品列表页的新增商品按钮
${locatorB_productsMgmt_checkbox_chooseProducets}    ${locatorB_checkbox00}    #点击checkbox按钮，选中当前页面所有商品
${locatorB_productsMgmt_checkbox_chooseFirstProduct}    ${locatorB_checkbox01}    #点击checkbox按钮，选中当前页面第一个商品
${locatorB_productsMgmt_select_batchOperations}    ${locatorB_select_batchOperations}    #批量操作下拉框
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
${locatorB_productsMgmt_icon_migrateProduct}    dom:document.querySelectorAll(".yijianzhuaqu")[0]    #商品列表页的店铺搬迁按钮
${locatorB_productsMgmt_icon_uploadProduct}    dom:document.querySelectorAll(".piliangshangchuan")[0]    #商品列表页的上传商品按钮
${locatorB_productsMgmt_input_uploadProduct}    dom:document.querySelectorAll('input[type="file"]')[0]   #批量上传商品input
${locatorB_productsMgmt_button_toImport}    dom:document.querySelectorAll('button[class="ant-btn middle_btn___2ExQc undefined ant-btn-submit"]')[0]    #开始导入
${locatorB_productsMgmt_button_confirmAfterImport}    dom:document.querySelectorAll('button[class="ant-btn middle_btn___2ExQc undefined"]')[0]    # 导入之后的确定按钮

${locatorB_productsMgmt_button_editTableHead}    dom:document.querySelectorAll(".edit_head___2-5Ey")[0]     #编辑表头
${locatorB_productsMgmt_tabindex_firstSwitch}    dom:document.querySelectorAll(".ant-switch")[0]    # 列表第一个商品的上架按钮
${locatorB_productsMgmt_input_minPrice}    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[0]    #"最低售价"输入框
${locatorB_productsMgmt_input_maxPrice}    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[1]    #"最高售价"输入框
${locatorB_productsMgmt_input_name}    dom:document.querySelectorAll(".search_content___DTTXj .search_li___3f16J .ant-input")[2]    #"商品名称/商品SKU/标签"输入框
${locatorB_productsMgmt_button_search}    dom:document.querySelectorAll('button[data-robot="btn_search"]')[0]    # 搜索按钮
${locatorB_productsMgmt_icon_preview}    dom:document.querySelectorAll("tbody tr td div div i")[0]    # 商品列表 - 预览按钮

${locatorB_productsMgmt_image_firstProductThumbnails}    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[1].querySelectorAll("img")[0]     #商品列表第一个商品的图片
${locatorB_productsMgmt_text_firstProductName}    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[2].querySelectorAll("span")[0]    #商品列表第一个商品的商品名称
${locatorB_productsMgmt_text_firstProductInventoryQuantity}    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[3]    #商品列表第一个商品的库存(只能在Show All Header关键字执行之后使用)
${locatorB_productsMgmt_text_firstProductSku}    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[4]    #商品列表第一个商品的SKU(只能在Show All Header关键字执行之后使用)
${locatorB_productsMgmt_text_firstProductViews}    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[5]    #商品列表第一个商品的浏览量(只能在Show All Header关键字执行之后使用)
${locatorB_productsMgmt_text_tagInPopUps}    dom:document.querySelectorAll('[class="des1___37crS"]')[0]    # 批量添加标签中的标签text
${locatorB_productsMgmt_icon_listPreview}    dom:document.querySelectorAll("i[class*='preview']")    #所有条目的预览icon,第0个为第一条商品的
${locatorB_productsMgmt_icon_listDelete}    dom:document.querySelectorAll("i[class*='delete']")    #所有条目的删除icon,第0个为第一条商品的
${locatorB_productsMgmt_text_listCreateTime}    dom:document.querySelectorAll('td[class="vendor___2VuW9"]')    #所有条目的创建时间，第0个为第一条商品的
${locatorB_productsMgmt_switch_listLaunched}    dom:document.querySelectorAll('span[class="ant-switch ant-switch-checked"]')    #所有上架条目的switch按钮
${locatorB_productsMgmt_switch_listDiscontinued}    dom:document.querySelectorAll('span[class="ant-switch"]')    #所有下架条目的switch按钮


${locatorB_productsMgmt_popUps_firstInput}    ${locatorB_popUps_inputs}[0]    # 弹窗第一个输入框
${locatorB_productsMgmt_textlist_itemsTitle}    dom:document.querySelectorAll('thead[class="ant-table-thead"] th')    # 商品列表的所有title

# locator_productsType
${locatorB_productType_button_saveBtn}    id:test_save_btn    # 商品分类-保存按钮
# locator_productsNew
#${locatorB_productsMgmt_switch_listDiscontinued}    dom:document.querySelectorAll('div[class="ant-select-selection__rendered"]')[0]    #所有下架条目的switch按钮
${locatorB_productsNew_button_back}    class:back    # 进入编辑页面的后退按钮
${locatorB_productsNew_button_uploadBtn}    id:test_upload_btn    # 上传商品图片按钮
${locatorB_productsNew_switch_status}    dom:document.querySelectorAll('span[data-robot="products_status"]')[0]    # 商品状态按钮
${locatorB_productsNew_input_tags}    id:tags    # 添加标签按钮
${locatorB_productsNew_input_addImage}    dom:document.querySelectorAll('input[type="file"]')[0]   # 选择文件上传
${locatorB_productsNew_img_firstImage}    dom:document.querySelectorAll('img[class="center___1nHSZ"]')[0]    # 选择第一张图片
${locatorB_productsNew_input_title}    id:__title    # 添加商品页面-标题按钮
${locatorB_productsNew_input_subTitle}    id:__brief    # 添加商品页面-副标题按钮
${locatorB_productsNew_input_desc}    dom:document.querySelectorAll('div[class="fr-element fr-view"] p')[0]    # 添加商品页面-副标题按钮
${locatorB_productsNew_input_salePrice}    id:price    # 添加商品页面-价格输入框
${locatorB_productsNew_input_rawPrice}    id:compare_at_price    # 添加商品页面-原价格输入框
${locatorB_productsNew_input_weight}    id:weight    # 添加商品页面-重量输入
${locatorB_productsNew_input_sku}    id:sku    # 添加商品页面-Sku
${locatorB_productsNew_input_barcode}    id:barcode    # 添加商品页面-条形码
${locatorB_productsNew_input_supplier}    dom:document.querySelectorAll(".ant-input")[1]    # 添加供应商
${locatorB_productsNew_input_productType}    id:product_type_cascade    #商品专辑页的新增专辑按钮
${locatorB_productsNew_cascader_chooseCategoryItem}    dom:document.querySelectorAll(".ant-cascader-menu-item")[0]    # 选择商品分类子项
${locatorB_productsNew_button_save}    ${locatorB_button_save}    #保存按钮
${locatorB_productsNew_button_setting}    dom:document.querySelectorAll('button[data-robot="products_setting"]')[0]    #设置按钮
${locatorB_productsNew_dropdown_addItems}    dom:document.querySelectorAll('button[class="ant-btn ant-dropdown-trigger"]')[0]
${locatorB_productsNew_dropdown_customize}    dom:document.querySelectorAll('li[class="ant-dropdown-menu-item"]')[0]
${locatorB_productsNew_input_firstStyleCategory}    id:option_0    # 第一个款式分类输入框
${locatorB_productsNew_input_firstSubStyleCategory}    id:option_values_4  # 第一个款式分类sub输入框
${locatorB_productsNew_checkbox_firstSubProduct}    dom:document.querySelectorAll('label[class="ant-checkbox-wrapper"]')[1]  # 第一个subproduct
${locatorB_productsNew_icon_editSEO}    dom:document.querySelectorAll('a[class="icon_custom_left___GO944 gap___1qNPB"]')[0]  # 编辑SEO
${locatorB_productsNew_input_homeTitle}    dom:document.querySelectorAll('input[class="autosize-input___MJu1O"]')[0]  # 主页标题输入框
${locatorB_productsNew_textarea_homeSEODesc}    dom:document.querySelectorAll('textarea[class="ant-input text_area___BhZLp"]')[0]  # 主页SEO描述
${locatorB_productsNew_input_homeSEOLink}    dom:document.querySelectorAll('input[class="autosize-input___MJu1O"]')[1]  #
${locatorB_productsNew_input_homeSEOKeyword}    dom:document.querySelectorAll('input[class="ant-select-search__field"]')[0]  #

# locator_productsMobile
${locatorC_products_icon_cart}    dom:document.querySelectorAll('i[class*="cart"]')[0]    #C端，购物车

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
${file_products_template}    ${CURDIR}/../xlsx/product_template.xlsx    # 添加单个商品模版文件
${file_products_templates}    ${CURDIR}/../xlsx/products_template.xlsx    # 添加多个商品模版文件
${file_products_wrong_template}    ${CURDIR}/../xlsx/wrong_format.xlsx    # 添加单个的错误的商品模版文件





# C端
${locatorC_productDetail_button_addToCart}    dom:document.querySelectorAll("[data-click='addToCart']")[0]     #.c端订单-添加到购物车 add to cart
${locatorC_productDetail_button_buyNow}    dom:document.querySelectorAll("[class*='btn-secondary']")[0]    #.by-now按钮
${locatorC_productDetail_input_qtyNum}    dom:document.querySelectorAll("[class*='form-control product-info__qty_num']")[0]    #商品购买数量输入框
