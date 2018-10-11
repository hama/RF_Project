*** Settings ***
Documentation     Ckeckout Page Check
Suite Setup       Checkout Common Step
Suite Teardown    Common Teardown    # close the browser opened for this test suite
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_checkout.robot
Resource          ../../../resources/variable/var_checkout.robot
Resource          ../../../resources/variable/var_checkout.robot
Resource          ../../../resources/variable/var_product_management.robot
Library           ${CURDIR}/../../../lib/customlib/kwproduct.py
Library           ${CURDIR}/../../../lib/customlib/kwshipping.py
Library           ${CURDIR}/../../../lib/customlib/kwtax.py
Library           ${CURDIR}/../../../lib/customlib/kwmarketing.py
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py

*** Test Cases ***
xsxsxsxs
    kwshipping.del_all_shipping_py
    #.添加一个重量运费的物流
    kwshipping.add_shipping_py    0    1
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #.选择中国
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    3
    ${res}    Get Text    dom:document.querySelectorAll(".fl")[4]
    Should Be True    '${res}'=='Freight Standard shipping'


checkout001
    [Documentation]    C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
    [Tags]    P0    threshold    smoke
    #.click products btn
    Click Preview Step
    Wait Until Element Is Visible    ${locatorB_checkout_add_card_btn}
    Page Should Contain Image    dom:document.querySelectorAll("img")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".sales_price")[0]

checkout002
    [Documentation]    进入checkout界面 显示购买的商品，地址，
    [Tags]    P0    threshold    smoke
    #点击商品预览
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Sleep    2
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".coline")[0]

checkout006
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品标题显示正常
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Sleep    2
    Wait Until Page Contains Locator    ${locatorB_checkout_address_showProduct_eml}

checkout_007
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品子产品显示正常 > "1.C端购买商品women的子款式：blue XXL,2.进入checkout shipping页面,3.查看订单汇总商品栏子产品" > "子产品显示为：,color：blue,size：XXL"
    [Tags]    P0    threshold    smoke
    # 添加一个待自产品的商品
    kwproduct.add_max_product_with_sub_py
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    Wait Until Page Contains    Color:red
    Wait Until Page Contains    Size:min
    
checkout_008
    [Documentation]    验证checkout shipping页面，订单汇总商品栏，商品数量显示正常 > "1.C端够买商品women5件进入checkout shipping页面,2.查看订单汇总商品栏，商品数量显示" > 商品数量显示为：X5
    [Tags]    P0    threshold    smoke
    Click Preview Step
    #.先点击选中颜色，尺寸
    Wait And Click Element    ${locatorB_checkout_selectColor_elm}
    #.输入数量
    Wait And Input Text    dom:document.querySelectorAll(".qty-num")[0]    5
    #,点击立即购买
    Wait And Click Element    dom:document.querySelectorAll(".second_btn")[0]
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    #.获取数量
    Wait Until Element Is Visible    dom:document.querySelectorAll("tbody tr td")[2]
    ${res}    Execute JavaScript    return document.querySelectorAll("tbody tr td")[2].innerText
    Should Be True    '${res}'=='X5'

checkout_009
    [Documentation]    验证checkout shipping页面，订单汇总商品栏，商品价格显示正常 >"1.C端购买商品women进入checkout shipping页面,2.查看订单汇总商品栏，商品价格显示" > 商品价格显示为：444USD
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Sleep    2
    Wait Until Page Contains Locator        dom:document.querySelectorAll(".order_price")[0]
    ${res}    Execute JavaScript    return document.querySelectorAll(".order_price")[0].innerText
    Should Be True    '${res}'=='$444.00'

checkout_014
    [Documentation]    验证checkout shipping页面，subtotal显示正常 > "1.C端购买商品women两件进入checkout shipping页面,2.查看价格详情中subtotal" > subtotal为：$444.00
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    Wait Until Page Contains Locator    dom:document.querySelectorAll("tfoot tr td")[1]
    ${res}    Execute JavaScript    return document.querySelectorAll("tfoot tr td")[1].innerText
    Should Be True    '${res}'=='$444.00'

