*** Settings ***
Resource    ../resources/common.robot

*** Keywords ***
Logout
    Click   [id="logoutBtn"]

Verify Logout Completed
    Get Text    .login-card h2      ==  Chansongduang