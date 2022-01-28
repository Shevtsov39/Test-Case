*** Settings ***
 
*** Variables ***


*** Test Cases ***
Test Prime Numbers
    ${x}  Prime Numbers  ${111}
    
*** Keywords ***
Prime Numbers  [Arguments]  ${num}
    ${sum}=  set variable  ${EMPTY}
    FOR  ${i}  IN RANGE  2  ${num} + 1
        ${q}=  evaluate  ${i}**2
        ${q-1}=  evaluate  ${q}-${1}
        ${nok}=  evaluate  ${q-1}/${24}
        ${rounded}=  convert to integer  ${nok}
            IF  ${nok}==${rounded}
                ${sum}=  evaluate  "${sum},"+"${i}"
            END
    END
    log to console  ${sum}