checkout_015
    [Documentation]    验证checkout shipping页面，价格详情中，shipping显示正常 >  shipping显示为：$10
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    5
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    ${res}    Execute JavaScript    return document.querySelectorAll("tbody tr td")[7].innerText
    Should Be True    '${res}'=='+ $10.00'

checkout_018
    [Documentation]    验证checkout shipping页面，订单详情中tax显示正常 > 
    [Tags]    P0    threshold    smoke
    #.添加一个物流为中国百分之60的税金
    add_other_tax_price_py    60
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    5
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    Wait Until Page Contains Locator    dom:document.querySelectorAll("tbody tr td")[9]

checkout_021
    [Documentation]    验证checkout shipping页面，使用优惠码后，价格详情中会出现discount code并显示优惠价格 > "1.C端购买商品women进入checkout shipping页面，2.使用优惠码AAA001，3.查看价格详情" > 价格详情显示优惠金额
    [Tags]    P0    threshold    smoke
    #.添加一个满50减10的全场优惠券
    kwmarketing.add_coupon_py    1
    #. 先获得优惠码
    Go To Coupon Page
    Sleep    2
    Wait Until Page Contains    优惠码
    ${copun}    Execute JavaScript    return document.querySelectorAll("tbody tr:nth-child(1) td")[2].innerText
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    #.输入优惠码
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ${copun}
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    Wait Until Page Contains    Discount code

checkout_024
    [Documentation]    验证checkout shipping页面，total显示正常 > "1.C端购买商品进入checkout shipping页面,2.信息填写栏选择国家 中国,3.选择物流方案：方案1,4.使用优惠码AAA001,5.此订单价格为：,,subtotal：$50.00,shipping：+ $2.00,discount code：- $10.00,tax: + $25.00,6.查看价格详情total"
    [Tags]    P0    threshold    smoke
    #.添加一个满50减10的全场优惠券
    kwmarketing.add_coupon_py    1
    #.添加一个物流为中国百分之60的税金
    add_other_tax_price_py    60
    #. 先获得优惠码
    Go To Coupon Page
    Sleep    2
    Wait Until Page Contains    优惠码
    ${copun}    Execute JavaScript    return document.querySelectorAll("tbody tr:nth-child(1) td")[2].innerText
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    4
    #，点击查看详情的下拉剪头
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    #.输入优惠码
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ${copun}
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    #.获取优惠券价格,物流价格
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".checkout-prices-value")[0]
    ${total}    Get Text    dom:document.querySelectorAll(".checkout-prices-value")[0]
    Sleep Time
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".checkout-prices-value")[1]
    ${nums}    Get Text    dom:document.querySelectorAll(".checkout-prices-value")[1]
    Sleep Time
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".checkout-prices-value")[2]
    ${shipping}    Get Text    dom:document.querySelectorAll(".checkout-prices-value")[2]
    Sleep Time
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".checkout-prices-value")[3]
    ${code}    Get Text    dom:document.querySelectorAll(".checkout-prices-value")[3]
    Sleep Time
    #.获取total 
    Wait Until Page Contains Locator    dom:document.querySelectorAll("tfoot tr td")[1]
    ${exs}    Get Text    dom:document.querySelectorAll("tfoot tr td")[1]
    #.去掉多余字符后运算
    ${exsx}    lib_utils.searchStrs_py    ${exs}
    ${totals}    lib_utils.searchStrs_py    ${total}
    ${numsx}    lib_utils.searchStrs_py    ${nums}
    ${shippings}    lib_utils.searchStrs_py    ${shipping}
    ${codes}    lib_utils.searchStrs_py    ${code}
    #.获取优惠券信息
    ${res}    Evaluate    ${totals}+${shippings}+${codes}-int(${numsx})
    Should Be True    ${res}==${exsx}
    
