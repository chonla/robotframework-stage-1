*** Keywords ***
Increase
    [Arguments]    ${operand1}    ${operand2}
    ${result}=    Evaluate    ${operand1} + ${operand2}
    [Return]    ${result}