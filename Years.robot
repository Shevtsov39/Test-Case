*** Settings ***
Library         String

*** Variables ***


*** Test Case ***
Test The Same 
    #New Version   

    Years 

*** Keywords ***
Years   
    FOR  ${year}  IN RANGE  1910   1921
        FOR  ${month}  IN RANGE  1   13
            IF  ${month} < 10
                ${month}=  set variable  0${month}
            END
            FOR  ${days}  IN RANGE  1   31   
                ${d+m}=  set variable  ${days}${month}
                ${mult}=  evaluate  ${d+m}*${year}
                ${mult}=  convert to string  ${mult}         
                ${flag}=  set variable  ${true}
                @{chars}=  Split String To Characters  ${mult}
                ${c}=  set variable  ${chars}[4]
                FOR  ${i}  IN  @{chars}
                    IF  ${c} != ${i}
                        ${flag}=  set variable  ${false}
                        Exit for Loop  
                    END
                END
                IF  ${flag}
                    ${print}=  set variable  ${days}.${month}.${year} = ${mult}
                    log to console  ${print}
                END
            END
        END  
    END
 
New Version
    FOR  ${year}  IN RANGE  1   2000
        FOR  ${month}  IN RANGE  1   13
            IF  ${month} < 10
                ${month}=  set variable  0${month}
            END
            FOR  ${days}  IN RANGE  1   31   
                ${d+m}=  set variable  ${days}${month}
                ${mult}=  evaluate  ${d+m}*${year}
                ${ostatok}=  set variable  ${mult}
                ${lastDigit}=  evaluate  ${mult}%10
                FOR  ${i}  IN RANGE  1  9
                    ${ostatok}=  evaluate  ${ostatok}//10
                    ${notlastDigit}=  evaluate  ${ostatok}%10 
                    IF  ${lastDigit} == ${notlastDigit}
                        Continue For Loop
                    ELSE
                        Exit For Loop
                    END   
                END
                IF  ${ostatok}==0
                    ${print}=  set variable  ${days}.${month}.${year} = ${mult}
                    log to console  ${print}
                    Exit For Loop
                END
            END
        END  
    END