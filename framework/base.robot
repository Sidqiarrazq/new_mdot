*** Settings ***
Resource                router.robot

*** Variables ***
${URL_BETA}            ${BROWSER}

*** Keywords ***
Start Testing
    [Arguments]     ${URL_BETA}
    Open Mdot               ${BROWSER}

Open Mdot
    [Arguments]     ${URL_BETA}
    Open Normal Browser                      ${URL_BETA}

End Testing
    Close All Browsers

Open Mdot
    [Arguments]     ${URL_BETA}
    Open Normal Browser                      ${URL_BETA}

Open Normal Browser
    [Arguments]     ${URL_BETA}
    Open Browser                ${URL_BETA}      chrome
    Maximize Browser Window
    Go To                       ${URL_BETA}