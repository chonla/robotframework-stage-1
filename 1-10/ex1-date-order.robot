*** Settings ***
Library    ./libs/sorting.py

*** Test Cases ***
Date Should Be Sorted Ascendingly
    ${data}=    Create List    2017-05-21    2017-05-22    2017-05-23    2017-05-23    2017-05-25
    Date Is Ascendingly Sorted    ${data}