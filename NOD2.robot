*** Settings ***

*** Variables ***

*** Test Case ***                                       
Test NOD                                 
    ${y}=  NOD   ${28}  ${35} 
    Should Be Equal As Numbers  ${y}  ${7} 
    
    ${x}=  NOD   ${23}  ${17} 
    Should Be Equal As Numbers  ${x}  ${1} 

    ${a}=  NOK   ${28}  ${35} 
    Should Be Equal As Numbers  ${a}  ${140} 
    
    ${b}=  NOK   ${23}  ${17} 
    Should Be Equal As Numbers  ${b}  ${391} 

Test Nagative NOD
    Run Keyword And Expect Error  Значение аргумента отрицательное  NOD  ${-7}  ${-5}  
    Run Keyword And Expect Error  Значение не целое  NOD  ${10.8}  ${6.4}
    Run Keyword And Expect Error  Значения равны 0  NOD  ${0}  ${0}
    Run Keyword And Expect Error  Одно из значений равно 0  NOD  ${0}  ${2}
    Run Keyword And Expect Error  Одно из значений равно 0  NOD  ${3}  ${0}
                          
*** Keywords ***
NOD  [Arguments]  ${a}  ${b}
    Should Be True   ${a}>=0 and ${b}>=0  Значение аргумента отрицательное
    ${rounded1}=  Convert To Integer  ${a}
    ${rounded2}=  Convert To Integer  ${b}
    Run keyword if  ${rounded1} != ${a} and ${rounded2} != ${b}  Fail  Значение не целое
    Run keyword if  ${a}== ${0} and ${b}==${0}  Fail  Значения равны 0
    Run keyword if  ${a}== ${0} or ${b}==${0}  Fail  Одно из значений равно 0
    ${ab}=  Create List   ${a}   ${b}
    IF  ${a} > ${b}
        ${big}=  set variable  ${a}
    ELSE 
        ${big}=  set variable  ${b}
    END
    FOR  ${i}  IN RANGE  1  ${big} 
        IF  ${a} > ${b}
            ${a}=  evaluate  ${a}-${b}
        ELSE  
            ${b}=  evaluate  ${b}-${a} 
        END    
        Exit For Loop If  ${a}==${b}
    END 
    NOK  ${ab}[0]  ${ab}[1]
    [Return]  ${b}

NOK  [Arguments]  ${a}  ${b}
    ${b2}=  set variable  ${b}
    ${a2}=  set variable  ${a}
    FOR  ${i}  IN RANGE  1   40
        IF  ${a} < ${b}
            ${a}=  evaluate  ${a2}+${a}
        ELSE IF  ${a} > ${b}
            ${b}=  evaluate  ${b2}+${b}
        ELSE   
            Exit For Loop If  ${a}==${b}
        END
    END
    [Return]  ${a}