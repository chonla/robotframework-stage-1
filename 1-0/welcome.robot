*** Settings ***
Library    SeleniumLibrary
Test Setup    Set Things Up
Test Teardown    Close All Browsers

*** Variables ***
@{WELCOME_MESSAGE}
    ...    <h1>สวัสดีทุกคน!!</h1><br>
    ...    หวังว่าจะสนุกกับคลาส <font color='red'>Robot Framework - Stage 1</font> นะครับ<br>
    ...    <br><br>
    ...    ขอให้บันเทิงครับ :)<br>
    ...    <font color='red' size='6'>&#10084;&#10084;&#10084;</font>
${WELCOME_FILE}    file://${CURDIR}/static/hello.html
${DELAY}    1s

*** Test Cases ***
Show Welcome Message
    [Tags]    greet
    : FOR    ${line}    IN    @{WELCOME_MESSAGE}
    \    Print ${line}

*** Keywords ***
Set Things Up
    Open Browser    ${WELCOME_FILE}    gc
    Set Selenium Speed    ${DELAY}

Print ${message}
    Execute Javascript
    ...    (function() {
    ...         var o = document.getElementById("msgbox");
    ...         o.innerHTML = o.innerHTML + "${message}";
    ...    })();
