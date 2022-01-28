*** Settings ***
Documentation       Дан файл с текстом. Напечатать все символы, расположенные между первой и второй запятой. 
...                 Если второй запятой нет, то должны быть напечатаны все символы, расположенные после единственной имеющейся запятой.
Library             OperatingSystem
Library             String
Library             Collections

*** Variables *** 
${file1}            C:\\tests\\Primer\\For OperatingSystem\\File.txt
${file2}            C:\\tests\\Primer\\For OperatingSystem\\SecondFile.txt
${file3}            C:\\tests\\Primer\\For OperatingSystem\\ThirdFile.txt
${file4}            C:\\tests\\Primer\\For OperatingSystem\\OneComma.txt
${comma}            ,

*** Test Cases ***
Test First File
    ${result}  First File  ${file1}
    Should Be Equal As Strings  "${result}"  " количество" пробелов используемых в качестве разделителя может варьироваться и поэтому пустые значения не могут быть "распознаны если они не экранированы. Пустые ячейки можно экранировать либо с помощью символа обратной косой черты либо с помощью встроенной переменной $ {EMPTY}.\n\nПоследний"

Test File From Command Line
    ${result}  First File  ${file}
    Should Be Equal As Strings  "${result}"  " разработки" 

Whithout Comma
    ${result}  First File  ${file2}
    Should Be Equal As Strings  ${result}  В тексте нет запятых!

One Word 
    ${result}  First File  ${file3} 
    Should Be Equal As Strings  ${result}  вариант

One Comma
    ${result}  First File  ${file4}
    Should Be Equal As Strings  "${result}"  " либо с помощью символа обратной косой черты."

*** Keywords ***
First File  [Arguments]  ${input}
    ${flag}=  set variable  ${0}
    ${text}=  Get File  ${input}                            # Получаем текст.     
    ${kol-vo}=  Get Count  ${text}  ${comma}        # Ищем запятые в данном тексте  
    ${k-vo}=  Get Count  ${text}  "
    IF  ${k-vo} != 0
        Log to console  В тексте есть лишние символы!
    END
    IF  ${kol-vo} != 0                 
        ${parts}=  Split String  ${text}  ${comma}               
        ${flag}=  evaluate  ${flag}+${1} 
    ELSE 
        Return From Keyword  В тексте нет запятых!
    END
    ${afterComm}=  set variable  ${parts}[${flag}]                                                                
    [Return]  ${afterComm}

    