*** Settings ***
Documentation     Test payment price page ui.
Suite Setup       New Test Suite Browser And Login    ${user_default_name}    ${user_default_pwd}    ${user_default_domain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot

*** Test Cases ***
01_Save_Success
    Login To Checkout Channel
    #填写地址表单
    #first_name
    Input Text    ${first_name}    baiyuan
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

02_Save_Failed_Without_FirstName
    Login To Checkout Channel
    #填写地址表单
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
    ${class_name}    Execute Javascript    return document.querySelectorAll("input[name=first_name]")[0].getAttribute('class')
    Should Be True    '${class_name}'=='not_none'

03_Save_Success
    Login To Checkout Channel
    #填写地址表单
    #first_name
    Input Text    ${first_name}    baiyuan
    #last_name
    Input Text    ${last_name}    fang
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

04_Save_Failed_Without_LastName
    Login To Checkout Channel
    #填写地址表单
    #first_name
    Input Text    ${first_name}    baiyuan
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
    ${class_name}    Execute Javascript    return document.querySelectorAll("input[name=last_name]")[0].getAttribute('class')
    Should Be True    '${class_name}'=='not_none'

*** KeyWords ***
Login To Checkout Channel
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
