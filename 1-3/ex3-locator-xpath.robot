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
    Click Element    signin
    Input Text    xpath=//*/input[@type="text"]    ${USERNAME}
    Input Password    xpath=//*/input[@type="password"]    ${PASSWORD}
    Click Element    xpath=//*/button[@type="submit"]
    Wait Until Keyword Succeeds    5s    1s    Location Should Be    ${URL}/#/user/dashboard

*** Keywords ***
Go To Test Site
    Open Browser    ${URL}    ${BROWSER}