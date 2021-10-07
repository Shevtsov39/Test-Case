*** Settings ***

*** Variables ***

*** Test Case ***
Test Correct Data                     
    ${result}  Correct Data  ${1}  ${2}  ${1991}
    log to console  ${result}

    ${result1}  Correct Data  ${31}  ${12}  ${1877}
    Should Be True  ${result1}  ${true}

    ${result2}  Correct Data  ${13}  ${7}  ${2001}
    Should Be True  ${result2}  ${true}

Test Negative Numbers
    Run Keyword and Expect Error  Одно из значений отрицательное  Correct Data  ${-275}  ${-275}  ${-275}
    Run Keyword and Expect Error  Одно из значений равно нулю  Correct Data  ${0}  ${8}  ${7}
    Run Keyword and Expect Error  Одно из значений не целое  Correct Data  ${22.5}  ${7.7}  ${1875.6}
    Run Keyword and Expect Error  Одно из значений превышает возможную величину  Correct Data  ${32}  ${14}  ${2024}

*** Keywords ***
Correct Data  [Arguments]  ${day}  ${month}  ${year}
    Run Keyword If  ${day}==${0} or ${month}==${0} or ${year}==${0}  Fail  Одно из значений равно нулю
    Run Keyword If  ${day} < ${0} or ${month} < ${0} or ${year} < ${0}  Fail  Одно из значений отрицательное
    ${rounded1}=  convert to integer  ${day}
    ${rounded2}=  convert to integer  ${month}
    ${rounded3}=  convert to integer  ${year}
    Run Keyword If  ${day} != ${rounded1} or ${month} != ${rounded2} or ${year} != ${rounded3}  Fail  Одно из значений не целое
    Run Keyword If  ${day} > ${31} or ${month} > ${12} or ${year} > ${2021}  Fail  Одно из значений превышает возможную величину
    ${result}=  set variable  ${true}
    IF  ${month}==2 and ${day} > 29
            ${result}=  set variable  ${false}
    ELSE IF  ${day} > 31
        ${result}=  set variable  ${false}
    END
    [Return]  ${result}