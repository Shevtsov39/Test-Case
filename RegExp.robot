*** Settings ***
Documentation     Sending plain text email via Gmail.
Library           RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587
Library           RPA.Robocorp.Vault
Library           RPA.Robocloud.Secrets

*** Variables ***
${browser}        Chrome
${USERNAME}       YOUR_GMAIL_ACCOUNT
${PASSWORD}       YOUR_GMAIL_PASSWORD
${RECIPIENT}      forcodedude@gmail.com

*** Tasks ***
Send test email
    ${secret}=    Get Secret    creden
    Input Text      id:username     ${secret}[username]
    Input Password      id:password     ${secret}[password]
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=     First message from robot
    ...    body=    This is the body of the email.