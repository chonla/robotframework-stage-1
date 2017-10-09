*** Settings ***
Library    SeleniumLibrary
Test Setup    Initialize Test
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword

*** Test Cases ***
Login
    Sign In With Valid Credential
    Location Should Be    ${URL}/dashboard.html

*** Keywords ***
Initialize Test
    Set Selenium Speed    0.1s
    Open Browser    ${URL}    ${BROWSER}

Sign In With Valid Credential
    Click Element    go_to_unstable_signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin
