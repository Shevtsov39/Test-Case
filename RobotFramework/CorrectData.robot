*** Settings ***
Documentation       Написать функцию, которая по входным данным День, Месяц, Год определяет является ли дата корректной 
...                 (32 мая или 29 февраля 1901 года быть не может)
...                 Результат работы: True или False.
Library         String
Library         DateTime

*** Variables ***
@{longM}               1  3  5  7  8  10  12
@{shortM}              4  6  9  11

*** Test Case ***
Test for Leap2
        ${result}  Is Date Correct  ${31}  ${12}  ${2017}
        Should Be True  ${result}
        log to console  Год - ${result}
        
        ${result}  Is Date Correct  ${31}  ${5}  ${2000}
        Should Be True  ${result}   
        log to console  Год - ${result}

        ${result}  Is Date Correct  ${29}  ${2}  ${2000}
        Should Be True  ${result}   
        log to console  Год - ${result}

Negative Tests
        ${result}  Is Date Correct  ${29}  ${2}  ${2003}
        log to console  Год - ${result}
        Should Not Be True  ${result}   

Test Invalid Values        
        ${result}  Is Date Correct  ${29}  ${0}  ${1600}
        log to console  Год - ${result}
        Should Not Be True  ${result}

        ${result}  Is Date Correct  ${29.5}  ${2}  ${2021}
        log to console  Год - ${result}
        Should Not Be True  ${result}

*** Keywords ***
Is Leap Year  [Arguments]  ${year}
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

Is Date Correct  [Arguments]  ${day}  ${month}  ${year}
        ${result}  Check Days for Month  ${day}  ${month}  ${year}
        Return from Keyword If  not ${result}  ${false}
        ${result1}  Is Leap Year  ${year}
        IF  ${month}==2 and ((${result1} and ${day} > 29 ) or (not ${result1} and ${day} > 28)) 
            Return from Keyword  ${false} 
        END
        IF  ${month}==${4} or ${month}==${6} or ${month}==${9} or ${month}==${11}
            Return from Keyword If  ${day} > 30  ${false}
        ELSE
            Return from Keyword If  ${day} > 31  ${false}
        END
        [Return]  ${true}

Check Days for Month  [Arguments]  ${day}  ${month}  ${year}
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
    IF  ${day} > ${31} or ${month} > ${12}
        ${result}=  set variable  ${false}
    END
    ${date} =	Get Current Date
    ${dateD} =	Convert Date	${date}	  result_format=%d
    ${dateM} =	Convert Date	${date}	  result_format=%m
    ${dateY} =	Convert Date	${date}	  result_format=%Y
    IF  ${day} > ${dateD} and ${month} > ${dateM} and ${year} > ${dateY}
        ${result}=  set variable  ${false}
    END
    [Return]  ${result}