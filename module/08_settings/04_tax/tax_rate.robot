*** Settings ***
Documentation     税费设置功能测试
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Test Setup        Taxprice Page Test Setup
Test Teardown     Teardown Test Case
Force Tags        tax
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***

taxPrice001
    [Documentation]    测试税金界面可以正常进入
    [Tags]    P0    threshold   smoke
    Go To Tax Page
    #加一个判断元素
    Wait Until Page Contains Text    ${locatorB_taxPrice_text_methodOfTax}



taxPrice005
    [Documentation]    测试在物流中添加的国家会显示在税金列表中
    [Tags]    P0    threshold   smoke
    Wait Until Page Contains Text   中国
    Wait Until Page Contains Text   China

taxPrice006
    [Documentation]    测试物流中删除已有的国家，税金列表中也会删除国家   >  1.进入物流界面删除国家：中国  2.进入税金界面查看
    [Tags]    P0    threshold   smoke
    Wait Until Page Contains Text   中国
    Wait Until Page Contains Text   China
    #删除物流信息
    kwshipping.del_all_shipping_py
    #刷新税金页面
    Reload Page And Start Ajax
    Wait Until Page Not Contains Text     中国
    Wait Until Page Not Contains Text     China

taxPrice007
    [Documentation]    测试国家栏后面的开启关闭按钮正常
    [Tags]    P0    threshold
    #初始化物流信息
    kwshipping.del_all_shipping_py
    #添加一个中国的物流信息
    kwshipping.add_shipping_with_conf_py
    #创建60的税费
    kwtax.add_default_tax_price_py
    Sleep    5
    #.关闭税费中的第一个国家税费
    Wait And Click Element    ${locatorB_taxPrice_switch_list}[0]
    Wait Until Page Contains Text   设置成功
    #判断是否真的按钮转换了
    Wait Until Page Contains Locator  ${locatorB_taxPrice_switch_list}[0]
    #添加一个444的商品
    kwproduct.add_launched_product_py
    #测试商品购买不收取税费
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    #添加是shipping address
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    #.选择中国
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    #查看商品扣除60%税费后的金额
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_shipping_total}    $444.00

taxPrice009
    [Documentation]    测试税金界面运费设置按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorC_taxPrice_icon_custom}
    Wait Until Page Contains Text     税费 = 税率 x 实付商品价格，例如：实付商品价为$1.00，税率为20%的商品需额外收取税费：1 X 20% = $0.20（如有小数，需四舍五入且保留两位小数）

taxPrice011
    [Documentation]    测试税金界面运费设置按钮
    [Tags]    P0    threshold   smoke
    Wait And Click Element  ${locatorB_taxPrice_button_shippingSet}
    Wait Until Page Contains Locator  ${locatorB_taxPrice_icon_shippingVender}

taxPrice012
    [Documentation]    测试国家栏后面的开启关闭按钮正常
    [Tags]    P0    threshold   smoke
    Click Element  ${locatorB_taxPrice_switch_list}[0]
    Wait Until Page Contains Text   设置成功
    #判断是否真的按钮转换了
    Wait Until Page Contains Locator  ${locatorB_taxPrice_switch_list}


taxPrice017
    [Documentation]    测试城市税金设置
    [Tags]    P0    threshold   smoke
    Wait And Click Element    ${locatorB_taxPrice_icon_set}
    Wait Until Page Contains Text   国家税率

