*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}          Chrome
${url1}             https://github.com/
${url2}             https://translate.yandex.ru/


*** Test Case ***
Test browser
    Open Browser                ${url1}  ${browser}
    Maximize Browser Window
    Page Should Contain         Where the world builds software
    ${text}=  Get Text          xpath=/html/body/div[4]/main/div[1]/div[1]/div[1]/div/div/div[1]/p
    log to console  ${text}
    Go To  ${url2}
    Input Text                  id:fakeArea  ${text}
    Click Element               id:textSpeaker
    Sleep                       9
    #Wait For Condition	style = document.getElementById('textSpeaker').style.toString(); alert(style); return style.search('state-silent') != -1  60                         
    Close Browser

