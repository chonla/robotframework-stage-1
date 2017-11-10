*** Settings ***
Documentation    Complete Retry Keyword
Library    SeleniumLibrary
Test Setup    Go To Test Site
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword
${TIMEOUT}    5s
${INTERVAL_TIMEOUT}    1s

*** Test Cases ***
Slow Loading Form Should Be Rendered
    [Tags]   task
    Click Element    go_to_signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin
    Retry    Click Element    go_to_slow_form
    Retry    Element Should Be Visible    inputEmail
    Retry    Element Should Be Visible    buttonGoBack

*** Keywords ***
Go To Test Site
    Open Browser    ${URL}    ${BROWSER}

Retry
    [Arguments]    ${keyword}    @{args}

    #
    # Complete this keyword.
    #
    # Dealing With Slow Webpage
    # 
    # DO NOT use Sleep keyword.
    #
    # You can use "Wait Until Keyword Succeeds" to block execution until keyword is successfully executed.
    #
    # Usage of 
    #
    #     Wait Until Keyword Succeeds    retry    retry_interval    kw_name    *args
    #





    #
    #