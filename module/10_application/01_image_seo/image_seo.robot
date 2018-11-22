*** Settings ***
Suite Setup       Application Suite Setup
Suite Teardown    Application Suite Teardown
Test Setup        Application Case Setup
Test Teardown     Application Case Teardown
Force Tags        image seo
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_application.robot

*** Test Cases ***

seoImage001
    [Documentation]    验证‘列表页’展示正确
    [Tags]    P0
    Wait Until Page Contains Text    图片SEO
    Wait Until Page Contains Text    设置商品ALT标签提高网站Goolge图片搜索的排名

seoImage002
    [Documentation]    验证‘详情页‘样式显示位置和文案正确
    [Tags]    P0
    Wait And Click Element    ${locatorB_applicationSeo_imgBlock_seoicon}
    Wait Until Page Contains Text    图片SEO
    Wait Until Page Contains Text    Google图片搜索高度重视图片Alt标签 ，设置商品Alt标签提高网站Goolge图片搜索的排名。
    Wait Until Page Contains Text    设置ALT文本格式
    Wait Until Page Contains Locator    ${locatorB_applicationSeo_input_textForm}
    Wait Until Page Contains Locator    ${locatorB_applicationSeo_span_textBth}