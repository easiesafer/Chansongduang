*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/login.robot
Resource    ../resources/logout.robot
Resource    ../resources/service.robot
Resource    ../test-data/test_data.robot


*** Test Cases ***
Admin Can Fill Service 100,700 Successfully
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Service Page
    Fill Service Basic Information      ${name_th-100}      ${name_en-100}      ${desc_th-700}      ${desc_en-700}
    Verify Basic Information True
    Save Service
    Verify Service Saved

    Logout
    Verify Logout Completed
    Close Browser  

Admin Can Fill Service 200,1000 Successfully
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Service Page
    Fill Service Basic Information      ${name_th-200}      ${name_en-200}      ${desc_th-1000}      ${desc_en-1000}
    Verify Basic Information True
    Save Service
    Verify Service Saved

    Logout
    Verify Logout Completed
    Close Browser  

Admin Cannot Create Service With Empty Required Fields
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Service Page
    Save Service
    Verify Service Save Validation Error

    Logout
    Verify Logout Completed
    Close Browser  