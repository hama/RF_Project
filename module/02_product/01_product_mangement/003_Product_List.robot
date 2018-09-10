*** Settings ***
Documentation     测试商品列表
Suite Setup       Products Suite Setup
Suite Teardown    Close Test Suite Browser
Test Setup        Go To Products Page
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_products.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_products.robot

*** Test Cases ***
products001
    [Documentation]    验证商品的排列方式正确
    [Tags]    P0
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
    ${item1_createtime}=    Wait And Get Text    dom:document.querySelectorAll('[class="vendor___2VuW9"]')[1]
    ${item2_createtime}=    Wait And Get Text    dom:document.querySelectorAll('[class="vendor___2VuW9"]')[2]
    ${result}    compare_time_py    ${item1_createtime}    ${item2_createtime}
    Should Be Equal    ${result}    gt

products002
    [Documentation]    验证展示的商品数量正确
    [Tags]    P0
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
    ${total_record}    Wait And Get Text    ${locatorB_page_text_totalRecord}
    ${size}    searchStrs_py    ${total_record}
    Should Be Equal As Integers    ${size}    2


products003
    [Documentation]    验证列表中展示的商品数据正确
    [Tags]    P0
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
    Wait And Click Element    ${locatorB_productsMgmt_button_editTableHead}
    @{list}    Get List Items    document.querySelectorAll('.ant-modal-body span[class="ant-checkbox"]')
    :FOR    ${i}    IN    @{list}
    \    Wait And Click Element    ${i}
    Wait And Click Element    dom:document.querySelectorAll('button[class*="middle_btn"]')[0]
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
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_icon_preview}
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_icon_delete}
    # 图片
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_image_center}
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_button_editTableHead}



#products001
#    [Documentation]    验证商品的排列方式正确
#    [Tags]    P0
#    #获取每页多少条数据
#    Wait Until Element Is Visible    ${locatorB_page_text_totalRecord}
#    ${size}    Get Text    ${locatorB_page_text_totalRecord}
#    ${total_record}    searchStrs_py    ${size}
#    # 然后遍历校验列表数据是否一致
#    :FOR    ${index}    IN RANGE    ${total_record}
#    \    ${table_row}=    Evaluate    int(${index}) + 2
#    \    ${title}=    Execute JavaScript    return responseMap.get("${apiB_products_list}").data.products[${index}].title;
#    \    ${sku}=    Execute JavaScript    return responseMap.get("${apiB_products_list}").data.products[${index}].variants[0].sku;
#    \    ${incoming}=    Execute JavaScript    return responseMap.get("${apiB_products_list}").data.products[${index}].variants[0].incoming.toString();
#    \    ${sales}=    Execute JavaScript    return responseMap.get("${apiB_products_list}").data.products[${index}].variants[0].sales.toString();
#    \    ${status}=    Execute JavaScript    return responseMap.get("${apiB_products_list}").data.products[${index}].status;
#    \    ${create_time}=    Execute JavaScript    return responseMap.get("${apiB_products_list}").data.products[${index}].create_time;
#    \    Table Cell Should Contain    tag:table    ${table_row}    3    ${title}
#    \    Table Cell Should Contain    tag:table    ${table_row}    5    ${sku}
#    \    Table Cell Should Contain    tag:table    ${table_row}    10    ${create_time}
#    \    Run Keyword If    ${status}==0    Should Be Not Checked    ${index}
#    \    Run Keyword If    ${status}==1    Should Be Checked    ${index}

Validate_Tab
    [Documentation]    验证商品模块标签
    [Tags]    P0
    ${class_should_be}=    Set Variable    ant-radio-button-wrapper ant-radio-button-wrapper-checked
    Wait Until Element Is Visible    ${locatorB_productsMgmt_button_all}
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-radio-button-wrapper")[0].getAttribute('class')
    Should Be Equal As Strings    ${class_should_be}    ${class}

#products003
#    [Documentation]    验证商品管理表头的信息显示
#    [Tags]    P0
#    #验证表头显示
#    Execute Javascript    return document.querySelectorAll(".edit_head___UidlR")[0].scrollIntoView()
#    Sleep    1
#    Wait And Click Element    ${locatorB_productsMgmt_button_editTableHead}
#    Wait Until Element Is Visible    ${locatorB_products_popUps_body}
#    #点击已经选中的，将他们全部取消选中
#    ${count}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox-checked").length
#    :FOR    ${index}    IN RANGE    ${count}
#    \    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]
#    Sleep    1
#    #再将所有复选框选中
#    ${cancel}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox").length
#    :FOR    ${i}    IN RANGE    ${cancel}
#    \    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox")[${i}]
#    #点击确定按钮
#    Wait And Click Element    dom:document.querySelectorAll(".ok___1LXqc")[0]
#    #添加完所有表头之后再进行表头信息的检验
#    Page Should Contain Element    dom:document.querySelectorAll(".ant-table-thead tr th input")[0]
#    Page Should Contain    商品图片
#    Page Should Contain    商品名称
#    Page Should Contain    库存
#    Page Should Contain    SKU
#    Page Should Contain    浏览量
#    Page Should Contain    销量
#    Page Should Contain    上架
#    Page Should Contain    操作
#    Page Should Contain    创建时间
#    Page Should Contain Element    ${locatorB_productsMgmt_icon_preview}
#    Page Should Contain Element    ${locatorB_productsMgmt_icon_delete}
#    #图片
#    Page Should Contain Element    ${locatorB_productsMgmt_image_center}
#    #库存
#    #在这里修改情况，验证第一个商品是否有库存
#    ${should_quantity}    getFirstProductQuantity
#    Log    ${should_quantity}
#    ${show_quantity}    Get Text    dom:document.querySelectorAll(".ant-table-tbody tr")[0].getElementsByTagName("td")[3]
#    #如果库存为0
#    Run Keyword If    ${should_quantity}==0    compare_quantity    ${show_quantity}
#    Run Keyword If    ${should_quantity}>0    compare_quantity2    ${show_quantity}    ${should_quantity}

