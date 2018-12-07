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
    kwrebate.add_doing_rebate_py
    kwrebate.add_finish_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_tab_ActivityNoStart}
    Wait And Click Element    ${locatorB_subtractionsMain_tab_ActivityAll}
    Wait Until Page Contains Text    未开始
    Wait Until Page Contains Text    进行中
    Wait Until Page Contains Text    已结束
    Wait Until Page Contains Locator    ${locatorB_subtractionsMain_list_firstActivity}

activitie_002
    [Documentation]    可查未开始状态的活动
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    kwrebate.add_doing_rebate_py
    kwrebate.add_finish_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_tab_ActivityNoStart}
    Wait Until Page Contains Text    未开始
    Wait Until Page Contains Locator    ${locatorB_subtractionsMain_list_firstActivity}

activitie_003
    [Documentation]    可查进行中状态的活动
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    kwrebate.add_doing_rebate_py
    kwrebate.add_finish_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_tab_ActivityUnderWay}
    Wait Until Page Contains Text    进行中
    Wait Until Page Contains Locator    ${locatorB_subtractionsMain_list_firstActivity}

activitie_004
    [Documentation]    可查已结束状态的活动
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    kwrebate.add_doing_rebate_py
    kwrebate.add_finish_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_tab_ActivityFinish}
    Wait Until Page Contains Text    已结束
    Wait Until Page Contains Locator    ${locatorB_subtractionsMain_list_firstActivity}

activitie_005
    [Documentation]    名称精确查询
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_list_firstActivity}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    ${Empty}
    Sleep    1
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    满减活动搜索
    Sleep    1
    Wait And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait And Input Text    ${locatorB_subtractionsMain_input_KeywordSearch}    满减活动搜索
    Sleep    1
    Wait And Click Element    ${locatorB_subtractionsMain_button_KeywordSearch}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    满减活动搜索

activitie_006
    [Documentation]    名称为空查询
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_button_KeywordSearch}
    Wait Until Page Contains Locator    ${locatorB_subtractionsMain_list_firstActivity}

activitie_007
    [Documentation]    名称模糊查询
    [Tags]    P0    threshold
    kwrebate.add_doing_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_list_firstActivity}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    ${Empty}
    Sleep    1
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    满减活动模糊查询
    Sleep    1
    Wait And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait And Input Text    ${locatorB_subtractionsMain_input_KeywordSearch}    模糊
    Sleep    1
    Wait And Click Element    ${locatorB_subtractionsMain_button_KeywordSearch}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    模糊

activitie_008
    [Documentation]    名称特殊符号查询
    [Tags]    P0    threshold
    kwrebate.add_doing_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_list_firstActivity}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    ${Empty}
    Sleep    1
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    满减活动特殊富豪&*¥
    Sleep    1
    Wait And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait And Input Text    ${locatorB_subtractionsMain_input_KeywordSearch}    &*
    Sleep    1
    Wait And Click Element    ${locatorB_subtractionsMain_button_KeywordSearch}
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    &*

activitie_020
    [Documentation]    新建活动，1件商品添加新建
    [Tags]    P1    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Click Element    ${locatorB_subtractionNew_button_selectSomeProduct}
    Wait And Click Element    ${locatorB_subtractionNew_icon_addSomeProduct}
    Wait And Click Element    ${locatorB_subtractionNew_SelectProduct_checkbox_selectProductfist}
    Wait And Click Element     ${locatorB_subtractionNew_SelectProduct_button_SelectProductSave}
    Wait And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Contains Text    保存成功

activitie_021
    [Documentation]    新建活动，全选商品添加
    [Tags]    P1    threshold
    [Setup]    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_tab_ProductOn}
    Wait And Click Element    ${locatorB_productsMgmt_button_addNewProduct}
    Fill In Required Items When Create Product
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Reload Page And Start Ajax
    Go To Subtraction Page
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Sleep    2
    Wait And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Contains Text    保存成功

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
    Wait And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Wait Until Page Contains Text    保存成功

activitie_053
    [Documentation]    未开始活动，可以删除
    [Tags]    P1    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Sleep    5
    ${beforeActivityID}=    Wait And Get Text    ${locatorB_subtractionsMain_text_firstActivityID}
    Wait And Click Element Then Confirm    ${locatorB_subtractionsMain_icon_firstActivityDelete}
    Reload Page And Start Ajax
    ${afterActivityID}=    Wait And Get Text    ${locatorB_subtractionsMain_text_firstActivityID}
    Should Be True    $beforeActivityID!=$afterActivityID

activitie_066
    [Documentation]    同时间，商品已参加其他活动，不能重复
    [Tags]    P1    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Sleep    5
    ${getStartTime1}=    Wait And Get Text    ${locatorB_subtractionsMain_text_firstActivityTime}
    ${getStartTime2}=    Remove String    ${getStartTime1}    无期限
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Click Element    ${locatorB_subtractionNew_icon_ActivityTimeStart}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityTimeStart}    ${Empty}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityTimeStart}    ${getStartTime2}
    Wait And Click Element    ${locatorB_subtractionNew_button_ActivityTimeStart}
    Wait And Click Element    ${locatorB_subtractionNew_checkbox_ActivityTimeNoEnd}
    Wait And Click Element    ${locatorB_subtractionNew_button_selectSomeProduct}
    Wait And Click Element    ${locatorB_subtractionNew_icon_addSomeProduct}
    Wait Until Page Not Contains Locator   ${locatorB_subtractionNew_SelectProduct_checkbox_selectProductfist}

activitie_067
    [Documentation]    不同时间，商品已参加其他活动，不能重复
    [Tags]    P1    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_button_addActivity}
    Add Fill Rebate Activity
    Wait And Click Element    ${locatorB_subtractionNew_button_selectSomeProduct}
    Wait And Click Element    ${locatorB_subtractionNew_icon_addSomeProduct}
    Wait Until Page Not Contains Locator   ${locatorB_subtractionNew_SelectProduct_checkbox_selectProductfist}

activitie_080
    [Documentation]    验证活动名称可以为字母
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_list_firstActivity}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    ${Empty}
    Sleep    1
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    rebateActivity
    Sleep    1
    Wait And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    rebateActivity

activitie_081
    [Documentation]    验证活动名称可以为数字
    [Tags]    P0    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_list_firstActivity}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    ${Empty}
    Sleep    1
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    1234567890
    Sleep    1
    Wait And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    1234567890

activitie_082
    [Documentation]    验证活动名称可以为中文
    [Tags]    P1    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_list_firstActivity}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    ${Empty}
    Sleep    1
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    满减活动中文字符测试
    Sleep    1
    Wait And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Sleep    2
    Text Of Element Should Be Equal With Wait    ${locatorB_subtractionsMain_text_firstActivityName}    满减活动中文字符测试

activitie_083
    [Documentation]    验证活动名称可以为字母加数字
    [Tags]    P1    threshold
    kwrebate.add_before_rebate_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_subtractionsMain_list_firstActivity}
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    ${Empty}
    Sleep    1
    Wait And Input Text    ${locatorB_subtractionNew_input_ActivityName}    activity123456
    Sleep    1
    Wait And Click Element    ${locatorB_subtractionNew_button_addActivitySave}
    Sleep    2
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


activitie_092
    Advance Close Subtraction Activity