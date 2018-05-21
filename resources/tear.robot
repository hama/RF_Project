*** Keywords ***
Custom Teardown
    Run Keyword If Test Passed    Capture Page Screenshot
    Run Keyword If Test Failed    Capture Page Screenshot
