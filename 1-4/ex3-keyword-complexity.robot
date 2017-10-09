*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword

*** Test Cases ***
After Success Login, Page Should Be Redirected To Dashboard - To Complicated
    Open Browser And Go To Test Site And Go To Login Page And Login With Valid Credential
    Page Should Be Redirected To Dashboard

*** Keywords ***
Open Browser And Go To Test Site And Go To Login Page And Login With Valid Credential
    Open Browser    ${URL}    ${BROWSER}
    Click Element    go_to_signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin

Page Should Be Redirected To Dashboard
    Location Should Be    ${URL}/dashboard.html
