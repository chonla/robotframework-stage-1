*** Test Cases ***
Increase One By One Should Give Two
    ${result}=    Evaluate    1 + 1
    Should Be Equal As Numbers    ${result}    2

Increase Two By One Should Give Three
    ${result}=    Evaluate    2 + 1
    Should Be Equal As Numbers    ${result}    3