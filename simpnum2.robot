*** Settings ***
 
*** Variables ***


*** Test Cases ***
Test Simple Numbers
    ${x}  Simple Numbers  ${40}
    
*** Keywords ***
Simple Numbers  [Arguments]  ${num}
    ${sum}=  set variable  ${EMPTY}
    FOR  ${i}  IN RANGE  2  ${num}
        FOR  ${j}  IN RANGE  2  ${i} + 1
            ${sum}=  evaluate  "${sum}"+"${i}"+"${j}"


        END
    END
    log to console  ${sum}

#N  [Arguments]  ${num}