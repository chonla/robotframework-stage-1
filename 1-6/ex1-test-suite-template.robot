*** Settings ***
Library    SeleniumLibrary
Suite Setup    Go To Login Page
#Suite Teardown    Close All Browsers
Test Teardown    Reset Test
Test Template    Login With Invalid Credentials Should Fail

*** Variables ***
${URL}    http://localhost:4200     # https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${VALID_USERNAME}    demouser
${VALID_PASSWORD}    demopassword

*** Test Cases ***                USERNAME             PASSWORD
# Invalid User Name                 invalid              ${VALID_PASSWORD}
# Invalid Password                  ${VALID_USERNAME}    invalid
# Invalid User Name and Password    invalid              invalid
Empty User Name                   ${EMPTY}             ${VALID_PASSWORD}
Empty Password                    ${VALID_USERNAME}    ${EMPTY}
Empty User Name and Password      ${EMPTY}             ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Login With Credential    ${username}    ${password}
    Invalid Username Or Password Error Modal Should Be Displayed

Sign Out
    Click Element    signout

Go To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Click Element    signin

Go To Create User Page
    Retry    Click Element    create-user

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
    Click Element    buttonLogin

Invalid Username Or Password Error Modal Should Be Displayed
    Retry    Element Should Be Visible    errorModal
    Element Should Contain    errorModal    ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง

Retry
    [Arguments]    @{args}
    Wait Until Keyword Succeeds    5s    3s    @{args}

Reset Test
    Retry    Click Button    close-error-modal-button
    Wait Until Element Is Not Visible    close-error-modal-button
    Input Text    inputUser    ${EMPTY}
    Retry    Wait Until Element Value Is Empty    inputUser
    Input Password    inputPassword    ${EMPTY}
    Retry    Wait Until Element Value Is Empty    inputPassword

Wait Until Element Value Is Empty
    [Arguments]    ${locator}
    ${value}=    Get Value    ${locator}
    Should Be Equal    ${value}    ${EMPTY}