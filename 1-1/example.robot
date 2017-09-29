*Setting
Test Setup    Set Things Up

*** Settings ***
Library    SeleniumLibrary

| *Setting |
| Test Teardown | Close All Browsers |

*** Variables ***
${URL}    https://google.com

*** Test Cases ***
Open Google
    Page Should Contain    Google

*** Keywords ***
Set Things Up
    Open Browser    ${URL}    gc

*** Ignored ***
Believe me, everything is fine. :)