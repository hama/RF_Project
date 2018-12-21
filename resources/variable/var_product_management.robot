*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator_productsMgmt
${locatorB_productsMgmt_button_addSomePro}    dom:document.querySelectorAll('[class*="ant-btn middle_btn"]')[0]    # 商品管理 - 无数据 - 新建商品 按钮
${locatorB_productsMgmt_button_addNewProduct}    dom:document.querySelectorAll('[class*="ant-btn large_btn"]')    # 商品管理 - 右上角 - 新建商品 按钮
${locatorB_productsMgmt_tab_ProductAll}    dom:document.querySelectorAll('[role="tab"]')[0]    # 商品管理 - 全部tab
${locatorB_productsMgmt_tab_ProductOn}    dom:document.querySelectorAll('[role="tab"]')[1]    # 商品管理 - 已上架tab
${locatorB_productsMgmt_tab_ProductDown}    dom:document.querySelectorAll('[role="tab"]')[2]    # 商品管理 - 已下架tab
${locatorB_productsMgmt_input_ProductSelect}    dom:document.querySelectorAll('[id="keyword"]')    # 商品管理 - 搜索输入框
${locatorB_productsMgmt_button_ProductSelect}    dom:document.querySelectorAll('[class*="ant-btn confirm"]')[0]    # 商品管理 - 搜索按钮
${locatorB_productsMgmt_button_SelectReset}    dom:document.querySelectorAll('[class*="ant-btn small"]')[0]    # 商品管理 - 重置按钮

${locatorB_productsMgmt_checkbox_chooseProducets}    dom:document.querySelectorAll('[class="ant-table-selection"] [class="ant-checkbox"]')    #商品管理 - 商品列表 - 全选复选框
${locatorB_productsMgmt_button_BatchDelete}    dom:document.querySelectorAll('[class*="ant-btn small"]')[1]    #商品管理 - 商品列表 - 批量删除 按钮
${locatorB_productsMgmt_button_BatchOn}    dom:document.querySelectorAll('[class*="ant-btn small"]')[2]    #商品管理 - 商品列表 - 批量上架 按钮
${locatorB_productsMgmt_button_BatchDown}    dom:document.querySelectorAll('[class*="ant-btn small"]')[3]    #商品管理 - 商品列表 - 批量下架 按钮

${locatorB_productsMgmt_list_firstProduct}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr')    #商品管理 - 商品列表第一行
${locatorB_productsMgmt_icon_firstpreview}    dom:document.querySelectorAll('[class*="djfont dj-preview"]')[0]    #商品管理 - 商品列表第一行 - 预览图标
${locatorB_productsMgmt_icon_firstdelete}    dom:document.querySelectorAll('[class*="djfont delete"]')[0]    #商品管理 - 商品列表第一行 - 删除图标
${locatorB_productsMgmt_image_firstProductImage}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(3)')[0]    #商品管理 - 商品列表第一行 - 商品图片
${locatorB_productsMgmt_text_firstProductName}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(4)')[0]    #商品管理 - 商品列表第一行 - 商品名称
${locatorB_productsMgmt_button_ProductUpDown}    dom:document.querySelectorAll('[class*="ant-switch"]')    #商品管理 - 商品列表第一行 - 是否上架


${locatorB_productsNew_button_productList}    dom:document.querySelectorAll('[class="djfont dj-back"]')    # 进入新增/编辑页面的后退按钮
${locatorB_productsNew_button_NextStep}    dom:document.querySelectorAll('[class*="next_step"]')    #进入新增/编辑页面的下一步按钮
${locatorB_productsNew_button_cancel}    dom:document.querySelectorAll('[class*="ant-btn default_btn"]')[0]    #进入新增/编辑页面的取消按钮

${locatorB_productsNew_input_title}    dom:document.querySelectorAll('[id="product.title"]')    # 添加商品页面-标题输入
${locatorB_productsNew_input_subTitle}    dom:document.querySelectorAll('[id="product.brief"]')    # 添加商品页面-副标题输入
${locatorB_productsNew_span_subTitleNum}    dom:document.querySelectorAll('[id="product.brief"] + span')[0]    # 添加商品页面-副标题字体显示
${locatorB_productsNew_input_desc}    dom:document.querySelectorAll('[class*="mce-edit-area"]')    # 添加商品页面-描述
${locatorB_productsNew_input_tags}    dom:document.querySelectorAll('input[id="product.tags"]')    # 添加标签输入
${locatorB_productsNew_input_supplier}    dom:document.querySelectorAll('[id="product.vendor"]')    # 添加供应商输入
${locatorB_productsNew_input_url}    dom:document.querySelectorAll('[id="product.vendor_url"]')     # 添加url输入
${locatorB_productsNew_button_productOn}    dom:document.querySelectorAll('[id="product.published"]')    # 商品上架按钮
${locatorB_productsNew_button_productShipping}    dom:document.querySelectorAll('[id="product.requires_shipping"]')    # 商品 需要物流 按钮
${locatorB_productsNew_button_productTax}    dom:document.querySelectorAll('[id="product.taxable"]')    # 商品 对此商品收税 按钮

