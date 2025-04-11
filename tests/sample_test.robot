*** Settings ***
Library    SeleniumLibrary
Library    library.py
Test Setup       Open Browser    ${URL_BETA}    ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${URL_STAGING}      https://dev-m-new.cinema21.co.id/
${URL_BETA}         https://m-new.cinema21.co.id/
${BROWSER}          firefox
# ${USERNAME}         6281219693235
# ${PASSWORD}         123456

${USERNAME}         62821212121
${PASSWORD}         212121
${OTP}              111111


# DB Config
${MESSAGE}        Hello, world!
${PASSWORD}       ${EMPTY}
${ALIAS}          mtix_devel

${SSH_HOST}         34.124.238.137
${SSH_PORT}         20001
${SSH_USER}         regi
${SSH_PKEY}         /Users/cinemaxxi/.ssh/id_rsa
${SQL_HOST}         10.255.255.6
# ${SQL_HOST}         localhost:3306
${SQL_PORT}         3306
${SQL_USER}         mtix_dev
${SQL_PASSWORD}     mtix_dev@21
${SQL_DATABASE}     mtix_application

*** Test Cases ***
Valid Login Test
    Maximize Browser Window
    Submit Login Homepage
    Input Username And Password
    Submit Login Form
    # Generate OTP Code      6281219693235
    Input OTP
    Verify Login Success
    Submit User Button
    Submit Logout Button
    Submit Yes Button

Veriry registrasi
    Maximize Browser Window
    Submit Login Homepage
    

*** Keywords ***
Submit Login Homepage
    Wait Until Element Is Visible    //a[text()='Login']
    Click Element    //a[text()='Login']

Input Username And Password
    Wait Until Element Is Visible    //input[contains(@id, 'input')]
    Wait Until Element Is Visible    //input[@id='password']
    Input Text    //input[contains(@id, 'input')]    ${USERNAME}
    Input Text    //input[@id='password']    ${PASSWORD}

Input OTP
    Wait Until Element Is Visible    //div[@class='FormOtp_form__U62ob']
    ${length}=    Get Length    ${OTP}
    FOR    ${index}    IN RANGE    0    ${length}
        Input Text    //input[${index + 1}]    ${OTP[${index}]}
    END 

Submit Login Form
    Wait Until Element Is Visible    //button[text()='Login']
    Click Element    //button[text()='Login']

Verify Login Success
    Wait Until Element Is Visible    //div[@class='Alert_snackbar__aHkWS Alert_success__phczx false']

Submit User Button
    Wait Until Element Is Visible    //img[contains(@src, 'avatar')]
    Click Element    //img[contains(@src, 'avatar')]

Submit Logout Button
    Wait Until Element Is Visible    //div[@class='NavbarLink_dropdown__footer__FRFUM']
    Click Element    //div[@class='NavbarLink_dropdown__footer__FRFUM']

Submit Yes Button
    Wait Until Element Is Visible    //button[normalize-space()='Yes']
    Click Element    //button[normalize-space()='Yes']

Generate OTP Code
    [Documentation]     Keyword for generate otp code login
    [Arguments]         ${PHONE}=${phone_number}
    Sleep   3
    Query Select Data OTP Login From DB mtix_application            ${PHONE}

Query Select Data OTP Login From DB mtix_application
    [Documentation]         Keyword for get select otp code login from to_send mtix_application
    [Arguments]             ${PHONE}=${phone_number}
    Open Connection SSH And DB
    # Connect Fast Forward
    ${result}=         Execute Query    SELECT SUBSTRING(substring_index(message,'OTP : ',-1),1,6) from mtix_application.to_send WHERE msisdn = '${PHONE}' ORDER BY datelog desc limit 1
    Log    ${result}
    Set Test Variable       ${OTP}        ${result[0][0]}
    Log to console          ${OTP}

Open Connection SSH And DB
    [Documentation]     Open SSH tunnel, connect to MySQL
    [Arguments]        ${DatabaseName}=${SQL_DATABASE}
    Open SSH Tunnel    ${SSH_HOST}    ${SSH_PORT}    ${SSH_USER}    ${SSH_PKEY}    ${SQL_HOST}    ${SQL_PORT}
    Mysql Connect      ${SQL_USER}    ${SQL_PASSWORD}    ${DatabaseName}