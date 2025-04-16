*** Settings ***
Resource                        ../framework/router.robot
# Test Timeout                    ${DEFAULT_TEST_TIMEOUT}
Test Setup                      base.Start Testing    ${URL_BETA}
Test Teardown                   base.End Testing

*** Test Cases ***
Valid Login Test
    Submit Login Homepage
    Input Username And Password
    Submit Login Form
    Input OTP
    Submit User Button
    Submit Logout Button
    Submit Yes Button