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
Go To Create Item Page And Capture Screenshot
    Capture Page Screenshot    create-item-{index}-screen.png

*** Keywords ***
Initialize Test
    Open Browser    ${URL}    ${BROWSER}
    Sign In With Valid Credential
    Go To Create Item Page

Sign In With Valid Credential
    Click Element    signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin
    Wait Until Keyword Succeeds    5s    1s    Location Should Be    ${URL}/#/user/dashboard

Go To Create Item Page
    Click Element    create-customer