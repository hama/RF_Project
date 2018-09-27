*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator_productsCollection
${locatorB_productsCollection_button_addCategory}    ${locatorB_button_add}    #商品专辑页的新增专辑按钮
${locatorB_productsCollection_button_delProducts}    dom:document.querySelectorAll(".batchSelectTable_btn___40HNR")[0]    #通过checkbox选中所有专辑之后，提供的删除button
#${locatorB_productsCollection_popUps_firstCategory}    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0]    #"要添加到的专辑"弹窗的第一条条目（不简洁，暂时不用）
${locatorB_productsCollection_checkbox_chooseCategories}    ${locatorB_checkbox00}    #点击checkbox按钮，选中当前页面所有专辑

${locatorB_productsCollection_text_listCollectionNum}    dom:document.querySelectorAll("td[class='collection_id___1EkxD']")    # 商品专辑页面，列表所有item's num
${locatorB_productsCollection_text_firstCollectionNum}    ${locatorB_productsCollection_text_listCollectionNum}[0]    # 商品专辑页面，列表first item's num
${locatorB_productsCollection_img_listCollectionThumbnails}    dom:document.querySelectorAll('td[class="collection_img___2CY1-"]')    # 商品专辑页面，列表所有items图片

${locatorB_productsCollection_text_collection}    dom:document.querySelectorAll('p[class="title___3MmN9"]')    # 商品专辑
${locatorB_productsCollection_icon_listDetailFold}    dom:document.querySelectorAll('i[class="djfont dj-fold icon_custom___3gJ6J undefined"]')    # 所有-专辑详情-fold
${locatorB_productsCollection_icon_listDetailOpen}    dom:document.querySelectorAll('i[class="djfont dj-open icon_custom___3gJ6J undefined"]')    # 所有-专辑详情-open
${locatorB_productsCollection_icon_listDel}    dom:document.querySelectorAll('i[class="djfont delete icon_custom___3gJ6J undefined"]')    # 所有-专辑删除icon

# locator_collectionDetail
${locatorB_collectionDetail_input_title}    dom:document.querySelectorAll('input[id="title"]')   #
