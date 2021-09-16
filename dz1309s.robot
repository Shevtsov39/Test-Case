*** Settings ***


*** Variables ***

*** Test Case ***
Test Integer  
    ${x}=  Integer  ${17}

*** Keywords ***
Integer  [Arguments]  ${num}
    #${polovina}=  evaluate  ${0.5}*${num}
    ${factors}=  set variable  ${EMPTY}
    FOR  ${i}  IN RANGE  1  ${num} + 1
        ${i1}=  convert to integer  ${i}
        ${sum}=  evaluate  ${num}%${i1}
        IF  ${sum}==0
            ${factors}=  evaluate  "${factors}"+"${i1}."
            #${factors}=  evaluate  ${factors}%1
        END
    END
    log to console  ${factors}
    [Return]  ${factors}