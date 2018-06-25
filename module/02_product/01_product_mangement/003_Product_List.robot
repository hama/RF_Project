*** Settings ***
Documentation     测试商品列表
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
${locator_page_total_record}    dom:document.querySelectorAll(".ant-pagination-total-text")[0]

*** Test Cases ***
Test_Products_List_Data
    [Documentation]    测试商品列表的展示（数量/标题/库存/SKU/浏览量/销量/上架状态/创建时间）
    [Tags]    P0
    #获取每页多少条数据
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-pagination-total-text")[0]
    ${size}    Get Text    dom:document.querySelectorAll(".ant-pagination-total-text")[0]
    ${total_record}    searchStrs    ${size}
    # 然后遍历校验列表数据是否一致
    : FOR    ${index}    IN RANGE    ${total_record}
    \    ${table_row}=    Evaluate    int(${index}) + 2
    \    ${title}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].title;
    \    ${sku}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].variants[0].sku;
    \    ${incoming}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].variants[0].incoming.toString();
    \    ${sales}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].variants[0].sales.toString();
    \    ${status}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].status;
    \    ${create_time}=    Execute JavaScript    return responseMap.get("${api_products_list}").data.products[${index}].create_time;
    \    Table Cell Should Contain    tag:table    ${table_row}    3    ${title}
    \    Table Cell Should Contain    tag:table    ${table_row}    5    ${sku}
    \    Table Cell Should Contain    tag:table    ${table_row}    10    ${create_time}
    \    Run Keyword If    ${status}==0    Should Be Not Checked    ${index}
    \    Run Keyword If    ${status}==1    Should Be Checked    ${index}

Validate_Tab
    [Documentation]    验证商品模块标签
    [Tags]    P0
    ${class_should_be}=    Set Variable    ant-radio-button-wrapper ant-radio-button-wrapper-checked
    Wait Until Element Is Visible    ${locator_products_all}
    ${class}    Execute Javascript    return document.querySelectorAll(".ant-radio-button-wrapper")[0].getAttribute('class')
    Should Be Equal As Strings    ${class_should_be}    ${class}

Validate_Table_Head
    [Documentation]    验证商品管理表头的信息显示
    [Tags]    P0
    #验证表头显示
    Execute Javascript    return document.querySelectorAll(".edit_head___UidlR")[0].scrollIntoView()
    Sleep    1
    Wait And Click Element    ${locator_products_editTableHead}
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-body")[0]
    #点击已经选中的，将他们全部取消选中
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox-checked").length
    : FOR    ${index}    IN RANGE    ${count}
    \    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox-checked")[0]
    Sleep    1
    #再将所有复选框选中
    ${cancel}    Execute Javascript    return document.querySelectorAll(".ant-modal-body .ant-checkbox").length
    : FOR    ${i}    IN RANGE    ${cancel}
    \    Click Element    dom:document.querySelectorAll(".ant-modal-body .ant-checkbox")[${i}]
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".ok___1LXqc")[0]
    #添加完所有表头之后再进行表头信息的检验
    Page Should Contain Element    dom:document.querySelectorAll(".ant-table-thead tr th input")[0]
    Page Should Contain    商品图片
    Page Should Contain    商品名称
    Page Should Contain    库存
    Page Should Contain    SKU
    Page Should Contain    浏览量
    Page Should Contain    销量
    Page Should Contain    上架
    Page Should Contain    操作
    Page Should Contain    创建时间
    Page Should Contain Element    dom:document.querySelectorAll(".preview___37DtU")[0]
    Page Should Contain Element    ${locator_products_deleteIcon}
    #图片
    Page Should Contain Element    dom:document.querySelectorAll(".center___1nHSZ")[0]
    #库存
    #在这里修改情况，验证第一个商品是否有库存
    ${should_quantity}    getFirstProductQuantity
    ${show_quantity}    Get Text    dom:document.querySelectorAll(".ant-table-tbody tr")[0].getElementsByTagName("td")[3]
    #如果库存为0
    Run Keyword If    ${should_quantity}==0    compare_quantity    ${show_quantity}
    Run Keyword If    ${should_quantity}>0    compare_quantity2    ${show_quantity}    ${should_quantity}

Validate_Product_Status
    [Documentation]    验证显示的所有商品状态是否显示正确
    [Tags]    P0
    #验证表头显示
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody .ant-table-row")[0]
    #获取当前页展示的商品数量
    ${count}    Execute Javascript    return document.querySelectorAll(".ant-table-tbody .ant-table-row").length
    #判断当前页所有商品状态
    : FOR    ${i}    IN RANGE    ${count}
    \    ${status}    getProductStatus    ${i}
    \    Run Keyword If    ${status}==0    Should Be Not Checked    ${i}
    \    Run Keyword If    ${status}==1    Should Be Checked    ${i}

Validate_Product_Sku
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

Validate_Upload_Alert
    [Documentation]    验证商品上传弹窗
    [Tags]    P0
    #验证商品上传弹窗
    Wait And Click Element    ${locator_products_upload_product}
    Sleep    5
    Execute Javascript    return document.querySelectorAll(".ant-modal-close")[0].click()
    #Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-close")[0]
    #Click Element    dom:document.querySelectorAll(".ant-modal-close")[0]
    Go TO    ${home_page}

Validate_Delete_Product
    [Documentation]    验证删除商品
    [Tags]    P0
    #删除商品
    #获取要删除的商品名称
    Wait Until Element Is Visible    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击删除按钮
    Wait And Click Element    ${locator_products_deleteIcon}
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    Page Should Contain    确定删除吗？
    #确定
    Wait And Click Button    ${locator_products_delBtn}
    #等待页面刷新数据
    Sleep    1
    #页面不应该包含该商品名称
    #存在多件商品名称相同，这里的判断失效
    #Page Should Not Contain    ${name}

Validate_Cancel_Delete_Product
    [Documentation]    取消删除商品
    [Tags]    P0
    #取消删除商品
    #获取要删除的商品名称
    Wait Until Element Is Visible    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${name}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    #点击删除按钮
    Wait And Click Element    ${locator_products_deleteIcon}
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    Page Should Contain    确定删除吗？
    #取消
    Wait And Click Element    ${locator_products_cancelDelete}
    #数据无变化
    Page Should Contain    ${name}

*** Keywords ***
compare_quantity
    [Arguments]    ${show_quantity}
    Should Be Equal As Strings    ${show_quantity}    N/A

compare_quantity2
    [Arguments]    ${show_quantity}    ${should_quantity}
    ${show_quantity}    searchStr    ${show_quantity}
    Should Be True    ${show_quantity}==${should_quantity}

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
    Delete_First_Product
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
