*** Settings ***
Library     Collections

*** Variables ***

*** Test Cases ***
Test Prime Numbers
    ${x}  Prime Numbers  ${400}
    log to console  ${x}

*** Keywords ***                                    
Prime Numbers  [Arguments]  ${count}                            # Функция выдает список, определенного нами количества, простых чисел
    @{primes}=  create list  ${2}
    ${i}=  set variable  ${1}
    FOR  ${n}  IN RANGE  3   2000  2  
        ${isPrime}=  Test For Prime  ${n}  @{primes}
        IF  ${isPrime} == ${true}   
            Append To List  ${primes}  ${n}                    
            ${i}=  evaluate  ${i}+${1}                         #Счетчик итераций
        END
        IF  ${i} == ${count}
            Exit for Loop
        END
    END
    [Return]  @{primes}

Test For Prime  [Arguments]   ${n}  @{primes}
    ${half}=  evaluate  ${n}**${0.5}
    ${f}=  set variable  ${true}
    FOR  ${i}  IN  @{primes}            
        IF  ${half} < ${i}
            Exit For Loop
        END
        ${ostatok}=  evaluate  ${n}%${i}                  #Остаток от деления
        IF  ${ostatok} == 0
            ${f}=  set variable  ${false}
            Exit For Loop    
        END
    END
    [Return]  ${f}