*** Settings ***
Library    Collections

*** Variables ***
@{EXPECTED_FIBONACCI_0}    @{EMPTY}
@{EXPECTED_FIBONACCI_1}    ${1}
@{EXPECTED_FIBONACCI_1_1}    ${1}    ${1}
@{EXPECTED_FIBONACCI_1_1_2_3_5_8_13_21}    ${1}    ${1}    ${2}    ${3}    ${5}    ${8}    ${13}    ${21}

*** Test Cases ***
Fibonacci Of Zero Number Should Return Empty List
    ${fib}=    Fibonacci List    0
    Lists Should Be Equal    ${fib}    ${EXPECTED_FIBONACCI_0}

Fibonacci Of One Number Should Return [1]
    ${fib}=    Fibonacci List    1
    Lists Should Be Equal    ${fib}    ${EXPECTED_FIBONACCI_1}

Fibonacci Of Two Numbers Should Return [1 1]
    ${fib}=    Fibonacci List    2
    Lists Should Be Equal    ${fib}    ${EXPECTED_FIBONACCI_1_1}

Fibonacci Of Two Numbers Should Return [1 1 2 3 5 8 13 21]
    ${fib}=    Fibonacci List    8
    Lists Should Be Equal    ${fib}    ${EXPECTED_FIBONACCI_1_1_2_3_5_8_13_21}

*** Keywords ****
Fibonacci List
    [Arguments]    ${n}
    @{fib}    Create List
    Run Keyword If    ${n} > 0    Append To List    ${fib}    ${0}    ${1}
    : FOR    ${i}    IN RANGE    2    ${n} + 1
    \     ${n_0}=    Evaluate    ${fib[${i}-1]} + ${fib[${i}-2]}
    \     Append To List    ${fib}    ${n_0}
    ${fib}=    Get Slice From List    ${fib}    1
    [Return]    ${fib}