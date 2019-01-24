*** Settings ***
Suite Setup       Tracking Suite Setup
Suite Teardown    Close Test Suite Browser
Test Setup        Tracking Testcase Setup
Test Teardown     Tracking Testcase Teardown
Force Tags        tracking
Resource          public_testtracking_cases.robot

*** Test Cases ***
tracking001
    [Documentation]    google、神策、facebook的pageview事件上报
    [Tags]
    tracking001

tracking002
    [Documentation]    google、神策、facebook的addtocart事件上报
    [Tags]
    tracking002

tracking003
    [Documentation]    facebook的"进入Cartcheckout次数"事件上报(购物车的结账)
    [Tags]
    tracking003

tracking004
    [Documentation]    facebook的"进入detail_buynow次数"事件上报(详情页面的立即购买)
    [Tags]
    tracking004

tracking005
    [Documentation]    ga的cart页面"checkout"上报事件
    [Tags]
    tracking005

tracking006
    [Documentation]    sc的cart页面"checkout"上报事件
    [Tags]
    tracking006

tracking007
    [Documentation]    google、神策、facebook的填写支付信息上报事件
    [Tags]
    tracking007

tracking008
    [Documentation]    facebook —》进入checkout_result 且是成功页面的次数 -》上报事件
    [Tags]
    tracking008

tracking009
    [Documentation]    ga —》进入checkout_result 且是成功页面的次数 -》上报事件
    [Tags]
    tracking009

tracking010
    [Documentation]    sc —》进入checkout_result 且是成功页面的次数 -》上报事件
    [Tags]
    tracking010

tracking011
    [Documentation]    google、神策、facebook -》点击搜索的次数 -》上报事件
    [Tags]
    tracking011

*** Keywords ***
Tracking Suite Setup
	[Documentation]
	kwthemes.change_themes_by_name_py    Black wind
	Sleep    3
	Open Test Browser    ${url}
	Open New And Close Other Windows    ${url}