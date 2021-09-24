*** Settings ***


*** Variables ***


*** Test case ***
Test Summa Loop 
    ${s}=  set variable  ${10.7}
    Should Be True  ${s} != 0
    ${s}=  Summa Loop  ${s}
    Should Be Equal  ${s}  ${55}

*** Keywords ***
Summa Loop  [Arguments]  ${num}
    ${sum}=  set variable  ${0}
    FOR  ${n}  IN RANGE  1  ${num} + 1
        ${sum}=  evaluate  ${sum}+${n}
    END
    [Return]  ${sum}