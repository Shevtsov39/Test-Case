*** Settings ***

*** Variables ***


*** Test Case ***
Test SwapInteger                     
    ${x}  SwapInteger    ${789}   
    log to console  Ответ = ${x}

*** Keywords ***
SwapInteger  [Arguments]  ${int}
    ${first}=  evaluate  ${int}//${100}
    ${last}=  evaluate  ${int}%${10}
    ${middle}=  evaluate  ${int}//${10}
    ${middle}=  evaluate  ${middle}%${10}
    ${result}=  set variable  ${last}${middle}${first}
    [Return]  ${result}