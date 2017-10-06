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
After Login Should Redirect To Dashboard
    Go To Login Page
    Login With Valid Credential
    Page Should Be Redirected To Dashboard

*** Keywords ***
Go To Test Site
    Open Browser    ${URL}    ${BROWSER}

Go To Login Page
    Click Element    go_to_signin

Login With Valid Credential
    Enter Username    ${USERNAME}
    Enter Password    ${PASSWORD}
    Click Login Button

Enter Username
    [Arguments]    ${username}
    Input Text    inputUser    ${username}

Enter Password
    [Arguments]    ${password}
    Input Password    inputPassword    ${password}

Click Login Button
    Click Element    buttonLogin

Page Should Be Redirected To Dashboard
    Location Should Be    ${URL}/dashboard.html
