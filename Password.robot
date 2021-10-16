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
@{symbol}       !#$%&-'()*+
${a-z}          abcdefghijklmnopqrstuvwxyz
@{1-9}          123456789

*** Test Case ***
Check Password
    ${result}   Password     (9)9)Aa


Test Others Password
    ${result}   Password     1aA
    Should Be Equal  ${result}  ${3}

    ${result}   Password     AaBbCc12
    Should Be Equal  ${result}  ${4}

    ${result}   Password     AAAaaaAAA
    Should Be Equal  ${result}  ${3}

    ${result}   Password     Ab#c23$$$
    Should Be Equal  ${result}  ${5}

*** Keywords ***
Password  [Arguments]  ${pas}
    ${flag1}=  set variable  ${0}
    ${flag2}=  set variable  ${0}
    ${flag3}=  set variable  ${0}
    ${flag4}=  set variable  ${0}
    ${a-zUpper}=  Convert To Upper Case  abcdefghijklmnopqrstuvwxyz
    ${flag}=  set variable  ${0}
    ${newflag}=  set variable  ${0}
    ${len}=  get length  ${pas}                                         
    Should Be True  ${len} < 100  Пароль слишком велик                  # Проверка длины пароля
    IF  ${len} >= 8
        ${newflag}=  evaluate  ${newflag}+${1}
    END
     @{listpas}=  Split String To Characters  ${pas}
    FOR  ${j}  IN RANGE    11
        ${j+1}=  evaluate  ${j}+${1}
        ${n}=  get substring  @{symbol}  ${j}  ${j+1}
        FOR  ${i}  IN  @{listpas}
            IF  "${i}" == "${n}" 
                ${flag1}=  evaluate  ${flag1}+${1}
                Exit for Loop
            END
        END
        IF  ${flag1} == 1
            ${newflag}=  evaluate  ${newflag}+${1}
            Exit for Loop
        END
    END
    FOR  ${j}  IN RANGE    10
        ${j+1}=  evaluate  ${j}+${1}
        ${n}=  get substring  @{1-9}  ${j}  ${j+1}
        FOR  ${i}  IN  @{listpas}    
            IF  "${i}" == "${n}"
               ${flag2}=  evaluate  ${flag2}+${1}
               Exit for Loop
            END
        END
        IF  ${flag2} == 1
            ${newflag}=  evaluate  ${newflag}+${1}
            Exit for Loop
        END
    END
    FOR  ${j}  IN RANGE    27
        ${j+1}=  evaluate  ${j}+${1}
        ${n}=  get substring  ${a-z}  ${j}  ${j+1}
        FOR  ${i}  IN  @{listpas} 
            IF  "${i}" == "${n}"
                ${flag3}=  evaluate  ${flag3}+${1}
                Exit for Loop
            END
        END
        IF  ${flag3} == 1
            ${newflag}=  evaluate  ${newflag}+${1}
            Exit for Loop
        END
    END
    FOR  ${j}  IN RANGE    27
        ${j+1}=  evaluate  ${j}+${1}
        ${n}=  get substring  ${a-zUpper}  ${j}  ${j+1}
        FOR  ${i}  IN  @{listpas}
            IF  "${i}" == "${n}"
                ${flag4}=  evaluate  ${flag4}+${1}
                Exit for Loop
            END
        END
        IF  ${flag4} == 1
            ${newflag}=  evaluate  ${newflag}+${1}
            Exit for Loop
        END
    END
    [Return]  ${newflag}