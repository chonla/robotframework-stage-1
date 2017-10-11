*** Settings ***
Library    SeleniumLibrary
Suite Setup    Initialize Test
Suite Teardown    Close All Browsers
Test Teardown    Remove Test Data

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword

*** Test Cases ***
Create User Success
    Go To Create User Page
    Enter Fullname    สมบูรณ์ ใจงาม
    Enter Login    somboon
    Enter Password    1234
    Enter Retype Password    1234
    Save User Data
    Retry    User Data Should Be Successfully Saved

*** Keywords ***
Initialize Test
    Set Selenium Speed    0.1s
    Open Browser    ${URL}    ${BROWSER}
    Sign In With Valid Credential

Sign In With Valid Credential
    Click Element    go_to_signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin

Go To Create User Page
    Click Element    go_to_create_user

Enter Fullname
    [Arguments]    ${name}
    Input Text    inputName    ${name}

Enter Login
    [Arguments]    ${login}
    Input Text    inputLogin    ${login}

Enter Password
    [Arguments]    ${pass}
    Input Text    inputPassword    ${pass}

Enter Retype Password
    [Arguments]    ${pass}
    Input Text    inputPassword2    ${pass}

Save User Data
    Click Element    buttonConfirm

User Data Should Be Successfully Saved
    Element Should Be Visible    modal
    Element Should Contain    modal    บันทึกสำเร็จ

Remove Test Data
    Retry    Go To User List Page
    Retry    Remove Test User Data

Go To User List Page
    Go To    ${URL}/list-user.html
    Wait Until Page Contains Element    button-remove-somboon

Remove Test User Data
    Click Element    button-remove-somboon

Retry
    [Arguments]    ${keyword}    ${arguments}=@{EMPTY}
    Wait Until Keyword Succeeds    5s    1s    ${keyword}    @{arguments}