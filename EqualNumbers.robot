*** Settings ***

*** Variables ***

*** Test Case ***
Test Equal Numbers                       # Функция, которая определяет, есть ли одинаковые цифры в числе.
    ${result}  Equal Numbers  ${1116}
    log to console  ${result}

Check Correct Answer
    ${result1}  Equal Numbers  ${1436}
    Should Be True  ${result1}==${false} 

    ${result2}  Equal Numbers  ${3543}
    Should Be True  ${result2}==${true}

Test Negative Numbers
    Run Keyword and Expect Error  Число не четырёхзначное  Equal Numbers  ${756}
    Run Keyword and Expect Error  Число отрицательное  Equal Numbers  ${-2756}
    Run Keyword and Expect Error  Число не целое  Equal Numbers  ${2754.56}
    
*** Keywords ***
Equal Numbers  [Arguments]  ${num}
    Run Keyword If  ${num} < ${0}  Fail  Число отрицательное
    Run Keyword If  ${num} > ${9999} or ${num} < ${1000}  Fail  Число не четырёхзначное
    ${rounded}=  convert to integer  ${num}
    Run Keyword If  ${num} != ${rounded}  Fail  Число не целое
    ${result}=  set variable  ${false}
    ${first}=   evaluate   ${num}//${1000}
    ${second}=  evaluate   ${num}//${100}
    ${second}=  evaluate   ${second}%${10}
    ${third}=   evaluate   ${num}//${10}
    ${third}=   evaluate   ${third}%${10}
    ${fourth}=  evaluate   ${num}%${10}
    IF  ${first}==${second} or ${first}==${third} or ${first}==${fourth} or ${second}==${fourth} or ${third}==${second} or ${fourth}==${third}
        ${result}=  set variable  ${true}  
    END
    [Return]  ${result}
    