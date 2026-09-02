*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/login.robot
Resource    ../resources/logout.robot
Resource    ../resources/promotion.robot
Resource    ../test-data/test_data.robot


*** Test Cases ***
Admin Can Fill Promotion 100,700 Successfully
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Promotion Page
    Fill Promotion Basic Information      ${name_th-100}      ${name_en-100}      ${desc_th-700}      ${desc_en-700}
    Verify Basic Information True
    Save Promotion
    Verify Promotion Saved

    Logout
    Verify Logout Completed
    Close Browser  

Admin Can Fill Promotion 200,1000 Successfully
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Promotion Page
    Fill Promotion Basic Information      ${name_th-200}      ${name_en-200}      ${desc_th-1000}      ${desc_en-1000}
    Verify Basic Information True
    Save Promotion
    Verify Promotion Saved

    Logout
    Verify Logout Completed
    Close Browser  

Admin Cannot Create Promotion With Empty Required Fields
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Promotion Page
    Save Promotion
    Verify Promotion Save Validation Error

    Logout
    Verify Logout Completed
    Close Browser  