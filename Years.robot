*** Settings ***
Library         String

*** Variables ***


*** Test Case ***
Test The Same 
    ${x}  Years   
    #log to console  ${x}

*** Keywords ***
Years   
    ${data}=  create list  ${EMPTY}
    FOR  ${year}  IN RANGE  1910  1913 + 1
        FOR  ${month}  IN RANGE  1   12 + 1
            IF  ${month} < 10
                ${month}=  set variable  0${month}
            END
            FOR  ${days}  IN RANGE  1   31   
                ${d+m}=  set variable  ${days}${month}
                ${mult}=  evaluate  ${d+m}*${year}
                ${mult1}=  convert to string  ${mult}
                ${len}=  get length  ${mult1}
                ${num1}=  get substring  ${mult1}  0  1 
                FOR  ${i}  IN RANGE  1  ${len}
                    ${i+1}=  evaluate  ${i}+${1}
                    ${n}=  get substring  ${mult1}  ${i}  ${i+1}
                    IF  ${num1} != ${n}
                        ${result}=  set variable  ${false}
                        Exit For Loop
                    ELSE
                        ${result}=  set variable  ${true}
                        Exit For Loop
                    END
                END
                IF  ${result} == ${true}
                    ${print}=  set variable  ${days}.${month}.${year} = ${mult}
                    log to console  ${print}
                    #${data}=  set variable  ${print}
                END
            END
        END  
    END