*** Settings ***
Library    Browser
*** Keywords ***
Open swag labs login page
    New Browser    headless=False
    New Page    https://www.saucedemo.com/

Input Username and PASSWORD
    [Arguments]    ${username}    ${password}
    Fill Text    id=user-name  ${username}   
    Fill Text    id=password   ${password}

Submit Login 
    Click  id=login-button

Verify Login Success
    ${URL}=  Get Url
    Should Be Equal       ${URL}  https://www.saucedemo.com/inventory.html

