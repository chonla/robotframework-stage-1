*** Settings ***
Library    requests
Library    Collections

*** Variables ***
${TODO_URL}    https://jsonplaceholder.typicode.com/todos

*** Test Cases ***
Should Get Todo List Successfully
    ${resp}=    Get    ${TODO_URL}
    Should Be Equal    ${resp.status_code}    ${200}

Response Should Contain Todo Items
    ${resp}=    Get    ${TODO_URL}
    ${json}=    Set Variable    ${resp.json()}
    ${count}=    Get Length    ${json}
    Should Not Be Equal    ${count}    ${0}
    Dictionary Should Contain Key    ${json[0]}    userId
    Dictionary Should Contain Key    ${json[0]}    id
    Dictionary Should Contain Key    ${json[0]}    title
    Dictionary Should Contain Key    ${json[0]}    completed