*** Settings ***
Documentation     测试商品批量上下架
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
Delete_Product
    [Documentation]    点击商品预览后，进入checkout页面，在点击Submit前，在后台删除该商品，之后再点击Submit按钮，应该显示支付失败
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------
    Sleep    2
    #点击个人账户按钮，展现出店铺名称
    Wait And Click Element    dom:document.querySelectorAll(".xiala-choose")[0]
    Sleep    1
    #获取店铺名称
    ${store_name}    Get Text    dom:document.querySelectorAll(".name___2AVIS")[0]
    Sleep    2
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #点击第一个商品的预览icon
    Wait And Click Element    dom:document.querySelectorAll(".tw-see")[0]
    #跳转到商品详情页
    Select Window    title=${title}
    Sleep    1
    #跳转到页面底部
    Execute Javascript    return document.querySelectorAll(".buy-now")[0].scrollIntoView()
    #点击submit
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Sleep    1
    #进入到填写订单信息页面
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    #返回后台页面修改商品状态为下架
    Select Window    店匠科技
    #点击删除第一件商品
    Wait And Click Element    dom:document.querySelectorAll(".delete___2xfx-")[0]
    Sleep    2
    #点击确定按钮
    Wait And Click Element    ${locator_products_delBtn}
    Sleep    5
    #切换到商品submit页
    Select Window    title=${store_name}
    Sleep    1
    #添加地址信息
    Wait And Click Element    id:addAddress
    Sleep    1
    #first name
    Wait And Input Text    dom:document.querySelectorAll("input[name=first_name]")[0]    zc
    #last name
    Wait And Input Text    dom:document.querySelectorAll("input[name=last_name]")[0]    l
    #选择国家
    Select From List By Index    id:shipping_country_id    1
    Sleep    2
    #选择身份
    Select From List By Index    id:shipping_zone_id    1
    #city
    Wait And Input Text    dom:document.querySelectorAll("input[name=city]")[0]    shenzhen
    #address
    Wait And Input Text    dom:document.querySelectorAll("input[name=address]")[0]    hhh
    #postal code
    Wait And Input Text    dom:document.querySelectorAll("input[name=zip]")[0]    333000
    #email
    Wait And Input Text    dom:document.querySelectorAll("input[name=email]")[0]    1004714019@qq.com
    #phone
    Wait And Input Text    dom:document.querySelectorAll("input[name=phone]")[0]    15297989918
    #company
    Wait And Input Text    dom:document.querySelectorAll("input[name=company]")[0]    dianjiangkeji
    #保存填写的地址信息
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    #点击Submit按钮进入支付页
    Wait And Click Element    id:submitMbPay
    Sleep    5
    #支付页面应该显示支付失败
    Page Should Contain    Payment failure!
    #-------------------case跑完之后要回到商品列表页才能删除第一个商品--------------------

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Default User
    Start Ajax Listener
    #Add Product
    Sleep    5
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    #Delete_First_Product
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
