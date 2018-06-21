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
    [Documentation]    验证商品批量添加标签时是否显示正常
    [Tags]    P0
    #验证添加标签页面
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
    #选择添加标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]
    #验证是否有输入框
    Page Should Contain Element    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]

Add_Tag
    [Documentation]    商品批量添加标签
    [Tags]    P0
    #添加商品标签
    Go TO    ${home_page}
    ${input_tag}=    Set Variable    bbb
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择添加标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]    alert
    #输入标签
    Set Focus To Element    alert
    Click Element    alert
    Input Text    dom:document.querySelectorAll(".ant-select-search__field")[1]    ${input_tag}
    Press Key    dom:document.querySelectorAll(".ant-select-search__field")[1]    \\13
    #检验输入框中是否含有刚刚输入的标签
    Page Should Contain Element    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".ant-btn-primary")[0]
    #提示添加成功
    #Page Should Contain    添加成功
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    #点击进入商品详情查看该商品是否含有该标签
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    #获取现有的标签与之对比
    ${tag}    Get Text    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    Should Be Equal As Strings    ${tag}    ${input_tag}

Add_Already_Tag
    #-----------------------------------------------------有问题-----------------------------------------------------#
    [Documentation]    商品批量添加现已有的标签
    [Tags]    P0
    #验证添加已有的标签
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
    #选择添加标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-content")[0]
    #记录下点击的标签内容
    ${tag}    Get Text    dom:document.querySelectorAll(".ant-tag")[0]
    Click Element    dom:document.querySelectorAll(".ant-tag")[0]
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".ant-btn-primary")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Sleep    1
    #点击进入商品详情查看该商品是否含有该标签
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    Page Should Contain    ${tag}

Add_New_And_Already_Tag
    [Documentation]    商品批量添加现已有的标签和新的标签
    [Tags]    P0
    #添加现有的和新的标签
    Go TO    ${home_page}
    ${input_tag}=    Set Variable    ccc
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择添加标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]
    #点击现有的标签
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-content")[0]
    #记录下点击的标签内容
    ${already_tag}    Get Text    dom:document.querySelectorAll(".ant-tag")[0]
    Click Element    dom:document.querySelectorAll(".ant-tag")[0]
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]    alert
    #输入标签
    Set Focus To Element    alert
    Click Element    alert
    Input Text    dom:document.querySelectorAll(".ant-select-search__field")[1]    ${input_tag}
    Press Key    dom:document.querySelectorAll(".ant-select-search__field")[1]    \\13
    #检验输入框中是否含有刚刚输入的标签
    Page Should Contain Element    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    #点击标题框以失去焦点
    Execute Javascript    document.querySelectorAll(".ant-modal-mask")[0].click()
    #点击确定按钮
    Click Element    dom:document.querySelectorAll(".ant-btn-primary")[0]
    #提示添加成功
    #Page Should Contain    添加成功
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    #点击进入商品详情查看该商品是否含有该标签
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    #显示标签数据
    Page Should Contain    ${input_tag}
    Page Should Contain    ${already_tag}

Cancel_Add_Tag
    [Documentation]    商品批量取消添加标签
    [Tags]    P0
    #取消添加标签
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
    #选择添加标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]
    #点击取消按钮
    Click Element    dom:document.querySelectorAll(".ant-btn")[4]
    #返回界面
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]

Remove_Tag_Page
    [Documentation]    验证商品批量移除标签是否显示正常
    [Tags]    P0
    #验证移除标签显示正确
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
    #选择移除标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[4]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #验证选中的第一个商品已有的标签显示正确
    ${should_count}    getProductTagsLength    0
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-tag-checkable").length
    Should Be True    ${should_count}==${count}

Remove_Tag
    [Documentation]    商品批量移除标签
    [Tags]    P0
    #移除标签
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
    #选择移除标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[4]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #包含已有的标签
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-tag-checkable")[0]
    #选择要移除的标签
    Click Element    dom:document.querySelectorAll(".ant-tag-checkable")[0]
    #记录要移除的标签名称
    ${name}    Get Text    dom:document.querySelectorAll(".ant-tag-checkable")[0]
    #确定
    Click Element    dom:document.querySelectorAll(".ant-btn-primary")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    #点击进入商品详情查看该商品是否含有该标签
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".label___1jnO-")[2]
    Page Should Not Contain    ${name}
