*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}          Chrome
${url1}             https://oncalc.ru/calc/cifry-rimskimi       
${text}             1000

*** Test Cases ***
RomanusConverter
   Convert  ${num}

*** Keywords ***
Convert  [Arguments]  ${num}
   Open Browser                ${url1}  ${browser}
   Maximize Browser Window
   Page Should Contain         Перевод в римские цифры онлайн
   Sleep                       5
   Input Text                  id:sum  ${num}
   Click Element               xpath=/html[1]/body[1]/div[2]/div[1]/div[1]/div[6]/div[1]/div[1]/form[1]/div[1]/div[3]/input[1]
   Sleep                       2
   ${result}=  Get Text        id:result
   log to console  ${result}
   Sleep                       2
   [Return]  ${result}
   Close Browser