*** Settings ***

*** Variables ***


*** Test Case ***
Test Equal Numbers                       # Готов. Функция, которая определяет, есть ли одинаковые цифры в нем.
    ${result}  Equal Numbers  ${7353}
    log to console  ${result}

*** Keywords ***
Equal Numbers  [Arguments]  ${num}
    ${result}=  set variable  ${false}
    ${first}=  evaluate  ${num}//${1000}
    ${second}=  evaluate  ${num}//${100}
    ${second}=  evaluate  ${second}%${10}
    ${third}=  evaluate  ${num}//${10}
    ${third}=  evaluate  ${third}%${10}
    ${fourth}=  evaluate  ${num}%${10}
    IF  ${first}==${second} or ${first}==${third} or ${first}==${fourth} or ${second}==${fourth} or ${third}==${second} or ${fourth}==${third}
        ${result}=  set variable  ${true}  
    END
    [Return]  ${result}