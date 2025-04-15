*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${submit_login_homepage}     //a[text()='Login']
${submit_user_button}        //img[contains(@src, 'avatar')]
${submit_logout_button}      //div[@class='NavbarLink_dropdown__footer__FRFUM']
${submit_yes_button}         //button[normalize-space()='Yes']

*** Keywords ***
Submit Login Homepage
    Wait Until Element Is Visible    ${submit_login_homepage}
    Click Element    ${submit_login_homepage}

Submit User Button
    Wait Until Element Is Visible    ${submit_user_button}
    Click Element    ${submit_user_button}

Submit Logout Button
    Wait Until Element Is Visible    ${submit_logout_button}
    Click Element    ${submit_logout_button}

Submit Yes Button
    Wait Until Element Is Visible    ${submit_yes_button}
    Click Element    ${submit_yes_button}