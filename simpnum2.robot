*** Settings ***
Library     Collections

*** Variables ***
@{primes}       ${2}

*** Test Cases ***
Test Prime Numbers
    Prime Numbers  ${50}
    log to console  ${primes}

*** Keywords ***
Prime Numbers  [Arguments]  ${count}  
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

Test For Prime  [Arguments]   ${n}  @{primes}
    ${f}=  set variable  ${true}
    FOR  ${i}  IN  @{primes}             
        ${ostatok}=  evaluate  ${n}%${i}                  #Остаток от деления
        IF  ${ostatok} == 0
            ${f}=  set variable  ${false}
            Exit For Loop    
        END
    END
    [Return]  ${f}