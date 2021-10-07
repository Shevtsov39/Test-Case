*** Settings ***

*** Variables ***


*** Test Case ***
Test Swap                       # Работает только с числами
    ${a}=  set variable  8
    ${b}=  set variable  6
    Swap    ${a}   ${b}
    ${x}=  set variable  Hello
    ${y}=  set variable  World
    SwapSecond    ${x}   ${y}

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