*** Settings ***
Library           /usr/local/lib/python2.7/site-packages/Selenium2Library
Library           customLibrary

*** Variables ***
${addr}           /Users/dianjiang/shoplaza/shoplaza_mq

*** Test Cases ***
recover_pwd
    ${url}    set variable    http://admin1024.shoplazza.com/findpass
    ${domain}    set variable    ZPiX3lY
    ${email}    set variable    ZPiX3lY@g0yP.com
    open browser    ${url}    google chrome
    input text    id=username    ${domain}
    input text    id=account    ${email}
    click button    //*[@id="root"]/div/div/div/div/form/div[3]/div/div/button
    sleep    3
    import variables    ${addr}/recover_pwd.py
    sleep    3
    input text    id=code    ${res}
    sleep    2
    click button    //*[@id="root"]/div/div/div/div/form/div[5]/button
    sleep    4
    page should contain element    //*[@id="root"]/div/div/div/div/form/p[2]
    input password    id=password    456789
    input password    id=confirmpass    456789
    click button    //*[@id="root"]/div/div/div/div/form/div[3]/button
    sleep    3
    page should contain element    //*[@id="root"]/div/div
    close browser
