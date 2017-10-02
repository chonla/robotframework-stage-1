*** Settings ***
Suite Setup    Do Suite Setup
Suite Teardown    Do Suite Teardown
Test Setup    Do Test Setup
Test Teardown    Do Test Teardown

*** Variables ***
${GREEN}    "\\033[92m"
${YELLOW}    "\\033[93m"
${BLUE}    "\\033[94m"
${MAGENTA}    "\\033[95m"
${CYAN}    "\\033[96m"

*** Test Cases ***
Test Case Number One
    Print With Color    Executing Test Case #1    ${GREEN}

Test Case Number Two
    Print With Color    Executing Test Case #2    ${GREEN}

Test Case Number Three
    Print With Color    Executing Test Case #3    ${GREEN}

Test Case Number Four
    Print With Color    Executing Test Case #4    ${GREEN}

*** Keywords ***
Print With Color
    [Arguments]    ${msg}    ${color}
    ${console_color}=    Evaluate    ${color}
    ${console_reset_color}=    Evaluate    "\\033[0m"
    ${msg}=    Evaluate    "${console_color}${msg}${console_reset_color}"
    Log To Console    ${msg}

Do Suite Setup
    Print With Color    Executing Suite Setup    ${BLUE}

Do Suite Teardown
    Print With Color    Executing Suite Teardown    ${CYAN}

Do Test Setup
    Print With Color    \\nExecuting Test Setup    ${MAGENTA}

Do Test Teardown
    Print With Color    Executing Test Teardown    ${YELLOW}