*** Settings ***
Documentation     菜单导航
Suite Setup       Navigation Suite Setup
Suite Teardown    Navigation Suite Teardown
Test Setup        Navigation Test Setup
Test Teardown     Navigation Test Teardown
Force Tags        navigation_menu
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
menu001
    [Documentation]      菜单导航入 口
    [Tags]    P1    threshold
    Wait Until Page Contains Text    菜单导航
    Wait Until Page Contains Locator    ${locatorB_menus_button_addMenu}

menu003
    [Documentation]      默认的菜单导航展示
    [Tags]    P0    threshold
    Wait Until Page Contains Text    你可以在此设置菜单，装修店铺顶部导航、页尾时，可手动关联对应的菜单
    Wait Until Page Contains Locator    ${locatorB_menus_button_addMenu}
    Text Of Element Should Contain With Wait    ${locatorB_menus_list_menuList}[0]     顶部导航菜单
    Text Of Element Should Contain With Wait    ${locatorB_menus_list_menuList}[1]     页尾菜单

menu005
    [Documentation]      点击新增菜单按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait Until Page Contains Locator    ${locatorB_menusAdd_input_menuName}
    Wait Until Page Contains Locator    ${locatorB_menusAdd_button_addMenuDirectory}

menu007
    [Documentation]      点击系统菜单（顶部导航菜单）右侧的编辑按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menusAdd_link_editorMenu}[0]
    Wait Until Page Contains Text    菜单名称
    Wait Until Page Contains Text    菜单目录结构

menu007.1
    [Documentation]      点击系统菜单（页尾菜单）右侧的编辑按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menusAdd_link_editorMenu}[1]
    Wait Until Page Contains Text    菜单名称
    Wait Until Page Contains Text    菜单目录结构

menu008
    [Documentation]      点击非系统默认菜单右侧的编辑按钮
    [Tags]    P0    threshold
    Add Navigation Menu With Wait    化妆品系列
    Wait And Click Element    ${locatorB_menusAdd_link_editorMenu}[2]
    Value Of Element Should Be Equal With Wait    ${locatorB_menusAdd_input_menuName}    化妆品系列

menu009
    [Documentation]      点击菜单名称
    [Tags]    P0    threshold
    Add Navigation Menu With Wait    减肥产品系列
    Wait And Click Element    ${locatorB_menus_text_menuListName}
    Value Of Element Should Be Equal With Wait    ${locatorB_menusAdd_input_menuName}    减肥产品系列

menu010
    [Documentation]      菜单名称较短时展示
    [Tags]    P0    threshold
    Add Navigation Menu With Wait    n1
    Text Of Element Should Be Equal With Wait    ${locatorB_menus_text_menuListName}    n1

menu022
    [Documentation]      确认删除非系统菜单
    [Tags]    P0    threshold
    Delete All Navigation Menu
    Add Navigation Menu With Wait    非系统菜单删除
    Wait And Click Element Then Confirm    ${locatorB_menusAdd_link_delMenu}
    Wait Until Page Not Contains Locator    ${locatorB_menus_list_menuList}[2]
    Wait Until Page Not Contains Text    非系统菜单删除

menu029
    [Documentation]      新建一个菜单
    [Tags]    P0    threshold
    Add All Navigation Menu With Wait    新增一个菜单    衣服
    Text Of Element Should Be Equal With Wait    ${locatorB_menus_text_menuListName}    新增一个菜单
    Text Of Element Should Be Equal With Wait    ${locatorB_menus_text_levelDirectory}    衣服

menu030
    [Documentation]      新建多个菜单
    [Tags]    P0    threshold
    Add All Navigation Menu With Wait    新增第一个菜单    衣服01
    Add All Navigation Menu With Wait    新增第二个菜单    衣服02
    Add All Navigation Menu With Wait    新增第三个菜单    衣服03
    Go To Navigation Menu Page
    Wait Until Page Contains Text    新增第一个菜单
    Wait Until Page Contains Text    衣服01
    Wait Until Page Contains Text    新增第二个菜单
    Wait Until Page Contains Text    衣服02
    Wait Until Page Contains Text    新增第三个菜单
    Wait Until Page Contains Text    衣服03

menu032
    [Documentation]      修改菜单
    [Tags]    P0    threshold
    Add Navigation Menu With Wait    小吃系列
    Wait And Click Element    ${locatorB_menus_list_menuList}[2]
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     修改后的小吃系列
    Sleep    2
    Sleep And Click Element    ${locatorB_button_save00}
    Sleep    2
    Wait Until Page Not Contains Locator     ${locatorB_button_save00}
    Go To Navigation Menu Page
    Text Of Element Should Be Equal With Wait    ${locatorB_menus_text_menuListName}    修改后的小吃系列

