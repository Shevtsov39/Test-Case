*** Settings ***
Library         OperatingSystem
Library         String
*** Variables ***


*** Test Cases ***
Read File
    File
    
*** Keywords ***
File
    log to console  \t
    ${file}=  set variable  Какой-то Текст  
    ${file1}  Get File  КомандыGit.txt
    @{read}  Create List  ${file1}
    @{lines}  Split To Lines  @{read}
    Append To File  C:/tests/Primer/КомандыGit.txt   ${file1}
    log to console  \t${lines}  no_newline=true