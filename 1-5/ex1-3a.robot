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
When Create Customer Success Success Modal Should Be Display
    Go To Create Customer Page
    Fill Create Form
    Click Save Button
    Customer Should Be Successfully Saved

When Create Customer Success Success Modal Should Be Display - Not 3A
    [Tags]    bad
    Go To Create Customer Page
    Retry    Location Should Be    ${URL}/#/user/create-customer
    Fill Create Form
    Selection Count Should Match    inputInterest    3
    Click Save Button
    Customer Should Be Successfully Saved

*** Keywords ***
Initialize Test
    Open Browser    ${URL}    ${BROWSER}
    Sign In With Valid Credential

Sign In With Valid Credential
    Click Element    signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin

Go To Create Customer Page
    Retry    Click Element    create-customer

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
    Retry    Element Should Be Visible    success-modal
    Element Should Contain    success-modal    บันทึกสำเร็จ

Selection Count Should Match
    [Arguments]    ${locator}    ${count}
    ${selected}=    Get Selected List Values    ${locator}
    ${selected_count}=    Get Length    ${selected}
    Should Be Equal As Numbers    ${selected_count}    ${count}

Retry
    [Arguments]    @{args}
    Wait Until Keyword Succeeds    5s    1s    @{args}
