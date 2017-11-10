*** Settings ***
Documentation    Complete Sorting Order Verifying Keyword

*** Test Cases ***
Verify If Input Is Sorted In Ascending Order
    [Tags]   task
    @{input}    Create List    1    2    3    4
    Should Sorted In Ascending Order    ${input}

*** Keywords ***
Should Sorted In Ascending Order
    [Arguments]    ${list}

    ${is_sorted}=    Set Variable    ${true}
    ${last}=    Set Variable    ${list[0]}

    #
    # Complete this keyword.
    #
    # Verify Sorting Order
    # 
    # You can use for loop control flow.
    # For loop syntax is as follow.
    #
    # : FOR    ${v}    IN    @{list}
    # \    ${is_sorted}=    ...
    #
    # You can use "Run Keyword If" or "Run Keyword Unless" to do if condition
    #






    Should Be True    ${is_sorted}