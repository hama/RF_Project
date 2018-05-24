*** Settings ***
Library           /usr/local/lib/python2.7/site-packages/Selenium2Library
Library           customLibrary

*** Variables ***
${url}            http://admin1024.shoplazza.com/register
${addr}           /Users/dianjiang/shoplaza/shoplaza_mq
${num}            chen
${pwd}            123456
${phone}          15220581724

*** Test Cases ***
registers
    open browser    ${url}    google chrome
    ${salt}    Salt
    input text    id=username    ${salt}
    input password    id=password    ${pwd}
    input password    id=confirmpass    ${pwd}
    ${email}    create str
    input text    id=account    ${email}
    sleep    1
    click button    //*[@id="root"]/div/div/div/div/form/div[5]/div/div/button
    sleep    3
    ${code}    select code
    input text    id=code    ${code}
    sleep    2
    click button    //*[@id="root"]/div/div/div/div/form/div[7]/button
    sleep    4
    page should contain element    //*[@id="root"]
    close browser
