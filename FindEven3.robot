*** Settings ***
Library   String

*** Variables ***

*** Test Case ***
Test FindEven  
    ${x}=  FindEven  ${254568.275}

*** Keywords ***
FindEven  [Arguments]  ${num}
    ${sum}=  set variable  ${EMPTY}
    ${int}=  Integer  ${num}
    ${str}=  Convert To string  ${int}
    ${len}=  get length  ${str}
    FOR  ${i}  IN RANGE  0   ${len} 
        ${i1}=  evaluate  ${i}+1
        ${b}=  Get Substring  ${str}  ${i}  ${i1}
        ${even}=  evaluate  ${b}%${2}
        IF  ${even}==0
            ${sum}=  evaluate  "${sum}"+"${b}."
        END
    END
    log to console  ${sum}
    [Return]  ${sum}

Integer  [Arguments]  ${n}
    ${int}=  convert to integer  ${n}
    [Return]  ${int}