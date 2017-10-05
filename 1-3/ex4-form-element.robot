*** Settings ***
Library    SeleniumLibrary
Test Setup    Go To Create Item Page
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword

*** Test Cases ***
Should Go To Create Iteam Page From Side Navigation
    Location Should Be    ${URL}/create-item.html

When Create User Success Success Modal Should Be Display
    Input Text    inputName    สมเด่น เกือบดัง
    Input Text    inputEmail    somdenkuabdung@somemail.com
    Select From List By Value    inputGender    male
    Select From List By Value    inputInterest    car    photography    technology
    Input Text    inputDetail    สมเด่นเป็นคนขยัน ชอบกินกาแฟ
    Select Checkbox    inputChangePassword
    Click Element    buttonConfirm
    Element Should Be Visible    modal
    Element Should Contain    modal    บันทึกสำเร็จ

*** Keywords ***
Go To Create Item Page
    Set Selenium Speed    0.1s
    Open Browser    ${URL}    ${BROWSER}
    Click Element    go_to_signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin
    Click Element    go_to_create_item