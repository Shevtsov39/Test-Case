***Test Cases***
Check Oddness
  ${res}=  Get Oddness  ${8}
  Should Be Equal  ${res}  even
  ${res}=  Get Oddness  ${9}
  Should Be Equal  ${res}  odd
  
Check Oddness Negative
    Run Keyword And Expect Error  Not an integer  Get Oddness  ${8.5}

*** Keywords ***
Get Oddness  [Arguments]  ${number}
  ${rounded}=  Convert To Integer  ${number}
  Run keyword if  ${rounded} != ${number}  Fail  Not an integer
  ${mod}=  Evaluate  ${number}%2
  ${r}=  Set Variable If  ${mod}==0  even  odd
  [return]  ${r}