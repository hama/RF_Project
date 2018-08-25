*** Settings ***


*** Keywords ***
Logout
    Wait And Click Element    dom:document.querySelectorAll("i[class~='hd-line-center']")[0]
    Wait And Click Element    dom:document.querySelectorAll("div[class='account_content___18o60'] a")[1]