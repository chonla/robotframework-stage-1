*** Settings ***
Library    ./libs/palindrome.py

*** Test Cases ***
Should Pass Palindrome Test
    [Template]    String Should Be Palindrome
    [Tags]   task
    radar
    Radar
    racecar
    madam
    Madam, I'm Adam
    noon

Should Pass Not Palindrome Test
    [Template]    String Should Not Be Palindrome
    [Tags]   task
    mouse
    a man
    Telephone
    I am fine

*** Keywords ***
String Should Be Palindrome
    [Arguments]    ${s}
    Should Be Palindrome    ${s}

String Should Not Be Palindrome
    [Arguments]    ${s}
    Should Not Be Palindrome    ${s}