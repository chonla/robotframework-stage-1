*** Settings ***
Library    requests
Library    Collections
Library    OperatingSystem
Library    ./libs/multipart.py

*** Variables ***
${UPLOAD_URL}    http://localhost:8080/upload.php

*** Test Cases ***
Should Upload File
    Upload File    terminator.jpg
    Upload File    large-photo-3dot5MB.jpg
    Upload File    large-photo.jpg

*** Keywords ***
Upload File
    [Arguments]    ${file_name}

    ${file_data}=    Get Binary File    ./${file_name}
    ${file_param}=    Create List    ${file_name}    ${file_data}
    ${fields}=    Create Dictionary    fileToUpload=${file_param}

    ${body}=    Multipart Encode    fields=${fields}

    ${headers}=    Create Dictionary    Content-Type=${body.content_type}

    ${resp}=    Post    ${UPLOAD_URL}    data=${body}    headers=${headers}
    Log To Console    ${resp.text}