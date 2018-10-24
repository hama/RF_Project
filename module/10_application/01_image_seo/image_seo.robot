*** Settings ***
Suite Setup       Shipping Suite Setup
Suite Teardown    Shipping Suite Teardown
Test Setup        Shipping Case Setup
Test Teardown     Shipping Case Teardown
Force Tags        image seo
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***

seoImage006
    [Documentation]     验证alt文本设置为【商品标题】，可保存成功且生效
    [Tags]    P0    threshold    smoke
    Wait And Input Text    ${locatorB_seolmage_input_commodityTitle}    ${empty}
    Wait And Input Text    ${locatorB_seolmage_input_commodityTitle}    [图片seo]
    ${rel}    Get Value  ${locatorB_seolmage_input_commodityTitle}
    Wait And Click Element    ${locatorB_seolmage_but_saveAlt}
    Element Attribute Should Contain With Wait    ${locatorB_seolmage_but_saveAlt}     disabled    ${empty}
    Wait Until Page Contains Text    网站所有图片已设置为${rel}
    Reload Page And Start Ajax
    Value Of Element Should Be Equal With Wait    ${locatorB_seolmage_input_commodityTitle}     [图片seo]

seoImage007
    [Documentation]     验证alt文本设置为【店铺名】，可保存成功且生效
    [Tags]    P0    threshold    smoke
    Wait And Input Text    ${locatorB_seolmage_input_commodityTitle}    ${empty}
    Wait And Input Text    ${locatorB_seolmage_input_commodityTitle}    [图片seo]-[店铺名设置]
    ${rel}    Get Value  ${locatorB_seolmage_input_commodityTitle}
    Wait And Click Element    ${locatorB_seolmage_but_saveAlt}
    Element Attribute Should Contain With Wait    ${locatorB_seolmage_but_saveAlt}     disabled    ${empty}
    Wait Until Page Contains Text    网站所有图片已设置为${rel}
    Reload Page And Start Ajax
    Value Of Element Should Be Equal With Wait    ${locatorB_seolmage_input_commodityTitle}     [图片seo]-[店铺名设置]

seoImage008
    [Documentation]     验证alt文本设置为[商品标题]、[商品分类]、[供应商]、[店铺名]，可保存成功且生效
    [Tags]    P0    threshold    smoke
    Wait And Input Text    ${locatorB_seolmage_input_commodityTitle}    ${empty}
    Wait And Input Text    ${locatorB_seolmage_input_commodityTitle}    [图片seo]-[系统商品]-[店匠]-[店铺名设置]
    ${rel}    Get Value  ${locatorB_seolmage_input_commodityTitle}
    Wait And Click Element    ${locatorB_seolmage_but_saveAlt}
    Element Attribute Should Contain With Wait    ${locatorB_seolmage_but_saveAlt}     disabled    ${empty}
    Wait Until Page Contains Text    网站所有图片已设置为${rel}
    Reload Page And Start Ajax
    Value Of Element Should Be Equal With Wait    ${locatorB_seolmage_input_commodityTitle}     [图片seo]-[系统商品]-[店匠]-[店铺名设置]

seoImage009
    [Documentation]     验证alt文本设置为【商品分类】，可保存成功且生效
    [Tags]    P0    threshold    smoke
    Wait And Input Text    ${locatorB_seolmage_input_commodityTitle}    ${empty}
    Wait And Input Text    ${locatorB_seolmage_input_commodityTitle}    [商品分类-系统商品]
    ${rel}    Get Value  ${locatorB_seolmage_input_commodityTitle}
    Wait And Click Element    ${locatorB_seolmage_but_saveAlt}
    Element Attribute Should Contain With Wait    ${locatorB_seolmage_but_saveAlt}     disabled    ${empty}
    Wait Until Page Contains Text    网站所有图片已设置为${rel}
    Reload Page And Start Ajax
    Value Of Element Should Be Equal With Wait    ${locatorB_seolmage_input_commodityTitle}     [商品分类-系统商品]

seoImage010
    [Documentation]     验证alt文本设置为【供应商】，可保存成功且生效
    [Tags]    P0    threshold    smoke
    Wait And Input Text    ${locatorB_seolmage_input_commodityTitle}    ${empty}
    Wait And Input Text    ${locatorB_seolmage_input_commodityTitle}    [供应商-店匠]
    ${rel}    Get Value  ${locatorB_seolmage_input_commodityTitle}
    Wait And Click Element    ${locatorB_seolmage_but_saveAlt}
    Element Attribute Should Contain With Wait    ${locatorB_seolmage_but_saveAlt}     disabled    ${empty}
    Wait Until Page Contains Text    网站所有图片已设置为${rel}
    Reload Page And Start Ajax
    Value Of Element Should Be Equal With Wait    ${locatorB_seolmage_input_commodityTitle}     [供应商-店匠]
