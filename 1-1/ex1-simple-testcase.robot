*** Test Cases ***
Increase One By One Should Give Two
    ${result}=    Evaluate    1 + 1
    Should Be Equal As Numbers    ${result}    2