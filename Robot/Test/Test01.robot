*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser       

*** Test Cases ***
Facebook Login
    [Documentation]    Open Facebook login page
    [Tags]    Sanity
    Open Browser    ${URL}[FB]    chrome
    Maximize Browser Window
    Input Text    id=email        ${CredentialsFB}[0] 
    Input Text    id=pass         ${CredentialsFB}[1]
    Click Button    name=login
    Sleep    ${Sleep_Time}    
    
OrangeHRM page Login
    [Tags]    Smoke
    [Documentation]    open and login in orangeHrm page
    Login
    Click Element    id=welcome    
    Click Element    link=Logout  
    Sleep    ${Sleep_Time}
    
    
*** Variables ***
&{URL}    FB= https://www.facebook.com/    Orange= https://opensource-demo.orangehrmlive.com/index.php/auth/login  
${Sleep_Time}     5
@{CredentialsFB}    Karthik    Santhi
@{CredentialsOR}    Admin    admin132


*** Keywords ***
Login
    Open Browser    &{URL}[Orange]    chrome
    Set Browser Implicit Wait    ${Sleep_Time}
    Input Text    id=txtUsername    @{CredentialsOR}[0]
    Input Password    id=txtPassword    @{CredentialsOR}[1]
    Click Button    id=btnLogin       
            