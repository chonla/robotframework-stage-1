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
    Go To Login Page
    Login With Valid Credential
    Page Should Be Redirected To Dashboard

After Success Login, Page Should Redirect To Dashboard - Too Long
    Open Login Page By Clicking Sign In Link On Home Page
    Input Valid Username And Valid Password Into Login Form And Click Login Button
    Login Should Be Success And Page Should Be Redirected To Dashboard

After Success Login, Page Should Redirect To Dashboard - Too Short
    Go Login
    Login
    Should Be Dashboard

After Success Login, Page Should Redirect To Dashboard - Unnecessary documentation
    [Documentation]    Open browser and go to login page and then login with a valid credential.
    ...                Page should be redirected to dashboard page.
    Go To Login Page
    Login With Valid Credential
    Page Should Be Redirected To Dashboard

*** Keywords ***
Go To Test Site
    Open Browser    ${URL}    ${BROWSER}

Open Login Page By Clicking Sign In Link On Home Page
    Click Element    go_to_signin

Go To Login Page
    Click Element    go_to_signin

Go Login
    Click Element    go_to_signin

Login
    Enter Username    ${USERNAME}
    Enter Password    ${PASSWORD}
    Click Login Button

Input Valid Username And Valid Password Into Login Form And Click Login Button
    Enter Username    ${USERNAME}
    Enter Password    ${PASSWORD}
    Click Login Button

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

Login Should Be Success And Page Should Be Redirected To Dashboard
    Location Should Be    ${URL}/dashboard.html

Page Should Be Redirected To Dashboard
    Location Should Be    ${URL}/dashboard.html

Should Be Dashboard
    Location Should Be    ${URL}/dashboard.html