${locatorB_productsNew_span_SelectCollection}    dom:document.querySelectorAll('[class*="icon_custom_left"]')[0]    # 商品 选择专辑 按钮
${locatorB_productsNew_input_selectCollName}    dom:document.querySelectorAll('[class="ant-input"]')[4]    # 专辑选择 - 专辑名称搜索输入框
${locatorB_productsNew_button_selectCollbtn}    dom:document.querySelectorAll('[class*="ant-btn confirm_btn_c2c3"]')    # 专辑选择 - 专辑名称搜索按钮
${locatorB_productsNew_button_newCollection}    dom:document.querySelectorAll('[class*="ant-btn small_"]')[0]    # 专辑选择 - 新建专辑按钮
${locatorB_productsNew_input_newCollectionName}    dom:document.querySelectorAll('[id="collectionTitle"]')    #新建专辑 - 专辑名称
${locatorB_productsNew_link_newCollection}    dom:document.querySelectorAll('[class*="link_"]')    #专辑选择 - 新建 文本链接
${locatorB_productsNew_checkbox_CollectionAll}    dom:document.querySelectorAll('[class="ant-checkbox-input"]')[0]    #专辑选择 - 全选框
${locatorB_productsNew_button_addCollectionSave}    dom:document.querySelectorAll('[class="ant-drawer-footer"] [class*="ant-btn middle_btn"]')    # 专辑选择 - 确定按钮
${locatorB_productsNew_icon_closeCollection}    dom:document.querySelectorAll('[class="ant-drawer-close-x"]')    # 专辑选择 - 关闭窗口按钮（x）

${locatorB_productsNew_textarea_firstCollCheckbox}     dom:document.querySelectorAll('[class="ant-table-tbody"] tr td')[0]    # 专辑选择 - 第一个专辑 - 复选框
${locatorB_productsNew_image_firstPicture}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td')[1]    # 专辑选择 - 第一个专辑 - 图片
${locatorB_productsNew_text_firstCollName}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td')[2]    # 专辑选择 - 第一个专辑 - 专辑名称
${locatorB_productsNew_text_firstCollTime}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td')[3]    # 专辑选择 - 第一个专辑 - 创建时间


${locatorB_productsNew_icon_seoEdit}    dom:document.querySelectorAll('[class*="icon_custom_left"]')[3]    # 商品 编辑seo
${locatorB_productsNew_icon_viewCollect}    dom:document.querySelectorAll('[class*="icon_custom_left"]')[2]    # 商品 查看收录
${locatorB_productsNew_icon_commit}    dom:document.querySelectorAll('[class*="icon_custom_left"]')[1]    # 商品 手动提交

${locatorB_productsNew_button_LastStep}    dom:document.querySelectorAll('[class*="ant-btn default_btn"]')[1]    # 进入新增/编辑页面的上一步按钮
${locatorB_productsNew_list_picture}    dom:document.querySelectorAll('[class="img-container_cf00"]')   # 图片展示显示
${locatorB_productsNew_icon_DeletePictureAll}    dom:document.querySelectorAll('[class*="icon_custom_left_"]')    # 移除所有图片 图标
${locatorB_productsNew_button_uploadBtn}    dom:document.querySelectorAll('[class*="djfont dj-add icon_"]')[0]    # 上传商品图片按钮
${locatorB_productsNew_input_imageUp}    dom:document.querySelectorAll('[type="file"]')    #图片文件上传
${locatorB_productsNew_icon_imageDelete}    dom:document.querySelectorAll('[class="djfont dj-not_found"]')    #图片删除图标
${locatorB_productsNew_icon_imagePreview}    dom:document.querySelectorAll('[class="djfont dj-preview"]')[1]    #图片预览图标

${locatorB_productsNew_input_salePrice}    dom:document.querySelectorAll('[id="product.variants[0].price"]')    # 添加商品页面-售价输入框
${locatorB_productsNew_input_rawPrice}    dom:document.querySelectorAll('[id="product.variants[0].compare_at_price"]')    # 添加商品页面-原价格输入框
${locatorB_productsNew_input_weight}    dom:document.querySelectorAll('[id="product.variants[0].weight"]')    # 添加商品页面-重量输入
${locatorB_productsNew_input_sku}    dom:document.querySelectorAll('[id="product.variants[0].sku"]')    # 添加商品页面-Sku
${locatorB_productsNew_input_barcode}    dom:document.querySelectorAll('[id="product.variants[0].barcode"]')    # 添加商品页面-条形码
${locatorB_productsNew_input_stock}    dom:document.querySelectorAll('[id="product.variants[0].inventory_quantity"]')    # 添加商品页面-库存

