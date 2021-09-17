*** Settings ***

*** Variables ***

*** Test Case ***
Check Month 
    ${x}=  MonthSpring  ${12}
    
   
*** Keywords ***
MonthSpring  [Arguments]  ${num}
    FOR  ${spring}  IN RANGE  3  5 + 1
        IF  ${num}==${spring}
            log to console  ${num} месяц - Весна
        ELSE
            MonthSummer  ${num}
        END
    END

MonthSummer  [Arguments]  ${num}
    FOR  ${summer}  IN RANGE  6   8 + 1
        IF  ${num}==${summer}
            log to console  ${num} месяц - Лето
        ELSE
            MonthAutumn  ${num}
        END
    END

MonthAutumn  [Arguments]  ${num}
    FOR  ${autumn}  IN RANGE  9   11 + 1
        IF  ${num}==${autumn}
            log to console  ${num} месяц - Осень
        ELSE
            MonthWinter  ${num}
        END
    END

MonthWinter  [Arguments]  ${num}
    log to console  ${num} месяц - Зима
   
    