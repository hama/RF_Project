*** Settings ***
*** Variables ***
#.button
${locatorB_uploadFile_upload_btn}    dom:document.querySelectorAll('[id="test_add_btn"]')[0]    #. 上传+号按钮
#.nva
${locatorB_uploadFile_nav_shippingImg}    dom:document.querySelectorAll('.ant-tabs-tab')[0]     #.商品图
${locatorB_uploadFile_nav_upfile}    dom:document.querySelectorAll('.ant-tabs-tab')[1]    #.文件管理- 上传文件

${locatorB_uploadFile_img_shippingImg}    dom:document.querySelectorAll('[class*="ant-table-row"] [class*="center"]')[0]   #第一个上传的商品图片

${locatorB_uploadFile_upLoad_addFileBtn}    dom:document.querySelectorAll('input[type="file"]')[0]    #.文件管理- 上传文件
${locatorB_uploadFile_icon_delImg}    dom:document.querySelectorAll('[class*="delete icon_custom"]')   #.文件管理- 删除按钮

${locatorB_uploadFile_list_firstTr}    dom:document.querySelectorAll('[class*="nt-table-row-level"]')   #.文件管理- tr 列表 list
${locatorB_uploadFile_checkbox_delFutureBut}    dom:document.querySelectorAll('.ant-checkbox')[0]    #.文件管理- 批量选中
${locatorB_uploadFile_page_prePageBut}    dom:document.querySelectorAll('.ant-btn-icon-only')[0]    #.文件管理- 上一页
${locatorB_uploadFile_page_nexPageBut}    dom:document.querySelectorAll('.ant-btn-icon-only')[1]    #.文件管理- 下一页

#. 状态判定

${locatorB_uploadFile_checkbox_state}    dom:document.querySelectorAll('[class*="ant-checkbox-checked"]')    #.文件管理- 选中状态判定

${locatorB_uploadFile_checkbox_delTheBut}    dom:document.querySelectorAll('input[class*="ant-checkbox"]')    #.文件管理- 单个选择
${locatorB_uploadFile_button_delData}    dom:document.querySelectorAll('button[class*="batchSelectTable_btn"]')[0]    #.删除按钮