*** Settings ***
Resource    ../resources/common.robot
Resource    ../test-data/test_data.robot

*** Keywords ***
Open Promotion Page
    Click   [data-tab="promotions"]
    Get Attribute    [data-tab="promotions"]    class    ==    active

Fill Promotion Basic Information
    [Arguments]    ${name_th}    ${name_en}     ${desc_th}      ${desc_en}
    Fill Text   [id="promotions-title_th"]       ${name_th}  
    Fill Text   [id="promotions-title_en"]       ${name_en}
    Fill Text   [id="promotions-detail"]      ${desc_th}
    Fill Text   [id="promotions-detail_en"]      ${desc_en}

Verify Basic Information True
    Get Text    [id="promotions-title_th-counter"]     ==  100
    Get Text    [id="promotions-title_en-counter"]     ==  100
    Get Text    [id="promotions-detail-counter"]     ==  700
    Get Text    [id="promotions-detail_en-counter"]     ==  700

Save Promotion
    Click   [onclick="savePromotion()"]

Verify Promotion Saved
    Wait For Elements State    [id="toast"]    visible
    Get Text    [id="toast"]    ==    บันทึกสำเร็จ

Verify Promotion Save Validation Error
    Wait For Elements State    [id="toast"]    visible
    Get Text    [id="toast"]    ==    กรุณากรอกข้อมูลที่จำเป็นให้ครบ (ขาด 2 ช่อง)
