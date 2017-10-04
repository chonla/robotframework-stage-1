*** Settings ***
Library    SeleniumLibrary
Test Setup    Go To Test Site
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc

*** Test Cases ***
Test Site Should Be Displayed
    Page Should Contain    Robot Framework - Stage 1

Test Site Should Contain Working Link To GitHub
    Click Element    go_to_github
    Location Should Be    https://github.com/chonla/robotframework-stage-1

*** Keywords ***
Go To Test Site
    Open Browser    ${URL}    ${BROWSER}