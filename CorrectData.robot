*** Settings ***

*** Variables ***


*** Test Case ***
Test Correct Data                     
    ${result}  Correct Data  ${32}  ${11}  ${1991}
    log to console  ${result}

*** Keywords ***
Correct Data  [Arguments]  ${day}  ${month}  ${year}
    ${result}=  set variable  ${true}
    IF  ${month}==2
        IF  ${day} > 29
            ${result}=  set variable  ${false}
        END
    ELSE IF  ${day} > 31
        ${result}=  set variable  ${false}
    END
    [Return]  ${result}