*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator_CollectionsMgmt
${locatorB_CollectionsMgmt_button_addOneCollection}    dom:document.querySelectorAll('[class*="ant-btn middle_btn"]')    # 商品专辑 - 无数据 - 创建一个专辑
${locatorB_CollectionsMgmt_button_newCollection}    dom:document.querySelectorAll('[class*="ant-btn large_btn_"]')[0]    # 商品专辑 - 右上角 - 新建专辑
${locatorB_CollectionsMgmt_input_selectCollection}    dom:document.querySelectorAll('[class="ant-input"]')    # 商品专辑 - 搜索输入框
${locatorB_CollectionsMgmt_tabindex_firstCollection}       dom:document.querySelectorAll('[class="ant-table-tbody"] tr')[0]    # 商品专辑 - 第一个专辑的一行
${locatorB_CollectionsMgmt_icon_firstPreview}    dom:document.querySelectorAll('[class*="djfont dj-preview"]')[0]    # 商品专辑 - 第一个专辑 - 预览按钮
${locatorB_CollectionsMgmt_icon_firstDelete}    dom:document.querySelectorAll('[class*="djfont delete"]')[0]    # 商品专辑 - 第一个专辑 - 删除按钮
${locatorB_CollectionsMgmt_image_firstPicture}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(3)')[0]    # 商品专辑 - 第一个专辑 - 专辑图
${locatorB_CollectionsMgmt_text_firstCollectionName}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(4)')[0]    # 商品专辑 - 第一个专辑 - 专辑名称
${locatorB_CollectionsMgmt_text_firstCollectionDesc}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(5)')[0]    #商品专辑 - 第一个专辑 - 专辑描述
${locatorB_CollectionsMgmt_text_firstCollectionNum}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(6)')[0]    #商品专辑 - 第一个专辑 - 专辑数量
${locatorB_CollectionsMgmt_text_firstCollEditTime}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(7)')[0]     #商品专辑 - 第一个专辑 - 修改时间

# locator_CollectionsNew
${locatorB_CollectionsNew_button_CollectionSave}    dom:document.querySelectorAll('[class*="saveButton"] button[class*="middle_btn"]')[0]    #专辑详情 - 保存按钮
${locatorB_CollectionsNew_button_CollectionCancel}    ${locatorB_button_canecl00}    #专辑详情 - 取消按钮
${locatorB_CollectionsNew_icon_Collectionlist}    dom:document.querySelectorAll('[class="djfont dj-back"]')    #专辑详情 - 返回专辑列表 图标
${locatorB_CollectionsNew_icon_CollectionPreview}     dom:document.querySelectorAll('[class*="djfont dj-preview"]')[0]    #专辑详情 - 预览页面 图标
${locatorB_CollectionsNew_inoput_CollectionName}    dom:document.querySelectorAll('[id="title"]')   #专辑名称
${locatorB_CollectionsNew_textarea_CollectionDesc}    dom:document.querySelectorAll('[id="description"]')    #专辑描述
${locatorB_CollectionsNew_icon_CollectionPicture}    dom:document.querySelectorAll('[class*="djfont dj-add"]')    #专辑封面添加图标
${locatorB_CollectionsNew_input_CollectionPicture}    dom:document.querySelectorAll('span [type="file"]')    #专辑图片上传
${locatorB_CollectionsNew_image_existPicture}    dom:document.querySelectorAll('[class*="image_wrap"]')    #图片上传存在元素

${locatorB_CollectionsNew_image_uploadPicture}     dom:document.querySelectorAll('[type="file"]')[0]    #图片上传image

${locatorB_CollectionsNew_icon_CollectionEditSeo}    dom:document.querySelectorAll('[class*="icon_custom_left"]')[2]    #编辑seo
${locatorB_CollectionsNew_input_SeoTitle}    dom:document.querySelectorAll('[class="ant-input"]')[1]   #编辑seo - seo标题
${locatorB_CollectionsNew_texterea_SeoDesc}    dom:document.querySelectorAll('[class*="ant-input seo_form"]')[0]    #编辑seo - seo描述
${locatorB_CollectionsNew_texterea_SeoLink}    dom:document.querySelectorAll('[class*="ant-input seo_form"]')[1]    #编辑seo - seo链接
${locatorB_CollectionsNew_input_SeoKeywords}    dom:document.querySelectorAll('[class*="seo_form_tag_"]')    #编辑seo - seo关键词
${locatorB_CollectionsNew_button_SeoCancel}    dom:document.querySelectorAll('[class*="ant-btn default_btn_"]')    #编辑seo - seo取消按钮
${locatorB_CollectionsNew_button_Seosave}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_"]')[1]    #编辑seo - seo保存按钮
${locatorB_CollectionsNew_icon_CloseSeo}    dom:document.querySelectorAll('[class="ant-drawer-close-x"]')    #编辑seo - seo页面关闭图标（x）

${locatorB_CollectionsNew_icon_previewCollect}    dom:document.querySelectorAll('[class*="icon_custom_left"]')[1]    #查看收录
${locatorB_CollectionsNew_icon_commit}    dom:document.querySelectorAll('[class*="icon_custom_left"]')[0]    #手动提交

${locatorB_CollectionsNew_button_addProduct}    dom:document.querySelectorAll('[class*="ant-btn middle_btn_"]')    #添加商品按钮
${locatorB_CollectionsNew_image_ProductImage}     dom:document.querySelectorAll('[class*="product_imgwrapper"]')[0]    #第一个商品图片
${locatorB_CollectionsNew_icon_ProductDelete}    dom:document.querySelectorAll('[class*="djfont delete"]')[0]    #第一个商品图片 - 删除 图标
${locatorB_CollectionsNew_select_ProductStatusbox}    dom:document.querySelectorAll('[class*="ant-select-selection"]')[0]    #商品选择 - 状态框
${locatorB_CollectionsNew_select_selectContectOne}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[0]    #商品选择 - 全部状态
${locatorB_CollectionsNew_select_selectContectTwo}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[1]    #商品选择 - 上架
${locatorB_CollectionsNew_select_selectContectThere}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[2]    #商品选择 - 下架
${locatorB_CollectionsNew_input_ProductSelect}    dom:document.querySelectorAll('[class="ant-input"]')[1]    #商品选择 - 商品搜索输入框
${locatorB_CollectionsNew_button_ProductSelect}   dom:document.querySelectorAll('[class*="ant-btn confirm_btn_"]')    #商品选择 - 商品搜索按钮
${locatorB_CollectionsNew_link_addProduct}    dom:document.querySelectorAll('[href="../products"]')    #商品选择 - 去添加商品 链接
${locatorB_CollectionsNew_checkbox_firstProduct}    dom:document.querySelectorAll('td span[class*="ant-checkbox"]')[0]    #商品选择 - 第一个商品 复选框
${locatorB_CollectionsNew_checkbox_ProductAll}    dom:document.querySelectorAll('[class*="footer_"] [class="ant-checkbox-input"]')    #商品选择 - 全选框
${locatorB_CollectionsNew_button_Productaddfoot}    dom:document.querySelectorAll('[class*="ant-btn middle_btn"]')[1]    #商品选择 - 添加按钮
${locatorB_CollectionsNew_icon_CloseProduct}    dom:document.querySelectorAll('[class="ant-drawer-close-x"]')    #商品选择 - 商品页面关闭图标（x）

# locator_CollectionsEdit
${locatorB_CollectionsEdit_button_deleteCollection}    dom:document.querySelectorAll('[class*="ant-btn delete_btn_"]')    #专辑详情 - 删除该专辑 按钮