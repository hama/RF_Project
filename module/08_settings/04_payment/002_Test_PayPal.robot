*** Settings ***
Documentation     Test payment price page ui.
Suite Setup       New Test Suite Browser And Login    1004714019@qq.com    123456    test
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        payment
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot    # import ajax listener keyword

*** Test Cases ***
