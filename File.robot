*** Settings ***
Documentation       Дан файл с текстом. Напечатать все символы, расположенные между первой и второй запятой. 
...                 Если второй запятой нет, то должны быть напечатаны все символы, расположенные после единственной имеющейся запятой.
Library             OperatingSystem
Library             String
Library             Collections
*** Variables *** 
${in}            File.txt
${comma}         ,

*** Test Cases ***
Test First File
    First File
    
*** Keywords ***
First File
    ${flag}=  set variable  ${0}
    ${text}=  Get File  ${in}                            # Получаем текст.     
    ${kolichestvo}=  Get Count  ${text}  ${comma}        # Ищем запятые в данном тексте   
    IF  ${kolichestvo}==0                                
        ${flag}=  evaluate  ${flag}+${flag}
    ELSE
        ${flag}=  evaluate  ${flag}+${1}
    END
    @{parts}=  Split String  ${text}  ${comma}
    ${afterComm}=  set variable  ${parts}[${flag}]
    IF  "${afterComm}" == "${text}"
        log to console  \nВ тексте нет запятых!
    END
