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
    Page Should Be Redirected To Create Item Form

*** Keywords ***
Go To Create Item Page
    [Documentation]    Too complicated keyword. One keyword does many detailed things.
    [Tags]    bad
    Open Browser    ${URL}    ${BROWSER}
    Click Element    go_to_signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin
    Click Element    go_to_create_item

Page Should Be Redirected To Create Item Form
    Location Should Be    ${URL}/create-item.html
