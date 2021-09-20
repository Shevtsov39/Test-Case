*** Settings ***

*** Variables ***
${a}   100
${b}   75

*** Test Case ***                                       
Test NOD                                 
    ${y}=  NOD   ${a}  ${b}       

Test Nagative NOD
    Run Keyword And Expect Error  Значение аргумента отрицательное  NOD  ${-7}  ${-5}  
    Run Keyword And Expect Error  Значение не целое  NOD  ${10.8}  ${6.4}
    Run Keyword And Expect Error  Значения равны 0  NOD  ${0}  ${0}
    Run Keyword And Expect Error  Одно из значений равно 0  NOD  ${0}  ${2}
    Run Keyword And Expect Error  Одно из значений равно 0  NOD  ${3}  ${0}
                          
*** Keywords ***
NOD  [Arguments]  ${a}  ${b}
    ${ab}=  Create List   ${a}   ${b}
    Should Be True   ${a}>=0 and ${b}>=0  Значение аргумента отрицательное
    ${rounded1}=  Convert To Integer  ${a}
    ${rounded2}=  Convert To Integer  ${b}
    Run keyword if  ${rounded1} != ${a} and ${rounded2} != ${b}  Fail  Значение не целое
    Run keyword if  ${a}== ${0} and ${b}==${0}  Fail  Значения равны 0
    Run keyword if  ${a}== ${0} or ${b}==${0}  Fail  Одно из значений равно 0
    FOR  ${i}  IN RANGE  1  100
        IF  ${a} > ${b}
            ${a}=  evaluate  ${a}-${b}
        ELSE  
            ${b}=  evaluate  ${b}-${a} 
        END    
        Exit For Loop If  ${a}==${b}
    END 
    ${nod}=  set variable  ${b}
    log to console  \n NOD = ${a}
    NOK  ${ab}[0]  ${ab}[1]  ${nod}
    [Return]  ${b}

NOK  [Arguments]  ${a}  ${b}  ${c}  
    ${nok}=  evaluate  ${a}*${b}/${c}
    log to console  NOK = ${nok}
    [Return]  ${nok}