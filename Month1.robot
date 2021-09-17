*** Settings ***                                                                     
Library    Collections                                                                
                                                                
*** Variables ***


*** Test Case ***
Check Month
    Run Keyword And Expect Error  Значение равно 0  Month  ${0}
    ${x}=  Month  ${0}

Test Negative Month
    Run Keyword And Expect Error  Значение аргумента отрицательное  Month  ${-7}
    Run Keyword And Expect Error  Значение не целое  Month  ${10.8}

*** Keywords ***
Month  [Arguments]  ${m}
    Should Be True   ${m} >= 0   Значение аргумента отрицательное
    ${rounded1}=  Convert To Integer  ${m}
    Run keyword if  ${rounded1} != ${m}  Fail  Значение не целое
    Run keyword if  ${m}== ${0}  Fail  Значение равно 0
    FOR  ${i}  IN RANGE   1
        IF  ${m}>=3 and ${m}<=5
            log to console  Это Весна
        ELSE IF  ${m}>=6 and ${m}<=8
            log to console  Это Лето
        ELSE IF  ${m}>=9 and ${m}<=11
            log to console  Это Осень   
        ELSE IF  ${m}<=12 and ${m}>=1
            log to console  Это Зима 
        ELSE
            log to console  Ошибка
        END
    END
