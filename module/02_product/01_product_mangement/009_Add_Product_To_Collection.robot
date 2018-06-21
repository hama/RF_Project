*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Validate_Normal_Page
    [Documentation]    验证商品批量添加专辑显示正常
    [Tags]    P0
    #验证添加到商品专辑排版正确
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择添加到专辑
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #搜索栏
    Page Should Contain Element    dom:document.querySelectorAll(".ant-input")[5]
    #复选框
    Page Should Contain Element    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0].querySelectorAll("td")[0]
    #可搜索专辑名
    Page Should Contain Element    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0].querySelectorAll("td")[1]
    #专辑时间
    Page Should Contain Element    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0].querySelectorAll("td")[2]
    #确定按钮
    Page Should Contain Element    dom:document.querySelectorAll(".confirm___2lMF-")[0]

Add_Product_To_Collection
    [Documentation]    验证商品批量添加专辑
    [Tags]    P0
    #添加商品到专辑
    #选中第几个专辑
    ${which}=    Set Variable    0
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #记录下操作的商品名称
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择添加到专辑
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #选中专辑
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[${which}]
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".confirm___2lMF-")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #去商品专辑模块检查
    Wait Until Element Is Visible    dom:document.querySelectorAll(".menu_item___3VgTh")[1].querySelectorAll("a")[0]
    Click Element    dom:document.querySelectorAll(".menu_item___3VgTh")[1].querySelectorAll("a")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    #进入专辑详情查看是否存在刚刚添加的商品
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".shop_name___3rsn4")[1]
    Page Should Contain    ${name}

Search_Collection
    [Documentation]    验证商品批量添加专辑弹窗中，专辑搜索功能显示正常
    [Tags]    P0
    #验证商品专辑搜索
    #选择搜索第几个专辑的名称
    ${which}=    Set Variable    0
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择添加到专辑
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #获取要搜索的专辑名称
    ${collection_name}    Get Text    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0].querySelectorAll("td")[1]
    #搜索框输入搜索
    Input Text    dom:document.querySelectorAll(".ant-input")[5]    ${collection_name}
    Sleep    1
    Element Should Contain    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0].querySelectorAll("td")[1]    ${collection_name}

Add_Product_To_Search_Collection
    [Documentation]    商品批量添加到搜索出来的专辑
    [Tags]    P0
    #验证搜索出来的专辑可正常添加商品
    #选中第几个专辑
    ${which}=    Set Variable    0
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #记录下操作的商品名称
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择添加到专辑
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #先搜索符合条件的专辑
    #获取要搜索的专辑名称
    ${collection_name}    Get Text    dom:document.querySelectorAll(".ant-modal-content .ant-table-row")[0].querySelectorAll("td")[1]
    #搜索框输入搜索
    Input Text    dom:document.querySelectorAll(".ant-input")[5]    ${collection_name}
    Sleep    1
    #选中专辑
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[${which}]
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".confirm___2lMF-")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #去商品专辑模块检查
    Wait Until Element Is Visible    dom:document.querySelectorAll(".menu_item___3VgTh")[1].querySelectorAll("a")[0]
    Click Element    dom:document.querySelectorAll(".menu_item___3VgTh")[1].querySelectorAll("a")[0]
    Sleep    1
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    #进入专辑详情查看是否存在刚刚添加的商品
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".shop_name___3rsn4")[1]
    Page Should Contain    ${name}

Add_Product_To_Search_Collection_By_Id
    [Documentation]    验证商品成功批量添加到通过专辑编号搜索出来的专辑中
    [Tags]    P0
    #通过专辑编号搜索专辑
    #选中第几个专辑
    ${which}=    Set Variable    0
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #记录下操作的商品名称
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择添加到专辑
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #先搜索符合条件的专辑
    #搜索框输入专辑编号搜索
    Input Text    dom:document.querySelectorAll(".ant-input")[5]    1
    Sleep    1
    #选中专辑
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[${which}]
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".confirm___2lMF-")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #去商品专辑模块检查
    Wait Until Element Is Visible    dom:document.querySelectorAll(".menu_item___3VgTh")[1].querySelectorAll("a")[0]
    Click Element    dom:document.querySelectorAll(".menu_item___3VgTh")[1].querySelectorAll("a")[0]
    Sleep    1
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    #进入专辑详情查看是否存在刚刚添加的商品
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".shop_name___3rsn4")[1]
    Page Should Contain    ${name}

No_Select_Collection
    [Documentation]    验证商品批量添加专辑时未选择专辑
    [Tags]    P0
    #未选择商品专辑
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择添加到专辑
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".confirm___2lMF-")[0]

Cancel_Add_Product_To_Collection
    [Documentation]    验证商品批量取消添加专辑
    [Tags]    P0
    #取消将商品加入专辑
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择添加到专辑
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击取消按钮
    Click Element    dom:document.querySelectorAll(".ant-modal-close-x")[0]

Validate_No_Collection
    [Documentation]    验证商品批量添加专辑时，无专辑数据
    [Tags]    P0
    #验证无专辑数据时
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择添加到专辑
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[5]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #提示专辑暂无数据
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-placeholder")[0]
    ${title}    GetText    dom:document.querySelectorAll(".ant-table-placeholder")[0]
    Should Be Equal As Strings    ${title}    暂无数据
