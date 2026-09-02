*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/login.robot
Resource    ../resources/logout.robot
Resource    ../resources/review.robot
Resource    ../test-data/test_data.robot


*** Test Cases ***
Admin Can Fill Review 100,700 Successfully
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Review Page
    Fill Review Basic Information      ${name_th-100}      ${Source-fb}       ${desc_th-700}      ${desc_en-700}
    Verify Basic Information True
    Save Review
    Verify Review Saved

    Logout
    Verify Logout Completed
    Close Browser  

Admin Can Fill Review 200,1000 Successfully
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Review Page
    Fill Review Basic Information      ${name_th-200}      ${Source-gg}      ${desc_th-1000}      ${desc_en-1000}
    Verify Basic Information True
    Save Review
    Verify Review Saved

    Logout
    Verify Logout Completed
    Close Browser  

Admin Cannot Create save Review With Empty Required Fields
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Review Page
    Save Review
    Verify Review Save Validation Error

    Logout
    Verify Logout Completed
    Close Browser  