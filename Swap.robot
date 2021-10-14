*** Settings ***

*** Variables ***


*** Test Case ***
Test Swap                       # Работает только с числами
    Swap    ${8}   ${6}
    SwapSecond    Hello   World

*** Keywords ***
Swap  [Arguments]  ${first}  ${second}          #Первый вариант
    ${first}=  evaluate  ${first}+${second}        
    ${second}=  evaluate  ${first}-${second}                  
    ${first}=  evaluate  ${first}-${second}
    log to console  \nПервая переменная = ${first}
    log to console  Вторая переменная = ${second}
    log to console  =============================

SwapSecond  [Arguments]  ${first}  ${second}          #Второй вариант работает со строками
    ${a}=  create list  ${first}  ${second}
    ${b}=  set variable  ${a}[:1]
    ${a}=  set variable  ${a}[1:2]
    log to console  \nПервая переменная = ${a}
    log to console  Вторая переменная = ${b}