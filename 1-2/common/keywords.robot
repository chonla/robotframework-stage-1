*** Keywords ***
Range
    [Arguments]    ${n}    ${start_from}=${DEFAULT_START_RANGE}    ${step}=${DEFAULT_STEP}
    @{out}=    Create List
    ${tmp}=    Set Variable    ${start_from}
    : FOR    ${i}    IN RANGE    0    ${n}
    \    Append To List    ${out}    ${tmp}
    \    ${tmp}=    Evaluate    ${tmp} + ${step}
    [Return]    ${out}