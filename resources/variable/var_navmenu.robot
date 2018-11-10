*** Settings ***
Resource          var_common.robot

*** Variables ***
# content


# button
${locatorB_menus_button_addMenu}    dom:document.querySelectorAll('button[type="button"]')[0]     #.+ 新增菜单
${locatorB_menusAdd_button_addMenuDirectory}    dom:document.querySelectorAll('button[class*="add_menu_btn"]')[0]     #.+ 添加菜单目录
# icon  button
${locatorB_menusAdd_icon_returnMenu}    dom:document.querySelectorAll('[class*="dj-back"]')[0]     #.返回按钮 图标
${locatorB_menusAdd_icon_menuDrag}    dom:document.querySelectorAll('[class*="moveHandle"]')     #.拖动按钮  图标
# locator content
${locatorB_menus_list_menuList}    dom:document.querySelectorAll('[class*="menu_list_row"]')     #.菜单导航列表

${locatorB_menus_text_menuListName}   ${locatorB_menus_list_menuList}[2].querySelectorAll('[class*="menu_list_col"]')[0]    #.菜单名称序列 第三列
${locatorB_menus_text_menuListName1}   ${locatorB_menus_list_menuList}[3].querySelectorAll('[class*="menu_list_col"]')[0]    #.菜单名称序列 第四列
${locatorB_menus_text_levelDirectory}   ${locatorB_menus_list_menuList}[2].querySelectorAll('[class*="menu_list_col"]')[1]    #.菜单一级目录序列

# link
${locatorB_menusAdd_link_editorMenu}    dom:document.querySelectorAll('[class*="menu_icon"]')     #.菜单操作-编辑
${locatorB_menusAdd_link_delMenu}    dom:document.querySelectorAll('[class*="delete_menu_icon"]')     #.菜单操作-删除
${locatorB_menusAdd_link_addMenuDirectory}    dom:document.querySelectorAll('[class*="add_content_wrapper"] [class*="icon_custom_left"]')[0]     #.添加菜单目录 icon

# input
${locatorB_menusAdd_input_menuName}    dom:document.querySelectorAll('input[id="title"]')      #.输入菜单名称文本框
${locatorB_menusAdd_input_menuNavName}    dom:document.querySelectorAll('input[class*="title_input"]')    #.新建菜单目录结构-导航名称输入
# div select
${locatorB_menusAdd_select_linkPage}    dom:document.querySelectorAll('[class*="url_select"]')     #.链接到页面-选择list
${locatorB_menusAdd_select_listLinkLi}   dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')    #.链接页面-选择
${locatorB_menusAdd_select_linkPageInput}    dom:document.querySelectorAll('[class="ant-select-selection-selected-value"]')    #.链接页面-显示
# text
${locatorB_menusAdd_text_addSecondaryDirectory}    dom:document.querySelectorAll('[class*="add_menu_icon"]')     #.添加二级目录
${locatorB_menusAdd_text_delDirectory}    dom:document.querySelectorAll('[class*="delete_menu_icon"]')     #.删除二级目录

#popUp
${locatorB_menusAdd_select_collection}    dom:document.querySelectorAll("[class='ant-modal-content']")    #. 增加目录 弹窗
${locatorB_menusAdd_span_collectionText}    dom:document.querySelectorAll(" [class*='ant-radio-group'] [class='ant-radio-inner']")[0]    #. 增加目录 弹窗  第一个内容
${locatorB_menusAdd_button_collectionConfirm}    ${locatorB_popUps_button_footermiddle}    #. 增加目录 弹窗  添加按钮
${locatorB_menusAdd_button_writeUrl}    dom:document.querySelectorAll('[class="ant-input"]')[1]    # 增加目录 弹窗 链接地址输入框
















