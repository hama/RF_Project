*** Settings ***
Documentation     税费设置功能测试
Suite Setup       Taxprice Page Suite Setup
Suite Teardown    Taxprice Page Suite Teardown
Test Setup        Taxprice Page Test Setup
Test Teardown     Teardown Test Case
Force Tags        tax
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***

taxPrice001
    [Documentation]    测试税金界面可以正常进入
    [Tags]    P0    threshold   smoke
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
    Wait Until Page Not Contains Text       China
    kwshipping.add_shipping_with_conf_py

taxPrice007
    [Documentation]    测试国家栏后面的开启关闭按钮正常
    [Tags]    P0    threshold   smoke
    Click Element  ${locatorB_taxPrice_switch_list}[0]
    Wait Until Page Contains Text   设置成功
    判断是否真的按钮转换了
    Wait Until Page Contains Locator  ${locatorB_taxPrice_switch_list}
    #测试商品购买不收取税费
    Checkout Case Setup
    #初始化物流信息
    kwshipping.del_all_shipping_py
    kwshipping.add_shipping_with_conf_py
    #创建60的税费
    kwtax.add_default_tax_price_py
    #添加是shipping address
    Sleep    2
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    #.选择中国
    Wait And Select From List By Label    ${locatorB_checkout_address_select_country}    China
    #查看商品扣除60%税费后的金额
    Text Of Element Should Be Equal With Wait    ${locatorC_checkout_shipping_total}    $444.00

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

