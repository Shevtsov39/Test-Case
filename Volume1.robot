*** Settings ***

*** Test Case ***
Chek Volume Positive
    Run Keyword And Expect Error  Значение равно нулю  Volume  ${3}  ${0}  ${0}
    Run Keyword And Expect Error  Значение равно нулю  Volume  ${0}  ${4}  ${5}
    ${v}=  Volume  ${3}  ${4}  ${5}
    Should Be Equal As Numbers  ${v}  60
    
Chek Volume Negative
    Run Keyword And Expect Error  Значение аргумента отрицательное  Volume  ${3}  ${-4}  ${5}
    Run Keyword And Expect Error  Значение аргумента отрицательное  Volume  ${-3}  ${4}  ${5}
    Run Keyword And Expect Error  Значение аргумента отрицательное  Volume  ${3}  ${4}  ${-5}
    Run Keyword And Expect Error  Значение аргумента отрицательное  Volume  ${-3}  ${-4}  ${5}
    Run Keyword And Expect Error  Значение аргумента отрицательное  Volume  ${-3}  ${-4}  ${-5}
    Run Keyword And Expect Error  Не целое  Volume  ${3.4}  ${4.7}  ${5.5}
    Run Keyword And Expect Error  Не целое  Volume  ${3}  ${4}  ${5.5}
    Run Keyword And Expect Error  Не целое  Volume  ${3.4}  ${4.7}  ${5}

*** Keyword ***
Volume   [Arguments]  ${a}  ${b}  ${c}
    Should Be True  ${a} >= 0 and ${b} >= 0 and ${c} >= 0  Значение аргумента отрицательное
    ${rounded1}=  Convert To Integer  ${a}
    ${rounded2}=  Convert To Integer  ${b}
    ${rounded3}=  Convert To Integer  ${c}
    Run keyword if  ${rounded1} != ${a}  Fail  Не целое
    Run keyword if  ${rounded2} != ${b}  Fail  Не целое
    Run keyword if  ${rounded3} != ${c}  Fail  Не целое
    Run keyword if  ${a}== ${0}  Fail  Значение равно нулю  
    Run keyword if  ${b}== ${0}  Fail  Значение равно нулю
    Run keyword if  ${c}== ${0}  Fail  Значение равно нулю
    ${d}=  evaluate  ${a}*${b}*${c}
    [Return]  ${d}