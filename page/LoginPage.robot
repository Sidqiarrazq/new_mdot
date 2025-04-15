*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${input_username}    //input[contains(@id, 'input')]
${input_password}    //input[@id='password']
${submit_login_form}    //button[text()='Login']

*** Keywords ***
Input Username And Password
    Wait Until Element Is Visible    ${input_username}
    Wait Until Element Is Visible    ${input_password}
    Input Text    ${input_username}    ${USERNAME}
    Input Text    ${input_password}    ${PASSWORD}

Submit Login Form
    Wait Until Element Is Visible    ${submit_login_form}
    Click Element    ${submit_login_form}