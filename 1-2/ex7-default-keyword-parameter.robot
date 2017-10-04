*** Variables ***
${DEFAULT_INCREMENT_BY}    1

*** Test Cases ***
Increase One Should Give Two
    ${result}=    Increase    1
    Should Be Equal As Numbers    ${result}    2

Increase Two Should Give Three
    ${result}=    Increase    2
    Should Be Equal As Numbers    ${result}    3

*** Keywords ***
Increase
    [Arguments]    ${operand1}    ${operand2}=${DEFAULT_INCREMENT_BY}
    ${result}=    Evaluate    ${operand1} + ${operand2}
    [Return]    ${result}