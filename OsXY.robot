*** Settings ***                                                                                                                                    
                                                                
*** Variables ***
${first}        Первая четверть
${second}       Вторая четверть
${third}        Третья четверть
${fourth}       Четвертая четверть

*** Test Case ***
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
    IF  ${x}>=0 and ${y}>=0
        log to console  ${first}
        ${result}=  set variable  ${first}
    ELSE IF  ${x}<0 and ${y}>=0
        log to console  ${second}
        ${result}=  set variable  ${second}
    ELSE IF  ${x}<0 and ${y}<0
        log to console  ${third}
        ${result}=  set variable  ${third}
    ELSE IF  ${x}>0 and ${y}<0
        log to console  ${fourth}
        ${result}=  set variable  ${fourth}
    END
    [Return]  ${result}