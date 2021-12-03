*** Settings ***
Library      String

*** Test Case ***
Test Multiplication
     Multiplication

*** Keywords ***
Multiplication
    log to console  \n\t 2\t 3\t 4\t 5\t 6\t 7\t 8\t 9\t10
    log to console   ${SPACE * 4}__________________________________________________________________________
    FOR  ${i}  IN RANGE  2   11 
        Print  ${i}
        FOR  ${j}  IN RANGE  2   11
            ${sum}=  evaluate   ${i}*${j}
            log to console  \t  no_newline=true
            Print  ${sum} 
        END
        log to console  ${EMPTY}
    END 

    
Print  [Arguments]  ${n}
    IF  ${n}<10
        log to console  ${SPACE}  no_newline=true
    END
        log to console  ${n}   no_newline=true