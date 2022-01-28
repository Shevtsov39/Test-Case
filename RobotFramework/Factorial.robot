*** Settings ***

*** Test Cases ***
Check Factorial
    Factorial   8

*** Keywords ***
Factorial    [Arguments]   ${num}
    ${sum}=  set variable  ${1}
    FOR  ${i}  IN RANGE  1  ${num} + 1
        ${f}=  set variable  ${i}
        ${sum}=  evaluate  ${sum}*${f}
        log to console  ${sum}
    END
    