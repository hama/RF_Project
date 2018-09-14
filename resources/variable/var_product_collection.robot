*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator_productsCollection
${locatorB_productsCollection_button_addCategory}    ${locatorB_button_add}    #商品专辑页的新增专辑按钮
${locatorB_productsCollection_icon_del}    dom:document.querySelectorAll(".djfont.delete")[0]    #商品专辑的第一个删除icon
${locatorB_productsCollection_button_delProducts}    dom:document.querySelectorAll(".batchSelectTable_btn___40HNR")[0]    #通过checkbox选中所有专辑之后，提供的删除button
${locatorB_productsCollection_popUps_firstCategory}    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0]    #"要添加到的专辑"弹窗的第一条条目
${locatorB_productsCollection_checkbox_chooseCategories}    ${locatorB_checkbox00}    #点击checkbox按钮，选中当前页面所有专辑