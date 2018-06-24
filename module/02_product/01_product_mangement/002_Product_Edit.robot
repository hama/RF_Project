*** Settings ***
Documentation     测试商品编辑
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Products Test Case Teardown
Force Tags        Products
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot

*** Variables ***
${locator_products_first_switch}    dom:document.querySelectorAll(".ant-switch")[0]    # 列表第一个商品的上架按钮
${content_products_tips_shelf}    是否上架
${content_products_tips_shelf_ok}    上架成功

*** Test Cases ***
Edit_Title
    [Documentation]    测试已有商品的编辑，保存生效
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locator_products_first}
    # 编辑商品
    ${new_title}=    Evaluate    random.randint(0, 100)    modules=random
    Wait And Input Text    ${locator_products_addTitle}    ${new_title}
    # 验证编辑页面排版
    Wait And Click Element    ${locator_products_save_product}
    Wait Until Page Contains    ${content_products_tips_save_ok}
    Sleep    1
    Go To Products Page
    ${new_title_str}=    Convert To String    ${new_title}
    Page Should Contain    ${new_title_str}

Edit_Price
    [Documentation]    测试已有商品的编辑，保存生效
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locator_products_first}
    # 编辑商品
    ${new_price}=    Evaluate    random.randint(0, 100)    modules=random
    Wait And Input Text    ${locator_products_addPrice}    ${new_price}
    # 验证编辑页面排版
    Wait And Click Element    ${locator_products_save_product}
    Wait Until Page Contains    ${content_products_tips_save_ok}
    Sleep    1
    Go To Products Page
    Wait Until Page Contains Element    ${locator_products_first}
    Wait And Click Element    ${locator_products_first}
    Sleep    3
    ${price}=    Get Value    ${locator_products_addPrice}
    Should Be Equal As Strings    ${new_price}    ${price}

Edit_Sku
    [Documentation]    测试已有商品的编辑，保存生效
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locator_products_first}
    # 编辑商品
    ${new_sku}=    Evaluate    random.randint(0, 100)    modules=random
    Wait And Input Text    ${locator_products_addSku}    ${new_sku}
    # 验证编辑页面排版
    Wait And Click Element    ${locator_products_save_product}
    Wait Until Page Contains    ${content_products_tips_save_ok}
    Sleep    1
    Go To Products Page
    ${new_sku_str}=    Convert To String    ${new_sku}
    Page Should Contain    ${new_sku_str}

Edit_Without_Save
    [Documentation]    测试已有商品的编辑，未保存退出，弹窗提示是否退出，选择 是
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locator_products_first}
    # 记录商品原始名称
    ${old_sku}    Get Text    ${locator_products_addSku}
    # 编辑商品
    ${new_sku}=    Evaluate    random.randint(0, 100)    modules=random
    Wait And Input Text    ${locator_products_addSku}    ${new_sku}
    # 验证编辑页面排版
    Wait And Click Element    ${locator_products_back}
    Alert Should Be Present
    Go To Products Page
    Page Should Contain    ${old_sku}

Edit_Without_Save_Dismmis_Alert
    [Documentation]    测试已有商品的编辑，未保存退出，弹窗提示是否退出，选择 否
    [Tags]    P0
    Sleep    2
    Wait And Click Element    ${locator_products_first}
    # 记录商品原始名称
    ${old_sku}    Get Text    ${locator_products_addSku}
    # 编辑商品
    ${new_sku}    Evaluate    random.randint(0, 100)    modules=random
    Wait And Input Text    ${locator_products_addSku}    ${new_sku}
    # 验证编辑页面排版
    Wait And Click Element    ${locator_products_back}
    Handle Alert    action=DISMISS
    # 正常退出
    Wait And Click Element    ${locator_products_back}
    Alert Should Be Present

Edit Shelf And Drop
    [Documentation]    测试已有商品的上架
    [Tags]    P0
    # 获取第一件商品的标题
    ${title}=    Get Text    dom:document.querySelectorAll("tr td")[2]
    # 将第一件商品进行上架（默认添加的商品是下架的）
    Page Should Contain Element    ${locator_products_first}
    Wait Until Page Contains Element    ${locator_products_first_switch}
    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].click()
    Page Should Contain    是否上架
    Sleep    2
    Click Button    确 定
    Sleep    5
    # 切换到上架商品
    Wait And Click Element    ${locator_products_shelf}
    Page Should Contain    ${title}
    # 再把商品下架
    Page Should Contain Element    ${locator_products_first}
    Wait Until Page Contains Element    ${locator_products_first_switch}
    Execute Javascript    return document.querySelectorAll(".ant-switch")[0].click()
    Page Should Contain    是否下架
    Sleep    2
    Click Button    确 定
    # 切换到上架商品
    Wait And Click Element    ${locator_products_drop}
    Page Should Contain    ${title}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup
    Login With Default User
    Start Ajax Listener
    Add Product
    Sleep    5
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Delete_First_Product
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
