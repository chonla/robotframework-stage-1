*** Settings ***
Library    SeleniumLibrary
Test Setup    Go To Create Item Page
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword

*** Test Cases ***
Go To Create Iteam Page And Capture Screenshot
    Capture Page Screenshot    create-item-{index}-screen.png

*** Keywords ***
Go To Create Item Page
    Set Selenium Speed    0.1s
    Open Browser    ${URL}    ${BROWSER}
    Click Element    go_to_signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin
    Click Element    go_to_create_item