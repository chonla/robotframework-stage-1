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
Create New Item
    Sign In With Credential    ${USERNAME}    ${PASSWORD}
    Go To Create Item Page
    Fill Create Form
    Click Save Button
    Item Should Be Successfully Saved

*** Keywords ***
Initialize Test
    Set Selenium Speed    0.1s
    Open Browser    ${URL}    ${BROWSER}

Sign In With Credential
    [Arguments]    ${u}    ${p}
    Click Element    go_to_signin
    Input Text    inputUser    ${u}
    Input Password    inputPassword    ${p}
    Click Element    buttonLogin

Go To Create Item Page
    Click Element    go_to_create_item

Fill Create Form
    Input Text    inputName    สมเด่น เกือบดัง
    Input Text    inputEmail    somdenkuabdung@somemail.com
    Select From List By Value    inputGender    male
    Select From List By Value    inputInterest    car    photography    technology
    Input Text    inputDetail    สมเด่นเป็นคนขยัน ชอบกินกาแฟ
    Select Checkbox    inputChangePassword

Click Save Button
    Click Element    buttonConfirm

Item Should Be Successfully Saved
    Element Should Be Visible    modal
    Element Should Contain    modal    บันทึกสำเร็จ

Selection Count Should Match
    [Arguments]    ${locator}    ${count}
    ${selected}=    Get Selected List Values    ${locator}
    ${selected_count}=    Get Length    ${selected}
    Should Be Equal As Numbers    ${selected_count}    ${count}
