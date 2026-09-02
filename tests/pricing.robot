*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/login.robot
Resource    ../resources/logout.robot
Resource    ../resources/pricing.robot
Resource    ../test-data/test_data.robot


*** Test Cases ***
Admin Can Fill Pricing 70 Successfully
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Pricing Page
    Fill Pricing Basic Information      ${name_th-70}      ${name_en-70}       ${price_60}      ${price_90}      ${price_120}
    Verify Basic Information True
    Save Pricing
    Verify Pricing Saved

    Logout
    Verify Logout Completed
    Close Browser  

Admin Can Fill Pricing 110 Successfully
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Pricing Page
    Fill Pricing Basic Information      ${name_th-110}      ${name_en-110}      ${price_60}      ${price_90}      ${price_120}
    Verify Basic Information True
    Save Pricing
    Verify Pricing Saved

    Logout
    Verify Logout Completed
    Close Browser  

Admin Cannot Create save Pricing With Empty Required Fields
    Open Admin Page
    Login       ${ADMIN_EMAIL}      ${ADMIN_PASSWORD}
    Verify Login Completed

    Open Pricing Page
    Save Pricing
    Verify Pricing Save Validation Error

    Logout
    Verify Logout Completed
    Close Browser  