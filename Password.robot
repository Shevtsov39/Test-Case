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
@{symbol}       !#$%&-'()*+"""
${a-z}          abcdefghijklmnopqrstuvwxyz
@{1-9}          123456789

*** Test Case ***
Check Password
    ${result}   Better Version     AaBbCc12
    log to console  ${result}

Test Others Password
    ${result}   Better Version     1aA
    Should Be Equal  ${result}  ${3}
    log to console  ${result}
    ${result}   Better Version     AaBbCc12
    Should Be Equal  ${result}  ${4}
    log to console  ${result}
    ${result}   Better Version     AAAaaaAAA
    Should Be Equal  ${result}  ${3}
    log to console  ${result}
    ${result}   Better Version     Ab#c23$$$
    Should Be Equal  ${result}  ${5}
    log to console  ${result}

*** Keywords ***
Better Version  [Arguments]  ${pas}
    ${flag}=  set variable  ${0}
    ${len}=  get length  ${pas}                                         
    Should Be True  ${len} < 100  Пароль слишком велик                  # Проверка длины пароля
    IF  ${len} >= 8
        ${flag}=  evaluate  ${flag}+${1}
    END
    ${a-zUpper}=  Convert To Upper Case  ${a-z}
    @{listpas}=  Split String To Characters  ${pas}
        FOR  ${i}  IN  @{listpas}
            ${count1}=  Get Count  @{1-9}   ${i}
            IF  ${count1} > 0
                ${flag}=  evaluate  ${flag}+${1}
                Exit For Loop
            END
        END
        FOR  ${i}  IN  @{listpas}    
            ${count2}=  Get Count  ${a-z}   ${i}
            IF  ${count2} > 0
                ${flag}=  evaluate  ${flag}+${1}
                Exit For Loop
            END
        END
        FOR  ${i}  IN  @{listpas}
            ${count3}=  Get Count  ${a-zUpper}   ${i}
            IF  ${count3} > 0
                ${flag}=  evaluate  ${flag}+${1}
                Exit For Loop
            END
        END
        FOR  ${i}  IN  @{listpas}
            ${count4}=  Get Count  @{symbol}   ${i}
            IF  ${count4} > 0
                ${flag}=  evaluate  ${flag}+${1}
                Exit For Loop
            END
        END
    [Return]  ${flag}
