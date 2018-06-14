*** Settings ***
Library           SeleniumLibrary
Library           ../../../lib/customLibrary
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/kw_login.robot


*** Variables ***
${xpath_a}        //*[@id=“root”]/div/div/div[1]/div[1]/div/div
${xpath_b}        //*[@id="root"]/div/div/div[1]/div[1]/d../../../li[9]/div
${xpath_c}        //*[@id="9$Menu"]/li[3]/a
