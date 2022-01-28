*** Settings ***
Library    String

*** Variables ***

*** Test Case ***
Test Sequence
    ${num}=  Sequence  ${12}
      


*** Keywords ***
Sequence  [Arguments]  ${num}
    ${s1}=  set variable  ${1}
    FOR  ${i}  IN RANGE  2   ${num}                     #В переменной ${num} ук
        ${ostatok}=  evaluate  ${i}%${2}                #Проверяем переменную ${i}, то есть число на остаток при делении(остаток=1 - нечетное, остаток=2 - четное)
        IF  ${ostatok}==0                               #Условие
            ${s1}=  evaluate  "${s1}"+"${i}"

        ELSE                                            #Если условие не выполняется, запускается ELSE
            ${s1}=  evaluate  "${i}"+"${s1}"
            ${s1}=  Regularity  ${s1}
        END
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