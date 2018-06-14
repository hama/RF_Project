*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/kw_login.robot    
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Add_Product_With_Supplier
    #添加供应商
    ${title}    Set Variable    ceshi
    #填写必要和非必要参数以添加商品
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
    #供应商
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-input")[1]
    Input Text    dom:document.querySelectorAll(".ant-input")[1]    ${title}
    Press Key    dom:document.querySelectorAll(".ant-input")[1]    \\13
    #售价
    Wait Until Page Contains Element    id:price
    Input Text    id:price    100
    #原价
    Wait Until Page Contains Element    id:compare_at_price
    Input Text    id:compare_at_price    110
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #保存之后检测该商品是否包含该供应商
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-input")[1]
    ${now_supplier}    Execute Javascript    return document.querySelectorAll(".ant-input")[1].value
    Should Be Equal As Strings    ${now_supplier}    ${title}

Add_Product_With_Tag
    #添加标签
    ${title}    Set Variable    ceshi
    #填写必要和非必要参数以添加商品
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
    #标签
    Wait Until Page Contains Element    id:tags
    Input Text    id:tags    ${title}
    Press Key    id:tags    \\13
    #售价
    Wait Until Page Contains Element    id:price
    Input Text    id:price    100
    #原价
    Wait Until Page Contains Element    id:compare_at_price
    Input Text    id:compare_at_price    110
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #保存之后检测该商品是否包含该标签
    Wait Until Page Contains Element    dom:document.querySelectorAll(".container___3MQp4")[0]
    Element Should Contain    dom:document.querySelectorAll(".container___3MQp4")[0]    ${title}

Add_Product_With_sku
    #添加sku
    ${title}    Set Variable    ceshi
    ${sku}    Set Variable    hhh
    #填写必要和非必要参数以添加商品
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
    #sku
    Wait Until Page Contains Element    id:sku
    Input Text    id:sku    ${sku}
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #保存之后检测该商品是否包含该sku
    Wait Until Page Contains Element    id:sku
    ${should_sku}    Execute Javascript    return document.getElementById("sku").value
    Should Be Equal As Strings    ${sku}    ${should_sku}

Add_Product_With_Barcode
    #添加条形码
    ${title}    Set Variable    ceshi
    ${barcode}    Set Variable    123456
    #填写必要和非必要参数以添加商品
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
    #条形码
    Wait Until Page Contains Element    id:barcode
    Input Text    id:barcode    ${barcode}
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #保存之后检测该商品是否包含该条形码
    Wait Until Page Contains Element    id:barcode
    ${should_barcode}    Execute Javascript    return document.getElementById("barcode").value
    Should Be Equal As Strings    ${barcode}    ${should_barcode}

Add_Product_With_Images
    #添加多张图片
    ${image1}    Set Variable    /Users/lizhicheng/dianjiang/shoplaza_robot/module/02_product/tm.jpg
    ${image2}    Set Variable    /Users/lizhicheng/dianjiang/shoplaza_robot/module/02_product/mv.jpg
    ${title}    Set Variable    ceshi
    #填写必要和非必要参数以添加商品
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
    #上传图片
    Upload_Image    ${image1}
    Upload_Image    ${image2}
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #保存之后检测该商品包含添加的多张图片数量是否一致
    Wait Until Page Contains Element    dom:document.querySelectorAll(".wrapper___3TwjV")[0]
    ${count}    Execute Javascript    return document.querySelectorAll(".wrapper___3TwjV").length
    Should Be True    ${count}==3
    #接着图片预览，编辑替代文本，删除图片
    #预览
    #点击预览
    Wait Until Page Contains Element    dom:document.querySelectorAll(".center___1nHSZ")[0]
    Mouse Over    dom:document.querySelectorAll(".center___1nHSZ")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".preview___3lmGC")[0]
    Click Element    dom:document.querySelectorAll(".preview___3lmGC")[0]
    #展示图片大图
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-content")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-modal-content")[0]
    #关闭大图
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-modal-close")[0]
    Click Element    dom:document.querySelectorAll(".ant-modal-close")[0]
    #编辑替代文本
    Wait Until Page Contains Element    dom:document.querySelectorAll(".center___1nHSZ")[0]
    Mouse Over    dom:document.querySelectorAll(".center___1nHSZ")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".alt___192h2")[0]
    Click Element    dom:document.querySelectorAll(".alt___192h2")[0]
    #展现弹出框
    Wait Until Page Contains Element    dom:document.querySelectorAll(".alt_input___1RvXO")[0]
    Input Text    dom:document.querySelectorAll(".alt_input___1RvXO")[0]    test
    #确定
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-btn-primary")[0]
    Click Element    dom:document.querySelectorAll(".ant-btn-primary")[0]
    #点击删除图片
    Wait Until Page Contains Element    dom:document.querySelectorAll(".center___1nHSZ")[0]
    Mouse Over    dom:document.querySelectorAll(".center___1nHSZ")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".delete___1vipL")[0]
    Click Element    dom:document.querySelectorAll(".delete___1vipL")[0]
    ${now_count}    Execute Javascript    return document.querySelectorAll(".wrapper___3TwjV").length
    Should Be True    ${now_count}==2
    #移除所有图片
    Wait Until Page Contains Element    dom:document.querySelectorAll(".headerExtra___3kmgB a")[0]
    Click Element    dom:document.querySelectorAll(".headerExtra___3kmgB a")[0]
    #弹窗选择“是”
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-popover-inner")[0]
    Click Element    dom:document.querySelectorAll(".ant-popover-inner")[0].querySelectorAll(".ant-btn-primary")[0]
    Sleep    1
    ${final_count}    Execute Javascript    return document.querySelectorAll(".wrapper___3TwjV").length
    Should Be True    ${final_count}==1

*** KeyWords ***
Upload_Image
    [Arguments]    ${image}
    #上传一张图片
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    id:test_upload_btn
    Choose File    dom:document.querySelectorAll("input[type='file']")[0]    ${image}
    Sleep    1
