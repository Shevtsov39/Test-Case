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
@{symbol}       !$%&-'()*+
${a-z}          abcdefghijklmnopqrstuvwxyz
@{1-9}          123456789
${pattern}      [A-Z0-9_\\s]{1,20} \\| [0-9]+ cm\\| [0-9A-Fa-f]:[0-9A-Fa-f]

*** Test Case ***
Check Password
    Password     (ig97ddF)

# New Password
    Example   (ig97ddF)
    # log to console  ${symbol}
    # log to console  @{a-z}
    # log to console  ${1-9}
    # log to console  @{A-Z}
    
*** Keywords ***
Password  [Arguments]  ${pas}
    ${a-zUpper}=  Convert To Upper Case  abcdefghijklmnopqrstuvwxyz
    ${flag}=  set variable  ${0}
    ${nwflag}=  set variable  ${0}
    @{listpas}=  Split String To Characters  ${pas}
    ${len}=  get length  ${pas}                                         
    Should Be True  ${len} < 100  Пароль слишком велик                  # Проверка длины пароля
    IF  ${len} >= 8
        ${nwflag}=  evaluate  ${nwflag}+${1}
    END
    
    FOR  ${j1}  IN RANGE    27
        ${j+1}=  evaluate  ${j1}+${1}
        ${n1}=  get substring  @{symbol}  ${j1}  ${j+1}
        ${n2}=  get substring  @{1-9}  ${j1}  ${j+1}
        ${n3}=  get substring  ${a-z}  ${j1}  ${j+1}
        ${n4}=  get substring  ${a-zUpper}  ${j1}  ${j+1}

        FOR  ${i}  IN  @{listpas}
            IF  "${i}" == "${n1}" 
                log to console  symbol - ${n1}
                ${flag}=  evaluate  ${flag}+${1}
                IF  ${flag}==1
                    ${nwflag}=  evaluate  ${nwflag}+${1}
                END
            END
            IF  "${i}" == "${n2}"
                log to console  digits - ${n2}
                ${flag}=  evaluate  ${flag}+${1}
                IF  ${flag}>1
                    ${nwflag}=  evaluate  ${nwflag}+${1} 
                END
            END
            IF  "${i}" == "${n3}"
                log to console  lower - ${n3}
                ${flag}=  evaluate  ${flag}+${1}
                IF  ${flag}>1
                    ${nwflag}=  evaluate  ${nwflag}+${1} 
                END
            END
            IF  "${i}" == "${n4}"
                log to console  upper - ${n4}
                ${flag}=  evaluate  ${flag}+${1}
                IF  ${flag}>1
                    ${nwflag}=  set variable  ${nwflag}+${1} 
                END
            END
        END
    END
    log to console  ${nwflag}


New Version  [Arguments]  ${pas}
    ${flag}=  set variable  ${0}
    ${len}=  get length  ${pas}
    IF  ${len} >= 8
        ${flag}=  evaluate  ${flag}+${1}
    END
    Should Be True  ${len} < 100  Пароль слишком велик
    @{listpas}=  Split String To Characters  ${pas} 
    ${j1}=  set variable  ${0}
    ${h1}=  set variable  ${0}
    ${g1}=  set variable  ${0}
    ${f1}=  set variable  ${0}
     
    FOR  ${n}  IN RANGE  1  100
        
        FOR  ${j}  IN  @{a-z}

            FOR  ${h}  IN  @{A-Z}

                FOR  ${g}  IN  @{symbol}

                    FOR  ${f}  IN  @{1-9}
                    
                        FOR  ${i}  IN  @{listpas}

                            IF  "${i}" == "${j}"
                                ${flag}=  evaluate  ${flag}+${1}
                            END
                            IF  "${i}" == "${h}"
                                ${flag}=  evaluate  ${flag}+${1}
                            END
                            IF  "${i}" == "${g}"
                                ${flag}=  evaluate  ${flag}+${1}
                            END
                            IF  "${i}" == "${f}"
                                ${flag}=  evaluate  ${flag}+${1}
                            END
                            ${fl}=  set variable  ${flag}
                        END

                    END
                
                END

            END

        END
        
    END
    log to console  ${fl}

