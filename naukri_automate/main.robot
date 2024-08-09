***Settings***
Library     Selenium2Library
Library     OperatingSystem
Library     snippet/operations.py
Library     BuiltIn
Library     mail.py
Resource    variables.robot
Resource    snippet/snippets.robot
Resource    snippet/login.robot
Resource    snippet/operations.robot
Variables     config.py

# Resource    snippet/logout.robot
# Resource    config.robot



***Test Cases***
Refresh Naukri Profile
    ${status}    Main
    ${subject}     Run Keyword IF    "${status}"=="Success"    Set Variable     Success : ${subject}
    ...    ELSE     Set variable    Failed : ${subject} 
    ${body}        Run Keyword IF    "${status}"=="Success"    Set Variable     ${success_body}
    ...    ELSE     Set variable    ${status}
    send mail         ${subject}     ${body}
    [Teardown]    Failcase    ${subject}

***Keywords***
Main
    Open Chrome Browser
    Login
    ${status}    Update Profile
    # Logout
    Close Browser
    RETURN    ${status}


Failcase
    [Arguments]      ${subject}
    Run Keyword If Test Failed     Close Browser
    Run Keyword If Test Failed       send mail         Failed : ${subject}     ${TEST_STATUS}\n${TEST_MESSAGE}
