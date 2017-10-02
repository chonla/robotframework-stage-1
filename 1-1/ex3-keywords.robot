*** Test Cases ***
Increase One By One Should Give Two
    ${result}=    Increase    1    1
    Should Be Equal As Numbers    ${result}    2

Increase Two By One Should Give Three
    ${result}=    Increase    2    1
    Should Be Equal As Numbers    ${result}    3

*** Keywords ***
Increase
    [Arguments]    ${operand1}    ${operand2}
    ${result}=    Evaluate    ${operand1} + ${operand2}
    [Return]    ${result}