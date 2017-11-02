*** Settings ***
Library    requests
Library    Collections
Library    OperatingSystem
Library    ./libs/multipart.py

*** Variables ***
${UPLOAD_URL}    http://posttestserver.com/post.php

*** Test Cases ***
Should Upload File
    Upload File    ${CURDIR}/terminator.jpg

*** Keywords ***
Upload File
    [Arguments]    ${file_name}

    ${file_data}=    Get Binary File    ${file_name}
    ${file_param}=    Create List    ${file_name}    ${file_data}
    ${fields}=    Create Dictionary    fileToUpload=${file_param}

    ${body}=    Multipart Encode    fields=${fields}

    ${headers}=    Create Dictionary    Content-Type=${body.content_type}

    ${resp}=    Post    ${UPLOAD_URL}    data=${body}    headers=${headers}
    Should Be Equal    ${resp.status_code}    ${200}