*** Settings ***
Documentation       Написать функцию, которая по входным данным День, Месяц, Год определяет является ли дата корректной 
...                 (32 мая или 29 февраля 1901 года быть не может)
...                 Результат работы: True или False.
Library         String

*** Variables ***
@{longM}               1  3  5  7  8  10  12
@{shortM}              4  6  9  11

*** Test Case ***
Test for Leap2
        ${result}  Other Values  ${31}  ${12}  ${2017}
        Should Be True  ${result}   ${true}
        log to console  Год - ${result}
        
        ${result}  Other Values  ${31}  ${5}  ${2000}
        Should Be True  ${result}   ${false}
        log to console  Год - ${result}

        ${result}  Other Values  ${29}  ${2}  ${2000}
        Should Be True  ${result}   ${true}
        log to console  Год - ${result}

        ${result}  Other Values  ${29}  ${2}  ${2003}
        log to console  Год - ${result}
        #Should Be True  ${result}   ${false}
        

        ${result}  Other Values  ${29}  ${0}  ${1600}
        log to console  Год - ${result}
        #Should Be True  ${result}   ${false}

        ${result}  Other Values  ${29.5}  ${2}  ${2021}
        log to console  Год - \n ${result}
        #Should Be True  ${result}   ${false}

*** Keywords ***
Condition month2  [Arguments]  ${month}                 # Проверяем на короткие месяцы
        FOR  ${i}  IN  @{shortM}
            IF  ${month} == ${i}
                Return from Keyword  ${false}
            ELSE
                Continue For Loop
            END
        END  
        [Return]  ${true}

Condition month1  [Arguments]  ${month}                 # На длинные
        FOR  ${i}  IN  @{longM}                                                     
            IF  ${month} == ${i}
                Return from Keyword  ${true}
            ELSE
                Continue For Loop
            END
        END  
        ${result}  Condition month2  ${month}   
        [Return]  ${result}                             # Возвращаем true если месяц длинный, false если короткий

Visokosniy Year2  [Arguments]  ${year}
        ${leap}=  evaluate  ${year}%${4}
        IF  ${leap} != 0
            Return from Keyword  ${false}
        END
        ${leap400}=  evaluate  ${year}%${400}
        ${leap100}=  evaluate  ${year}%${100}
        IF  ${leap100} == 0 and ${leap400} != 0
            Return from Keyword  ${false}
        END
        [Return]  ${true}

Condition Month  [Arguments]  ${day}  ${month}  ${year}
        ${result1}  Visokosniy Year2  ${year}
        IF  ${month}==2 and ${result1}==${true}                      # Если год високосный и месяц февраль
            IF  ${day} <= 29
                Return from Keyword  ${true} 
            ELSE
                Return from Keyword  ${false}
            END
        END
        IF  ${month}==2 and ${result1}==${false}                     # Если годе не високосный и месяц февраль
            IF  ${day} <= 28
                Return from Keyword  ${true} 
            ELSE
                Return from Keyword  ${false}
            END    
        END
        ${result2}  Condition month1  ${month}
        IF  ${result2}==${false}                                     # Если месяц короткий
            IF  ${day} > 30 
                Return from Keyword  ${false}
            ELSE
                Return from Keyword  ${true}
            END       
        END
        IF  ${result2}==${true}                                      # Если месяц длинный
            IF  ${day} <= 31
                Return from Keyword  ${true}
            ELSE
                Return from Keyword  ${false}
            END
        END
        [Return]  ${false}

Other Values  [Arguments]  ${day}  ${month}  ${year}
    ${result}=  set variable  ${true}
    ${rounded1}=  convert to integer  ${day}
    ${rounded2}=  convert to integer  ${month}
    ${rounded3}=  convert to integer  ${year}
    IF  ${day} != ${rounded1} or ${month} != ${rounded2} or ${year} != ${rounded3}
        ${result}=  set variable  ${false}
    END
    IF  ${day} <= ${0} or ${month} <= ${0} or ${year} <= ${0}
        ${result}=  set variable  ${false}
    END
    IF  ${day} > ${31} or ${month} > ${12} or ${year} > ${2022}
        ${result}=  set variable  ${false}
    END
    IF  ${result}==${true}
        ${result}  Condition Month  ${day}  ${month}  ${year}
    END
    [Return]  ${result}