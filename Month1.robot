*** Settings ***                                                                     
Library    Collections                                                                
                                                                
*** Variables ***
${spring}       Это Весна
${summer}       Это Лето
${autumn}       Это Осень 
${winter}       Это Зима


*** Test Case ***
Test 
    ${x}=  Month  ${2}

Test Spring
    ${y}=  Month  ${3}
    Should Be Equal As Strings  ${y}  ${spring}

Test Summer
    ${z}=  Month  ${7}
    Should Be Equal As Strings  ${z}  ${summer}

Test Autumn
    ${a}=  Month  ${10}
    Should Be Equal As Strings  ${a}  ${autumn}

Test Winter
    ${b}=  Month  ${12}
    Should Be Equal As Strings  ${b}  ${winter}

Test Other Values
    Run Keyword And Expect Error  Значение слишком велико  Month  ${13}

Test Negative Month
    Run Keyword And Expect Error  Значение аргумента отрицательное  Month  ${-7}
    Run Keyword And Expect Error  Значение не целое  Month  ${10.8}
    Run Keyword And Expect Error  Значение равно 0  Month  ${0}

*** Keywords ***
Month  [Arguments]  ${m}
    Should Be True   ${m}>=0   Значение аргумента отрицательное
    ${rounded1}=  Convert To Integer  ${m}
    Run keyword if  ${rounded1} != ${m}  Fail  Значение не целое
    Run keyword if  ${m}== ${0}  Fail  Значение равно 0
    Should Be True  ${m}<=12  Значение слишком велико
    FOR  ${i}  IN RANGE   2
        IF  ${m}<=2 or ${m}>=12
            ${result}=  set variable  ${winter}
        ELSE IF  ${m}>=6 and ${m}<=8
            ${result}=  set variable  ${summer}
        ELSE IF  ${m}>=9 and ${m}<=11
            ${result}=  set variable  ${autumn}   
        ELSE IF  ${m}>=3 and ${m}<=5
            ${result}=  set variable  ${spring}
        ELSE 
            Fail
        END
    END
    log to console  ${result}
    [Return]  ${result}
      