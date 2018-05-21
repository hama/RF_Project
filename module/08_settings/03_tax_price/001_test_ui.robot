*** Settings ***
Resource          ../../../Resources/Login.robot    # import login keyword

*** Test Cases ***
Test Tax Price Page
    # tax price page should be normal atfer login
    Open My Browser    ${home_page}
    Login With User    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
