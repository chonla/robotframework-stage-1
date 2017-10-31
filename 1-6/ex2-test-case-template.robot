*** Settings ***
Library    SeleniumLibrary
Suite Setup    Go To Login Page
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${VALID_USERNAME}    demouser
${VALID_PASSWORD}    demopassword

*** Test Cases ***
Invalid Credential Should Fail
    [Template]    Login With Invalid Credentials Should Fail
    invalid              ${VALID_PASSWORD}
    ${VALID_USERNAME}    invalid
    invalid              invalid
    ${EMPTY}             ${VALID_PASSWORD}
    ${VALID_USERNAME}    ${EMPTY}
    ${EMPTY}             ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Login With Credential    ${username}    ${password}
    Invalid Username Or Password Error Modal Should Be Displayed
    [Teardown]    Reset Test

Sign Out
    Click Element    signout

Go To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Click Element    signin

Login With Credential
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button

Enter Username
    [Arguments]    ${username}
    Input Text    inputUser    ${username}

Enter Password
    [Arguments]    ${password}
    Input Password    inputPassword    ${password}

Click Login Button
    Click Button    buttonLogin

Invalid Username Or Password Error Modal Should Be Displayed
    Retry    Element Should Be Visible    errorModal
    Element Should Contain    errorModal    ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง

Retry
    [Arguments]    @{args}
    Wait Until Keyword Succeeds    5s    3s    @{args}

Reset Test
    Wait Until Element Is Visible    close-error-modal-button
    Click Button    close-error-modal-button
    Wait Until Element Is Not Visible    close-error-modal-button
    Clear Text Field    inputUser
    Clear Text Field    inputPassword

Clear Text Field
    [Arguments]    ${locator}
    ${value}=    Get Value    ${locator}
    ${length}=    Get Length    ${value}    
    :FOR    ${index}    IN RANGE    ${length}
    \    Press Key    ${locator}    \\8