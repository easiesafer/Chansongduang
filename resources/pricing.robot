*** Settings ***
Resource    ../resources/common.robot
Resource    ../test-data/test_data.robot

*** Keywords ***
Open Pricing Page
    Click   [data-tab="pricing"]
    Get Attribute    [data-tab="pricing"]    class    ==    active

Fill Pricing Basic Information
    [Arguments]    ${name_th}    ${name_en}     ${price_60}      ${Price_90}      ${Price_120}
    Fill Text   [id="pricing-name_th"]       ${name_th}  
    Fill Text   [id="pricing-name_en"]       ${name_en}
    Fill Text   [id="pricing-price_60"]      ${Price_60}
    Fill Text   [id="pricing-price_90"]      ${Price_90}
    Fill Text   [id="pricing-price_120"]      ${Price_120}

Verify Basic Information True
    Get Text    [id="pricing-name_th-counter"]     ==  70
    Get Text    [id="pricing-name_en-counter"]     ==  70

Save Pricing
    Click   [onclick="savePricing()"]

Verify Pricing Saved
    Wait For Elements State    [id="toast"]    visible
    Get Text    [id="toast"]    ==    บันทึกสำเร็จ

Verify Pricing Save Validation Error
    Wait For Elements State    [id="toast"]    visible
    Get Text    [id="toast"]    ==    กรุณากรอกข้อมูลที่จำเป็นให้ครบ (ขาด 2 ช่อง)
