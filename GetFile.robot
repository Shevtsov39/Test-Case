*** Settings ***
Library         OperatingSystem
Library         String

*** Variables *** 
${in}            RobotF.txt
${out}           New.txt

*** Test Cases ***
Test Clone File
    ${x}=  Clone File   ${in}  ${out}  

Test Exsisting File
    ${in1}=  set variable  Robotfff.txt
    Run Keyword And Expect Error  Входного файла не существует  Clone File  ${in1}  ${out}
    ${out1}=  set variable  Newww.txt
    #Run Keyword And Expect Error  Выходной файл существует  Clone File  ${in}  ${out1}
    ${in2}=  set variable  empty.txt
    Run Keyword And Expect Error  Файл пустой  Clone File  ${in2}  ${out}

#Other Tests


*** Keywords ***
Clone File  [Arguments]  ${inputFile}  ${outputFile}
    [Documentation]    Функция копирует текст из файла  ${inputFile} в ${outputFile}  
    File Should Exist  ${inputFile}  Входного файла не существует 
    File Should Not Be Empty  ${inputFile}  Файл пустой                     #Файл не должен быть пустым
    ${sum2}=  Set Variable  ${EMPTY}
    ${inf}=  Get File  ${inputFile}
    @{lines}=  Split To Lines  ${inf}                                      #Цифра в конце означает с какой строки начать записывать информацию(к примеру если единица, будет пропущена первая строка)
    Remove File  ${outputFile}                                             #Удаляем файл перед тем как вставить в него текст
    #File Should Not Exist  ${outputFile}  Выходной файл существует
        FOR  ${i}  ${line}  IN ENUMERATE  @{lines}  start=1
            # IF  "${line}" == "${EMPTY}"
            #     ${rm}=  Remove String  ${line}  ${line}
            #      #${i}=  evaluate  ${i}-${1}
            #      continue for loop 
            # END   
            ${sum1}=  Set Variable  ${i})${line}\n
            Append To File  ${outputFile}  ${sum1}
            log to console  ${sum1}
        END
    #Should Contain  ${outputFile}  ${inf}
    [Return]  ${sum1}
