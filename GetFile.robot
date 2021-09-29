*** Settings ***
Library         OperatingSystem
Library         String

*** Variables *** 
 
*** Test Cases ***
Test Get File
    ${x}=  File  

*** Keywords ***
File
    ${inf}=  Get File  RobotF.txt
    @{text}=  Create List  ${inf}
    @{lines}=  Split To Lines  @{text}   0        #Цифра в конце означает с какой строки начать записывать информацию(к примеру если единица, будет пропущена первая строка)
        FOR  ${i}  ${item}  IN ENUMERATE  @{lines}  start=1
            Log To Console  \n${i}) ${item} 
        END
    #Append To File  New.txt  @{lines}
    [Return]  @{lines}