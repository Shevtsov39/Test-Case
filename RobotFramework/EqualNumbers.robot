*** Settings ***
Documentation       Дано четырехзначное число. Написать функцию, которая определяет, есть ли одинаковые цифры в нем.
...                 Результат работы функции: True или False
...                 Строки не использовать.

*** Variables ***


*** Test Case ***
Test Equal Numbers                       
    ${result}  Equal Numbers  ${1216}
    #log to console  ${result}

# Check Correct Answer
    # ${result1}  Equal Numbers  ${1136}
    # Should Be True  ${result1}==${true} 

    # ${result2}  Equal Numbers  ${2521}
    # Should Be True  ${result2}==${true}

    # ${result3}  Equal Numbers  ${3543}
    # Should Be True  ${result3}==${true}

    # ${result4}  Equal Numbers  ${2414}
    # Should Be True  ${result4}==${true}

    # ${result5}  Equal Numbers  ${1558}
    # Should Be True  ${result5}==${true}
    
    # ${result6}  Equal Numbers  ${3566}
    # Should Be True  ${result6}==${true}

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
    log to console  ${first}
    ${second}=  evaluate   (${num}//${100})%${10}
    log to console  ${second}
    ${third}=   evaluate   (${num}//${10})%${10}
    log to console  ${third}
    ${fourth}=  evaluate   ${num}%${10}
    log to console  ${fourth}
    IF  ${first}==${second} or ${first}==${third} or ${first}==${fourth} or ${second}==${fourth} or ${third}==${second} or ${fourth}==${third}          # Проверить каждый вариант
        ${result}=  set variable  ${true}  
    END
    [Return]  ${result}
    