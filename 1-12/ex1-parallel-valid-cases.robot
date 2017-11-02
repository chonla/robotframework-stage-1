*** Settings ***
Library    SeleniumLibrary
Suite Setup    Go To Login Page
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${VALID_USERNAME}    demouser
${VALID_PASSWORD}    demopassword
@{CHROME_OPTIONS}    headless    disable-gpu
${CHROME_BINARY}    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

*** Test Cases ***
Valid Credential Should Be Success
    Login With Credential    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Dashboard Should Be Displayed
    [Teardown]    Sign Out

*** Keywords ***
Open Headless Browser
    [Arguments]    ${url}
    ${options}=    Set Chrome Options
    ${options.set_binary}=    Set Variable    set_binary=${CHROME_BINARY}
    Create WebDriver    Chrome    chrome_options=${options} 
    Go To    ${url}

Set Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{CHROME_OPTIONS}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

Dashboard Should Be Displayed
    Retry    Location Should Be    ${URL}/#/user/dashboard

Sign Out
    Click Element    logout

Go To Login Page
    Open Headless Browser    ${URL}
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

Retry
    [Arguments]    @{args}
    Wait Until Keyword Succeeds    5s    3s    @{args}
