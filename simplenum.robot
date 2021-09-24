*** Settings ***
 
*** Variables ***


*** Test Cases ***
Test Simple Numbers
    ${x}  Simple Numbers  ${77}
    
*** Keywords ***
Simple Numbers  [Arguments]  ${num}
    ${sum}=  evaluate  "${EMPTY}"
    ${sum2}=  evaluate  "${EMPTY}"
    FOR  ${i}  IN RANGE  2   ${num} + 1
        FOR  ${j}  IN RANGE  2   ${i}
            ${res}=  evaluate  ${i}%${j}
            IF  ${res}==0
                ${sum2}=  evaluate  "${sum2}"+"${res}"
            ELSE
                ${sum}=  evaluate  "${sum}"+"${i}"
            END
        END
    END
    log to console  ${sum}
    #log to console  ${sum2}