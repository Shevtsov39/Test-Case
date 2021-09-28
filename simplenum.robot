*** Settings ***
 
*** Variables ***


*** Test Cases ***
Test Simple Numbers
    ${x}  Simple Numbers  ${77}
    
*** Keywords ***
Simple Numbers  [Arguments]  ${num}
    ${sum}=  set variable  ${EMPTY}
    ${del}=  set variable  ${2}
    FOR  ${i}  IN RANGE  2   ${num} + 1
        ${k}=  set variable  ${0}
        FOR  ${j}  IN RANGE  1   ${i}
            ${res}=  evaluate  ${num}%${j}
            IF  ${res}>0
                ${k}=  evaluate  ${k}+${1}
            END
                IF  ${k}==2
                    ${sum}=  evaluate  "${sum}"+"${i},"
                    Exit For Loop
                END
        END
    END
    log to console  ${sum}