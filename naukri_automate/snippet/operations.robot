***Keywords***
Update Profile
    Navigate to Profile
    Edit Headline
    ${status}    Confirmation
    RETURN     ${status}

Navigate to Profile
    Custom Wait and Click    ${profile_button}
    Sleep   0.5
    Custom Wait and Click    ${view_profile}

Edit Headline
    Custom Wait and Click    ${edit_resume_headline_button}
    Sleep   1
    ${headline}    Custom Wait and Get Text    ${resume_headline_textarea}
    ${new_headline}   edit text    ${headline}
    Custom Wait and Clear Text     ${resume_headline_textarea}
    Sleep   0.5
    Custom Wait and Input Text    ${resume_headline_textarea}    ${new_headline}
    Custom Wait and Click     ${save_button}

Confirmation
    ${confirmation_status}     Run Keyword and return Status     Wait Until Element is Visible     ${confirmation_button}    5
    ${status}    Run Keyword If    "${confirmation_status}"=="True"    Set Variable     Success
    ...    ELSE     Set Variable     Failed
    RETURN     ${status}
