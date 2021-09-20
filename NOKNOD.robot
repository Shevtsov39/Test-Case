*** Settings ***

*** Variables ***


*** Test Case ***                                       
Test NOD                                 
    ${y}=  NOD   ${99}  ${13}

#Test NOK    
#    ${x}=  NOK   ${100}  ${75}   
                               
*** Keywords ***
#NOK  [Arguments]  ${a}  ${b} 
#    ${nok}=  evaluate  ${a}*${b}/${nod}




NOD  [Arguments]  ${a}  ${b}
    log to console  \t
    FOR  ${i}  IN RANGE  1  ${b}
        IF  ${b} > 0
            ${c}=  evaluate  ${a}%${b}
            ${a}=  set variable  ${b}
            ${b}=  set variable  ${c}
        END
    END
    log to console  ${a}
    [Return]  ${a}