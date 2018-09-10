*** Settings ***
Documentation     测试商品批量添加到专辑
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_products.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_products.robot

*** Test Cases ***
products051
    [Documentation]    验证商品批量添加专辑显示正常
    [Tags]    P0
    #验证添加到商品专辑排版正确
    Click_First_Product_And_Click_Batch_Menu
    #选择添加到专辑
    Assign Id To Element    ${locatorB_productsMgmt_select_addtoCategory}    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    ${locatorB_productsCategory_popUps_firstCategory}
    Sleep    5
    #搜索栏
    Page Should Contain Element    dom:document.querySelectorAll(".ant-input")[5]
    #复选框
    Page Should Contain Element    ${locatorB_productsCategory_popUps_firstCategory}.querySelectorAll("td")[0]
    #可搜索专辑名
    Page Should Contain Element    ${locatorB_productsCategory_popUps_firstCategory}.querySelectorAll("td")[1]
    #专辑时间
    Page Should Contain Element    ${locatorB_productsCategory_popUps_firstCategory}.querySelectorAll("td")[2]
    #确定按钮
    Page Should Contain Element    dom:document.querySelectorAll(".confirm___2lMF-")[0]
    #关闭弹出框
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-close")[0]
    Go TO    ${home_page}

products052
    [Documentation]    验证商品批量添加专辑
    [Tags]    P0
    #添加商品到专辑
    #选中第几个专辑
    ${which}=    Set Variable    0
    #选中第一个商品
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_checkbox_chooseFirstProducet}
    Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProducet}
    #记录下操作的商品名称
    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
    #点击批量操作菜单
    Wait And Click Element    ${locatorB_productsMgmt_select_batchOperations}
    #选择添加到专辑
    Assign Id To Element    ${locatorB_productsMgmt_select_addtoCategory}    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    ${locatorB_productsCategory_popUps_firstCategory}
    Sleep    5
    #选中专辑
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[${which}]
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".confirm___2lMF-")[0]
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_checkbox_chooseFirstProducet}
    #去商品专辑模块检查
    Wait And Click Element    ${locatorB_product_collection}
    #进入专辑详情查看是否存在刚刚添加的商品
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".shop_name___3rsn4")[1]
    Page Should Contain    ${name}
    Go TO    ${home_page}

products053
    [Documentation]    验证商品批量添加专辑弹窗中，专辑搜索功能显示正常
    [Tags]    P0
    #验证商品专辑搜索
    #选择搜索第几个专辑的名称
    ${which}=    Set Variable    0
    Click_First_Product_And_Click_Batch_Menu
    #选择添加到专辑
    Assign Id To Element    ${locatorB_productsMgmt_select_addtoCategory}    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    ${locatorB_productsCategory_popUps_firstCategory}
    Sleep    5
    #获取要搜索的专辑名称
    ${collection_name}    Get Text    ${locatorB_productsCategory_popUps_firstCategory}.querySelectorAll("td")[1]
    #搜索框输入搜索
    Wait And Input Text    dom:document.querySelectorAll(".ant-input")[5]    ${collection_name}
    Sleep    5
    Element Should Contain    ${locatorB_productsCategory_popUps_firstCategory}.querySelectorAll("td")[1]    ${collection_name}
    #关闭弹出框
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-close")[0]
    Go TO    ${home_page}

products054
    [Documentation]    商品批量添加到搜索出来的专辑
    [Tags]    P0
    #验证搜索出来的专辑可正常添加商品
    #选中第几个专辑
    ${which}=    Set Variable    0
    #选中第一个商品
    Sleep    2
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_checkbox_chooseFirstProducet}
    Select Checkbox    ${locatorB_productsMgmt_checkbox_chooseFirstProducet}
    #记录下操作的商品名称
    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
    #点击批量操作菜单
    Wait And Click Element    ${locatorB_productsMgmt_select_batchOperations}
    #选择添加到专辑
    Assign Id To Element    ${locatorB_productsMgmt_select_addtoCategory}    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
    Sleep    5
    #先搜索符合条件的专辑
    #获取要搜索的专辑名称
    ${collection_name}    Get Text    ${locatorB_productsCategory_popUps_firstCategory}.querySelectorAll("td")[1]
    #搜索框输入搜索
    Wait And Input Text    dom:document.querySelectorAll(".ant-input")[5]    ${collection_name}
    Sleep    5
    #选中专辑
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[${which}]
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".confirm___2lMF-")[0]
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_checkbox_chooseFirstProducet}
    #去商品专辑模块检查
    Wait And Click Element    ${locatorB_product_collection}
    #进入专辑详情查看是否存在刚刚添加的商品
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".shop_name___3rsn4")[1]
    Page Should Contain    ${name}
    Go TO    ${home_page}

products055
    [Documentation]    验证商品成功批量添加到通过专辑编号搜索出来的专辑中
    [Tags]    P0
    #通过专辑编号搜索专辑
    #选中第几个专辑
    ${which}=    Set Variable    0
    #获取选中的专辑编号
    ${collection_id}    getCollectionId_py    ${which}
    #选中第一个商品
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_checkbox_chooseFirstProducet}
    Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProducet}
    #记录下操作的商品名称
    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
    #点击批量操作菜单
    Wait And Click Element    ${locatorB_productsMgmt_select_batchOperations}
    #选择添加到专辑
    Assign Id To Element    ${locatorB_productsMgmt_select_addtoCategory}    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    ${locatorB_productsCategory_popUps_firstCategory}
    Sleep    5
    #先搜索符合条件的专辑
    #搜索框输入专辑编号搜索
    Wait And Input Text    dom:document.querySelectorAll(".ant-input")[5]    ${collection_id}
    Sleep    5
    #选中专辑
    Select Checkbox    dom:document.querySelectorAll(".ant-modal-content .ant-checkbox-input")[${which}]
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".confirm___2lMF-")[0]
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_checkbox_chooseFirstProducet}
    #去商品专辑模块检查
    Wait And Click Element    ${locatorB_product_collection}
    #进入专辑详情查看是否存在刚刚添加的商品
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".shop_name___3rsn4")[1]
    Page Should Contain    ${name}
    Go TO    ${home_page}

products057
    [Documentation]    验证商品批量取消添加专辑
    [Tags]    P0
    #取消将商品加入专辑
    Click_First_Product_And_Click_Batch_Menu
    #选择添加到专辑
    Assign Id To Element    ${locatorB_productsMgmt_select_addtoCategory}    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    ${locatorB_productsCategory_popUps_firstCategory}
    Sleep    2
    #点击取消按钮
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-close-x")[0]
    Go TO    ${home_page}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,添加商品，专辑
    Login With Default User
    Start Ajax Listener
    Go TO    ${home_page}
    Sleep    5
    Add_Collection
    Sleep    5
    Go To Products Page
    Sleep    5
    Add_Collection
    Sleep    5
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品，专辑
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

