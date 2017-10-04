*** Settings ***
Documentation    Complete Factorial Keyword

*** Test Cases ***
Factorial Of One Should Give One
    [Tags]   task
    ${result}=    Factorial    1
    Should Be Equal As Numbers    ${result}    1

Factorial Of Two Should Give Two
    [Tags]   task
    ${result}=    Factorial    2
    Should Be Equal As Numbers    ${result}    2

Factorial Of Three Should Give Six
    [Tags]   task
    ${result}=    Factorial    3
    Should Be Equal As Numbers    ${result}    6

Factorial Of Ten Should Give 3628800
    [Tags]   task
    ${result}=    Factorial    10
    Should Be Equal As Numbers    ${result}    3628800

*** Keywords ***
Factorial
    [Arguments]    ${n}
    ${f}=    Set Variable    1
    #
    # Complete this keyword.
    #
    # Factorial
    # 
    #   factorial(n) = n * factorial(n - 1)
    #   factorial(1) = 1
    #   factorial(0) = 1
    #
    # You can use for loop control flow.
    # For loop syntax is as follow.
    #
    # : FOR    ${i}    IN RANGE    0    ${n}
    # \    ${f}=    ...
    #



    [Return]    ${f}