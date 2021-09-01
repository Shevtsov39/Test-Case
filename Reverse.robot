*** Settings ***
Library    String

*** Variables ***

*** Test Case ***
Test Regularity
     ${x}=  Regularity  ${EMPTY}


*** Keywords ***
Regularity  [Arguments]  ${sum1}
    ${sum}=  set variable  privet
     FOR  ${i}  IN RANGE  1    6 + 1
        ${f}=  Get Substring  ${sum}  ${0}  ${1}
        ${0}=  set variable  ${1}
        ${1}=  evaluate  ${1}+1 
        ${sum1}=  evaluate  "${f}"+"${sum1}"   
     END     
    [Return]  ${sum1}

