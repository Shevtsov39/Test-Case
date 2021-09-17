*** Settings ***                                                                     
Library    Collections                                                                
                                                                
*** Variables ***


*** Test Case ***
Check Month
    ${x}=  Month  ${7}


*** Keywords ***
Month  [Arguments]  ${m}
    FOR  ${i}  IN RANGE   2
        IF  ${m}==3 or ${m}==4 or ${m}==5
            log to console  Это Весна
        ELSE IF  ${m}==6 or ${m}==7 or ${m}==8
            log to console  Это Лето
        ELSE IF  ${m}==9 or ${m}==10 or ${m}==11
            log to console  Это Осень   
        ELSE IF  ${m}==12 or ${m}==1 or ${m}==2
            log to console  Это Зима 
        END
    END
