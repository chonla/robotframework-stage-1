*** Variables ***
@{WELCOME_MESSAGE}
    ...    ${\n}
    ...    สวัสดีทุกคน
    ...    หวังว่าจะสนุกกับคลาสนี้นะครับ
    ...    สวัสดีจ้ะ
    ...    ${SPACE}${SPACE}${SPACE}${SPACE}.-'"""""'-.
    ...    ${SPACE}${SPACE}.'${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}`.
    ...    ${SPACE}/${SPACE}${SPACE}${SPACE}.${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}.${SPACE}${SPACE}${SPACE}${SPACE}\\
    ...    :${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}:
    ...    |${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}|
    ...    :${SPACE}${SPACE}${SPACE}\\${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}/${SPACE}${SPACE}${SPACE}${SPACE}:
    ...    ${SPACE}\\${SPACE}${SPACE}${SPACE}`.____.'${SPACE}${SPACE}${SPACE}${SPACE}/
    ...    ${SPACE}${SPACE}`.${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}.'
    ...    ${SPACE}${SPACE}${SPACE}${SPACE}`-._____.-'


*** Test Cases ***
Welcome
    : FOR    ${line}    IN    @{WELCOME_MESSAGE}
    \    Log To Console    ${line}
    \    Sleep    0.5s