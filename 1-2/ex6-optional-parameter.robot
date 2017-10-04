*** Settings ***
Library    Collections

*** Variables ***
${DEFAULT_START_RANGE}   ${1}
${DEFAULT_STEP}   ${1}

*** Test Cases ***
Create Range Without Start And Step Should Return Sequential Range Started From 1 And Step 1
    @{expected}=    Set Variable    ${1}    ${2}    ${3}    ${4}    ${5}
    ${result}=    Range    5
    Lists Should Be Equal    ${result}    ${expected}

Create Range With Start And Without Step Should Return Sequential Range Started From Given Start And Step 1
    @{expected}=    Set Variable    ${4}    ${5}    ${6}    ${7}    ${8}
    ${result}=    Range    5    start_from=${4}
    Lists Should Be Equal    ${result}    ${expected}

Create Range Without Start And With Step Should Return Sequential Range Started From 1 With Given Step
    @{expected}=    Set Variable    ${1}    ${4}    ${7}    ${10}    ${13}    ${16}
    ${result}=    Range    6    step=${3}
    Lists Should Be Equal    ${result}    ${expected}

Create Range With Start And Step Should Return Sequential Range Started From Given Start With Given Step
    @{expected}=    Set Variable    ${8}    ${11}    ${14}    ${17}    ${20}    ${23}
    ${result}=    Range    6    step=${3}    start_from=${8}
    Lists Should Be Equal    ${result}    ${expected}

*** Keywords ***
Range
    [Arguments]    ${n}    ${start_from}=${DEFAULT_START_RANGE}    ${step}=${DEFAULT_STEP}
    @{out}=    Create List
    ${tmp}=    Set Variable    ${start_from}
    : FOR    ${i}    IN RANGE    0    ${n}
    \    Append To List    ${out}    ${tmp}
    \    ${tmp}=    Evaluate    ${tmp} + ${step}
    [Return]    ${out}