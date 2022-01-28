*** Settings ***
Documentation       Дано любое число. Написать функцию, которая определяет, есть ли одинаковые цифры в нем.
...                 Результат работы функции: True или False
...                 Строки не использовать.
Library     String
Library     Collections
*** Variables ***

*** Test Case ***
# Test Equal Numbers                       
#     #${result}  Split to Digits  ${15461}
#     FOR  ${i}  IN  @{result}
#         log to console  Privet ${i}
#     END

Test The Same 
    ${x}  Number One  123456
    log to console  ${x}
    Should Be True  ${x}  ${true}

    ${x}  Is All The Same  ${18345}
    Should Be True  ${x}  ${false}
    
*** Keywords ***
Split Digits To List  [Arguments]  ${num}  
    ${str}=  convert to string  ${num}
    @{list1}=  Split String To Characters  ${str}
    FOR  ${i2}  IN  @{list1}
        ${i2}=  convert to integer  ${i2}
    END
    [Return]  ${list1}

Is All The Same  [Arguments]  ${num}
    ${result}=  set variable  ${false}
    ${i1}=  set variable  ${EMPTY}
    ${list2}  Split Digits To List  ${num}
    @{list3}=  Split String To Characters  ${list2}
    FOR  ${i}  IN  @{list3}
        IF  "${i1}" != "${i}"
            ${result}=  set variable  ${true}
            #Continue for loop
        ELSE
            ${i1}=  set variable  ${i}
            Continue for loop
        END
        IF  ${i} == ${i1}
            ${result}=  set variable  ${true}    
            Continue For Loop
        END
    END
    #log to console  ${result}
    [Return]  ${result}

Number One  [Arguments]  ${num}
    @{list}=    Split String To Characters  ${num}
    ${first}=   evaluate    ${num}%10
    ${second}=  evaluate    ${num}//10%10
    ${third}=   evaluate    ${num}//100%10
    ${fourth}=  evaluate    ${num}//1000%10
    ${five}=    evaluate    ${num}//10000%10   
    ${six}=     evaluate    ${num}//100000%10
    ${seven}=   evaluate    ${num}//1000000%10
    log to console  1) - ${first} , 2) - ${second} , 3) - ${third} , 4) - ${fourth} , 5) - ${five} , 6) - ${six} , 7) - ${seven}
    [Return]  ${}

Chess
    [Documentation]     Расставить 8 ладей на шахматной доске, что бы они не пересекались.
    ...                 На выходе получить количество возможных позиций.
        FOR  ${x}  IN RANGE  1  9
            FOR  ${y}  IN RANGE  1  9
                ${n}=  

            END
        END    