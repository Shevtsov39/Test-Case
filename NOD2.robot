*** Settings ***

*** Variables ***

*** Test Case ***                                       
Test NOD                                 
    ${y}=  NOD   ${100}  ${2}   
    ${nod}=  set variable  ${y}
    ${x}=  NOK  ${100}  ${2}  ${nod}
                          
*** Keywords ***
NOD  [Arguments]  ${a}  ${b}
    FOR  ${i}  IN RANGE  1  100
        Exit For Loop If  ${a}==${b}
        IF  ${a} > ${b}
            ${a}=  evaluate  ${a}-${b}
        ELSE  
            ${b}=  evaluate  ${b}-${a} 
        END    
    END  
    log to console  \n NOD = ${a}
    [Return]  ${b}

NOK  [Arguments]  ${a}  ${b}  ${nod}  
    ${nok}=  evaluate  ${a}*${b}/${nod}
    log to console  NOK = ${nok}
    [Return]  ${nok}