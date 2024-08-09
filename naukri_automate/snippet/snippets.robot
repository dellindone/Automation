***Keywords***
Open Chrome Browser
    Run Keyword if   "${RUNHEADLESSMODE}"=="yes"     Open Browser     ${homepage}     ${HEADLESS_OPTION}${browser}
    ...    ELSE     Open Browser     ${homepage}     ${browser}
    Maximize Browser Window

Custom Wait and Click
    [Arguments]     ${xpath}
    Wait Until Element Is Visible     ${xpath}
    Click Element     ${xpath}

Custom Wait and Input Text
    [Arguments]    ${xpath}     ${value}
    Wait Until Element Is Visible     ${xpath}
    Input Text     ${xpath}    ${value}

Custom Wait and Get Text
    [Arguments]     ${xpath}
    Wait Until Element Is Visible     ${xpath}
    ${text}    Get Text    ${xpath}
    RETURN    ${text}

Custom Wait and Clear Text
    [Arguments]    ${xpath}
    Wait Until Element Is Visible     ${xpath}
    Clear Element Text    ${xpath}
