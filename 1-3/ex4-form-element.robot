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
Should Go To Create Iteam Page From Side Navigation
    Location Should Be    ${URL}/#/user/create-customer

When Create Item Success Success Modal Should Be Display
    Wait Until Element Is Visible    inputName
    Input Text    inputName    สมเด่น เกือบดัง
    Input Text    inputEmail    somdenkuabdung@somemail.com
    Select From List By Value    inputGender    male
    Select From List By Value    inputInterest    car    photography    technology
    Input Text    inputDetail    สมเด่นเป็นคนขยัน ชอบกินกาแฟ
    Select Checkbox    inputVIP
    Click Element    buttonConfirm
    Wait Until Element Is Visible    success-modal
    Element Should Contain    success-modal    บันทึกสำเร็จ

*** Keywords ***
Initialize Test
    Open Browser    ${URL}    ${BROWSER}
    Sign In With Valid Credential
    Go To Create Item Page

Sign In With Valid Credential
    Click Element    signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin
    Wait Until Keyword Succeeds    5s    1s    Location Should Be    ${URL}/#/user/dashboard

Go To Create Item Page
    Wait Until Page Contains Element    create-customer
    Click Element    create-customer