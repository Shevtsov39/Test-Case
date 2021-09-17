*** Settings ***                                                                     
Library    Collections                                                                
                                                                
*** Variables ***


*** Test Case ***
Check Month
    ${x}=  Month  ${12}

*** Keywords ***
Month  [Arguments]  ${m}
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
