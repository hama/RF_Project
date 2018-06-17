*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Edit_Normal_Page_Without_Check_Product
    #验证商品编辑未选中商品时提示信息
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击编辑商品
    Wait Until Element Is Visible    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Click Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Page Should Contain    请至少选择一个商品

Validate_Edit_Product_Page
    #验证商品编辑页面排版
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll(".ant-table-tbody .ant-checkbox-input")[0]
    #记录下选中的商品名称
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击编辑商品
    Wait Until Element Is Visible    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Click Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    #验证编辑页面排版
    Wait Until Element Is Visible    dom:document.querySelectorAll(".arrow___1QM0w")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".arrow___1QM0w")[0]
    Page Should Contain    商品编辑
    Page Should Contain    当前编辑的选项
    Page Should Contain    ${name}
    Page Should Contain    商品图
    Page Should Contain    商品名称
    Page Should Contain    款式
    Page Should Contain    库存数量
    Page Should Contain    SKU
    Page Should Contain    售价
    Page Should Contain    折扣
    Page Should Contain    原价
    Page Should Contain Element    id:test_save_btn
    #点击返回按钮
    Click Element    dom:document.querySelectorAll(".arrow___1QM0w")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".header_left___3RMen")[0]
    Page Should Contain    商品管理

Edit_Price
    #编辑售价
    Go TO    ${home_page}
    ${input_price}=    Set Variable    4.64
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll(".ant-table-tbody .ant-checkbox-input")[0]
    #点击编辑商品
    Wait Until Element Is Visible    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Click Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Wait Until Element Is Visible    id:2__4__price
    Input Text    id:2__4__price    ${input_price}
    Click Element    id:test_save_btn
    Sleep    3
    #返回商品管理主页
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Sleep    3
    #选中一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll(".ant-table-tbody .ant-checkbox-input")[0]
    #点击编辑商品
    Wait Until Element Is Visible    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Click Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Wait Until Element Is Visible    id:2__4__price
    ${price}    Execute Javascript    return document.getElementById("2__4__price").value
    Should Be True    ${price}==${input_price}

Edit_Price_Sku_Quantity
    #编辑售价，库存和sku
    Go TO    ${home_page}
    ${input_price}=    Set Variable    3.64
    ${input_inventory_quantity}=    Set Variable    40
    ${input_sku}=    Set Variable    test
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #选中一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll(".ant-table-tbody .ant-checkbox-input")[0]
    #点击编辑商品
    Wait Until Element Is Visible    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Click Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    #修改售价
    Wait Until Element Is Visible    id:2__4__price
    Input Text    id:2__4__price    ${input_price}
    #修改库存
    Wait Until Element Is Visible    id:2__4__inventory_quantity
    Input Text    id:2__4__inventory_quantity    ${input_inventory_quantity}
    #修改sku
    Wait Until Element Is Visible    id:2__4__sku
    Input Text    id:2__4__sku    ${input_sku}
    Click Element    id:test_save_btn
    Sleep    3
    #返回商品管理主页
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Sleep    3
    #选中一个商品
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-tbody .ant-checkbox-input")[0]
    Click Element    dom:document.querySelectorAll(".ant-table-tbody .ant-checkbox-input")[0]
    #点击编辑商品
    Wait Until Element Is Visible    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Click Element    dom:document.querySelectorAll(".editBtn___2yB79")[0]
    Wait Until Element Is Visible    id:2__4__price
    #验证售价
    ${price}    Execute Javascript    return document.getElementById("2__4__price").value
    Should Be True    ${price}==${input_price}
    #验证库存
    ${inventory_quantity}    Execute Javascript    return document.getElementById("2__4__inventory_quantity").value
    Should Be True    ${inventory_quantity}==${input_inventory_quantity}
    #验证sku
    ${sku}    Execute Javascript    return document.getElementById("2__4__sku").value
    Should Be Equal As Strings    ${sku}    ${input_sku}

Edit_Product_Without_Save
    #修改商品库存未保存
    Go TO    ${home_page}
    ${input_inventory_quantity}=    Set Variable    50
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    #先获取原来的库存
    ${inventory_quantity}    Get Text    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[3]
    #点击第一个商品进行编辑
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-input-number-input")[3]
    #修改库存
    Input Text    dom:document.querySelectorAll(".ant-input-number-input")[3]    ${input_inventory_quantity}
    #未保存就点击返回按钮
    Click Element    dom:document.querySelectorAll(".arrow___1QM0w")[0]
    Alert Should Be Present    页面上有未保存内容，是否确定退出?
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[3]
    #获取现在的库存
    ${now_inventory_quantity}    Get Text    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[3]
    Should Be Equal As Strings    ${inventory_quantity}    ${now_inventory_quantity}

Edit_Product_Without_Save_Dismmis_Alert
    #取消退出保存
    Go TO    ${home_page}
    ${input_inventory_quantity}=    Set Variable    50
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-row")[0]
    #点击第一个商品进行编辑
    Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-input-number-input")[3]
    #修改库存
    Input Text    dom:document.querySelectorAll(".ant-input-number-input")[3]    ${input_inventory_quantity}
    #未保存就点击返回按钮
    Click Element    dom:document.querySelectorAll(".arrow___1QM0w")[0]
    Dismiss Alert    False
