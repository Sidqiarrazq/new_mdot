*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${input_otp}    //div[@class='FormOtp_form__U62ob']

*** Keywords ***
Input OTP
    Wait Until Element Is Visible    ${input_otp} 
    ${length}=    Get Length    ${OTP}
    FOR    ${index}    IN RANGE    0    ${length}
        Input Text    //input[${index + 1}]    ${OTP[${index}]}
    END 