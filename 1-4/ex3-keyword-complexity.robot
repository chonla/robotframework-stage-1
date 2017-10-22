*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword

*** Test Cases ***
Open Create Item Form
    Go To Create Item Page
    Page Should Be Redirected To Create Customer Form

*** Keywords ***
Go To Create Item Page
    [Documentation]    Too complicated keyword. One keyword does many detailed things.
    [Tags]    bad
    Open Browser    ${URL}    ${BROWSER}
    Click Element    signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin
    Retry    Location Should Be    ${URL}/#/user/dashboard
    Click Element    create-customer

Page Should Be Redirected To Create Customer Form
    Retry    Location Should Be    ${URL}/#/user/create-customer

Retry
    [Arguments]    @{args}
    Wait Until Keyword Succeeds    5s    1s    @{args}
