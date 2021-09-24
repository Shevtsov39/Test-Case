*** Settings ***

*** Variables ***


*** Test Case ***                                       
Test NOD                                 
    ${y}=  NOD   ${1000}  ${800}
            
*** Keywords ***
NOD  [Arguments]  ${a}  ${b}
    log to console  \t
    FOR  ${i}  IN RANGE  1  ${b}
        IF  ${b} > 0
            ${c}=  evaluate  ${a}%${b}
            ${a}=  set variable  ${b}
            ${b}=  set variable  ${c}
        END
    END
    log to console  ${a}
    [Return]  ${a}