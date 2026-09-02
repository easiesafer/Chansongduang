*** Settings ***
Resource    ../resources/common.robot
Resource    ../test-data/test_data.robot

*** Keywords ***
Open Review Page
    Click   [data-tab="reviews"]
    Get Attribute    [data-tab="reviews"]    class    ==    active

Fill Review Basic Information
    [Arguments]    ${name_th}    ${Source}     ${desc_th}      ${desc_en}
    Fill Text   [id="reviews-name"]       ${name_th}  
    Fill Text   [id="reviews-source"]       ${Source}
    Fill Text   [id="reviews-text_th"]      ${desc_th}
    Fill Text   [id="reviews-text_en"]      ${desc_en}

Verify Basic Information True
    Get Text    [id="reviews-name-counter"]     ==  100
    Get Text    [id="reviews-text_th-counter"]     ==  700
    Get Text    [id="reviews-text_en-counter"]     ==  700

Save Review
    Click   [onclick="saveReview()"]

Verify Review Saved
    Wait For Elements State    [id="toast"]    visible
    Get Text    [id="toast"]    ==    บันทึกสำเร็จ

Verify Review Save Validation Error
    Wait For Elements State    [id="toast"]    visible
    Get Text    [id="toast"]    ==    กรุณากรอกข้อมูลที่จำเป็นให้ครบ (ขาด 2 ช่อง)
