*** Settings ***
Library    String

*** Variables ***

*** Test Case *** 
Test Regularity                                  #Отзеркаливаю значения
     ${text}=  Regularity  qwertyuiop12             


*** Keywords ***
Regularity  [Arguments]  ${text}
    ${sum1}=  set variable  ${EMPTY}                #Присваиваю переменной пустое значение
    ${len}=  get length  ${text}                    #Присваиваю переменной ${len} длину полученного текста  
     FOR  ${i}  IN RANGE  0   ${len}                #Создаю цикл от 0 до переменной
        ${i2}=  evaluate  ${i}+1
        ${f}=  get substring  ${text}  ${i}   ${i2}  #Перебираю каждую букву текста, где ${i} и ${i2} меняют значения каждый цикл
        ${sum1}=  evaluate  "${f}"+"${sum1}"         #К сумме по очереди прибавляем каждую букву
     END     
     log to console  ${sum1}
    [Return]  ${sum1}


