*** Settings ***
Library         String

*** Variables ***


*** Test Case ***
#Test Date
#    ${x}=  Date   ${14}  ${11}  ${2000}

Test The Same 
    ${x}  Years   
    log to console  ${x}

*** Keywords ***
Years   
    ${data}=  create list  ${EMPTY}
    FOR  ${year}  IN RANGE  1900  1999 + 1
        FOR  ${month}  IN RANGE  1   12 + 1
            IF  ${month} < 10
                ${month}=  set variable  0${month}
            END
            FOR  ${days}  IN RANGE  1   31   
                ${d+m}=  set variable  ${days}${month}
                ${mult}=  evaluate  ${d+m}*${year}
                ${theSame}  Is The Same  ${mult}
                IF  ${theSame}==${true}
                    ${print}=  set variable  ${days},${month},${year}=${mult}
                     log to console  ${print}
                    #${data}=  set variable  ${print}
                END
            END
        END  
    END
    [Return]  @{data}

Date  [Arguments]  ${day}  ${month}  ${year}                #Делает вычисления день+месяц*год
    ${d+m}=  evaluate  "${day}"+"${month}"
    ${m}=  evaluate  ${d+m}*${year}
    log to console  ${m}

Is The Same  [Arguments]  ${same}                                  #Проверяет число на одинаковые цифры
    ${string}=  convert to string  ${same}
    ${len}=  get length  ${string}
    ${num1}=  get substring  ${string}  0  1 
    FOR  ${i}  IN RANGE  1  ${len}
        ${i+1}=  evaluate  ${i}+${1}
        ${n}=  get substring  ${string}  ${i}  ${i+1}
        IF  ${num1} != ${n}
            Return From Keyword  ${false}
        END
    END
    [Return]  ${true}