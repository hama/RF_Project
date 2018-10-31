*** Settings ***
Documentation     菜单导航
Suite Setup       Navigation Suite Setup
Suite Teardown    Navigation Suite Teardown
Test Setup        Navigation Test Setup
Test Teardown     Teardown Test Case
Force Tags        navigation_menu
Resource          ../../../resources/keywords/kw_common.robot



*** Test Cases ***

navigation_menu_001
    [Documentation]      菜单导航入 口
    [Tags]    P0    threshold
    Wait Until Page Contains Text    菜单导航
    Wait Until Page Contains Locator    ${locatorB_menus_button_addMenu}

navigation_menu_003
    [Documentation]      默认的菜单导航展示
    [Tags]    P0    threshold
    Wait Until Page Contains Text    你可以在此设置菜单，装修店铺顶部导航、页尾时，可手动关联对应的菜单
    Wait Until Page Contains Locator    ${locatorB_menus_button_addMenu}
    Text Of Element Should Contain With Wait    ${locatorB_menus_list_menuList}[0]     顶部导航菜单
    Text Of Element Should Contain With Wait    ${locatorB_menus_list_menuList}[1]     页尾菜单

navigation_menu_004
    [Documentation]      新增菜单按钮的展示
    [Tags]    P0    threshold
    Wait Until Page Contains Locator    ${locatorB_menus_button_addMenu}
    Text Of Element Should Contain With Wait     ${locatorB_menus_button_addMenu}     新增菜单

navigation_menu_005
    [Documentation]      新增菜单按钮的展示
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait Until Page Contains Locator    ${locatorB_menusAdd_button_addMenuDirectory}

navigation_menu_007
    [Documentation]      点击系统菜单右侧的编辑按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menusAdd_link_editorMenu}[0]
    Wait Until Page Contains Text    菜单目录结构

navigation_menu_008
    [Documentation]      点击非系统默认菜单右侧的编辑按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     化妆品系列
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    保存成功
    Go To Navigation Menu Page
    Wait And Click Element    ${locatorB_menusAdd_link_editorMenu}[2]
    ${menuName}     Wait And Get Value     ${locatorB_menusAdd_input_menuName}
    Should Be Equal      ${menuName}      化妆品系列


navigation_menu_009
    [Documentation]      点击菜单名称
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     减肥产品系列
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    保存成功
    Go To Navigation Menu Page
    Wait And Click Element    ${locatorB_menus_text_menuListName}
    ${menuName}     Wait And Get Value     ${locatorB_menusAdd_input_menuName}
    Should Be Equal      ${menuName}      减肥产品系列

navigation_menu_010
    [Documentation]      菜单名称较短时展示
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     小吃系列
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    保存成功
    Go To Navigation Menu Page
    ${menuName}     Wait And Get Text    ${locatorB_menus_text_menuListName}
    Should Be Equal    ${menuName}     小吃系列

navigation_menu_022
    [Documentation]      确认删除非系统菜单
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     菜单删除系列
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    保存成功
    Go To Navigation Menu Page
    Wait And Click Element Then Confirm    ${locatorB_menusAdd_link_delMenu}
    Wait Until Page Not Contains Locator    ${locatorB_menus_list_menuList}[2]

navigation_menu_029
    [Documentation]      新建一个菜单
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     新增一个菜单
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}    衣服
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    保存成功
    Go To Navigation Menu Page
    ${menuName}     Wait And Get Text    ${locatorB_menus_text_menuListName}
    Should Be Equal    ${menuName}     新增一个菜单
    ${menuDirectory}     Wait And Get Text    ${locatorB_menus_text_levelDirectory}
    Should Be Equal    ${menuDirectory}     衣服

navigation_menu_030
    [Documentation]      新建多个菜单
    [Tags]    P0    threshold
    :FOR    ${i}     IN RANGE   1   3    1
     \   Wait And Click Element    ${locatorB_menus_button_addMenu}
     \   Wait And Input Text    ${locatorB_menusAdd_input_menuName}     新增${i}个菜单
     \   Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
     \   Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}    衣服${i}
     \   Wait And Click Element    ${locatorB_button_save00}
     \   Go To Navigation Menu Page
    Go To Navigation Menu Page
    ${menuName}     Wait And Get Text    ${locatorB_menus_text_menuListName}
    Should Be Equal    ${menuName}     新增2个菜单
    ${menuName}     Wait And Get Text    ${locatorB_menus_text_menuListName1}
    Should Be Equal    ${menuName}     新增1个菜单

navigation_menu_032
    [Documentation]      保存菜单
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     小吃系列
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    保存成功
    Go To Navigation Menu Page
    Wait And Click Element    ${locatorB_menus_list_menuList}[2]
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     ${empty}
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     修改后的小吃系列
    Wait And Click Element    ${locatorB_button_save00}
    Go To Navigation Menu Page
    ${menuName}     Wait And Get Text    ${locatorB_menus_text_menuListName}
    Should Be Equal    ${menuName}     修改后的小吃系列

navigation_menu_035
    [Documentation]      未更改页面内容点击返回按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Input Text    ${locatorB_menusAdd_input_menuName}     小吃系列返回效果
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    保存成功
    Go To Navigation Menu Page
    Wait And Click Element    ${locatorB_menus_list_menuList}[2]
    Wait And Click Element    ${locatorB_menusAdd_icon_returnMenu}
    Text Of Element Should Contain With Wait      ${locatorB_menus_list_menuList}[2]    小吃系列返回效果

navigation_menu_049
    [Documentation]      点击‘添加菜单目录’按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait Until Page Contains Locator    ${locatorB_menusAdd_icon_menuDrag}[0]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_input_menuName}[0]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_select_linkPage}[0]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_text_addSecondaryDirectory}[0]
    Wait Until Page Contains Locator    ${locatorB_menusAdd_text_delDirectory}[0]

navigation_menu_058
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

navigation_menu_059
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

navigation_menu_061
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

navigation_menu_064
    [Documentation]      选择跳转链接为无
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[0]
    Text Of Element Should Contain With Wait     ${locatorB_menusAdd_select_linkPageInput}[0]    未选择链接

navigation_menu_065
    [Documentation]      选择跳转链接为首页
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[1]
    Text Of Element Should Contain With Wait     ${locatorB_menusAdd_select_linkPageInput}[0]    首页

navigation_menu_066
    [Documentation]      选择跳转链接为专辑详情页
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[2]
    Wait Until Page Contains Text    专辑选择

navigation_menu_067
    [Documentation]      选择跳转链接为商品详情页
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[3]
    Wait Until Page Contains Text     选择商品

navigation_menu_068
    [Documentation]      选择跳转链接为自定义页面
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[4]
    Wait Until Page Contains Text     页面选择

navigation_menu_069
    [Documentation]      选择跳转链接为自定义URL
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_button_addMenu}
    Wait And Click Element    ${locatorB_menusAdd_button_addMenuDirectory}
    Wait And Input Text    ${locatorB_menusAdd_input_menuNavName}[0]     一级菜单目录
    Wait And Select From List By Clicking    ${locatorB_menusAdd_select_linkPage}[0]     ${locatorB_menusAdd_select_listLinkLi}[5]
    Wait Until Page Contains Text     自定义链接







