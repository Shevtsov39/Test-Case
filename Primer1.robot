*** Settings ***
Library    String

*** Variables ***

*** Test Case ***
Test Regularity
     ${text}=  Regularity  qwerty12      


*** Keywords ***
Regularity  [Arguments]  ${text}                      #Функция, которая прибавляет к каждому последующему значению это значение Пример= 1 22 333 4444 55555
    ${sum}=  set variable  ${EMPTY}
    ${len}=  Get length  ${text}
     FOR  ${i}    IN RANGE    ${len}
         FOR  ${j}  IN RANGE  0  ${i}
              ${i-1}=  evaluate  ${i}-1
              ${b}=  get substring  ${text}  ${i-1}  ${i}
              log to console  ${i}, ${b}, ${i-1}
              ${sum}=  evaluate  "${sum}"+"${b}"
         END
     END   
    [Return]  ${sum}
