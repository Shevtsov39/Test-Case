*** Settings ***
Library   String

*** Variables ***

*** Test Case ***
Test FindEven  
    ${x}=  FindEven  17477

*** Keywords ***
FindEven  [Arguments]  ${num}
    ${sum}=  set variable  ${EMPTY}
    ${len}=  get length  ${num}
    FOR  ${i}  IN RANGE  0   ${len}
        ${i1}=  evaluate  ${i}+1
        ${b}=  Get Substring  ${num}  ${i}  ${i1}
        ${even}=  evaluate  ${b}%${2}
        IF  ${even}==0
            ${sum}=  evaluate  "${sum}"+"${b}."
        END
    END
    log to console  ${sum}
    [Return]  ${sum}