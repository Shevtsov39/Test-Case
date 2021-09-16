*** Settings ***
Library   String

*** Variables ***

*** Test Case ***
Test FindEven  
    ${x}=  FindEven  ${255.275}

*** Keywords ***
FindEven  [Arguments]  ${num}
    ${sum}=  set variable  ${EMPTY}
    ${int}=  Integer  ${num}
    ${rounded1}=  Convert To string  ${int}
    ${len}=  get length  ${rounded1}
    FOR  ${i}  IN RANGE  0   ${len} 
        ${i1}=  evaluate  ${i}+1
        ${b}=  Get Substring  ${rounded1}  ${i}  ${i1}
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