*** Settings ***
Documentation     测试商品列表
Suite Setup       Product Management Suite Setup Add Two Products
Suite Teardown    Product Management Common Suite Teardown
Test Setup        Go To Product Management Page
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_product_management.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_product_management.robot
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py

*** Test Cases ***
products001
    [Documentation]    验证商品的排列方式正确
    [Tags]    P0
    Select All Product Tag
    ${item1_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
    ${item2_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[1]
    ${result}    lib_utils.compare_time_py    ${item1_createtime}    ${item2_createtime}
    Should Be Equal    ${result}    gt

products002
    [Documentation]    验证展示的商品数量正确
    [Tags]    P0
    Select All Product Tag
    ${total_record}    Wait And Get Text    ${locatorB_page_text_totalRecord}
    ${size}    lib_utils.searchStrs_py    ${total_record}
    Should Be Equal As Integers    ${size}    2


products003
    [Documentation]    验证列表中展示的商品数据正确
    [Tags]    P0
    Select All Product Tag
    # 添加完所有表头之后再进行表头信息的检验
    Wait Until Page Contains Locator    dom:document.querySelectorAll('th[class="ant-table-selection-column"]')[0]
    Wait Until Page Contains Text    商品图片
    Wait Until Page Contains Text    商品名称
    Wait Until Page Contains Text    库存
    Wait Until Page Contains Text    SKU
    Wait Until Page Contains Text    浏览量
    Wait Until Page Contains Text    销量
    Wait Until Page Contains Text    上架
    Wait Until Page Contains Text    操作
    Wait Until Page Contains Text    创建时间
    # 检测商品信息
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_icon_listPreview}[0]
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_icon_listDelete}[0]
    # 图片
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_image_firstProductThumbnails}
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_button_editTableHead}

products006
    [Documentation]    验证商品有库存时，库存展示正确
    [Tags]    P0
    Select All Product Tag
	${inventoryQuantity}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductInventoryQuantity}
	Should Be equal    '${inventoryQuantity}'    '99件'


products008
    [Documentation]    验证上下架状态展示正确，上架商品上架开关开启，下架商品，下架开关关闭
    [Tags]    P0
    Select All Product Tag
    ${attr0} =    Get Element Attribute    dom:document.querySelectorAll('span[class~="ant-switch"]')[0]    class
    ${attr1} =    Get Element Attribute    dom:document.querySelectorAll('span[class~="ant-switch"]')[1]    class
    Should Be Equal    ${attr0}    ant-switch
    Should Be Equal    ${attr1}    ant-switch ant-switch-checked

products010
    [Documentation]    验证显示的所有商品的sku是否显示正确
    [Tags]    P0
    #判断当前页所有商品状态
    ${sku0}    Wait And Get Text    dom:document.querySelectorAll(".ant-table-tbody tr")[0].querySelectorAll("td")[4].querySelectorAll("span")[0]
    ${sku1}    Wait And Get Text    dom:document.querySelectorAll(".ant-table-tbody tr")[1].querySelectorAll("td")[4].querySelectorAll("span")[0]
    Should Be Equal As Strings    ${sku0}    autotest_sku
    Should Be Equal As Strings    ${sku1}    autotest_sku

products017
    [Documentation]    验证点击预览icon正确跳转到卡片C端
    [Tags]    P0
    Select All Product Tag
    Wait And Click Element    ${locatorB_productsMgmt_icon_listPreview}[0]
	Focus On New Window
    Wait Until Page Contains Locator    ${locatorC_products_logo}

products021
    [Documentation]    验证展示的商品只包含上架商品
    [Tags]    P0
    Select Launched Product Tag
    @{list1}    Wait And Get List Items    ${locatorB_productsMgmt_switch_listLaunched}
    :FOR    ${var}    IN    @{list1}
    \    Wait Until Page Contains Locator    ${var}
    Length Should Be Equal    ${locatorB_productsMgmt_switch_listDiscontinued}    ${0}

products023
    [Documentation]    验证展示的商品只包含下架商品
    [Tags]    P0
    Select Discontinued Product Tag
    @{list1}    Wait And Get List Items    ${locatorB_productsMgmt_switch_listDiscontinued}
    :FOR    ${var}    IN    @{list1}
    \    Wait Until Page Contains Locator    ${var}
    Length Should Be Equal    ${locatorB_productsMgmt_switch_listLaunched}    ${0}








#products015
#    [Documentation]    验证商品上传弹窗
#    [Tags]    P0
#    #验证商品上传弹窗
#    Wait And Click Element    ${locatorB_productsMgmt_icon_uploadProduct}
#    Sleep    5
#    Execute Javascript    return document.querySelectorAll(".ant-modal-close")[0].click()
#    #Wait Until Page Contains Locator    dom:document.querySelectorAll(".ant-modal-close")[0]
#    #Click Element    dom:document.querySelectorAll(".ant-modal-close")[0]
#    Go TO    ${home_page}
#
#products016
#    [Documentation]    验证删除商品
#    [Tags]    P0
#    #删除商品
#    #获取要删除的商品名称
#    Wait Until Element Is Visible    ${locatorB_productsMgmt_text_firstProductName}
#    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
#    #点击删除按钮
#    Wait And Click Element    ${locatorB_productsMgmt_icon_listDelete}[0]
#    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
#    Page Should Contain    确定删除吗？
#    #确定
#    Wait And Click Element    ${locatorB_popUps_button_middle}
#    #等待页面刷新数据
#    Sleep    1
#    #页面不应该包含该商品名称
#    #存在多件商品名称相同，这里的判断失效
#    #Page Should Not Contain    ${name}
#
#products017
#    [Documentation]    取消删除商品
#    [Tags]    P0
#    #取消删除商品
#    #获取要删除的商品名称
#    Wait Until Element Is Visible    ${locatorB_productsMgmt_text_firstProductName}
#    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
#    #点击删除按钮
#    Wait And Click Element    ${locatorB_productsMgmt_icon_listDelete}[0]
#    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
#    Page Should Contain    确定删除吗？
#    #取消
#    Wait And Click Element    ${locatorB_products_button_cancel}
#    #数据无变化
#    Page Should Contain    ${name}

