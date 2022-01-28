*** Settings ***
Library    String

*** Variables ***

*** Test Case ***
Test Regularity
     ${text}=  Regularity  qwertyuiop12   


*** Keywords ***
Regularity  [Arguments]  ${text}
    ${sum1}=  set variable  ${EMPTY}
    ${len}=  Get length  ${text}
     FOR  ${i}  IN RANGE  0   ${len}
        ${i2}=  evaluate  ${i}+1
        ${f}=  Get Substring  ${text}  ${i}   ${i2}
        ${sum1}=  evaluate  "${f}"+"${sum1}"   
     END     
    [Return]  ${sum1}