${locatorB_productsNew_radio_OneStyle}    dom:document.querySelectorAll('[class*="ant-radio"]')[4]    # 单一款式选择
${locatorB_productsNew_radio_moreStyle}    dom:document.querySelectorAll('[class*="ant-radio"]')[6]    # 添加多个款式选择
${locatorB_productsNew_input_needPicture}    dom:document.querySelectorAll('[class*="ant-form-item-control"] span[class*="ant-checkbox"]')[0]    # 需要配图选择
${locatorB_productsNew_checkbox_followNumber}    dom:document.querySelectorAll('[class*="ant-form-item-control"] span[class*="ant-checkbox"]')[2]    #跟踪库存
${locatorB_productsNew_input_followText}    dom:document.querySelectorAll('[class*="ant-select-selection"]')[0]     # 库存选择框
${locatorB_productsNew_select_ContentOne}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[0]    # 跟踪库存 - 库存为0时不允许购买
${locatorB_productsNew_select_ContentTwo}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[1]    # 跟踪库存 - 库存为0允许购买
${locatorB_productsNew_select_ContentThere}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[2]    # 跟踪库存 - 库存为0自动下架
${locatorB_productsNew_button_IndependentStyle}    dom:document.querySelectorAll('[class*="ant-btn small_btn_"]')[0]    # 独立款式 按钮
${locatorB_productsNew_button_changeStyle}    dom:document.querySelectorAll('[class*="ant-btn small_btn_"]')[1]    # 款式修改 按钮
${locatorB_productsNew_image_StylePic}    dom:document.querySelectorAll('[class="ant-form-item-children"] [class*="img-container img-container"]')    # 批量修改 - 图片上传
${locatorB_productsNew_button_PictureUp}     dom:document.querySelectorAll('[class="popover-imgs popover-imgs__bottomLeft "] [class*="ant-btn middle_btn"]')    # 批量修改 - 图片 - 上传按钮
${locatorB_productsNew_checkbox_AllStyle}    dom:document.querySelectorAll('[class="ant-table-thead"] span[class*="ant-checkbox"]')[0]     # 款式 - 全选复选框
${locatorB_productsNew_button_batchEdit}    dom:document.querySelectorAll('[class="dj-table__header-bar"] [class*="ant-btn small_btn"]')[0]     # 款式 - 批量修改
${locatorB_productsNew_button_batchDelete}    dom:document.querySelectorAll('[class="dj-table__header-bar"] [class*="ant-btn small_btn"]')[1]    # 款式 - 批量删除

${locatorB_productsNew_icon_AddstyleListPic}    dom:document.querySelectorAll('td [class*="img-container img-container"]')    # 款式 - 添加图片（+）图标
${locatorB_productsNew_popUp_styleListPic}    dom:document.querySelectorAll('[class*="popover-imgs popover-imgs__"]')    # 款式 - 添加图片（+）图标 - 图片
${locatorB_productsNew_input_styleEditPrice}     dom:document.querySelectorAll('[id="price"]')    # 批量修改款式 - 售价输入框
${locatorB_productsNew_input_styleEditComparePrice}    dom:document.querySelectorAll('[id="compare_at_price"]')    # 批量修改款式 - 原价输入框
${locatorB_productsNew_input_styleEditWeight}    dom:document.querySelectorAll('[id="weight"]')    # 批量修改款式 - 重量输入框
${locatorB_productsNew_input_styleEditQuantity}    dom:document.querySelectorAll('[id="inventory_quantity"]')    # 批量修改款式 - 库存输入框

${locatorB_productsNew_button_addStyle}    dom:document.querySelectorAll('[class*="ant-btn middle_btn"]')[2]    # 添加款式按钮
${locatorB_productsNew_input_StyleName}    dom:document.querySelectorAll('[id*="name"]')    # 款式名称输入
${locatorB_productsNew_input_StyleContent}    dom:document.querySelectorAll('input[id*="values"]')  #款式值输入
${locatorB_productsNew_button_productAttribute}    dom:document.querySelectorAll('[class="addoption_8be3"]')    # 创建商品属性 按钮
${locatorB_productsNew_icon_styleInputCancel}     dom:document.querySelectorAll('[class="option__remove_f522"]')[0]    #款式名称输入框-》删除图标
${locatorB_productsNew_button_styleCancel}    dom:document.querySelectorAll('[class*="ant-btn default_btn_"]')[3]    #添加款式页面 - 取消按钮
${locatorB_productsNew_button_styleSure}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_"]')    #添加款式页面 - 确认按钮
${locatorB_productsNew_icon_closestyle}    dom:document.querySelectorAll('[class="ant-drawer-close-x"]')     # 添加款式页面 关闭图标（x）
${locatorB_productsNew_button_save}    ${locatorB_button_save00}     # 保存按钮


# C端
${locatorC_productDetail_button_addToCart}    dom:document.querySelectorAll("[data-click='addToCart']")[0]     #.c端订单 - 添加到购物车 add to cart 按钮
${locatorC_productDetail_button_buyNow}    dom:document.querySelectorAll('[data-click="submit"]')[0]    #.by-now按钮
${locatorC_productDetail_input_qtyNum}    dom:document.querySelectorAll("[class*='form-control product-info__qty_num']")[0]    #商品购买数量输入框
