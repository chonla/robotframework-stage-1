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
    Given User Has Already Logged In
    When Go To Create Customer Page
    And Fill Create Form
    And Click Save Button
    Then Customer Should Be Successfully Saved

*** Keywords ***
Initialize Test
    Open Browser    ${URL}    ${BROWSER}

User Has Already Logged In
    Sign In With Valid Credential

Sign In With Valid Credential
    Click Element    signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin

Go To Create Customer Page
    Retry     Click Element    create-customer

Form Has Already Displayed
    Wait Until Element Is Visible    inputName    10s 

Fill Create Form
    Form Has Already Displayed
    Input Text    inputName    สมเด่น เกือบดัง
    Input Text    inputEmail    somdenkuabdung@somemail.com
    Select From List By Value    inputGender    male
    Select From List By Value    inputInterest    car    photography    technology
    Input Text    inputDetail    สมเด่นเป็นคนขยัน ชอบกินกาแฟ
    Select Checkbox    inputVIP

Click Save Button
    Click Element    buttonConfirm

Customer Should Be Successfully Saved
    Retry  Element Should Be Visible    success-modal 
    Element Should Contain    success-modal    บันทึกสำเร็จ

Selection Count Should Match
    [Arguments]    ${locator}    ${count}
    ${selected}=    Get Selected List Values    ${locator}
    ${selected_count}=    Get Length    ${selected}
    Should Be Equal As Numbers    ${selected_count}    ${count}

Retry
    [Arguments]    @{args}
    Wait Until Keyword Succeeds    10s    1s    @{args}
