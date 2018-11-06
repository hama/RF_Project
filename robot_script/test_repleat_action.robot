*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
#Test Setup        Login Testcase Setup
Test Teardown     Teardown Test Case
Force Tags        repeat action
Resource          ../resources/keywords/kw_common.robot

*** Variables ***
${locatorB_tax_icon_setting}    dom:document.querySelectorAll('[class="djfont setting icon_custom___3gJ6J undefined"]')
${locatorB_tax_popup_firstInput}    dom:document.querySelectorAll('[type="text"]')[0]
${locatorB_tax_popup_save}    dom:document.querySelectorAll('[class*="save"]')[0]


*** Testcases ***
Test Tax Settings
	Go To Tax Page
	Sleep    10
	@{items}    Wait And Get Items List From Locator    ${locatorB_tax_icon_setting}
	:FOR    ${item}    IN    @{items}
	\    Wait And Click Element    ${item}
	\    Wait And Input Text    ${locatorB_tax_popup_firstInput}    1
	\    Wait And Click Element    ${locatorB_tax_popup_save}
	\    Wait Until Page Not Contains Locator    ${locatorB_tax_popup_save}




*** keyword ***
