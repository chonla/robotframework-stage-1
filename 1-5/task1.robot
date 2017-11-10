*** Settings ***
Library    SeleniumLibrary
Suite Setup    Go To Test Site
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword

*** Test Cases ***
    #
    # Complete this task by creating a test case to create a new user and test if the new user account can login.
    #
    # This test case should be idempotent.
    #
    [Tags]   task

