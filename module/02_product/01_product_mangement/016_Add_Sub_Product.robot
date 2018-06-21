*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Add_Already_Option
    [Documentation]    添加子商品已有的选项
    [Tags]    P0
    #添加一个已有的选项
    ${title}    Set Variable    ceshi1
    #只填写必要参数以添加商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击添加商品按钮
    Wait Until Page Contains Element    id:test_add_btn
    Click Element    id:test_add_btn
    #标题
    Wait Until Page Contains Element    id:__title
    Input Text    id:__title    ${title}
    #添加选项
    Wait Until Element Is Visible    id:test_variant_setting_btn
    Click Element    id:test_variant_setting_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Mouse Over    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-dropdown-menu-item")[1]
    Click Element    dom:document.querySelectorAll(".ant-dropdown-menu-item")[1]
    #点击保存
    Click Element    id:test_save_btn

Add_Already_Self_Option
    #-------------------------暂未成功！！！--------------------------------
    [Documentation]    添加子商品自定义的选项
    [Tags]    P0
    #添加一个自定义的选项
    ${title}    Set Variable    ceshi1
    #只填写必要参数以添加商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击添加商品按钮
    Wait Until Page Contains Element    id:test_add_btn
    Click Element    id:test_add_btn
    #标题
    Wait Until Page Contains Element    id:__title
    Input Text    id:__title    ${title}
    #添加选项
    Wait Until Element Is Visible    id:test_variant_setting_btn
    Click Element    id:test_variant_setting_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Mouse Over    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    #点击自定义选项
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-dropdown-menu-item")[0]
    Set Focus To Element    dom:document.querySelectorAll(".ant-dropdown-menu-item")[0]
    Click Element    dom:document.querySelectorAll(".ant-dropdown-menu-item")[0]
    #输入选项名和款式细节
    Wait Until Element Is Visible    id:option_3
    Input Text    id:option_3    test
    Wait Until Element Is Visible    id:option_values_3
    Input Text    id:option_values_3    test-1
    #按enter添加细节
    Press Key    id:option_values_3    \\13
    #点击保存
    Click Element    id:test_save_btn

Add_Already_Seo
    [Documentation]    添加商品时，添加商品seo信息
    [Tags]    P0
    #编辑seo
    ${title}    Set Variable    ceshi1
    #只填写必要参数以添加商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击添加商品按钮
    Wait Until Page Contains Element    id:test_add_btn
    Click Element    id:test_add_btn
    #标题
    Wait Until Page Contains Element    id:__title
    Input Text    id:__title    ${title}
    #售价
    Wait Until Page Contains Element    id:price
    Input Text    id:price    100
    #原价
    Wait Until Page Contains Element    id:compare_at_price
    Input Text    id:compare_at_price    110
    #编辑商品seo
    Execute Javascript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    dom:document.querySelectorAll(".icon_custom_left___GO944")[0]
    Click Element    dom:document.querySelectorAll(".icon_custom_left___GO944")[0]
    #输入seo标题
    Wait Until Element Is Visible    dom:document.querySelectorAll(".seoForm___1GRPF .autosize-input___MJu1O")[0]
    Input Text    dom:document.querySelectorAll(".seoForm___1GRPF .autosize-input___MJu1O")[0]    test
    #输入seo描述
    Input Text    dom:document.querySelectorAll(".text_area___BhZLp")[0]    test
    #输入seo链接
    Input Text    dom:document.querySelectorAll(".autosize-input___MJu1O")[3]    test
    #输入seo关键词
    Input Text    dom:document.querySelectorAll(".ant-select-search__field")[1]    test
    Press Key    dom:document.querySelectorAll(".ant-select-search__field")[1]    \\13
    #点击保存
    Click Element    id:test_save_btn

Validate_SEO_Close
    [Documentation]    验证添加商品时，隐藏seo编辑区域
    [Tags]    P0
    #验证隐藏seo编辑
    ${title}    Set Variable    ceshi1
    #只填写必要参数以添加商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击添加商品按钮
    Wait Until Page Contains Element    id:test_add_btn
    Click Element    id:test_add_btn
    #标题
    Wait Until Page Contains Element    id:__title
    Input Text    id:__title    ${title}
    #售价
    Wait Until Page Contains Element    id:price
    Input Text    id:price    100
    #原价
    Wait Until Page Contains Element    id:compare_at_price
    Input Text    id:compare_at_price    110
    #编辑商品seo
    Execute Javascript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    dom:document.querySelectorAll(".icon_custom_left___GO944")[0]
    Click Element    dom:document.querySelectorAll(".icon_custom_left___GO944")[0]
    #点击隐藏seo编辑
    Wait Until Element Is Visible    dom:document.querySelectorAll(".icon_custom_left___GO944")[0]
    Click Element    dom:document.querySelectorAll(".icon_custom_left___GO944")[0]
    #seo编辑页面隐藏
    Wait Until Element Is Not Visible    dom:document.querySelectorAll(".seoForm___1GRPF .autosize-input___MJu1O")[0]
    ${title}    Execute Javascript    return document.querySelectorAll(".icon_custom_left___GO944")[0].text
    Should Be Equal As Strings    ${title}    编辑SEO
