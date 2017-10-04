*** Variables ***
${OWNER}    John

*** Test Cases ***
Owner Should Be John
    Should Be Equal    ${OWNER}    John

Change Owner To Peter
    ${OWNER}=    Set Variable    Peter
    Should Be Equal    ${OWNER}    Peter

Owner Should Be Unchanged
    Should Be Equal    ${OWNER}    John

Change Global Owner To Peter
    Set Global Variable    ${OWNER}    Peter
    Should Be Equal    ${OWNER}    Peter

New Owner Name Should Be Peter
    Should Be Equal    ${OWNER}    Peter