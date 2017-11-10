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
    [Tags]   task

    #
    # Complete this task by make this test case more business readable.
    #
    # You may generate some new keywords and put technical activites into them.
    #

    Click Element    signin
    Input Text    inputUser    ${USERNAME}
    Input Password    ${PASSWORD}
    Click Element    buttonLogin
    Wait Until Keyword Succeeds    5s    1s    Location Should Be    ${URL}/#/user/dashboard

*** Keywords ***
Go To Test Site
    Open Browser    ${URL}    ${BROWSER}
