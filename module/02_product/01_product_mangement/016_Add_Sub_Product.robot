*** Settings ***
Documentation     测试商品批量从专辑移除
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
products097
    [Documentation]    添加子商品已有的选项
    [Tags]    P0
    #添加一个已有的选项
    ${title}    Set Variable    ceshi1
    #只填写必要参数以添加商品
    #点击添加商品按钮
    Wait And Click Element    ${locator_products_add_product}
    #标题
    Wait And Input Text    ${locator_products_addTitle}    ${title}
    #添加选项
    Wait And Click Element    id:test_variant_setting_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Mouse Over    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Wait And Click Element    dom:document.querySelectorAll(".ant-dropdown-menu-item")[1]
    #添加多个种类
    Wait And Input Text    id:option_values_0    red
    #回车保存
    Press Key    id:option_values_0    \\13
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    Go TO    ${home_page}

products098
    [Documentation]    添加子商品自定义的选项
    [Tags]    P0
    #添加一个自定义的选项
    ${title}    Set Variable    ceshi1
    #只填写必要参数以添加商品
    #点击添加商品按钮
    Wait And Click Element    ${locator_products_add_product}
    #标题
    Wait And Input Text    ${locator_products_addTitle}    ${title}
    #添加选项
    Wait And Click Element    id:test_variant_setting_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Mouse Over    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Sleep    5
    #点击自定义选项
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-dropdown-menu-item")[0]
    Set Focus To Element    dom:document.querySelectorAll(".ant-dropdown-menu-item")[0]
    Wait And Click Element    dom:document.querySelectorAll(".ant-dropdown-menu-item")[0]
    #输入选项名和款式细节
    Wait And Input Text    id:option_0    test
    Wait And Input Text    id:option_values_0    test-1
    #按enter添加细节
    Press Key    id:option_values_0    \\13
    #点击保存
    Sleep    3
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    Go TO    ${home_page}

products099
    [Documentation]    添加商品时，添加商品seo信息
    [Tags]    P0
    #编辑seo
    ${title}    Set Variable    ceshi1
    #只填写必要参数以添加商品
    #点击添加商品按钮
    Wait And Click Element    ${locator_products_add_product}
    #标题
    Wait And Input Text    ${locator_products_addTitle}    ${title}
    #售价
    Wait And Input Text    ${locator_products_addPrice}    100
    #原价
    Wait And Input Text    ${locator_products_addRawPrice}    110
    #编辑商品seo
    Sleep    2
    Execute Javascript    return document.getElementById("test_upload_btn").scrollIntoView()
    Sleep    2
    Wait And Click Element    dom:document.querySelectorAll(".icon_custom_left___GO944")[3]
    Sleep    2
    #输入seo标题
    Wait And Input Text    dom:document.querySelectorAll(".seoForm___1GRPF .autosize-input___MJu1O")[0]    test
    #输入seo描述
    Wait And Input Text    dom:document.querySelectorAll(".text_area___BhZLp")[0]    test
    #输入seo链接
    Wait And Input Text    dom:document.querySelectorAll(".autosize-input___MJu1O")[3]    test
    #输入seo关键词
    Wait And Input Text    dom:document.querySelectorAll(".ant-select-search__field")[1]    test
    Press Key    dom:document.querySelectorAll(".ant-select-search__field")[1]    \\13
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    Go TO    ${home_page}

products100
    [Documentation]    验证添加商品时，隐藏seo编辑区域
    [Tags]    P0
    #验证隐藏seo编辑
    ${title}    Set Variable    ceshi1
    #只填写必要参数以添加商品
    #点击添加商品按钮
    Wait And Click Element    ${locator_products_add_product}
    #标题
    Wait And Input Text    ${locator_products_addTitle}    ${title}
    #售价
    Wait And Input Text    ${locator_products_addPrice}    100
    #原价
    Wait And Input Text    ${locator_products_addRawPrice}    110
    #编辑商品seo
    Execute Javascript    return document.getElementById("test_upload_btn").scrollIntoView()
    Sleep    2
    Wait And Click Element    dom:document.querySelectorAll(".icon_custom_left___GO944")[3]
    #点击隐藏seo编辑
    Wait And Click Element    dom:document.querySelectorAll(".icon_custom_left___GO944")[3]
    #seo编辑页面隐藏
    Wait Until Element Is Not Visible    dom:document.querySelectorAll(".seoForm___1GRPF .autosize-input___MJu1O")[0]
    ${title}    Execute Javascript    return document.querySelectorAll(".icon_custom_left___GO944")[3].text
    Should Be Equal As Strings    ${title}    编辑SEO
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
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
