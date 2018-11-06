*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
#Test Setup        Login Testcase Setup
Test Teardown     Teardown Test Case
Force Tags        repeat action
Resource          ../resources/keywords/kw_common.robot

*** Variables ***
${locatorB_tax_icon_setting}    dom:document.querySelectorAll('[class="djfont setting icon_custom___3gJ6J undefined"]')
${locatorB_tax_text_countryName}    dom:document.querySelectorAll('[class*="ant-table-row-level-0"] div div p[style*="font-size: 12px"]:nth-child(1)')
${locatorB_tax_popup_firstInput}    dom:document.querySelectorAll('[type="text"]')[0]
${locatorB_tax_popup_save}    dom:document.querySelectorAll('[class*="save"]')[0]


*** Testcases ***
Test Tax Settings
	Go To Tax Page
	Sleep    10

	@{items}    Wait And Get Items List From Locator    ${locatorB_tax_icon_setting}
	@{items}    Wait And Get Items List From Locator    ${locatorB_tax_icon_setting}
	${len}    Get Element Count    ${locatorB_tax_icon_setting}
	:FOR    ${i}    IN Range   ${len}
	\    ${text}    Wait And Get Text    ${locatorB_tax_text_countryName}[${i}]
	\    Log    ${text}
	\    Wait And Click Element    @{items}[${i}]
	\    Wait And Input Text    ${locatorB_tax_popup_firstInput}    1
	\    Wait And Click Element    ${locatorB_tax_popup_save}
	\    Wait Until Page Not Contains Locator    ${locatorB_tax_popup_save}




*** keyword ***
