*** Settings ***
Library         OperatingSystem
Library         String

*** Variables ***


*** Test Cases ***
Test Get File
    File  

    
*** Keywords ***
File
    ${text}=  Get File  КомандыGit.txt
    log to console  ${text}
    ${low} =	Generate Random String	6	[UPPER]
    log to console  ${low}