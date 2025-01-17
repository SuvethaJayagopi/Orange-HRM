*** Settings ***
Documentation     A login resource file with login features
Library     SeleniumLibrary

*** Variables ***
${error_msg}    xpath://p[text()='Invalid credentials']
${dashBoard}     xpath://h6[text()="Dashboard"]  
${required}    xpath://span[text()="Required"]


*** Keywords ***

Fill the login form
    [Arguments]    ${Username}    ${Password}
    
    Input Text    xpath://input[@name='username']    ${Username}
    Input Password    xpath://input[@type='password']    ${Password}
    Click Button    xpath://button[@type='submit']

verify the valid credentials
    Element Text Should Be    ${dashBoard}    Dashboard

verify the invalid credentials
    ${result}    Get Text    ${error_msg}
    Should Be Equal As Strings    ${result}    Invalid credentials   
    
verify the blank credentials
    Element Text Should Be    ${required}    Required


    


