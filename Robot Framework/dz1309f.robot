*** Settings ***
Library    String

*** Variables ***

*** Test Case ***
Test Integer
    ${x}=  Integer  ${20}
    
     
*** Keywords ***
Integer  [Arguments]  ${num}
    FOR  ${i}  IN RANGE  1   ${num}
        ${sum}=  set variable  ${i}
        IF  ${i}>10                                  
            ${sum}=  evaluate  ${num}-${i}           #                             
        END
        log to console  ${sum},   no_newline=true
    END
    log to console  ${EMPTY}
    [Return]  ${sum}