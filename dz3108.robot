*** Settings ***
Library    String

*** Variables ***

*** Test Case ***
Test Regularity
     ${x}=  Regularity  ${10}
     Run Keyword And Expect Error  Значение равно нулю  Regularity  ${0}

Test Negative Regularity
     Run Keyword And Expect Error  Не целое  Regularity  ${10.4}
     Run Keyword And Expect Error  Значение аргумента отрицательное  Regularity  ${-10}

*** Keywords ***
Regularity  [Arguments]  ${n}
     Should Be True  ${n}>=${0}  Значение аргумента отрицательное
     ${rounded}=  Convert To Integer  ${n}
     Run Keyword If  ${rounded}!=${n}  Fail  Не целое 
     Run Keyword If  ${n}==${0}  Fail  Значение равно нулю 
     ${sum}=  set variable  ${EMPTY}
     FOR  ${i}  IN RANGE  1    ${n} + 1
          ${f}=  Get Substring  ${sum}  0  1
          IF   "${f}"=="a"
               ${sum}=  evaluate  "b"+"${sum}"  
          ELSE
               ${sum}=  evaluate  "a"+"${sum}"
          END
     END     
    [Return]  ${sum}