products008
    [Documentation]    验证上下架状态展示正确，上架商品上架开关开启，下架商品，下架开关关闭
    [Tags]    P0
    #验证表头显示
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody .ant-table-row")[0]
    #获取当前页展示的商品数量
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-table-tbody .ant-table-row").length
    #判断当前页所有商品状态
    :FOR    ${i}    IN RANGE    ${count}
    \    ${status}    getProductStatus    ${i}
    \    Run Keyword If    ${status}==0    Should Be Not Checked    ${i}
    \    Run Keyword If    ${status}==1    Should Be Checked    ${i}

#products007
#    [Documentation]    验证显示的所有商品状态是否显示正确
#    [Tags]    P0
#    #验证表头显示
#    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody .ant-table-row")[0]
#    #获取当前页展示的商品数量
#    ${count}    Execute Javascript    return document.querySelectorAll(".ant-table-tbody .ant-table-row").length
#    #判断当前页所有商品状态
#    : FOR    ${i}    IN RANGE    ${count}
#    \    ${status}    getProductStatus    ${i}
#    \    Run Keyword If    ${status}==0    Should Be Not Checked    ${i}
#    \    Run Keyword If    ${status}==1    Should Be Checked    ${i}

products009
    [Documentation]    验证显示的所有商品的sku是否显示正确
    [Tags]    P0
    #验证表头显示
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody .ant-table-row")[0]
    #获取当前页展示的商品数量
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-table-tbody .ant-table-row").length
    #判断当前页所有商品状态
    : FOR    ${i}    IN RANGE    ${count}
    \    ${should_sku}    getProductSku    ${i}
    \    ${sku}    Get Text    dom:document.querySelectorAll(".ant-table-tbody tr")[${i}].querySelectorAll("td")[4].querySelectorAll("span")[0]
    \    Run Keyword If    ${should_sku}!=-1    Should Be Equal As Strings    ${should_sku}    ${sku}
    \    Run Keyword If    ${should_sku}==-1    Should Be True    '${sku}'==''

products015
    [Documentation]    验证商品上传弹窗
    [Tags]    P0
    #验证商品上传弹窗
    Wait And Click Element    ${locatorB_productsMgmt_icon_uploadProduct}
    Sleep    5
    Execute Javascript    return document.querySelectorAll(".ant-modal-close")[0].click()
    #Wait Until Page Contains Locator    dom:document.querySelectorAll(".ant-modal-close")[0]
    #Click Element    dom:document.querySelectorAll(".ant-modal-close")[0]
    Go TO    ${home_page}

products016
    [Documentation]    验证删除商品
    [Tags]    P0
    #删除商品
    #获取要删除的商品名称
    Wait Until Element Is Visible    ${locatorB_productsMgmt_text_firstProductName}
    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
    #点击删除按钮
    Wait And Click Element    ${locatorB_productsMgmt_icon_delete}
    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
    Page Should Contain    确定删除吗？
    #确定
    Wait And Click Element    ${locatorB_popUps_button_middle}
    #等待页面刷新数据
    Sleep    1
    #页面不应该包含该商品名称
    #存在多件商品名称相同，这里的判断失效
    #Page Should Not Contain    ${name}

products017
    [Documentation]    取消删除商品
    [Tags]    P0
    #取消删除商品
    #获取要删除的商品名称
    Wait Until Element Is Visible    ${locatorB_productsMgmt_text_firstProductName}
    ${name}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
    #点击删除按钮
    Wait And Click Element    ${locatorB_productsMgmt_icon_delete}
    Wait Until Element Is Visible    ${locatorB_products_popUps_content}
    Page Should Contain    确定删除吗？
    #取消
    Wait And Click Element    ${locatorB_products_button_cancel}
    #数据无变化
    Page Should Contain    ${name}

*** Keywords ***

Should Be Not Checked
    [Arguments]    ${i}
    #获取按钮类名
    ${class_name}    Execute Javascript    return document.getElementsByClassName("ant-switch")[${i}].getAttribute("class")
    Should Be Equal As Strings    ${class_name}    ant-switch

Should Be Checked
    [Arguments]    ${i}
    #获取按钮类名
    ${class_name}    Execute Javascript    return document.getElementsByClassName("ant-switch")[${i}].getAttribute("class")
    Should Be Equal As Strings    ${class_name}    ant-switch ant-switch-checked
