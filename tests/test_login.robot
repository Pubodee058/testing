*** Settings ***
Library    Browser
Resource   ../variables/user_variables.robot
Resource   ../keywords/login_keywords.robot

*** Test Cases ***
Login with Standard User
    Open swag labs login page
    Input Username and PASSWORD    ${STANDARD_USER}    ${PASSWORD}
    Submit Login
    Verify Login Success
Login with Unknown User
    Open swag labs login page
    Input Username and PASSWORD    unknown_user    ${PASSWORD}
    Submit Login
    ${URL}=  Get Url
    Should Not Be Equal       ${URL}  https://www.saucedemo.com/inventory.html
Login with Unknown password
    Open swag labs login page
    Input Username and PASSWORD    ${STANDARD_USER}    unknown_password
    Submit Login
    ${URL}=  Get Url
    Should Not Be Equal       ${URL}  https://www.saucedemo.com/inventory.html
Login with Both Unknown
    Open swag labs login page
    Input Username and PASSWORD    unknown_user    unknown_password
    Submit Login
    ${URL}=  Get Url
    Should Not Be Equal       ${URL}  https://www.saucedemo.com/inventory.html
Login with Empty username
    Open swag labs login page
    Input Username and PASSWORD    ${EMPTY}    unknown_password
    Submit Login
    ${URL}=  Get Url
    Should Not Be Equal       ${URL}  https://www.saucedemo.com/inventory.html
Login with Empty password
    Open swag labs login page
    Input Username and PASSWORD    unknown_user    ${EMPTY}
    Submit Login
    ${URL}=  Get Url
    Should Not Be Equal       ${URL}  https://www.saucedemo.com/inventory.html
Login with Both Empty 
    Open swag labs login page
    Input Username and PASSWORD    ${EMPTY}    ${EMPTY}
    Submit Login
    ${URL}=  Get Url
    Should Not Be Equal       ${URL}  https://www.saucedemo.com/inventory.html
Login with Special characters  
    Open swag labs login page
    Input Username and PASSWORD    %dsads    !@#  
    Submit Login
    ${URL}=  Get Url
    Should Not Be Equal       ${URL}  https://www.saucedemo.com/inventory.html
