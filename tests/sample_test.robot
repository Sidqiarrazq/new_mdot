*** Settings ***
Library    SeleniumLibrary

Test Setup       Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${URL}         https://m-new.cinema21.co.id/id
${BROWSER}     firefox
${USERNAME}    0821212121
${PASSWORD}    212121
${OTP}         111111


*** Test Cases ***
Valid Login Test
    Maximize Browser Window
    Submit Login Homepage
    Input Username And Password
    Submit Login Form
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

# Input OTP
#     Wait Until Element Is Visible    //div[@class='FormOtp_form__U62ob']
#     Input Text    //input[1]    ${OTP}
#     Input Text    //input[2]    ${OTP}
#     Input Text    //input[3]    ${OTP}
#     Input Text    //input[4]    ${OTP}
#     Input Text    //input[5]    ${OTP}
#     Input Text    //input[6]    ${OTP}

Submit Login Form
    Wait Until Element Is Visible    //button[text()='Login']
    Click Element    //button[text()='Login']

Verify Login Success
    Wait Until Element Is Visible    //div[@class='Alert_snackbar__aHkWS Alert_success__phczx false']
    Alert Should Be Present    //div[@class='Alert_snackbar__aHkWS Alert_success__phczx false']    Welcome, ${USERNAME}

Submit User Button
    Wait Until Element Is Visible    //button[@class='navbtn']
    Click Element    //button[@class='navbtn']

Submit Logout Button
    Wait Until Element Is Visible    //div[@class='NavbarLink_dropdown__footer__FRFUM']
    Click Element    //div[@class='NavbarLink_dropdown__footer__FRFUM']

Submit Yes Button
    Wait Until Element Is Visible    //button[normalize-space()='Yes']
    Click Element    //button[normalize-space()='Yes']