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
    [Tags]    bad
    Open Login Page By Clicking Sign In Link On Home Page
    Input Valid Username And Valid Password Into Login Form And Click Login Button
    Login Should Be Success And Page Should Be Redirected To Dashboard

After Success Login, Page Should Redirect To Dashboard - Too Short
    [Tags]    bad
    Go Login
    Login
    Should Be Dashboard

After Success Login, Page Should Redirect To Dashboard - Unnecessary documentation
    [Documentation]    Open browser and go to login page and then login with a valid credential.
    ...                Page should be redirected to dashboard page.
    [Tags]    bad
    Go To Login Page
    Login With Valid Credential
    Page Should Be Redirected To Dashboard

After Success Login, Page Should Redirect To Dashboard - Repeating documentation
    [Tags]    bad
    # Open browser and go to login page
    Go To Login Page
    # Login with a valid credential
    Login With Valid Credential
    # Page should be redirected to dashboard page
    Page Should Be Redirected To Dashboard

*** Keywords ***
Go To Test Site
    Open Browser    ${URL}    ${BROWSER}

Open Login Page By Clicking Sign In Link On Home Page
    Click Element    signin

Go To Login Page
    Click Element    signin

Go Login
    Click Element    signin

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
    Retry    Location Should Be    ${URL}/#/user/dashboard

Page Should Be Redirected To Dashboard
    Retry    Location Should Be    ${URL}/#/user/dashboard

Should Be Dashboard
    Retry    Location Should Be    ${URL}/#/user/dashboard

Retry
    [Arguments]    @{args}
    Wait Until Keyword Succeeds    5s    1s    @{args}
