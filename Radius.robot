*** Settings ***

*** Variables ***
${out}            Точка лежит вне окружности
${in}             Точка лежит в окружности

*** Test Case ***
Test Radius
    ${x}=  Radius  ${4}  ${3}  ${8}
    Should Be Equal As Strings  ${x}  ${in}
    
    ${y}=  Radius   ${0}  ${5}  ${8} 
    Should Be Equal As Strings  ${y}  ${in} 

    ${z}=  Radius   ${5}  ${6}  ${4} 
    Should Be Equal As Strings  ${z}  ${out} 

Test Negative Radius
    Run Keyword And Expect Error  Значения равны 0  Radius  ${0}  ${0}  ${0}
    Run Keyword And Expect Error  Точка лежит в начале координат  Radius  ${0}  ${0}  ${7} 
    Run Keyword And Expect Error  Радиус отрицательный  Radius  ${3}  ${4}  ${-7}
    Run Keyword And Expect Error  Радиус равен нулю  Radius  ${2}  ${4}  ${0}

*** Keywords ***
Radius  [Arguments]  ${a}  ${b}  ${r}
    Run keyword if  ${a}== ${0} and ${b}==${0} and ${r}==${0}  Fail  Значения равны 0
    Run keyword if  ${a}== ${0} and ${b}==${0}  Fail  Точка лежит в начале координат
    Should Be True   ${r}>=0  Радиус отрицательный
    Run keyword if  ${r}== ${0}  Fail  Радиус равен нулю
    ${q}=  evaluate  math.sqrt(${a}**2+${b}**2)                #Длина гипотенузы, то есть длина от созданной точки до начала координат
        IF  ${r} < ${q}
            ${result}=  set variable  ${out}
            #log to console  ${out}
        ELSE
            ${result}=  set variable  ${in}
            #log to console    ${in}
        END
    [Return]  ${result}