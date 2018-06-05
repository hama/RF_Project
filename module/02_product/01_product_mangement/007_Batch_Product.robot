*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot    # import login keyword
Resource          ../../../resources/browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Validate_Batch_Opreation
    #验证批量操作菜单栏正确
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-arrow")[1]
    Click Element    dom:document.querySelectorAll(".ant-select-arrow")[1]
    Page Should Contain    上架
    Page Should Contain    下架
    Page Should Contain    删除商品
    Page Should Contain    添加标签
    Page Should Contain    移除标签
    Page Should Contain    添加到专辑
    Page Should Contain    从专辑移除

Validate_Batch_Product_Without_Product
    #验证不勾选商品点击批量操作菜单
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择操作
    Set Focus To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]
    Mouse Down    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]
    Mouse Up    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]
    Page Should Contain    请至少选择一个商品

Product_Up
    #上架一个商品
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
    #选择上架
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[0]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击确定
    Click Element    dom:document.querySelectorAll(".ant-btn-primary")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #比较class
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    Should Be Equal As Strings    ${class}    ant-switch ant-switch-checked

Product_Up_Cancel
    #取消上架一个商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #获取第一个商品class
    ${should_class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    #选中第一个商品
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择上架
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[0]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击取消
    Click Element    dom:document.querySelectorAll(".cancel___Nh0a2")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #比较class
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    Should Be Equal As Strings    ${class}    ${should_class}

Product_Down
    #下架一个商品
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
    #选择下架
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击确定
    Click Element    dom:document.querySelectorAll(".ant-btn-primary")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #比较class
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    Should Be Equal As Strings    ${class}    ant-switch

Product_Down_Cancel
    #取消下架一个商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #获取第一个商品class
    ${should_class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    #选中第一个商品
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择下架
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击取消
    Click Element    dom:document.querySelectorAll(".cancel___Nh0a2")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #比较class
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
    Should Be Equal As Strings    ${class}    ${should_class}

Product_Delete
    #商品删除
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #获取此商品的名称
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择删除商品
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[2]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击确定
    Click Element    id:test_delete_modal_sure_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    Sleep    3
    #验证当前页面不应该含有该商品名称
    Page Should Not Contain    ${name}

Product_Delete_Cancel
    #取消商品删除
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中第一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #获取此商品的名称
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击批量操作菜单
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]
    #选择删除商品
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[2]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #点击取消
    Click Element    id:test_delete_modal_cancel_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
    #验证当前页面应该含有该商品名称
    Page Should Contain    ${name}
