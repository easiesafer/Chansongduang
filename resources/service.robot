*** Settings ***
Resource    ../resources/common.robot
Resource    ../test-data/test_data.robot

*** Keywords ***
Open Service Page
    Click   [data-tab="services"]
    Get Attribute    [data-tab="services"]    class    ==    active

Fill Service Basic Information
    [Arguments]    ${name_th}    ${name_en}     ${desc_th}      ${desc_en}
    Fill Text   [id="services-name_th"]       ${name_th}  
    Fill Text   [id="services-name_en"]       ${name_en}
    Fill Text   [id="services-desc_th"]      ${desc_th}
    Fill Text   [id="services-desc_en"]      ${desc_en}

Verify Basic Information True
    Get Text    [id="services-name_th-counter"]     ==  100
    Get Text    [id="services-name_en-counter"]     ==  100
    Get Text    [id="services-desc_th-counter"]     ==  700
    Get Text    [id="services-desc_en-counter"]     ==  700

Save Service
    Click   [onclick="saveService()"]

Verify Service Saved
    Wait For Elements State    [id="toast"]    visible
    Get Text    [id="toast"]    ==    บันทึกสำเร็จ

Verify Service Save Validation Error
    Wait For Elements State    [id="toast"]    visible
    Get Text    [id="toast"]    ==    กรุณากรอกข้อมูลที่จำเป็นให้ครบ (ขาด 4 ช่อง)
