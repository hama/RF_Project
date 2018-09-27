*** Settings ***
*** Variables ***

${locatorB_upfile_upload_btn}    id:test_add_btn    #. 上传+号按钮 
${locatorB_upfile_add_btn}    dom:document.querySelectorAll('input[type="file"]')[0]    #.文件管理- 上传文件
${locatorB_upfile_del_img}    dom:document.querySelectorAll('.icon_custom___3gJ6J')[0]    #.文件管理- 删除按钮
${locatorB_upfile_upfile_txt}    dom:document.querySelectorAll('.ant-tabs-tab')[1]    #.文件管理- 上传文件 字体
${locatorB_upfile_firstTr_elm}    dom:document.querySelectorAll('tbody tr')[0]    #.文件管理- 第一个tr
${locatorB_upfile_batchSect_elm}    dom:document.querySelectorAll('.ant-checkbox')[0]    #.文件管理- 批量选中
${locatorB_upfile_prePge_btn}    dom:document.querySelectorAll('.ant-btn-icon-only')[0]    #.文件管理- 上一页
${locatorB_upfile_nextPge_btn}    dom:document.querySelectorAll('.ant-btn-icon-only')[1]    #.文件管理- 下一页

${Img2}    ${CURDIR}/mv.jpg    # 添加商品图片

