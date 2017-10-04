*** Settings ***
Documentation    See more built-in variable at http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#built-in-variables

*** Variables ***
@{OSVARS}    ${CURDIR}    ${TEMPDIR}    ${EXECDIR}    ${/}    ${:}    ${\n}
@{NUMVARS}    1    ${1}    ${3.8}    ${-1e-3}    ${0b1011}    ${0o10}    ${0xff}    ${0B1011}
@{BOOLVARS}    ${true}    ${TRUE}    ${False}    ${false}
@{OTHERSVARS}    ${None}    ${SPACE}    ${EMPTY}    @{EMPTY}    &{EMPTY}

*** Test Cases ***
Show All Variables
    Show    @{OSVARS}    @{NUMVARS}    @{BOOLVARS}    @{OTHERSVARS}

**** Keywords ***
Show
    [Arguments]    @{var}
    : FOR    ${v}    IN    @{var}
    \     ${type}=    Evaluate    type($v).__name__
    \     Log To Console    ${v} (${type})