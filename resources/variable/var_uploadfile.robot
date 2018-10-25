*** Settings ***
*** Variables ***

${locatorB_uploadFile_upload_btn}    dom:document.querySelectorAll('[id="test_add_btn"]')[0]    #. 上传+号按钮

${locatorB_uploadFile_nav_shippingImg}    dom:document.querySelectorAll('.ant-tabs-tab')[0]     #.s商品图
${locatorB_uploadFile_img_shippingImg}    dom:document.querySelectorAll('[class*="ant-table-row"] [class*="center"]')[0]   #第一个上传的商品图片

${locatorB_uploadFile_add_btn}    dom:document.querySelectorAll('input[type="file"]')[0]    #.文件管理- 上传文件
${locatorB_uploadFile_del_img}    dom:document.querySelectorAll('[class*="icon_custom"]')[0]    #.文件管理- 删除按钮
${locatorB_uploadFile_upfile_txt}    dom:document.querySelectorAll('.ant-tabs-tab')[1]    #.文件管理- 上传文件 字体  素材管理
${locatorB_uploadFile_firstTr_elm}    dom:document.querySelectorAll('tbody tr')[0]    #.文件管理- 第一个tr
${locatorB_uploadFile_batchSect_elm}    dom:document.querySelectorAll('.ant-checkbox')[0]    #.文件管理- 批量选中
${locatorB_uploadFile_prePge_btn}    dom:document.querySelectorAll('.ant-btn-icon-only')[0]    #.文件管理- 上一页
${locatorB_uploadFile_nextPge_btn}    dom:document.querySelectorAll('.ant-btn-icon-only')[1]    #.文件管理- 下一页


