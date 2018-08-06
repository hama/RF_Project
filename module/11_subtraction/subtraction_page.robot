*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Force Tags        Subtraction
Library           ${CURDIR}/../../lib/customLibrary
Resource          ../../resources/kw_browser.robot
Resource          ../../resources/kw_common.robot
Resource          ../../resources/var_subtraction.robot
Resource          ../../resources/kw_add_order.robot
Resource          ../../resources/kw_order.robot
Resource          ../../resources/kw_products.robot

*** Test Cases ***
mnmnmnmn
    delSubtraction
    subtraction_common_change_name    gggggg    2


subtraction001
    [Documentation]    进入满减活动界面，查看左上角标题
    [Tags]    P0
    Go To Subtraction Page
    Page Should Contain    ${locator_contentB_subtraction_text}

subtraction002
    [Documentation]    进入全部满减活动界面
    [Tags]    P0
    Go To Subtraction Page
    # 调用添加一个满减活动关键字 - 状态为：进行中
    addSubtraction    1
    Go To Subtraction Page
    Page Should Contain Element    ${locator_ContentB_first_tr_eml}
    delSubtraction    #.删除满减活动

subtraction003
    [Documentation]    进入未开始满减活动界面
    [Tags]    P0
    Go To Subtraction Page
    #.添加一个未开始的活动
    addSubtraction    2
    Wait And Click Element    ${locator_ContentB_title_not_start}
    Page Should Contain Element    ${locator_ContentB_first_tr_eml}
    ${data}    Get Text    ${locator_ContentB_get_status_text}
    Should Be True    '${data}'=='未开始'
    delSubtraction    #.删除满减活动

subtraction004
    [Documentation]    进入-进行中满减活动界面
    [Tags]    P0
    Go To Subtraction Page
    #.添加一个进行中的活动
    addSubtraction    1
    Wait And Click Element    ${locator_ContentB_title_processing}
    ${data}    Get Text    ${locator_ContentB_get_status_text}
    Should Be True    '${data}'=='进行中'
    delSubtraction    #.删除满减活动

subtraction005
    [Documentation]    进入已结束满减活动界面
    [Tags]    P0
    Go To Subtraction Page
    #.添加一个已结束的活动
    ${aa}    addSubtraction    3
    Sleep    6
    Wait And Click Element    ${locator_ContentB_title_end}
    ${data}    Get Text    ${locator_ContentB_get_status_text}
    Should Be True    '${data}'=='已结束'
    delSubtraction    #.删除满减活动
subtraction010
    [Documentation]    活动状态未开始修改名称
    [Tags]    P0
    Go To Subtraction Page
    #.添加一个未开始的活动

*** Keyword ***
subtraction_common_change_name
    [Documentation]    修改活动状态
    [Arguments]    ${value}    ${status}    ${parments}=False
    addSubtraction    ${status}
    Go To Subtraction Page
    #.添加一个已结束的活动
    addSubtraction    ${status}
    Sleep    5
    Wait And Click Element    ${locator_ContentB_title_all}
    ${data}    Get Text    dom:document.querySelectorAll("tbody tr td")[1]
    Wait And Click Element    ${locator_ContentB_first_tr_eml}
    Wait And Input Text    ${locator_ContentB_edit_input_name}    ${value}
    Wait And Click Element    ${locator_ContentB_first_btn_save}
    Run keyword If    '${parments}'=='False'    Should Not Be True    '${data}'=='${value}'
    ...    ELSE    Should Be True    '${data}'=='${value}'
