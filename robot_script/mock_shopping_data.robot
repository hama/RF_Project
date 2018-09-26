*** Settings ***
Suite Setup       Open Test Browser    ${url}
#Suite Teardown    Close Test Suite Browser
#Test Setup        Login Testcase Setup
#Test Teardown     Teardown Test Case
Force Tags        mock_shopping_data
#Library           ${CURDIR}/../lib/customLibrary
#Library           ${CURDIR}/../lib/testKeyWord/testKeyWord
#Resource          ../resources/variable/var_common.robot
#Variables         ${CURDIR}/../lib/customlib/customkeywords.py
#Library           ${CURDIR}/../lib/customlib/customkeywords.py
Resource          ../resources/keywords/kw_browser.robot
Resource          ../resources/keywords/kw_common.robot
Resource          ../resources/keywords/kw_checkout.robot

*** Variables ***
${url}    https://jolly.myshoplaza.com/search
${btn_quickView}    dom:document.querySelectorAll('[class="normal_btn product_btn"]')[0]
${img}    dom:document.querySelectorAll('img')[0]
${btn_addToCart}    dom:document.querySelectorAll('[class="footer-submit normal_btn"]')[0]
${btn_buyNow}    dom:document.querySelectorAll('[class="footer-submit second_btn"]')[0]
${btn_continue_checkout_complete}    dom:document.querySelectorAll('[class="btn checkout-btn fr"]')[0]
${icon_credit_card}    dom:document.querySelectorAll('[class="djfont card-checkout-credit"]')[0]
${icon_cod}    dom:document.querySelectorAll('[class="djfont card-checkout-cash"]')[0]
${btn_pay_again}    dom:document.querySelectorAll('[class="btn pay-btn"]')[0]

${icon_cart}    dom:document.querySelectorAll('[class="djfont dj-cart"]')[0]
${btn_checkout}    dom:document.querySelectorAll('[class~="checkout"]')[0]
${input_search}    dom:document.querySelectorAll('[placeholder="Search for..."]')[0]


*** Testcases ***
AddToCart_Checkout_with_Credit_Card
	:FOR    ${i}    IN RANGE    10
	\    kw_AddToCart_Checkout_with_Credit_Card
	\    Log    ${i}

BuyNow_with_Credit_Card
	:FOR    ${i}    IN RANGE    10
    \    kw_BuyNow_with_Credit_Card
    \    Log    ${i}

Searching
	:FOR    ${i}    IN RANGE    1
	\    kw_Searching
	\    Log    ${i}


*** keyword ***
kw_AddToCart_Checkout_with_Credit_Card
	Run Keyword And Ignore Error    Delete Cookie    client_id
	Run Keyword And Ignore Error    Reload Page
	Run Keyword And Ignore Error    Mouse Over    ${img}
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_quickView}
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_addToCart}
	Run Keyword And Ignore Error    Sleep    1
	Run Keyword And Ignore Error    Wait And Click Element    ${icon_cart}
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_checkout}
	Run Keyword And Ignore Error    Add Address Common Step
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_continue_checkout_complete}
	Run Keyword And Ignore Error    Wait And Click Element    ${icon_credit_card}
	Run Keyword And Ignore Error    Add Credit Card Info
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_continue_checkout_complete}
	Run Keyword And Ignore Error    Wait Until Page Contains Locator    ${btn_pay_again}
	Run Keyword And Ignore Error    Open New And Close Other Windows    ${url}

kw_BuyNow_with_Credit_Card
	Run Keyword And Ignore Error    Delete Cookie    client_id
	Run Keyword And Ignore Error    Reload Page
	Run Keyword And Ignore Error    Wait And Click Element    ${img}
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_buyNow}
	Run Keyword And Ignore Error    Add Address Common Step
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_continue_checkout_complete}
	Run Keyword And Ignore Error    Wait And Click Element    ${icon_cod}
	Run Keyword And Ignore Error    Sleep    1
	Run Keyword And Ignore Error    Wait And Click Element    ${btn_continue_checkout_complete}
	Run Keyword And Ignore Error    Wait Until Page Contains Text    Payment successful!
	Run Keyword And Ignore Error    Open New And Close Other Windows    ${url}

kw_Searching
#	Run Keyword And Ignore Error    Delete Cookie    client_id
#	Sleep    1
#	Run Keyword And Ignore Error    Reload Page
	Sleep    1
	Start Ajax Listener
	Run Keyword And Ignore Error    Wait And Input Text    ${input_search}    1111111
	Sleep    1
	Run Keyword And Ignore Error    Press Key    ${input_search}    ${keybord_enter}
	Sleep    1
	Run Keyword And Ignore Error    Wait Until Page Contains Text    Try something like.
	Sleep    1
	Log Error Response Of Ajax Listener
	Log Correct Response Of Ajax Listener
	Run Keyword And Ignore Error    Execute Javascript    window.open("${url}")
#	Run Keyword And Ignore Error    Open New And Close Other Windows    ${url}

