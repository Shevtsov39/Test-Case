*** Settings ***

*** Test cases ***
Test Square          
    Run Keyword And Expect Error  Значение равно нулю  Square  ${0}  ${20}
    Run Keyword And Expect Error  Значение равно нулю  Square  ${10}  ${0} 
    ${s}=  Square        ${10}  ${20}
    Should Be Equal As Numbers  ${s}  200

Test Negative Square
    Run Keyword And Expect Error  Значение аргумента отрицательное  Square  ${-10}  ${20} 
    Run Keyword And Expect Error  Значение аргумента отрицательное  Square  ${-10}  ${-20}
    Run Keyword And Expect Error  Значение не целое  Square  ${10.8}  ${20}
    Run Keyword And Expect Error  Значение не целое  Square  ${10}  ${20.7}
    Run Keyword And Expect Error  Значение не целое  Square  ${10.2}  ${20.7}

*** Keyword ***
Square  [Arguments]  ${x}  ${y}  
    Should Be True   ${x} >= 0 and ${y} >= 0  Значение аргумента отрицательное
    ${rounded1}=  Convert To Integer  ${x}
    Run keyword if  ${rounded1} != ${x}  Fail  Значение не целое
    ${rounded2}=  Convert To Integer  ${y} 
    Run keyword if  ${rounded2} != ${y}  Fail  Значение не целое
    Run keyword if  ${x}== ${0}  Fail  Значение равно нулю  
    Run keyword if  ${y}== ${0}  Fail  Значение равно нулю
    ${s}=  evaluate  ${x}*${y}
    log  Площадь прямоугольника = ${s}
    [Return]  ${s}