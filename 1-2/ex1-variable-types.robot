*** Variables ***
# Scalar
${OPERAND1}    1
${OPERAND2}    2
${EXPECTED_ADDITION_RESULT}    3
${EXPECTED_SUM_SERIES}    55

# List
@{X_SERIES}    1    2    3    4    5    6    7    8    9    10

# Dictionary
&{XY_SERIES}    1=1    2=4    3=9    4=16    5=25

*** Test Cases ***
Simple Add
    ${result}=    Evaluate    ${OPERAND1} + ${OPERAND2}
    Should Be Equal As Numbers    ${result}    ${EXPECTED_ADDITION_RESULT}

Summation Of Number Series
    ${sum}=    Set Variable    0
    : FOR    ${x}    IN    @{X_SERIES}
    \    ${sum}=    Evaluate    ${sum} + ${x}
    Should Be Equal As Numbers    ${EXPECTED_SUM_SERIES}    ${sum}

Power Of Number
    : FOR    ${x}    IN    @{XY_SERIES.keys()}
    \    ${pow}=    Evaluate    ${x} * ${x}
    \    Should Be Equal As Numbers    ${XY_SERIES["${x}"]}    ${pow}
