*** Settings ***
Documentation     Test tax price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot    # import login keyword
Resource          ../../../resources/browser.robot    # import ajax listener keyword
Library           customLibrary

*** Test Cases ***
Add_Product_With_Required
    ${image}    Set Variable    /Users/lizhicheng/dianjiang/shoplaza_robot/module/02_product/tm.jpg
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
    #上传图片
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    id:test_upload_btn
    Choose File    dom:document.querySelectorAll("input[type='file']")[0]    ${image}
    Sleep    1
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #去商品列表页检测是否有该商品
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Page Contains Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${show_title}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    Should Be Equal As Strings    ${title}    ${show_title}

Add_Product_Without_Price
    #新增商品时不填写售价
    ${image}    Set Variable    /Users/lizhicheng/dianjiang/shoplaza_robot/module/02_product/tm.jpg
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
    #原价
    Wait Until Page Contains Element    id:compare_at_price
    Input Text    id:compare_at_price    110
    #上传图片
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    id:test_upload_btn
    Choose File    dom:document.querySelectorAll("input[type='file']")[0]    ${image}
    Sleep    1
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #保存失败，商品列表不应该存在此商品
    ${new_title}    getFirstProductTitle
    Should Not Be Equal As Strings    ${title}    ${new_title}

Add_Product
    ${image}    Set Variable    /Users/lizhicheng/dianjiang/shoplaza_robot/module/02_product/tm.jpg
    ${title}    Set Variable    ceshi1
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
    #副标题
    Wait Until Page Contains Element    dom:document.querySelectorAll(".autosize-input___MJu1O")[1]
    Input Text    dom:document.querySelectorAll(".autosize-input___MJu1O")[1]    ${title}
    #点击上架
    Wait Until Page Contains Element    id:status
    Click Element    id:status
    #售价
    Wait Until Page Contains Element    id:price
    Input Text    id:price    100
    #原价
    Wait Until Page Contains Element    id:compare_at_price
    Input Text    id:compare_at_price    110
    #上传图片
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    id:test_upload_btn
    Choose File    dom:document.querySelectorAll("input[type='file']")[0]    ${image}
    Sleep    1
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #去商品列表页检测是否有该商品
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Page Contains Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${show_title}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    Should Be Equal As Strings    ${title}    ${show_title}

Add_Product_With_Cancel
    #输入部分数据点击返回按钮退出
    ${image}    Set Variable    /Users/lizhicheng/dianjiang/shoplaza_robot/module/02_product/tm.jpg
    ${title}    Set Variable    ceshi1
    #只填写必要参数以添加商品
    Go TO    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击添加商品按钮
    Sleep    1
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
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    id:test_upload_btn
    Choose File    dom:document.querySelectorAll("input[type='file']")[0]    ${image}
    #点击返回按钮
    Click Element    dom:document.querySelectorAll(".back1")[0]
    #弹出窗
    #确定
    Handle Alert
    Sleep    2
    #返回到商品列表页
    #验证商品列表页面
    Wait Until Page Contains Element    dom:document.querySelectorAll(".header_left___3RMen")[0].querySelectorAll("span")[0]
    ${name}    Get Text    dom:document.querySelectorAll(".header_left___3RMen")[0].querySelectorAll("span")[0]
    Should Be Equal As Strings    ${name}    商品管理

Add_Product_With_Brief
    #添加副标题
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
    #副标题
    Wait Until Page Contains Element    dom:document.querySelectorAll(".autosize-input___MJu1O")[1]
    Input Text    dom:document.querySelectorAll(".autosize-input___MJu1O")[1]    ${title}
    #售价
    Wait Until Page Contains Element    id:price
    Input Text    id:price    100
    #原价
    Wait Until Page Contains Element    id:compare_at_price
    Input Text    id:compare_at_price    110
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #保存之后检测该商品是否包含刚刚输入的副标题
    ${now_title}    Execute Javascript    return document.getElementById("__brief").value
    Should Be Equal As Strings    ${title}    ${now_title}

Add_Product_With_Description
    #添加描述
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
    #描述
    Wait Until Page Contains Element    dom:document.querySelectorAll(".fr-view")[0].querySelectorAll("p")[0]
    Click Element    dom:document.querySelectorAll(".fr-view")[0].querySelectorAll("p")[0]
    Execute Javascript    return document.querySelectorAll(".fr-view")[0].querySelectorAll("p")[0].innerText=123321
    #售价
    Wait Until Page Contains Element    id:price
    Input Text    id:price    100
    #原价
    Wait Until Page Contains Element    id:compare_at_price
    Input Text    id:compare_at_price    110
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #保存之后检测该商品是否包含刚刚输入的描述
    ${now_title}    Execute Javascript    return document.querySelectorAll(".fr-view")[0].querySelectorAll("p")[0].innerText
    Should Be Equal As Strings    123321    ${now_title}

Add_Product_With_Status
    #验证商品上架
