*** Settings ***
Documentation     Test payment price page ui.
Suite Setup       New Test Suite Browser And Login    ${nothingUser}    ${nothingUserPassword}    ${nothingUserDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/kw_login.robot    
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword
Resource          ../../../resources/var_checkout.robot    # import form list

*** Test Cases ***
Test_Checkout_Normal_page
    Go TO    ${home_page}
    #跳转到商品管理模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    Sleep    3
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #点击商品预览
    Assign id To Element    dom:document.querySelectorAll(".preview___37DtU")[0]    btn1
    Wait Until Element Is Visible    btn1
    Click Element    btn1
    #跳转到商品详情页后点击buy now
    Select Window    title=${title}
    Assign id To Element    dom:document.querySelectorAll(".buy-now")[0]    btn2
    Wait Until Element Is Visible    btn2
    Click Element    btn2
    Sleep    2
    #选择商品属性规格
    Assign id To Element    dom:document.querySelectorAll(".item-Color")[0]    btn3
    Wait Until Element Is Visible    btn3
    Click Element    btn3
    #click submit
    Assign id To Element    dom:document.querySelectorAll(".footer-submit")[0]    btn4
    Wait Until Element Is Visible    btn4
    Click Element    btn4
    #进入checkout界面
    Page Should Contain    Order summary
    #验证信息
    #验证商品
    Page Should Contain    ${title}
    #验证地址
    Assign id To Element    dom:document.querySelectorAll(".address_btn")[0]    address
    Wait Until Element Is Visible    address
    Page Should Contain Element    address
    Click Element    address
    Wait Until Element Is Visible    id:addAddressForm
    #填写地址表单
    #first_name
    Input Text    ${first_name}    zc
    #last_name
    Input Text    ${last_name}    l
    #选择国家
    Select From List By Index    id:shipping_country_id    1
    Sleep    1
    #选择身份
    Select From List By Index    id:shipping_zone_id    1
    #城市
    Input Text    ${city}    shenzhen
    #地址
    Input Text    ${address}    xingdong
    #邮编
    Input Text    ${post_code}    333000
    #邮箱
    Input Text    ${email}    lizhicheng@shoplazza.com
    #电话
    Input Text    ${phone}    15297989918
    #公司
    Input Text    ${company}    djkj
    #填写好信息之后保存
    Click Element    dom:document.querySelectorAll(".form-footer")[0]
    #买家留言
    Wait Until Element Is Visible    id:instruction_menu
    Page Should Contain Element    id:instruction_menu
    #商品总价
    Assign id To Element    dom:document.querySelectorAll(".detail_total_price")[0]    total
    Wait Until Element Is Visible    total
    Page Should Contain Element    total
    #提交按钮
    Wait Until Element Is Visible    id:submitMbPay
    Page Should Contain Element    id:submitMbPay
    #物流选择栏
    Wait Until Element Is Visible    id:delivery_menu
    Page Should Contain Element    id:delivery_menu
    Click Element    id:delivery_menu
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".shipping_choice")[0]
