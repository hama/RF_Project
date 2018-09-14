*** Settings ***
Documentation     测试商品批量上下架
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_product_management.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_product_management.robot

*** Test Cases ***

#products034
#    [Documentation]    商品上架,第一个商品必须要有图片
#    [Tags]    P0
#    #上架一个商品
#    Click_First_Product_And_Click_Batch_Menu
#    #选择上架
#    Assign Id To Element    ${locatorB_productsMgmt_select_launch}    btn
#    Set Focus To Element    btn
#    Mouse Down    btn
#    Mouse Up    btn
#    #弹出框
#    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
#    #点击确定
#    Wait And Click Element    ${locatorB_products_button_confirm}
#    Sleep    3
#    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
#    #比较class
#    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
#    Should Be Equal As Strings    ${class}    ant-switch ant-switch-checked
#    Go TO    ${home_page}
#
#products035
#    [Documentation]    商品取消上架
#    [Tags]    P0
#    #取消上架一个商品
#    #获取第一个商品class
#    ${should_class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
#    Click_First_Product_And_Click_Batch_Menu
#    #选择上架
#    Assign Id To Element    ${locatorB_productsMgmt_select_launch}    btn
#    Set Focus To Element    btn
#    Mouse Down    btn
#    Mouse Up    btn
#    #弹出框
#    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
#    #点击取消
#    Click Element    dom:document.querySelectorAll(".cancel___Nh0a2")[0]
#    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
#    #比较class
#    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
#    Should Be Equal As Strings    ${class}    ${should_class}
#    Go TO    ${home_page}
#
#products036
#    [Documentation]    商品下架
#    [Tags]    P0
#    #下架一个商品
#    Click_First_Product_And_Click_Batch_Menu
#    #选择下架
#    Assign Id To Element    ${locatorB_productsMgmt_select_discontinue}    btn
#    Set Focus To Element    btn
#    Mouse Down    btn
#    Mouse Up    btn
#    #弹出框
#    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
#    #点击确定
#    Wait And Click Element    ${locatorB_products_button_confirm}
#    Sleep    3
#    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
#    #比较class
#    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
#    Should Be Equal As Strings    ${class}    ant-switch
#    Go TO    ${home_page}
#
#products037
#    [Documentation]    取消商品下架
#    [Tags]    P0
#    #取消下架一个商品
#    #获取第一个商品class
#    ${should_class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
#    Click_First_Product_And_Click_Batch_Menu
#    #选择下架
#    Assign Id To Element    ${locatorB_productsMgmt_select_discontinue}    btn
#    Set Focus To Element    btn
#    Mouse Down    btn
#    Mouse Up    btn
#    #弹出框
#    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
#    #点击取消
#    Wait And Click Element    dom:document.querySelectorAll(".cancel___Nh0a2")[0]
#    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
#    #比较class
#    ${class}    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].getAttribute("class")
#    Should Be Equal As Strings    ${class}    ${should_class}
#    Go TO    ${home_page}
#
#products039
#    [Documentation]    取消删除商品
#    [Tags]    P0
#    #取消商品删除
#    #选中第一个商品
#    Wait Until Page Contains Locator    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
#    Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
#    #获取此商品的名称
#    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
#    #点击批量操作菜单
#    Wait And Click Element    ${locatorB_productsMgmt_select_batchOperations}
#    #选择删除商品
#    Assign Id To Element    ${locatorB_productsMgmt_select_batchDel}    btn
#    Set Focus To Element    btn
#    Mouse Down    btn
#    Mouse Up    btn
#    #弹出框
#    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
#    #点击取消
#    Wait And Click Element    ${locatorB_products_button_cancel}
#    #Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
#    #验证当前页面应该含有该商品名称
#    #Page Should Contain    ${name}
#    Go TO    ${home_page}
#
#products038
#    [Documentation]    删除商品
#    [Tags]    P0
#    #店铺中含有多个名称相同的商品，影响case运行!!!!!!!!!!!!!!!!!!!!
#    #商品删除
#    #选中第一个商品
#    Wait Until Page Contains Locator    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
#    Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
#    #获取此商品的名称
#    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
#    #点击批量操作菜单
#    Wait And Click Element    ${locatorB_productsMgmt_select_batchOperations}
#    #选择删除商品
#    Assign Id To Element    ${locatorB_productsMgmt_select_batchDel}    btn
#    Set Focus To Element    btn
#    Mouse Down    btn
#    Mouse Up    btn
#    #弹出框
#    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
#    #点击确定
#    Wait And Click Element    ${locatorB_popUps_button_middle}
#    #Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-switch")[0]
#    #Sleep    3
#    #验证当前页面不应该含有该商品名称
#    #Page Should Not Contain    ${name}
#    Go TO    ${home_page}
#
