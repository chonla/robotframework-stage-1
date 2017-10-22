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
After Login Success, Page Should Be Redirected To Dashboard
    Go To Login Page
    Login With Valid Credential
    Page Should Be Redirected To Dashboard

*** Keywords ***
Go To Test Site
    Open Browser    ${URL}    ${BROWSER}

Go To Login Page
    Click Element    signin

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
    Retry    Location Should Be    ${URL}/#/user/dashboard

Retry
    [Arguments]    @{args}
    Wait Until Keyword Succeeds    5s    1s    @{args}
