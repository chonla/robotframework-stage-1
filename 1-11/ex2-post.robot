*** Settings ***
Library    requests
Library    Collections

*** Variables ***
${TODO_URL}    https://jsonplaceholder.typicode.com/todos

*** Test Cases ***
Should Post Todo List Successfully
    ${data}    Create Dictionary    userId=8    id=300    title=Hello    completed=true
    ${resp}=    Post    ${TODO_URL}    json=${data}
    Should Be Equal    ${resp.status_code}    ${201}