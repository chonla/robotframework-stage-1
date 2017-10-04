*** Variables ***
${OPERAND1}    1
${OPERAND2}    2
${EXPECTED_ADDITION_RESULT}    3
@{X_SERIES}    1    2    3    4    5
${EXPECTED_X_SERIES_SUM}    15
&{OPS}    op2=1    op1=2

*** Test Cases ***
Simple Add
    ${result}=    Add    ${OPERAND1}    ${OPERAND2}
    Should Be Equal As Numbers    ${result}    ${EXPECTED_ADDITION_RESULT}

Add With Varargs
    ${result}=    Sum All    ${OPERAND1}    ${OPERAND2}
    Should Be Equal As Numbers    ${result}    ${EXPECTED_ADDITION_RESULT}

Sum Elements
    ${result}=    Sum All    @{X_SERIES}
    Should Be Equal As Numbers    ${result}    ${EXPECTED_X_SERIES_SUM}

Add With Kwargs
    ${result}=    Add    &{OPS}
    Should Be Equal As Numbers    ${result}    ${EXPECTED_ADDITION_RESULT}

*** Keywords ***
Add
    [Arguments]    ${op1}    ${op2}
    ${sum}=    Evaluate    ${op1} + ${op2}
    [Return]    ${sum}

Sum All
    [Arguments]    @{ops}
    ${sum}=    Set Variable    0
    : FOR    ${i}    IN    @{ops}
    \    ${sum}=    Evaluate    ${sum} + ${i}
    [Return]    ${sum}