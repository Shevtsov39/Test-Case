*** Settings ***


*** Variables ***

*** Test Case ***                                       
Test Middle                                             #Вариант решения задачи с помощью списка
    ${x}=  Middle   -1  robot  22.32                    #нужно отобразить число посередине
   

*** Keywords ***
Middle  [Arguments]  ${a}  ${b}  ${c}
    ${mid}=  create list  ${a}  ${b}  ${c}
    log to console  ${mid}[1:-1]