*** Settings ***
Suite Setup       Common Suite
Suite Teardown    Close Test Suite Browser
Test Teardown     Teardown Test Case
Force Tags        Seo
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/variable/var_store.robot
Resource          ../../resources/variable/var_common.robot
Resource          ../../resources/variable/var_seoimage.robot
Library           ${CURDIR}/../../lib/customlib/kwstore.py

*** Test Cases ***
dddjdjjdjdjddjdj
    ${name}    Set Variable    [商品标题]、[商品分类]、[供应商]、[店铺名]
    Common Setting Name    ${name}


seoImage006
    [Documentation]    验证alt文本设置为【商品标题】，可保存成功且生效 > 修改为[商品标题]，点击保存 > 提示网站所有图片已设置为[商品标题]，图片alt 显示为对应的商品标题
    [Tags]    P0    threshold
    ${name}    Set Variable    [商品标题] - [店铺名]
    Common Setting Name    ${name}

seoImage007
    [Documentation]    验证alt文本设置为【店铺名】，可保存成功且生效 > 修改为[店铺名]，点击保存 > 提示网站所有图片已设置为[店铺名】，图片alt显示为对应的店铺名
    [Tags]    P0    threshold
    ${name}    Set Variable    [店铺名]
    Common Setting Name    ${name}

seoImage008
    [Documentation]    验证alt文本设置为[商品标题]、[商品分类]、[供应商]、[店铺名]，可保存成功且生效 > 提示网站所有图片已设置为【商品分类】，alt显示为对应的商品分类
    [Tags]    P0    threshold
    ${name}    Set Variable    [商品标题]、[商品分类]、[供应商]、[店铺名]
    Common Setting Name    ${name}

seoImage009
    [Documentation]    验证alt文本设置为【商品分类】，可保存成功且生效
    [Tags]    P0    threshold
    ${name}    Set Variable    [商品分类]
    Common Setting Name    ${name}

seoImage010
    [Documentation]    验证alt文本设置为[供应商]，可保存成功且生效
    [Tags]    P0    threshold
    ${name}    Set Variable    [供应商]
    Common Setting Name    ${name}


*** keywords ***
Common Suite
    [Documentation]    公共suite
    Login With Default User

Common Setting Name
    [Documentation]    公共设置名字的
    [Arguments]    ${name}
    ${new_name}    Evaluate    '网站所有图片已设置为'+'${name}'
    Go To Application Page
    Sleep    2.5
    ${res}    Execute JavaScript    return document.querySelectorAll('#info')[0].value==''
    Run keyword If    '${res}'=='False'    Wait And Input Text    ${locatorB_seoLst_name_ipt}    ${Empty}
    Wait And Input Text    ${locatorB_seoLst_name_ipt}    ${name}
    Wait And Click Element    ${locatorB_seoLst_confirm_btn}
    Wait Until Page Contains    ${new_name}
