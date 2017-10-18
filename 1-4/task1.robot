*** Settings ***
Library    SeleniumLibrary
Test Setup    Go To Test Site
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword

*** Test Cases ***
After Success Login, Page Should Redirect To Dashboard
    Click Element    go_to_signin
    Input Text    inputUser    ${USERNAME}
    Input Password    ${PASSWORD}
    Click Element    buttonLogin
    Click Element    go_to_create_item
    Location Should Be    ${URL}/create-item.html

*** Keywords ***
Go To Test Site
    Open Browser    ${URL}    ${BROWSER}
