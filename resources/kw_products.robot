*** Settings ***
Documentation     添加商品
Library           SeleniumLibrary
Library           customLibrary
Resource          kw_browser.robot
Resource          kw_login.robot
Resource          var_tax_price.robot

*** keyword ***
add_products
    #.添加商品
    #${image}    Set Variable    /Users/lizhicheng/dianjiang/shoplaza_robot/module/02_product/images/tm.jpg
    ${sssss}    Set Variable    ${CURDIR}/images/tm.jpg
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
    Input Text    id:__title    ${add_products_title}
    #售价
    Wait Until Page Contains Element    id:price
    Input Text    id:price    100
    #原价
    Wait Until Page Contains Element    id:compare_at_price
    Input Text    id:compare_at_price    110
    #上传图片
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    id:test_upload_btn
    Choose File    dom:document.querySelectorAll("input[type='file']")[0]    ${sssss}
    Sleep    1
    #点击保存
    Click Element    id:test_save_btn
    Sleep    2
    #去商品列表页检测是否有该商品
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Page Contains Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    ${show_title}    Get Text    dom:document.querySelectorAll(".product_name___Ul4W-")[0]
    Should Be Equal As Strings    ${add_products_title}    ${show_title}

del_products
    #.删除商品
    Go To    ${home_page}
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Click Element    dom:document.querySelectorAll(".ant-table-tbody tr td i")[5]
    Wait Until Element Is Visible    id:test_delete_modal_sure_btn
    Click Button    id:test_delete_modal_sure_btn
