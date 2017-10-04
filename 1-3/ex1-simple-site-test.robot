*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc

*** Test Cases ***
Test Site Should Be Displayed
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain    Robot Framework - Stage 1