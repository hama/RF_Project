*** Settings ***
Documentation     测试 满减活动
Suite Setup       Subtraction Suite Setup
Suite Teardown    Subtraction Suite Teardown
Test Setup        Subtraction Case Setup
Test Teardown     Subtraction Case Teardown
Force Tags        subtraction
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
activitie_001
    [Documentation]    可查全部状态的活动
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    kwrebate.add_finish_rebate_py
    kwrebate.add_doing_rebate_py
    Reload Page And Start Ajax
    Sleep And Click Element    ${locatorB_subtractionsMain_tab_ActivityAll}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityStatus}[0]   进行中
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityStatus}[1]    已结束
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityStatus}[2]    未开始
    ${rebateNum}=    kwrebate.get_all_rebates_count_py
    Text Of Element Should Contain With Wait    ${locatorB_subtractionsMain_text_pageinationTotal}    ${rebateNum}

activitie_002
    [Documentation]    可查未开始状态的活动
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    kwrebate.add_doing_rebate_py
    kwrebate.add_finish_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_tab_ActivityNoStart}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityStatus}    未开始

activitie_003
    [Documentation]    可查进行中状态的活动
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    kwrebate.add_doing_rebate_py
    kwrebate.add_finish_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_tab_ActivityUnderWay}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityStatus}    进行中

activitie_004
    [Documentation]    可查已结束状态的活动
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    kwrebate.add_doing_rebate_py
    kwrebate.add_finish_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_tab_ActivityFinish}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityStatus}    已结束

activitie_005
    [Documentation]    名称精确查询
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    满减活动002
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Wait And Input Text    ${locatorB_subtractionsMain_input_KeywordSearch}    满减活动002
    Sleep And Click Element    ${locatorB_subtractionsMain_button_KeywordSearch}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    满减活动002

activitie_006
    [Documentation]    名称为空查询
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Wait And Input Text    ${locatorB_subtractionsMain_input_KeywordSearch}    ${Empty}
    Wait And Click Element    ${locatorB_subtractionsMain_button_KeywordSearch}
    ${rebateNum}=    kwrebate.get_all_rebates_count_py
    Text Of Element Should Contain With Wait    ${locatorB_subtractionsMain_text_pageinationTotal}    ${rebateNum}

activitie_007
    [Documentation]    名称模糊查询
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    满减活动_12345
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Wait And Input Text    ${locatorB_subtractionsMain_input_KeywordSearch}    满减活动
    Sleep And Click Element    ${locatorB_subtractionsMain_button_KeywordSearch}
    Text Of Element Should Contain With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    满减活动

activitie_008
    [Documentation]    名称特殊符号查询
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    满减活动特殊符号&*¥
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Wait And Input Text    ${locatorB_subtractionsMain_input_KeywordSearch}    &*
    Sleep And Click Element    ${locatorB_subtractionsMain_button_KeywordSearch}
    Text Of Element Should Contain With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    &*

activitie_020
    [Documentation]    新建活动，1件商品添加新建
    [Tags]    P1    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    新建-添加1件活动商品
    Wait And Click Element    ${locatorB_subtractionNew_button_selectSomeProduct}
    Wait And Click Element    ${locatorB_subtractionNew_icon_addSomeProduct}
    Wait And Click Element    ${locatorB_subtractionNew_SelectProduct_checkbox_selectProductfist}
    Wait And Click Element     ${locatorB_subtractionNew_SelectProduct_button_SelectProductSave}
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Text Of Element Should Contain With Wait    ${locatorB_subtractionsMain_text_firstActivityName}[0]    新建-添加1件活动商品
    Text Of Element Should Contain With Wait    ${locatorB_subtractionsMain_text_firstActivityRange}[0]    部分商品

activitie_021
    [Documentation]    新建活动，全选商品添加
    [Tags]    P1    threshold
    kwproduct.add_max_product_py
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Text Of Element Should Contain With Wait    ${locatorB_subtractionsMain_text_firstActivityRange}[0]    全场

activitie_022
    [Documentation]    新建活动，添加下架商品
    [Tags]    P1    threshold
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Click Element    ${locatorB_subtractionNew_button_selectSomeProduct}
    Wait And Click Element    ${locatorB_subtractionNew_icon_addSomeProduct}
    Wait And Click Element    ${locatorB_subtractionNew_SelectProduct_checkbox_selectProductfist}
    Wait And Click Element     ${locatorB_subtractionNew_SelectProduct_button_SelectProductSave}
    Wait Until Page Contains Text    未上架
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Text Of Element Should Contain With Wait    ${locatorB_subtractionsMain_text_firstActivityRange}[0]    部分商品

activitie_053
    [Documentation]    未开始活动，可以删除
    [Tags]    P1    threshold
    kwrebate.add_finish_rebate_py
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    ${locatorB_subtractionsMain_icon_firstActivityPreview}
    Sleep    2
    ${beforeActivityID}=    Wait And Get Text    ${locatorB_subtractionsMain_text_firstActivityID}
    Wait And Click Element Then Confirm    ${locatorB_subtractionsMain_icon_firstActivityDelete}
    Reload Page And Start Ajax
    Sleep    2
    ${afterActivityID}=    Wait And Get Text    ${locatorB_subtractionsMain_text_firstActivityID}
    Should Be True    $beforeActivityID!=$afterActivityID

activitie_066
    [Documentation]    同时间，商品已参加其他活动，不能重复
    [Tags]    P1    threshold
    kwproduct.add_max_product_py
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Add Activity Same Time
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Contains Text   该时段已存在其他全部商品范围的活动，请选择其他时段

activitie_067
    [Documentation]    不同时间，商品已参加其他活动，正常添加
    [Tags]    P1    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Click Element    ${locatorB_subtractionNew_button_selectSomeProduct}
    Wait And Click Element    ${locatorB_subtractionNew_icon_addSomeProduct}
    Wait And Click Element    ${locatorB_subtractionNew_SelectProduct_checkbox_selectProductfist}
    Sleep And Click Element     ${locatorB_subtractionNew_SelectProduct_button_SelectProductSave}
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Text Of Element Should Contain With Wait    ${locatorB_subtractionsMain_text_firstActivityRange}[0]    部分商品

activitie_080
    [Documentation]    验证活动名称可以为字母
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    rebateActivity
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    rebateActivity

activitie_081
    [Documentation]    验证活动名称可以为数字
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    1234567890
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    1234567890

activitie_082
    [Documentation]    验证活动名称可以为中文
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    满减活动中文字符测试
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    满减活动中文字符测试

activitie_083
    [Documentation]    验证活动名称可以为字母加数字
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    activity123456
    Sleep And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Not Contains Locator    ${locatorB_subtractionNew_button_addActivitySave}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    activity123456

activitie_090
    [Documentation]    验证开始时间大于当前时间，活动未开始
    [Tags]    P1    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityStatus}    未开始

activitie_091
    [Documentation]    验证开始时间等于当前时间，活动进行中
    [Tags]    P1    threshold
    kwrebate.add_doing_rebate_py
    Reload Page And Start Ajax
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityStatus}    进行中