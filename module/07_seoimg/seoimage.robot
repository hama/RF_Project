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
seoImage006
    [Documentation]    验证alt文本设置为【商品标题】，可保存成功且生效 > 修改为[商品标题]，点击保存 > 提示网站所有图片已设置为[商品标题]，图片alt 显示为对应的商品标题
    [Tags]    P0    threshold
    ${name}    Set Variable    [商品标题] - [店铺名]
    Go To Application Page
    Sleep    2.5
    ${res}    Execute JavaScript    return document.querySelectorAll('#info')[0].value==''
    Run keyword If    '${res}'=='False'    Wait And Input Text    ${locatorB_seoLst_name_ipt}    ${name}
    Wait And Input Text    ${locatorB_seoLst_name_ipt}    ${name}
    Wait And Click Element    ${locatorB_seoLst_confirm_btn}
    Wait Until Page Contains    网站所有图片已设置为[商品标题] - [店铺名]

*** keywords ***
Common Suite
    [Documentation]    公共suite
    Login With Default User