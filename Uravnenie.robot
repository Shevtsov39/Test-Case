*** Settings ***

*** Variables ***
${noroots}      Корней нет
${oneroot}      Только один корень


*** Test Case ***
Test Roots
    Roots  ${2}  ${4}  ${-7}

Other Tests Roots
    ${y}=  Roots  ${0}  ${0}  ${0}
    Should Be Equal As Strings  ${y}  ${noroots}
    ${x}=  Roots  ${1}  ${6}  ${9}
    Should Be Equal As Strings  ${x}  ${oneroot}

Test Negative Radius
    Run Keyword And Expect Error  Значения равны 0  Roots  ${0}  ${0}  ${0} 
    Run Keyword And Expect Error  Одно из значений равно 0  Roots  ${3}  ${4}  ${0}
    Run Keyword And Expect Error  Одно из значений равно 0  Roots  ${2}  ${0}  ${6}
    Run Keyword And Expect Error  Одно из значений равно 0  Roots  ${0}  ${4}  ${3}

*** Keywords ***
Roots  [Arguments]  ${a}  ${b}  ${c}
    Run keyword if  ${a}== ${0} and ${b}==${0} and ${c}==${0}  Fail  Значения равны 0
    Run keyword if  ${a}== ${0} or ${b}==${0} or ${c}==${0}  Fail  Одно из значений равно 0
    ${d}=  evaluate  ${b}**2-4*${a}*${c}
    log to console  ${d}
    IF  ${d} > 0
        ${x1}=  evaluate  (-${b}+math.sqrt(${d}))/(2*${a})
        ${x2}=  evaluate  (-${b}-math.sqrt(${d}))/(2*${a})
        ${x1}=  evaluate  "%.3f" % ${x1}
        ${x2}=  evaluate  "%.3f" % ${x2}
        log to console  ${x1}
        log to console  ${x2}  
    ELSE IF  ${d}==${0}
            ${x}=  evaluate  -${b}/(${2}*${a})
            ${result}=  set variable  Только один корень 
            log to console   ${x}
    ELSE
        ${result}=  set variable  Корней нет
        log to console  Корней нет
    END               
    [Return]  