checkout_025
    [Documentation]    验证checkout shipping页面，优惠码输入框中可输入内容 > "1.点击优惠码输入框,2.输入内容：AAA003" > 优惠码输入框中显示输入的内容：AAA003
    [Tags]    P1    threshold    smoke
    ${num}    Set Variable    AAA003
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #，点击查看详情的下拉剪头
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    #.在优惠码输入框中输入AAA003
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ${num}
    ${res}    Get Value    ${locatorB_checkout_addressCoupon_ipt}
    Should Be True    '${res}'=='${num}'

checkout_026
    [Documentation]    验证checkout shipping页面，优惠码输入框后apply按钮可点击>"1.C端购买任意商品进入checkout shipping页面,2.优惠码输入框中输入优惠码AAA006,3.点击apply按钮" > 点击后优惠码使用成功，价格详情中显示discount code： - $10.00
    [Tags]    P0    threshold    smoke
    #.添加一个满50减10的全场优惠券
    kwmarketing.add_coupon_py    1
    #. 先获得优惠码
    Go To Coupon Page
    Sleep    2
    Wait Until Page Contains    优惠码
    ${copun}    Execute JavaScript    return document.querySelectorAll("tbody tr:nth-child(1) td")[2].innerText
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #，点击查看详情的下拉剪头
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ${copun}
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    #.获取优惠那一栏的值
    Sleep Time
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".checkout-prices-value")[1]
    ${nums}    Get Text    dom:document.querySelectorAll(".checkout-prices-value")[1]
    Should Be True    '${nums}'=='- $22.20'

checkout_027
    [Documentation]    验证checkout shipping页面输入错误的优惠码时，点击apply，会给出对应提示 > 2.优惠码输入框中输入任意内容：..0001,3.点击apply > 优惠码输入框下方出现错误提示
    [Tags]    P1    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #，点击查看详情的下拉剪头
    Wait And Click Element    ${locatorB_checkout_address_showProduct_eml}
    Wait And Input Text    ${locatorB_checkout_addressCoupon_ipt}    ..0001
    #.点击应用
    Wait And Click Element    ${locatorB_checkout_addressClickCoupon_btn}
    Wait Until Page Contains    This discount does not exist.

checkout_034
    [Documentation]    验证checkout shipping页面，shipping address栏，国家选择框可点击以及国家选择展示 > 1.点击shipping address栏国家选择框 >点击后国家选择框下拉展开，显示所有可选择的国家
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_address_select_country}


checkout_035
    [Documentation]    验证checkout shipping页面，shipping address栏，省份选择框可点击以及省份选择展示  > "1.点击国家选择框选择中国,2.点击省份选择框" > 点击后城市选择框下拉展开，显示中国的所有省份
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Select From List    ${locatorB_checkout_address_select_country}    China
    Wait And Click Element    ${locatorB_checkout_address_select_province}

checkout_037
    [Documentation]    验证checkout shipping页面，shipping address栏输入正确的信息，可以提交成功 > 输入地址 > 提交成功，页面跳转到支付页面
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}

checkout_073
    [Documentation]    验证checkout shipping页面，点击买家留言栏，可展开买家留言输入框 > 1.点击special instruction栏 > 点击后展开买家留言输入框
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_address_buyMesg_elm}

checkout_077
    [Documentation]    验证checkout shipping页面，买家留言输入框输入的内容，会同步到B端订单详情 > "1.C端发起新订单AAA00111进入checkout shipping页面,2.买家留言输入框中输入内容：请尽快发货,3.完成订单进入B端订单AAA00111详情,4.查看订单详情页面买家留言" > 买家留言内容显示为：请尽快发货
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Add Address Common Step
    #.点击展开留言框
    Wait And Click Element    dom:document.querySelectorAll('#instructionToggle')[0]
    #.输入留言
    Wait And Input Text    dom:document.querySelectorAll('textarea[name="customer_note"]')[0]    自动化测试
    #.点击提交
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Contains    PAYMENT


checkout_082
    [Documentation]    验证checkout shipping页面，没有可选择物流方案时，payment method 按钮无法点击 > payment method按钮置灰无法点击
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_by_now_btn_s}
    
