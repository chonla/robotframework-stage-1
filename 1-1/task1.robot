*** Settings ***
Documentation    Create Factorial Test Case

*** Test Cases ***
Factorial Of One Should Give One
    ${result}=    Factorial    1
    Should Be Equal As Numbers    ${result}    1

Factorial Of Two Should Give Two
    ${result}=    Factorial    2
    Should Be Equal As Numbers    ${result}    2

Factorial Of Three Should Give Six
    ${result}=    Factorial    3
    Should Be Equal As Numbers    ${result}    6

*** Keywords ***
Factorial
    [Arguments]    ${n}
    ${f}=    Set Variable    1
    #
    # Complete this keyword.
    # You can use for loop control flow.
    # For loop syntax is as follow.
    #
    # FOR    ${i}    IN RANGE    0    ${n}
    # \    ${f}=    ...
    #
    [Return]    ${f}