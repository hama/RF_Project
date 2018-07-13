*** Settings ***
Documentation     测试商品批量添加标签
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

*** Test Cases ***
products040
    [Documentation]    验证商品批量添加标签时是否显示正常
    [Tags]    P0
    Click_First_Product_And_Click_Batch_Menu
    #选择添加标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]
    #验证是否有输入框
    Page Should Contain Element    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]
    Go TO    ${home_page}

products042
    [Documentation]    商品批量添加标签
    [Tags]    P0
    ${input_tag}=    Set Variable    bbb
    #添加商品标签
    Click_First_Product_And_Click_Batch_Menu
    #选择添加标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]    alert
    #输入标签
    Set Focus To Element    alert
    Wait And Click Element    alert
    Wait And Input Text    dom:document.querySelectorAll(".ant-select-search__field")[1]    ${input_tag}
    Press Key    dom:document.querySelectorAll(".ant-select-search__field")[1]    \\13
    #检验输入框中是否含有刚刚输入的标签
    Page Should Contain Element    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    #点击空白处，取消下拉选项
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-title")[0]
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".middle_btn___2ExQc")[0]
    #提示添加成功
    #Page Should Contain    添加成功
    #点击进入商品详情查看该商品是否含有该标签
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    Element Should Contain    dom:document.querySelectorAll(".ant-select-selection__rendered")[0]    ${input_tag}
    Go TO    ${home_page}

products043
    [Documentation]    商品批量添加现已有的标签
    [Tags]    P0
    #验证添加已有的标签
    Click_First_Product_And_Click_Batch_Menu
    #选择添加标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-content")[0]
    #记录下点击的标签内容
    ${tag}    Get Text    dom:document.querySelectorAll(".ant-tag")[0]
    Wait And Click Element    dom:document.querySelectorAll(".ant-tag")[0]
    #点击空白处，取消下拉选项
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-title")[0]
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".middle_btn___2ExQc")[0]
    Sleep    1
    #点击进入商品详情查看该商品是否含有该标签
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    Page Should Contain    ${tag}
    Go TO    ${home_page}

products044
    [Documentation]    商品批量添加现已有的标签和新的标签
    [Tags]    P0
    #添加现有的和新的标签
    ${input_tag}=    Set Variable    ccc
    Click_First_Product_And_Click_Batch_Menu
    #选择添加标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]
    #点击现有的标签
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-content")[0]
    #记录下点击的标签内容
    ${already_tag}    Get Text    dom:document.querySelectorAll(".ant-tag")[0]
    Wait And Click Element    dom:document.querySelectorAll(".ant-tag")[0]
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]    alert
    #输入标签
    Set Focus To Element    alert
    Wait And Click Element    alert
    Wait And Input Text    dom:document.querySelectorAll(".ant-select-search__field")[1]    ${input_tag}
    Press Key    dom:document.querySelectorAll(".ant-select-search__field")[1]    \\13
    #检验输入框中是否含有刚刚输入的标签
    Page Should Contain Element    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    #点击标题框以失去焦点
    Execute Javascript    document.querySelectorAll(".ant-modal-mask")[0].click()
    #点击空白处，取消下拉选项
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-title")[0]
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".middle_btn___2ExQc")[0]
    #提示添加成功
    #Page Should Contain    添加成功
    #点击进入商品详情查看该商品是否含有该标签
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-select-selection__choice__content")[0]
    #显示标签数据
    Page Should Contain    ${input_tag}
    Page Should Contain    ${already_tag}
    Go TO    ${home_page}

products047
    [Documentation]    商品批量取消添加标签
    [Tags]    P0
    #取消添加标签
    Click_First_Product_And_Click_Batch_Menu
    #选择添加标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[3]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__rendered")[3]
    #点击取消按钮
    Wait And Click Element    dom:document.querySelectorAll(".default_btn___2wyTS")[0]
    #返回界面
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Go TO    ${home_page}

products049
    [Documentation]    商品批量移除标签
    [Tags]    P0
    #移除标签
    Click_First_Product_And_Click_Batch_Menu
    #选择移除标签
    Assign Id To Element    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[4]    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-modal-content")[0]
    #包含已有的标签
    #选择要移除的标签
    Wait And Click Element    dom:document.querySelectorAll(".ant-tag-checkable")[0]
    #记录要移除的标签名称
    ${name}    Get Text    dom:document.querySelectorAll(".ant-tag-checkable")[0]
    #确定
    Wait And Click Element    dom:document.querySelectorAll(".ant-btn-primary")[0]
    #点击进入商品详情查看该商品是否含有该标签
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0]
    Wait Until Page Contains Element    dom:document.querySelectorAll(".label___1jnO-")[2]
    Page Should Not Contain    ${name}
    Go TO    ${home_page}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup
    Login With Default User
    Start Ajax Listener
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
