***Variables***
${homepage}      https://www.naukri.com/nlogin/login?URL=https://www.naukri.com/mnjuser/homepage
${browser}       chrome
${HEADLESS_OPTION}    headless
${RUNHEADLESSMODE}    no     #to Run in headless mode say yes else no

${login_placeholder}     //input[@id='usernameField']
${password_placeholder}     //input[@id='passwordField']
${login_button}     (//button[contains(text(), 'Login')])[1]

${profile_button}     //div[@class="nI-gNb-drawer__icon-img-wrapper"]
${view_profile}       //a[contains(text(),'View & Update Profile')]
${edit_resume_headline_button}    //div[@class="widgetHead"]//span[contains(text(),'Resume headline')]//following-sibling::span[contains(text(), 'editOneTheme')]
${resume_headline_textarea}     //textarea[@id='resumeHeadlineTxt']
${save_button}     //button[@class="btn-dark-ot" and contains(text(), "Save")]
${confirmation_button}    //*[contains(text(), "Resume Headline has been successfully saved.")]
${logout_button}    //a[@title="Logout"]/span

${subject}     Automation of Naukri profile
${success_body}     Naukri profile has been refreshed.
   