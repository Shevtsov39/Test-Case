*** Settings ***


*** Variables ***


*** Test Case ***                                       
Test Middle                               
    ${x}=  Middle   ${22}  ${3}  ${1}                        
   
Test Negative Month
    Run Keyword And Expect Error  Значение аргумента отрицательное  Middle  ${-7}  ${-1}  ${-5}
    Run Keyword And Expect Error  Значение не целое  Middle  ${10.8}  ${7.7}  ${1.6}  
    Run Keyword And Expect Error  Значение равно 0  Middle  ${0}  ${0}  ${0}

*** Keywords ***
Middle  [Arguments]  ${a}  ${b}  ${c}
    Should Be True   ${a}>=0 or ${b}>=0 or ${c}>=0  Значение аргумента отрицательное
    ${rounded1}=  Convert To Integer  ${a}
    ${rounded2}=  Convert To Integer  ${b}
    ${rounded3}=  Convert To Integer  ${c}
    Run keyword if  ${rounded1} != ${a} or ${rounded2} != ${b} or ${rounded3} != ${c}  Fail  Значение не целое
    Run keyword if  ${a}==${0} or ${b}==${0} or ${c}==${0}  Fail  Значение равно 0
    FOR  ${i}  IN RANGE  2
        IF  ${b} < ${a} < ${c} or ${c} < ${a} < ${b}
            ${result}=  set variable  ${a}
        ELSE IF  ${a} < ${b} < ${c} or ${c} < ${b} < ${a}
            ${result}=  set variable  ${b}
        ELSE   
            ${result}=  set variable  ${c}
        END
    END
    log to console  ${result}
    [Return]  ${result}