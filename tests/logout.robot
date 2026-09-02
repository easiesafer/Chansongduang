*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/login.robot
Resource    ../resources/logout.robot
Resource    ../test-data/test_data.robot

*** Test Cases ***
Admin Can Logout Successfully
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed
    Logout
    Verify Logout Completed
    Close Browser