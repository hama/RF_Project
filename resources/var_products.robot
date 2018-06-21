*** Variables ***
# api
${api_products_add}    http://admin1024.shoplazza.com/api/product/add    # 保存商品
${api_products_upload}    http://admin1024.shoplazza.com/api/file/upload    # 上传图片
${api_products_addProductsType}    http://admin1024.shoplazza.com/productType    # 增加商品分类
${api_products_list}    http://admin1024.shoplazza.com/api/product/search?page=0&limit=20    # 获取商品列表
${api_products_list_shelf}    http://admin1024.shoplazza.com/api/product/search?status=1&page=0&limit=20    # 选择所有上架商品
${api_products_list_drop}    http://admin1024.shoplazza.com/api/product/search?status=0&page=0&limit=20    # 选择所有下架商品
${api_products_update_status}    http://admin1024.shoplazza.com/api/product/updatestatus    # 上架/下架 更新状态
# locator
${locator_products_all}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]    # 商品管理页面，全部商品标签
${locator_products_shelf}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[1]    # 商品管理页面，已上架商品标签
${locator_products_Drop}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[2]    # 商品管理页面，已下架商品标签
${locator_products_first}    dom:document.querySelectorAll("tr td")[1]    # 商品列表-第一个商品
${locator_products_back}    class:back1    # 商品编辑，后退按钮
${locator_products_addBtn}    id:test_add_btn    # 添加商品按钮
${locator_products_delBtn}    id:test_delete_modal_sure_btn    # 删除商品按钮
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
${locator_products_addCategory}    id:product_type_cascade    # 添加商品页面-添加分类
${locator_products_addCategoryItem}    dom:document.querySelectorAll(".ant-cascader-menu-item")[0]
${locator_products_chooseFile}    dom:document.querySelectorAll("input[type='file']")[0]    # 选择文件上传
${locator_products_chooseCategory}    id:product_type_cascade    # 选择商品分类
${locator_products_chooseCategoryItem}    dom:document.querySelectorAll(".ant-cascader-menu-item")[0]    # 选择商品分类子项
${locator_products_editTableHead}    dom:document.querySelectorAll(".editBtn___2yB79")[0]    #编辑表头
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
# file
${file_products_addImg}    ${CURDIR}/images/tm.jpg    # 添加商品图片
${file_products_addImg2}    ${CURDIR}/images/mv.jpg    # 添加商品图片
