*** Settings ***

*** Variables ***


*** Test Case ***                                       
Test SQRT                                 
    ${y}=  SQRT   ${16}
                     
*** Keywords ***
SQRT  [Arguments]  ${a}
    ${sqrt}=  evaluate  ${a}**${0.5}
    log to console  ${sqrt}