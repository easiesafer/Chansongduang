*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/login.robot
Resource    ../test-data/test_data.robot

*** Test cases ***
Admin Can Login Successfully
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed
    Close Browser

Admin Login Failed
    Open Admin Page
    Login       ${Alien_EMAIL}      ${Alien_PASSWORD}
    Verify Login Failed
    Close Browser