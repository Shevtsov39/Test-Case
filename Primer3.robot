*** Settings ***
Library    String

*** Variables ***
#${s1}=  ${1}

*** Test Case ***
Test Sequence
    ${num}=  Sequence  ${17}
      
*** Keywords ***
Sequence  [Arguments]  ${num}
    ${s1}=  set variable  ${1}
    FOR  ${i}  IN RANGE  2   ${num}
        ${ostatok}=  evaluate  ${i}%${2}
        IF  ${ostatok}==1
            ${s1}=  evaluate  "${s1}"+"${i}"
            ${s1}=  Regularity  ${s1}    
        ELSE
            ${s1}=  evaluate  "${s1}"+"${i}" 
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

    