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
    add_empty_quantity_product_py
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	${inventoryQuantity}    Wait And Get Text    ${locatorB_productsMgmt_text_inventoryQuantity}
	Should Be Equal    '${inventoryQuantity}'    '0件'

products009
    [Documentation]    验证商品的创建时间正确
    [Tags]    P0
    ${time1}    Get Time
    add_min_product_py
    ${time2}    Get Time
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	${createTime}    Wait And Get Text    ${locatorB_productsMgmt_text_createTime}
	${status}    Evaluate    '${createTime}'=='${time1}' or '${createTime}'=='${time2}'
	Should Be True    ${status}

products011
    [Documentation]    无SKU时，SKU展示空白
    [Tags]    P0
    add_min_product_py
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	${sku}    Wait And Get Text    ${locatorB_productsMgmt_text_sku}
	Should Be Equal    '${sku}'    ''

products014
    [Documentation]    验证点击‘全部’无结果
    [Tags]    P0
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	Wait Until Page Not Contains Locator    ${locatorB_productsMgmt_icon_preview}

products018
    [Documentation]    验证点击删除按钮可删除商品
    [Tags]    P0
    add_min_product_py
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	Wait And Click Element    ${locatorB_productsMgmt_icon_delete}
	Wait And Click Element    ${locatorB_products_button_confirm}
	Wait Until Page Not Contains Locator    ${locatorB_productsMgmt_icon_preview}

products019
    [Documentation]    验证可成功删除商品
    [Tags]    P0
    add_min_product_py
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	Wait And Click Element    ${locatorB_productsMgmt_icon_delete}
	Wait And Click Element    ${locatorB_products_button_confirm}
	Wait Until Page Not Contains Locator    ${locatorB_productsMgmt_icon_preview}

products020
    [Documentation]    验证可取消删除商品
    [Tags]    P0
    add_min_product_py
    Reload Page
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
	Wait And Click Element    ${locatorB_productsMgmt_icon_delete}
	Wait And Click Element    ${locatorB_products_button_cancel}
	Wait Until Page Contains Locator    ${locatorB_productsMgmt_icon_preview}


products021.1
    [Documentation]    验证展示的上架商品排序正确
    [Tags]    P0
    Wait And Click Element    ${locatorB_productsMgmt_button_launched}
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Wait Until Page Contains Locator    ${locatorC_products_logo}

products021.2
    [Documentation]    验证展示的上架商品数量正确
    [Tags]    P0
    Wait And Click Element    ${locatorB_productsMgmt_button_launched}
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Wait Until Page Contains Locator    ${locatorC_products_logo}

products022
    [Documentation]    验证点击‘上架’无结果
    [Tags]    P0
    add_min_product_py
    Wait And Click Element    ${locatorB_productsMgmt_button_launched}
    Wait Until Page Not Contains Locator    ${locatorB_productsMgmt_icon_preview}
    Wait Until Page Not Contains Locator    ${locatorC_products_logo}






