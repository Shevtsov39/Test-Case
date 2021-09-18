*** Settings ***                                                                                                                                    
                                                                
*** Variables ***
${first}        Первая четверть
${second}       Вторая четверть
${third}        Третья четверть
${fourth}       Четвертая четверть

*** Test Case ***
Test Quarter
    ${x}=  Quarter  ${-2}  ${0}
    log to console  ${x}
    Run Keyword And Expect Error  Точка находится на оси X  Quarter  ${2}  ${0}
    Run Keyword And Expect Error  Точка находится на оси Y  Quarter  ${0}  ${3}

Check First Quarter
    ${q}=  Quarter  ${4}  ${5}
    Should Be Equal As Strings  ${q}  ${first}

Check Second Quarter
    ${q}=  Quarter  ${-4}  ${5}
    Should Be Equal As Strings  ${q}  ${second}

Check Third Quarter
    ${q}=  Quarter  ${-4}  ${-5}
    Should Be Equal As Strings  ${q}  ${third}

Check Fourth Quarter
    ${q}=  Quarter  ${4}  ${-5}
    Should Be Equal As Strings  ${q}  ${fourth}

*** Keywords ***
Quarter  [Arguments]  ${x}  ${y}
    Run Keyword If  ${y}==0  Fail  Точка находится на оси X
    Run Keyword If  ${x}==0  Fail  Точка находится на оси Y
    IF  ${x}>=0 and ${y}>=0
        ${result}=  set variable  ${first}
    ELSE IF  ${x}<=0 and ${y}>=0  
        ${result}=  set variable  ${second}
    ELSE IF  ${x}<0 and ${y}<0  
        ${result}=  set variable  ${third}
    ELSE IF  ${x}>=0 and ${y}<0
        ${result}=  set variable  ${fourth}
    END
    [Return]  ${result}