checkout_083
    [Documentation]    验证B端运费方案设置价格范围时，C端购买的商品价格满足此价格范围，checkout shipping页面将展示此运费方案 > 运费方案中显示：价格方案1
    [Tags]    P0    threshold    smoke
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #.选择中国
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    3
    ${res}    Get Text    dom:document.querySelectorAll(".fl")[4]
    Should Be True    '${res}'=='Standard shipping'


checkout_085
    [Documentation]    验证B端运费方案设置重量范围时，C端购买的商品重量满足此重量范围，checkout shipping页面将展示此运费方案 > 运费方案中显示 重量方案1
    [Tags]    P0    threshold    smoke
    #.先删除物流
    kwshipping.del_all_shipping_py
    #.添加一个重量运费的物流
    kwshipping.add_shipping_py    0    1
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #.选择中国
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep    3
    ${res}    Get Text    dom:document.querySelectorAll(".fl")[4]
    Should Be True    '${res}'=='Freight Standard shipping'

checkout_087
    [Documentation]    验证B端运费方案设置数量范围时，C端购买的商品数量满足此数量范围，checkout shipping页面将展示此运费方案 > "1.C端购买5件商品进入checkout shipping页面,2.选择国家：中国,3.查看shipping delivery栏运费方案" >运费方案中显示 数量方案1
    [Tags]    P0    threshold    smoke
    Click Preview Step

# -------------------------------------------------------------------------------- old -----------------------------------------------------------------------------------

checkout005
    [Documentation]    进入checkout界面 点击搜索按钮 跳转到搜索页面
    [Tags]    P1
    Checkout_Common_Show_Element    ${locatorB_checkout_search_btn}    dom:document.querySelectorAll(".search_header_txt")[0]

checkout008
    [Documentation]    进入checkout界面 顶部导航栏中间显示店铺名
    [Tags]    P1
    Checkout Common Setp
    Page Should Contain Element    ${locatorB_checkout_user_name}

checkout009
    [Documentation]    进入checkout界面 点击购物车按钮 显示购物车内容
    [Tags]    P0
    Checkout_Common_Show_Element    ${locatorB_checkout_card_img_btn}    dom:document.querySelectorAll(".title")[0]

checkout010
    [Documentation]    进入checkout界面 点击个人中心按钮 显示个人中心内容
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_member_btn}
    Sleep Time
    Page Should Contain Element    dom:document.querySelectorAll(".operal_list_item")[0]

checkout011
    [Documentation]    进入checkout界面 点击buynow 然后添加地址
    [Tags]    P0
    Checkout Common Setp
    Checkout_Common_Address_Step
    Page Should Contain Element    dom:document.querySelectorAll("input[name='first_name']")[0]

checkout012
    [Documentation]    进去checkout界面 点击buynow 添加地址·输入该输入信息·保存成功
    [Tags]    P0
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Sleep Time
    Page Should Contain Element    dom:document.querySelectorAll(".header")[0]

checkout013
    [Documentation]    进去checkout 界面 点击buynow 添加地址·姓名不输入 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    ${Empty}
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout017
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不选择国家 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout018
    [Documentation]    进去checkout 界面 点击buynow 添加地址·先在后台添加一个中国的国家 然后在c端显示可选的为中国
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Page Should Contain Element    dom:document.querySelectorAll("#shipping_country_id option")[1]    #.代表中国

checkout022
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不选择地区 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout023
    [Documentation]    进去checkout 界面 点击buynow 添加地址·选择中国 出现中国的所有地区
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep Time
    ${count}    Execute JavaScript    return document.querySelectorAll("#shipping_zone_id")[0].length
    Should Be True    ${count}==32

checkout025
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入城市 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout026
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入详细地址 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout028
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入zip 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout030
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入邮箱 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout032
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入电话 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}


checkout035
    [Documentation]    进去checkout 界面 点击buynow 添加地址· 保存成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_save_checkout_btn}

