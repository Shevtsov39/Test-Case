*** Settings ***
Documentation       Задача
...                 Назовем пароль криптостойким, если выполнены 5 критериев
...                 1. Пароль содержит строчные латинские буквы
...                 2. Пароль содержит заглавные латинские буквы
...                 3. Пароль содержит цифры
...                 4. Символы: ! " # $ % & - ' ( ) * +
...                 5. Длина пароля не менее 8 символов
...                 Требуется по данному паролю определить, сколько критериев криптостойкости выполнено.
...                 Входные данные:
...                 Вводится одна строка, состоящая только из латинских букв и цифр. Количество символов в строке не превышает 100.
...                 Выходные данные:
...                 Выведите количество критериев криптостойкости, которым удовлетворяет пароль.
Library     String
Library     Collections

*** Variables ***
${symbol}       !#$%&-'()*+"""
${a-z}          abcdefghijklmnopqrstuvwxyz
${1-9}          123456789

*** Test Case ***
Check Password
    ${result}   Verify Password     AaBbC123()
    Should Be Equal  ${result}  ${5}

Test Others Password
    ${result}   Verify Password     1aA
    Should Be Equal  ${result}  ${3}
    log to console  ${result}
    ${result}   Verify Password     AaBbCc12
    Should Be Equal  ${result}  ${4}
    log to console  ${result}
    ${result}   Verify Password     AAAaaaAAA
    Should Be Equal  ${result}  ${3}
    log to console  ${result}
    ${result}   Verify Password     Ab#c23$$$
    Should Be Equal  ${result}  ${5}
    log to console  ${result}

*** Keywords ***
Verify Password  [Arguments]  ${pas}
    ${i+1}=  set variable  ${0}
    ${all}=  set variable  1234567890!#$%&-'()*+"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
    ${criterias}=  Create List  ${0}   ${0}   ${0}    ${0}
    ${sum}=  set variable  ${0}
    ${len}=  Get Length  ${pas}
    FOR  ${i}  IN RANGE     ${len}
        ${i+1}=  evaluate  ${i}+${1}
        ${char}=  Get Substring  ${pas}  ${i}  ${i+1}
        ${count1}=  Get Count  ${all}[0:10]  ${char}
        ${count2}=  Get Count  ${all}[10:22]  ${char}
        ${count3}=  Get Count  ${all}[22:48]  ${char}
        ${count4}=  Get Count  ${all}[48:76]  ${char}
        IF  ${count1} > 0 and ${criterias}[0]==0
            Set List Value  ${criterias}  0  ${1}
        ELSE IF  ${count2} > 0 and ${criterias}[1]==0
            Set List Value  ${criterias}  1  ${1}
        ELSE IF  ${count3} > 0 and ${criterias}[2]==0
            Set List Value  ${criterias}  2  ${1}
        ELSE IF  ${count4} > 0 and ${criterias}[3]==0
            Set List Value  ${criterias}  3  ${1}
        END
    END
    ${sum}=  evaluate  ${criterias}[0]+${criterias}[1]+${criterias}[2]+${criterias}[3]
    IF  ${len} >= 8
        ${sum}=  evaluate  ${sum}+${1}
    END
    [Return]  ${sum}

Verify Password Criterias  [Arguments]  ${pas}
    ${A-ZUpper}=  Convert To Upper Case  ${a-z}
    ${criterias}=  Create List  ${0}   ${0}   ${0}    ${0}
    ${len}=  Get Length  ${pas}
    FOR  ${i}  IN RANGE     ${len}
        ${i+1}=  evaluate  ${i}+${1}
        ${char}=  Get Substring  ${pas}  ${i}  ${i+1}
        ${count}=  Get Count  ${A-ZUpper}  ${char}
        IF  ${count} > 0 and ${criterias}[0]==0
            Set List Value  ${criterias}  0  ${1}
        END
        ${count}=  Get Count  ${a-z}  ${char}
        IF  ${count} > 0 and ${criterias}[1]==0
            Set List Value  ${criterias}  1  ${1}
        END
        ${count}=  Get Count  ${1-9}  ${char}
        IF  ${count} > 0 and ${criterias}[2]==0
            Set List Value  ${criterias}  2  ${1}
        END
        ${count}=  Get Count  ${symbol}  ${char}
        IF  ${count} > 0 and ${criterias}[3]==0
            Set List Value  ${criterias}  3  ${1}
        END
    END
    ${sum}=  evaluate  ${criterias}[0]+${criterias}[1]+${criterias}[2]+${criterias}[3]  
    IF  ${len} >= 8
        ${sum}=  evaluate  ${sum}+${1}
    END
    [Return]  ${sum}

    