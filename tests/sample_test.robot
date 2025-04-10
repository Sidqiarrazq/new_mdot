*** Settings ***
Library    SeleniumLibrary
# Library    library.py
# # Library    custom_keywords.py  # Menggunakan custom keywords dari Python

*** Variables ***
${URL}         https://m-new.cinema21.co.id/id
${BROWSER}     chrome
${USERNAME}    0821212121
${PASSWORD}    212121
${OTP}         111111
# ${OTP_API_URL}   https://api.example.com/get_otp  # Example API endpoint to fetch OTP
# ${OTP_FIELD}     //input[@name="otp"]  # XPath of the OTP input field
# ${SUBMIT_BTN}    //button[@type="submit"]  # XPath of the submit button

*** Test Cases ***
Valid Login Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    //a[text()='Login']
    Input Username And Password
    Submit Login Form
    Input OTP
    Click Element    //img[@alt='user']
    Click Element    //div[@class='NavbarLink_dropdown__footer__FRFUM']
    Click Element    //button[normalize-space()='Yes']
    # Query Select Data OTP Login From DB mtix_application
    # Verify Login Success
    Close Browser

# Invalid Login Test
#     Open Browser    ${URL}    ${BROWSER}
#     Input Invalid Credentials
#     Submit Login Form
#     Verify Login Failure
#     Close Browser

*** Keywords ***
Input Username And Password
    Wait Until Element Is Visible    //input[contains(@id, 'input')]
    Wait Until Element Is Visible    //input[@id='password']
    Input Text    //input[contains(@id, 'input')]    ${USERNAME}
    Input Text    //input[@id='password']    ${PASSWORD}

Input OTP
    Wait Until Element Is Visible    //div[@class='FormOtp_form__U62ob']
    Input Text    //input[1]    ${OTP}
    Input Text    //input[2]    ${OTP}
    Input Text    //input[3]    ${OTP}
    Input Text    //input[4]    ${OTP}
    Input Text    //input[5]    ${OTP}
    Input Text    //input[6]    ${OTP}

# Input OTP
#     Wait Until Element Is Visible    //div[@class='FormOtp_form__U62ob']
#     FOR    ${index}    IN RANGE    1    7
#     Input Text    //input[${index}]    ${OTP}
#     END 

Submit Login Form
    Wait Until Element Is Visible    //button[text()='Login']
    Click Element    //button[text()='Login']

Verify Login Success
    Wait Until Element Is Visible    //div[@class='Alert_snackbar__aHkWS Alert_success__phczx false']
    Alert Should Be Present    //div[@class='Alert_snackbar__aHkWS Alert_success__phczx false']    Welcome, ${USERNAME}

# Input Invalid Credentials
#     Input Text    id=username_field    invalid_user
#     Input Text    id=password_field    invalid_pass

# Verify Login Failure
#     Wait Until Element Is Visible    id=error_message
#     Element Should Contain    id=error_message    Invalid credentials