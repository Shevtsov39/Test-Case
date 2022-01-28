*** Settings ***

*** Variables ***


*** Test Case ***
Test SwapInteger                     
    ${x}  SwapInteger    ${611}   
    log to console  Ответ = ${x}

    ${x1}  SwapInteger    ${381}
    Should Be True  ${x1}  ${183}

    ${x2}  SwapInteger    ${233}
    Should Be True  ${x2}  ${332}

Test Negative Numbers
    Run Keyword and Expect Error  Число не трёхзначное  SwapInteger  ${75}
    Run Keyword and Expect Error  Число отрицательное  SwapInteger  ${-275}
    Run Keyword and Expect Error  Число не целое  SwapInteger  ${126.56}

*** Keywords ***
SwapInteger  [Arguments]  ${int}
    Run Keyword If  ${int} < ${0}  Fail  Число отрицательное
    Run Keyword If  ${int} > ${999} or ${int} < ${100}  Fail  Число не трёхзначное
    ${rounded}=  convert to integer  ${int}
    Run Keyword If  ${int} != ${rounded}  Fail  Число не целое
    ${first}=  evaluate  ${int}//${100}
    ${last}=  evaluate  ${int}%${10}
    ${middle}=  evaluate  ${int}//${10}
    ${middle}=  evaluate  ${middle}%${10}
    ${result}=  set variable  ${last}${middle}${first}
    [Return]  ${result}