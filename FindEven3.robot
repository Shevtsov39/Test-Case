*** Settings ***
Library   String

*** Variables ***

*** Test Case ***
Test FindEven  
    ${x}=  FindEven  ${25045}

Test Negative Even
    Run Keyword And Expect Error  Значение аргумента отрицательное  FindEven  ${-7}
    Run Keyword And Expect Error  Значение не целое  FindEven  ${10.8}
    Run Keyword And Expect Error  Значение равно 0  FindEven  ${0}
    Run Keyword And Expect Error  Значение содержит 0  FindEven  ${201}


*** Keywords ***
FindEven  [Arguments]  ${num}
    Should Be True   ${num}>=0   Значение аргумента отрицательное
    ${rounded1}=  Convert To Integer  ${num}
    Run keyword if  ${rounded1} != ${num}  Fail  Значение не целое
    Run keyword if  ${num}== ${0}  Fail  Значение равно 0
    ${sum}=  set variable  ${EMPTY}
    ${str}=  Convert To string  ${num}
    ${len}=  get length  ${str}
    FOR  ${i}  IN RANGE  0   ${len} 
        ${i1}=  evaluate  ${i}+1
        ${b}=  Get Substring  ${str}  ${i}  ${i1}
        ${even}=  evaluate  ${b}%${2}
        IF  ${b}==0
            Run keyword  Fail  Значение содержит 0
        ELSE IF  ${even}==0
            ${sum}=  evaluate  "${sum}"+"${b}."
        END
    END
    log to console  ${sum}
    [Return]  ${sum}
