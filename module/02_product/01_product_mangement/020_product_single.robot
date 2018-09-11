*** Settings ***
Documentation     构造单个商品测试
Suite Setup       Products Single Suite Setup
Suite Teardown    Close Test Suite Browser
Test Setup        Go To Products Page
Test Teardown     Products Single Case Teardown
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_products.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_products.robot

*** Test Cases ***
products004
    [Documentation]    上架商品图片展示商品主图
    [Tags]    P0
    add_launched_product_py
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	${attr}    Get Element Attribute    ${locatorB_productsMgmt_image_thumbnails}    class
	Should Be equal    '${attr}'    'center___1nHSZ'

products005
    [Documentation]    下架商品且未上传商品图，商品图片展示默认图
    [Tags]    P0
    add_discontinued_product_py
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	${attr}    Get Element Attribute    ${locatorB_productsMgmt_image_thumbnails}    class
	Should Be equal    '${attr}'    ''

products007
    [Documentation]    验证商品无库存时展示正确
    [Tags]    P0
    add_min_product_py
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	${inventoryQuantity}    Wait And Get Text    ${locatorB_productsMgmt_text_inventoryQuantity}
	Should Be equal    '${inventoryQuantity}'    '0件'

products009
    [Documentation]    验证商品的创建时间正确
    [Tags]    P0
    add_min_product_py
    ${time1}    Get Time
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	${createTime}    Wait And Get Text    ${locatorB_productsMgmt_text_createTime}
	Should Be Equal    '${createTime}'    '${time1}'





