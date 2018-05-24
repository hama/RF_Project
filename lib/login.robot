*** Settings ***
Library           /usr/local/lib/python2.7/site-packages/Selenium2Library

*** Variables ***
${url}            http://admin1024.shoplazza.com

*** Test Cases ***
case
    Open Browser    ${url}    google chrome
    sleep    2
    Input Text    id=account    18826557090
    input Password    id=password    147258
    Sleep    2
    click button    //*[@id="root"]/div/div/form/div[4]/button
    sleep    2
    page should contain element    //*[@id="root"]/div/div/div[1]/div[2]/div[1]/div/div[1]/span
    close browser
