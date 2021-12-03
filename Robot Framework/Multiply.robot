*** Settings ***
Library      String

*** Test Case ***
Test Multiplication
    log to console  \n\t 2\t 3\t 4\t 5\t 6\t 7\t 8\t 9\t10
    log to console  __________________________________________________________________________
    ${x}=  Multiplication  ${1}

*** Keywords ***
Multiplication  [Arguments]  ${num}
    FOR  ${i}  IN RANGE  2   11 
        log to console  ${EMPTY}
        log to console  ${i} |  no_newline=true
        FOR  ${j}  IN RANGE  2   11
            ${sum}=  evaluate   ${i}*${j}
            log to console  \t ${sum}  no_newline=true
        END
    END 
    log to console  ${EMPTY}
    [Return]  ${sum}