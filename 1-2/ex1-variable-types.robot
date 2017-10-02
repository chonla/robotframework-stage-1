*** Variables ***
${FIRST_NAME}    John
${LAST_NAME}    Farmer
${AGE}    62
${NEXT_YEAR_AGE}    63
@{KIDS}    Mary    Peter    Frank
&{PETS}    Dog=George    Cat=Lady    Cow=Ben    Bird=Jim    Pig=Big

*** Test Cases ***
Greeting
    ${result}=    Catenate    ${FIRST_NAME}    ${LAST_NAME}    is a    ${AGE}    years old man
    Should Be Equal    ${result}    John Farmer is a 62 years old man

John's Age In Next Year
    ${next_age}=    Evaluate    ${AGE} + 1
    Should Be Equal As Numbers    ${NEXT_YEAR_AGE}    ${next_age}

John's Kids
    ${number_of_kids}=    Get Length    ${KIDS}
    Log To Console     ${FIRST_NAME} has ${number_of_kids} kids
    : FOR    ${kid}    IN    @{KIDS}
    \    Log To Console    ${kid}

John's Pets
    : FOR    ${pet}    IN    @{PETS.keys()}
    \    Log To Console    ${FIRST_NAME} has a ${pet} named ${PETS["${pet}"]} in his farm