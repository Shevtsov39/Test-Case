*** Settings ***
Library         Browser
Library         OperatingSystem

*** Variables ***
${browser}       Chrome
${edge}          Edge
${file}          C:\\tests\\Primer\\Urls\\url.txt
${antiforurl}    https://www.virustotal.com/gui/home/url
${antiforfile}   https://www.virustotal.com/gui/home/upload

# *** Test Case ***
# Test Youtube
#     ${text}=  Get File  ${file}
#     @{read}=  Create List  ${text}
#     FOR  ${url}  IN  @{read}
#         New Browser    ${antiforurl}    ${browser}
#         Maximize Browser Window
#         Press Key      ${url}
#         Press Key      RETURN

#     END                   
                        
#aria-valuetext=0 мин. 1 сек.


*** Settings ***
Library   Browser

*** Variables ***
${BROWSER}      chromium
${LOGIN_URL}    https://www.virustotal.com/gui/home/url
*** Test Cases ***
#Example Test  
    #Open Browser	https://www.virustotal.com/gui/home/url	  ${BROWSER}  
    #Press Keys      https://www.google.com
    #Press Keys      RETURN
    #Get Text    Testing with Robot Framework
    #New Browser    chromium    headless=true
    #New Page   ${LOGIN_URL}  

Starting a browser with a page
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       https://www.virustotal.com/gui/home/url
    Fill Text      input[placeholder='Search or scan a URL']    http://ag-online.lordfilms-s.biz/41633-film-ostrov-prokljatyh-2009.html
    Keyboard Key    press    Enter
    ${element}  Get text   css=.positives
    log to console  ${element}
    Sleep    5
    #element=48414eb2-b3e2-4472-8508-22ab406dcca4 без вируса
    #element=e36c68a2-abde-4279-a6f9-2122b6f09f52 с одним вирусом
    #https://www.ibm.com/docs/ru/elm/6.0.4?topic=testing-test-case-test-suite-overview  element=9a5751f2-d4b6-49ea-8a3e-651928156cac
    #http://ag-online.lordfilms-s.biz/41633-film-ostrov-prokljatyh-2009.html

    