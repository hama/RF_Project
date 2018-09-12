*** Settings ***
Documentation     测试商品编辑
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
products023
    [Documentation]    测试已有商品的编辑，保存生效
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
    # 编辑商品
    ${new_title}=    Evaluate    random.randint(0, 100)    modules=random
    Wait And Input Text    ${locatorB_productsNew_input_addTitle}    ${new_title}
    # 验证编辑页面排版
    Wait And Click Element    ${locatorB_products_button_confirm}
    Wait Until Page Contains    ${contentB_products_tips_save_ok}
    Sleep    1
    Go To Products Page
    Sleep    5
    ${new_title_str}=    Convert To String    ${new_title}
    Page Should Contain    ${new_title_str}

products025
    [Documentation]    测试已有商品的编辑，保存生效
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
    # 编辑商品
    ${new_price}=    Evaluate    random.randint(0, 100)    modules=random
    Wait And Input Text    ${locatorB_productsNew_input_addPrice}    ${new_price}
    # 验证编辑页面排版
    Wait And Click Element    ${locatorB_products_button_confirm}
    Wait Until Page Contains    ${contentB_products_tips_save_ok}
    Sleep    1
    Go To Products Page
    Sleep    5
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
    Wait And Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
    Sleep    3
    ${price}=    Get Value    ${locatorB_productsNew_input_addPrice}
    Should Be Equal As Strings    ${new_price}    ${price}

products026
    [Documentation]    测试已有商品的编辑，保存生效
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
    # 编辑商品
    ${new_sku}=    Evaluate    random.randint(0, 100)    modules=random
    Wait And Input Text    ${locatorB_productsNew_input_addSku}    ${new_sku}
    # 验证编辑页面排版
    Wait And Click Element    ${locatorB_products_button_confirm}
    Wait Until Page Contains    ${contentB_products_tips_save_ok}
    Sleep    1
    Go To Products Page
    Sleep    5
    ${new_sku_str}=    Convert To String    ${new_sku}
    Page Should Contain    ${new_sku_str}

products029
    [Documentation]    测试已有商品的编辑，未保存退出，弹窗提示是否退出，选择 是
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
    # 记录商品原始名称
    ${old_sku}    Get Text    ${locatorB_productsNew_input_addSku}
    # 编辑商品
    ${new_sku}=    Evaluate    random.randint(0, 100)    modules=random
    Wait And Input Text    ${locatorB_productsNew_input_addSku}    ${new_sku}
    # 验证编辑页面排版
    Wait And Click Element    ${locatorB_productsNew_button_back}
    Sleep    5
    Alert Should Be Present
    Go To Products Page
    Sleep    5
    Page Should Contain    ${old_sku}

products031
    [Documentation]    测试已有商品的编辑，未保存退出，弹窗提示是否退出，选择 否
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}
    # 记录商品原始名称
    ${old_sku}    Get Text    ${locatorB_productsNew_input_addSku}
    # 编辑商品
    ${new_sku}    Evaluate    random.randint(0, 100)    modules=random
    Wait And Input Text    ${locatorB_productsNew_input_addSku}    ${new_sku}
    # 验证编辑页面排版
    Wait And Click Element    ${locatorB_productsNew_button_back}
    Sleep    5
    Handle Alert    action=DISMISS
    # 正常退出
    Wait And Click Element    ${locatorB_productsNew_button_back}
    Sleep    5
    Alert Should Be Present

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup
    Login With Default User
    Start Ajax Listener
    Add Product
    Sleep    5
    Add Product
    Sleep    5
    Add Product
    Sleep    5
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

