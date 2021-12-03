*** Settings ***
Library    String

*** Variables ***

*** Test Case ***
Test Sequence
    ${num}=  Sequence  ${13}
      
*** Keywords ***
Sequence  [Arguments]  ${num}
    ${s1}=  set variable  ${EMPTY}
    log to console  \n
    FOR  ${i}  IN RANGE  1   ${num} + 1
        ${ostatok}=  evaluate  ${i}%${2}
        ${s1}=  evaluate  "${s1}"+"${i}"
        IF  ${ostatok}==1    
            ${s1}=  Regularity  ${s1}
        END
        log to console  ${s1} 
    END
    [Return]  ${s1}

Regularity  [Arguments]  ${text}
    ${sum1}=  set variable  ${EMPTY}
    ${len}=  get length  ${text}
     FOR  ${i}  IN RANGE  0   ${len}
          ${i2}=  evaluate  ${i}+1
          ${f}=  get substring  ${text}  ${i}   ${i2}
          ${sum1}=  evaluate  "${f}"+"${sum1}"   
     END     
    [Return]  ${sum1}

    