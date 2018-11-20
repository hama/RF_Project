*** Settings ***
Documentation     测试商品列表
Suite Setup       Product Management Suite Setup Add Two Products
Suite Teardown    Product Management Common Suite Teardown
Test Setup        Go To Product Management Page
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
products001
    [Documentation]    验证商品的排列方式正确
    [Tags]    P0    threshold
    Select All Product Tag
    ${item1_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
    ${item2_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[1]
    ${result}    lib_utils.compare_time_py    ${item1_createtime}    ${item2_createtime}
    ${status} =    Evaluate    ${result}>0
    Should Be Equal    '${status}'    'True'

products002
    [Documentation]    验证展示的商品数量正确
    [Tags]    P0    threshold
    Select All Product Tag
    ${total_record}    Wait And Get Text    ${locatorB_page_text_totalRecord}
    ${size}    lib_utils.searchStrs_py    ${total_record}
    Should Be Equal As Integers    ${size}    2


products006
    [Documentation]    验证商品有库存时，库存展示正确
    [Tags]    P0    threshold
    Select All Product Tag
	${inventoryQuantity}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductInventoryQuantity}
	Should Be equal    '${inventoryQuantity}'    '99件'


products008
    [Documentation]    验证上下架状态展示正确，上架商品上架开关开启，下架商品，下架开关关闭
    [Tags]    P0
    Select All Product Tag
    ${attr0} =    Wait And Get Element Attribute    ${locatorB_productsMgmt_switch_listDiscontinued}[0]    class
    ${attr1} =    Wait And Get Element Attribute    ${locatorB_productsMgmt_switch_listLaunched}[0]    class
    Should Be Equal    ${attr0}    ant-switch
    Should Be Equal    ${attr1}    ant-switch ant-switch-checked


products017
    [Documentation]    验证点击预览icon正确跳转到卡片C端
    [Tags]    P0    threshold
    Select All Product Tag
    Wait And Click Element    ${locatorB_productsMgmt_icon_listPreview}[0]
	Focus On New Window
    Wait Until Page Contains Locator    ${locatorC_products_icon_cart}

products021
    [Documentation]    验证展示的商品只包含上架商品
    [Tags]    P0    threshold
    Select Launched Product Tag
    @{list1}    Wait And Get Items List From Locator    ${locatorB_productsMgmt_switch_listLaunched}
    :FOR    ${var}    IN    @{list1}
    \    Wait Until Page Contains Locator    ${var}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listDiscontinued}    ${0}

products023
    [Documentation]    验证展示的商品只包含下架商品
    [Tags]    P0    threshold
    Select Discontinued Product Tag
    @{list1}    Wait And Get Items List From Locator    ${locatorB_productsMgmt_switch_listDiscontinued}
    :FOR    ${var}    IN    @{list1}
    \    Wait Until Page Contains Locator    ${var}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listLaunched}    ${0}
