*** Settings ***
Suite Setup       Tracking Suite Setup
Suite Teardown    Close Test Suite Browser
Test Setup        Tracking Testcase Setup
Test Teardown     Tracking Testcase Teardown
Force Tags        tracking
Resource          public_testtracking_cases.robot

*** Test Cases ***
SnowInSummer_tracking001
    [Documentation]    google、神策、facebook的pageview事件上报
    [Tags]
    tracking001

SnowInSummer_tracking002
    [Documentation]    google、神策、facebook的addtocart事件上报
    [Tags]
    tracking002

SnowInSummer_tracking003
    [Documentation]    facebook的"进入Cartcheckout次数"事件上报(购物车的结账)
    [Tags]
    tracking003

SnowInSummer_tracking004
    [Documentation]    facebook的"进入detail_buynow次数"事件上报(详情页面的立即购买)
    [Tags]
    tracking004

SnowInSummer_tracking005
    [Documentation]    ga的cart页面"checkout"上报事件
    [Tags]
    tracking005

SnowInSummer_tracking006
    [Documentation]    sc的cart页面"checkout"上报事件
    [Tags]
    tracking006

SnowInSummer_tracking007
    [Documentation]    google、神策、facebook的填写支付信息上报事件
    [Tags]
    tracking007

SnowInSummer_tracking008
    [Documentation]    facebook —》进入checkout_result 且是成功页面的次数 -》上报事件
    [Tags]
    tracking008

SnowInSummer_tracking009
    [Documentation]    ga —》进入checkout_result 且是成功页面的次数 -》上报事件
    [Tags]
    tracking009

SnowInSummer_tracking010
    [Documentation]    sc —》进入checkout_result 且是成功页面的次数 -》上报事件
    [Tags]
    tracking010

SnowInSummer_tracking011
    [Documentation]    google、神策、facebook -》点击搜索的次数 -》上报事件
    [Tags]
    tracking011

*** Keywords ***
Tracking Suite Setup
	[Documentation]
	&{conf}=   Create Dictionary
	...    login_url=https://accounts.shoplazza.com
	...    home_page_url=${b_url}
	...    contact=trackingtest@autotest.com
	...    password=123456
	...    domain=trackingtest
	${cookie}    Login.login_b_py    &{conf}

	kwthemes.change_themes_by_name_py    Snow in Summer    ${cookie}
	Sleep    3
	Open Test Browser    ${c_url}
	Open New And Close Other Windows    ${c_url}