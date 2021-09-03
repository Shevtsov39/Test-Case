*** Settings ***
Library    String

*** Variables ***

*** Test Case ***
Test Regularity
     ${text}=  Regularity  qwerty12   


*** Keywords ***
Regularity  [Arguments]  ${text}
    ${sum}=  set variable  ${EMPTY}
    ${len}=  Get length  ${text}
     FOR    ${i}    IN RANGE    0   ${len} + 1
         ${i-1}=  evaluate  ${i}-1
         ${b}=  get substring  ${text}  ${i-1}  ${i}
         FOR  ${j}  IN RANGE  0  ${i}
              ${sum}=  evaluate  "${sum}"+"${b}"
         END
     END   
    [Return]  ${sum}