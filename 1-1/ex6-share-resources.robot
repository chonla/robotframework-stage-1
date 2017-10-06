*** Settings ***
Resource    common/keywords.robot
Resource    common/variables.robot

*** Test Cases ***
Increase One By One Should Give Two
    ${result}=    Increase    1    ${INCREMENT_BY}
    Should Be Equal As Numbers    ${result}    2

Increase Two By One Should Give Three
    ${result}=    Increase    2    ${INCREMENT_BY}
    Should Be Equal As Numbers    ${result}    3
