*** Settings ***
Resource          ../../resources/kw_payment.robot
Library           /usr/local/lib/python2.7/site-packages/customLibrary
Library           Selenium2Library
Resource          ../../resources/var_tax_price.robot
Resource          ../../resources/kw_browser.robot

*** Variables ***
${xpath_a}        //*[@id=“root”]/div/div/div[1]/div[1]/div/div
${xpath_b}        //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
${xpath_c}        //*[@id="9$Menu"]/li[4]/a
