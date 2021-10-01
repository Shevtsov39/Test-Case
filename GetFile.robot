*** Settings ***
Library         OperatingSystem
Library         String

*** Variables *** 
${in}            RobotF.txt
${out}           New.txt

*** Test Cases ***
Test Clone File
    ${x}=  Clone File1   ${in}  ${out}  

#Test Exsisting File
    ${in1}=  set variable  Robotfff.txt
    Run Keyword And Expect Error  Входного файла не существует  Clone File1  ${in1}  ${out}
    ${out1}=  set variable  Newww.txt
    Run Keyword And Expect Error  Выходного файла не существует  Clone File1  ${in}  ${out1}
    ${in2}=  set variable  empty.txt
    Run Keyword And Expect Error  Файл пустой  Clone File1  ${in2}  ${out}

*** Keywords ***
Clone File1  [Arguments]  ${inputFile}  ${outputFile}
    [Documentation]    Функция копирует текст из файла  ${inputFile} в ${outputFile}  
    File Should Exist  ${inputFile}  Входного файла не существует 
    File Should Not Be Empty  ${inputFile}  Файл пустой                     #Файл не должен быть пустым
    ${sum2}=  Set Variable  ${EMPTY}
    ${inf}=  Get File  ${inputFile}
    @{lines}=  Split To Lines  ${inf}   0                                   #Цифра в конце означает с какой строки начать записывать информацию(к примеру если единица, будет пропущена первая строка)
    File Should Exist  ${outputFile}  Выходного файла не существует
    Remove File  ${outputFile}                                              #Удаляем файл перед тем как вставить в него текст
        FOR  ${i}  ${line}  IN ENUMERATE  @{lines}  start=1
            ${sum1}=  Set Variable  ${i}) ${line}\n 
            Append To File  ${outputFile}  ${sum1}
        END
    [Return]  ${sum1}
