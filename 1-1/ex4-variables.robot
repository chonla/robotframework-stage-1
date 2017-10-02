*** Variables ***
${INCREMENT_BY}    1

*** Test Cases ***
Increase One By One Should Give Two
    ${result}=    Increase    1    ${INCREMENT_BY}
    Should Be Equal As Numbers    ${result}    2

Increase Two By One Should Give Three
    ${result}=    Increase    2    ${INCREMENT_BY}
    Should Be Equal As Numbers    ${result}    3

*** Keywords ***
Increase
    [Arguments]    ${operand1}    ${operand2}
    ${result}=    Evaluate    ${operand1} + ${operand2}
    [Return]    ${result}