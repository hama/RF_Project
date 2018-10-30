*** Settings ***
Documentation     菜单导航
Suite Setup       navigation Suite Setup
Suite Teardown    navigation Suite Teardown
Test Setup        navigation Test Setup
Test Teardown     Teardown Test Case
Force Tags        navigation_menu
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_navmenu.robot
Resource          ../../../resources/variable/var_navmenu.robot


*** Test Cases ***

navigation_menu_001
    [Documentation]      菜单导航入口
    [Tags]    P0    threshold
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
    Wait Until Page Contains Locator    ${locatorB_menus_button_addMenuDirectory}

navigation_menu_007
    [Documentation]      点击系统菜单右侧的编辑按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_menus_link_editorMenu}[0]
    Wait Until Page Contains Text    菜单目录结构

navigation_menu_008
    [Documentation]      点击系统菜单右侧的编辑按钮
    [Tags]    P0    threshold
    Wait Until Page Contains Locator    ${locatorB_menus_button_addMenu}
    Wait And Input Text    ${locatorB_menus_input_menuName}     化妆品系列
    Wait And Click Element    ${locatorB_button_save00}










