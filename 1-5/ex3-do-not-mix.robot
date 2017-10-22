*** Settings ***
Library    SeleniumLibrary
Test Setup    Initialize Test
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword

*** Test Cases ***
When Create User Success Success Modal Should Be Display
    Sign In With Valid Credential
    Go To Create Customer Page
    Fill Create Form
    Click Save Button
    Customer Should Be Successfully Saved

When User Login With Valid Credential, Dashboard Should Be Displayed
    [Documentation]    Split this test case to other suite.
    [Tags]    bad
    Sign In With Valid Credential
    Location Should Be    ${URL}/#/user/dashboard

*** Keywords ***
Initialize Test
    Open Browser    ${URL}    ${BROWSER}

Sign In With Valid Credential
    Click Element    signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin

Go To Create Customer Page
    Click Element    create-customer

Fill Create Form
    Input Text    inputName    สมเด่น เกือบดัง
    Input Text    inputEmail    somdenkuabdung@somemail.com
    Select From List By Value    inputGender    male
    Select From List By Value    inputInterest    car    photography    technology
    Input Text    inputDetail    สมเด่นเป็นคนขยัน ชอบกินกาแฟ
    Select Checkbox    inputVIP

Click Save Button
    Click Element    buttonConfirm

Customer Should Be Successfully Saved
    Element Should Be Visible    modal
    Element Should Contain    modal    บันทึกสำเร็จ

Selection Count Should Match
    [Arguments]    ${locator}    ${count}
    ${selected}=    Get Selected List Values    ${locator}
    ${selected_count}=    Get Length    ${selected}
    Should Be Equal As Numbers    ${selected_count}    ${count}