checkout039
    [Documentation]    进去checkout 界面 点击buynow 添加2次购物车 购物车的数量为2
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_add_card_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Sleep    3
    Wait And Click Element    ${locatorB_checkout_add_card_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Sleep    3
    Wait And Click Element    ${locatorB_checkout_card_img_btn}
    ${count}    Execute JavaScript    return document.querySelectorAll(".space-between span")[2].innerText
    Should Be True    ${count}==2

checkout040
    [Documentation]    进入checkout 界面 点击留言板，弹出窗口
    [Tags]    P1
    Checkout Common Setp
    Execute JavaScript    return document.getElementsByClassName("review_write")[0].scrollIntoView()
    Wait And Click Element    ${locatorB_checkout_write_review}
    Page Should Contain Element    dom:document.querySelectorAll(".addli")

checkout043
    [Documentation]    进入checkout 界面 点击留言板，弹出窗口 输入超过500个字符
    [Tags]    P1
    ${strs}    Set Variable    aslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsa
    Go To Home By Url
    Checkout Common Setp
    Execute JavaScript    return document.getElementsByClassName("review_write")[0].scrollIntoView()
    Wait And Click Element    ${locatorB_checkout_write_review}
    Input Text    id:content    ${strs}
    Page Should Contain Element    dom:document.querySelectorAll(".addli")

checkout019
    [Documentation]    B端添加其他国家 checkout 展开下拉框，显示所有国家
    [Tags]    P1
    Go To Home By Url
    Add Other Country
    Sleep    2
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    ${count}    Execute JavaScript    return document.querySelectorAll("#shipping_country_id")[0].length
    Should Be True    ${count}==228
    Go To Home By Url
    Delete Shipping

checkout021
    [Documentation]    正常添加数据，保存成功
    [Tags]    P0
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    ${name}    Execute JavaScript    return document.querySelectorAll("#shipping_country_id option")[1].innerText
    Select From List    ${locatorB_checkout_address_select_country}    ${name}
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    id:changeaddress

checkout038
    [Documentation]    添加地址后关闭页面填写的信息不会被重置
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    ${first_name}    Set Variable    123
    Input Text    ${locatorB_checkout_address_first_name}    ${first_name}
    Input Text    ${locatorB_checkout_address_last_name}    345
    Wait And Click Element    ${locatorB_checkout_address_close_address}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    ${data}    Execute JavaScript    return document.querySelectorAll("input[name='first_name']")[0].value
    Should Be True    '${data}'=='${first_name}'

checkout052
    [Documentation]    1.添加价格为10USD的一个商品进入checkout界面2.选中没有设置税金的国家3.不使用优惠券4.查看价格选项中优惠前的总价  优惠前的总价显示为10USD
    [Tags]    P1
    Add TenPrice Products    #.添加商品
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    dom:document.getElementsByClassName("pm_footer_left")[0]
    ${new_price}    Execute JavaScript    return document.querySelectorAll(".paydetail-line span")[1].innerText
    Should Be True    '${new_price}'=='$10'

checkout054
    [Documentation]    1.添加价格为10USD的一个商品进入checkout界面2.不使用优惠券3.选择设置了税金的国家4.查看价格选项中优惠前的总价"  优惠价格显示为0USD
    [Tags]    P1
    Set Tax Price    中国    10
    Add TenPrice Products    #.添加商品
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    dom:document.getElementsByClassName("pm_footer_left")[0]
    ${new_price}    Execute JavaScript    return document.querySelectorAll(".paydetail-content div:nth-child(2) span")[1].innerText
    ${res_price}    searchStrs_py    ${new_price}
    Should Be True    ${res_price}==0

checkout063
    [Documentation]    1.添加价格为10USD的商品进入checkout界面2.添加购买地址时选择中国，城市选择上海3.查看价格选项中税金价格 税金价格显示为1USD
    [Tags]    P1
    Set Tax Price    中国    10    #.设置税金
    Add TenPrice Products    #.添加商品
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep Time
    Select From List    ${locatorB_checkout_address_select_city}    Shanghai
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    dom:document.getElementsByClassName("pm_footer_left")[0]
    ${new_price}    Execute JavaScript    return document.querySelectorAll(".paydetail-content div:nth-child(3) span")[1].innerText
    ${res_price}    searchStrs_py    ${new_price}
    Should Be True    ${res_price}==1

checkout065
    [Documentation]     "1.添加价格为10USD的商品进入checkout界面2.添加购买地址时选择中国，城市选择广东3.查看价格选项中税金价格"  税金价格显示为0USD
    [Tags]    P0
    Set Tax Price    中国    0    #.设置税金
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep Time
    Select From List    ${locatorB_checkout_address_select_city}    Guangdong
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    dom:document.getElementsByClassName("pm_footer_left")[0]
    ${new_price}    Execute JavaScript    return document.querySelectorAll(".paydetail-content div:nth-child(3) span")[1].innerText
    ${res_price}    searchStrs_py    ${new_price}
    Should Be True    ${res_price}==0

checkout079
    [Documentation]     1.B端激活COD支付 2.进入checkout界面并进入支付界面" 支付界面显示COD支付方式
    [Tags]    P0
    Add Cod Payment    #.添加cod支付方式
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Page Should Contain Element    class:pm_name

checkout081
    [Documentation]     1.B端激活所有支付方式2.进入checkout界面并进入支付界面   支付界面显示所有激活的支付方式
    [Tags]    P0
    Add Payment    #.添加paylinks支付方式
    Add Cod Payment    #.添加cod支付方式
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Page Should Contain Element    class:pm_list_row
    Page Should Contain Element    dom:document.querySelectorAll(".pm_list_row[alt=ipaylinks]")[0]

checkout088
    [Documentation]    1.选择CDO支付方式 2.点击pay now"   直接跳转到支付成功界面
    [Tags]    P0
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    Page Should Contain Element    class:success

checkout098
    [Documentation]    1.进入支付界面2.B端删除本次购买的商品3.点击支付    购买失败，进入支付失败界面
    [Tags]    P0
    Add Order Products    #.添加商品
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    Del First Product    #. 调用关键字删除刚添加的商品
    Sleep    2
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    Page Should Contain Element    class:failed

checkout099
    [Documentation]    1.进入支付界面2.B端删除本次购买所选的支付方式3.点击支付    购买失败，进入支付失败界面
    [Tags]    P0
    Add Payment    #.添加支付方式
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    ${locator_checkout_payment_ipaylinks_elm}
    delPaymentPk    #. 调用关键字删除刚添加的支付方式
    Sleep    2
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    Page Should Contain Element    class:failed
checkout100
    [Documentation ]     1.进入支付界面2.B端删除本次购买所选的物流  3.点击支付
    [Tags]    P0
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    delShipping_py    #. 调用关键字删除刚添加的物流方式
    Sleep    2
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    Page Should Contain Element    class:failed
checkout101
    [Documentation]    支付失败 1.点击Pay again 2.查看结果   返回支付界面
    [Tags]    P0
    Add Cod Payment    #.添加支付方式
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    delPaymentCod    #. 调用关键字删除刚添加的支付方式
    Sleep    2
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    Wait And Click Element    id:payagain
    Page Should Contain Element    class:cart-title

*** Keywords ***
Checkout_Common_Show_Element
    [Documentation]    封装 进入checkout界面 显示购买的商品，地址......
    [Arguments]    ${click_element}    ${check_elements}
    Checkout Common Setp
    Wait And Click Element    ${click_element}
    Wait Until Page Contains Locator    ${check_elements}

Checkout Common Step
    #.登陆
    Login With Default User
    #.添加中国的物流
    kwshipping.add_shipping_py
    #.添加一个上架商品
    kwproduct.add_launched_product_py

Click Preview Step
    [Documentation]    点击预览的公共步骤
    Go To Product Management Page
    Sleep Time
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Sleep Time
    Select Window    New
    Sleep Time

Common Teardown
    [Documentation]    结束公共步骤
    Close Test Suite Browser
    kwshipping.delShipping_py
   