Second Version  [Arguments]  ${pas}
    ${flag}=  set variable  ${0}
    ${len}=  get length  ${pas}
    IF  ${len} >= 8
        ${flag}=  evaluate  ${flag}+${1}
    END
    Should Be True  ${len} < 100  Пароль слишком велик
    @{listpas}=  Split String To Characters  ${pas} 
    
    FOR  ${n}  IN RANGE  40
        FOR  ${i}  IN  @{listpas}


            FOR  ${j}  IN  @{a-z}  
                IF  "${i}" == "${j}"
                    ${flag}=  evaluate  ${flag}+${1}
                END
            END
            FOR  ${h}  IN  @{A-Z}
                IF  "${i}" == "${h}"
                    ${flag}=  evaluate  ${flag}+${1}
                END
            END                     
            FOR  ${g}  IN  @{symbol}
                IF  "${i}" == "${g}"
                    ${flag}=  evaluate  ${flag}+${1}
                END
            END                     
            FOR  ${f}  IN  @{1-9}
                IF  "${i}" == "${f}"
                    ${flag}=  evaluate  ${flag}+${1}
                END
            END
            ${fl}=  set variable  ${flag}
        END
    END
    log to console  ${fl}

Example  [Arguments]  ${pas}
    Should Match Regexp  12345678901234567890A   A   3:5      ${pattern}
    ${a-zUpper}=  Convert To Upper Case  abcdefghijklmnopqrstuvwxyz
    ${flag}=  set variable  ${0}
    ${nwflag}=  set variable  ${0}
    ${len}=  get length  ${pas}                                         
    Should Be True  ${len} < 100  Пароль слишком велик                  # Проверка длины пароля
    IF  ${len} >= 8
        ${nwflag}=  evaluate  ${nwflag}+${1}
    END
     @{listpas}=  Split String To Characters  ${pas}
    FOR  ${j1}  IN RANGE    27
        ${j+1}=  evaluate  ${j1}+${1}
        ${n1}=  get substring  @{symbol}  ${j1}  ${j+1}
        FOR  ${i}  IN  @{listpas}
            IF  "${i}" == "${n1}" 
                log to console  symbol - ${n1}
                ${flag}=  evaluate  ${flag}+${1}
                IF  ${flag}==1
                    ${nwflag}=  evaluate  ${nwflag}+${1}
                END
            END
        END
    END
    FOR  ${j1}  IN RANGE    27
        ${j+1}=  evaluate  ${j1}+${1}
        ${n2}=  get substring  @{1-9}  ${j1}  ${j+1}
        FOR  ${i}  IN  @{listpas}    
            IF  "${i}" == "${n2}"
                log to console  digits - ${n2}
                ${flag}=  evaluate  ${flag}+${1}
                IF  ${flag}>1
                    ${nwflag}=  evaluate  ${nwflag}+${1} 
                END
            END
        END
    END
    FOR  ${j1}  IN RANGE    27
        ${j+1}=  evaluate  ${j1}+${1}
        ${n3}=  get substring  ${a-z}  ${j1}  ${j+1}
        FOR  ${i}  IN  @{listpas} 
            IF  "${i}" == "${n3}"
                log to console  lower - ${n3}
                ${flag}=  evaluate  ${flag}+${1}
                IF  ${flag}>1
                    ${nwflag}=  evaluate  ${nwflag}+${1} 
                END
            END
        END
    END
    FOR  ${j1}  IN RANGE    27
        ${j+1}=  evaluate  ${j1}+${1}
        ${n4}=  get substring  ${a-zUpper}  ${j1}  ${j+1}
        FOR  ${i}  IN  @{listpas}
            IF  "${i}" == "${n4}"
                log to console  upper - ${n4}
                ${flag}=  evaluate  ${flag}+${1}
                IF  ${flag}>1
                    ${nwflag}=  set variable  ${nwflag}+${1} 
                END
            END
        END
    END
    log to console  ${nwflag}