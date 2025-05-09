*** Settings ***
Resource                router.robot

*** Keywords ***
Start Testing
    [Arguments]     ${URL_BETA}
    Open Mdot                   ${URL_BETA}
    Set Selenium Timeout        ${DEFAULT_TIMEOUT}
    Set Selenium Speed	        ${DELAY}

Open Mdot
    [Arguments]     ${URL_BETA}
    Open Browser                ${URL_BETA}      ${BROWSER}
    Maximize Browser Window
    Go To                       ${URL_BETA}

End Testing
    Close All Browsers