menu035
    [Documentation]      未更改页面内容点击返回按钮
    [Tags]    P2    threshold
    Add Navigation Menu With Wait    小吃系列
    Wait And Click Element    ${locatorB_menus_list_menuList}[2]
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     修改后的小吃系列
    Wait And Click Element    ${locatorB_menusAdd_icon_returnMenu}
    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?
    Sleep    2
    Text Of Element Should Be Equal With Wait      ${locatorB_menus_text_menuListName}    小吃系列

menu049
    [Documentation]      点击‘添加菜单目录’按钮
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait Until Page Contains Locator    ${locatorB_menusAdd_icon_menuDrag}[0]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_input_menuName}[0]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_select_linkPage}[0]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_text_addSecondaryDirectory}[0]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_text_delDirectory}[0]

menu058
    [Documentation]      点击一级目录下的‘添加菜单目录’
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[1]
    Wait And Click Element    ${locatorB_menusAdd_link_addMenuDirectory}
    Wait Until Page Contains Locator    ${locatorB_menusAdd_icon_menuDrag}[1]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_input_menuNavName}[1]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_select_linkPage}[1]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_text_addSecondaryDirectory}[1]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_text_delDirectory}[1]

menu059
    [Documentation]      点击一级菜单目录右侧的’添加‘icon
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     第一个一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[1]
    Wait And Click Element    ${locatorB_menusAdd_text_addSecondaryDirectory}
    Wait Until Page Contains Locator    ${locatorB_menusAdd_icon_menuDrag}[1]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_input_menuNavName}[1]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_select_linkPage}[1]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_text_delDirectory}[1]

menu061
    [Documentation]      链接弹框展示内容正确
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Click Element    ${locatorB_menusAdd_select_linkPage}
    Wait Until Page Contains Text     无
    Wait Until Page Contains Text     首页
    Wait Until Page Contains Text     专辑详情
    Wait Until Page Contains Text     商品详情
    Wait Until Page Contains Text     自定义页面
    Wait Until Page Contains Text     自定义URL

menu064
    [Documentation]      选择跳转链接为无
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[0]
    Text Of Element Should Contain With Wait     ${locatorB_menusAdd_select_linkPageInput}[0]    未选择链接

menu065
    [Documentation]      选择跳转链接为首页
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[1]
    Text Of Element Should Contain With Wait     ${locatorB_menusAdd_select_linkPageInput}[0]    首页

menu066
    [Documentation]      选择跳转链接为专辑详情页
    [Tags]    P0    threshold
    kwcollection.del_all_collections_py
    kwcollection.add_collection_with_pic_py
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[2]
    Long Press Element With Wait    ${locatorB_menusAdd_span_collectionText}
    Wait And Click Element    ${locatorB_menusAdd_button_collectionConfirm}
    Text Of Element Should Contain With Wait     ${locatorB_menusAdd_select_linkPageInput}[0]    专辑详情

menu067
    [Documentation]      选择跳转链接为商品详情页
    [Tags]    P0    threshold
    kwproduct.del_all_products_py
    kwproduct.add_max_product_py
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[3]
    Long Press Element With Wait    ${locatorB_menusAdd_span_collectionText}
    Wait And Click Element    ${locatorB_menusAdd_button_collectionConfirm}
    Text Of Element Should Contain With Wait     ${locatorB_menusAdd_select_linkPageInput}[0]    商品详情

menu068
    [Documentation]      选择跳转链接为自定义页面
    [Tags]    P0    threshold
    Go To Custom Page By Url
    Wait And Click Element    ${locatorB_decoration_custom_button_NewPage}
    Wait And Input Text    ${locatorB_decoration_addPage_input_pageName}    新建页面名称
    Sleep And Click Element    ${locatorB_button_save00}
    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
    Go To Navigation Menu Page
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[4]
    Long Press Element With Wait    ${locatorB_menusAdd_span_collectionText}
    Wait And Click Element    ${locatorB_menusAdd_button_collectionConfirm}
    Text Of Element Should Contain With Wait     ${locatorB_menusAdd_select_linkPageInput}[0]    自定义页面

menu069
    [Documentation]      选择跳转链接为自定义URL
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[5]
    Wait And Input Text    ${locatorB_menusAdd_button_writeUrl}    http://www.xxxxx.com
    Wait And Click Element    ${locatorB_menusAdd_button_collectionConfirm}
    Text Of Element Should Contain With Wait     ${locatorB_menusAdd_select_linkPageInput}[0]    自定义URL







