*** Settings ***
Library         OperatingSystem
Library         String

*** Variables *** 
 
*** Test Cases ***
Test Get File
    ${x}=  File  
    Log To Console  \n${x}
*** Keywords ***
File
    ${sum2}=  set variable  ${EMPTY}
    ${inf}=  Get File  RobotF.txt
    @{text}=  Create List  ${inf}
    @{lines}=  Split To Lines  @{text}   0        #Цифра в конце означает с какой строки начать записывать информацию(к примеру если единица, будет пропущена первая строка)
        FOR  ${i}  ${line}  IN ENUMERATE  @{lines}  start=1
            ${sum1}=  evaluate  "${i})"+"${line}" 
            ${sum2}=  evaluate  "${sum2}"+"${sum1}"
        END
    Append To File  New.txt  ${sum2}
    [Return]  ${sum2}