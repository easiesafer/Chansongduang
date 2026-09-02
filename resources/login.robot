*** Settings ***
Resource    ../resources/common.robot
Resource    ../test-data/test_data.robot

*** Keywords ***
Login
    [Arguments]    ${email}    ${password}
    Fill Text       [id="loginEmail"]       ${email}
    Fill Text       [id="loginPassword"]    ${password}
    Click       [id="loginBtn"]

Verify Login Completed
#   Action      class   Locator    Value
    Get Text    .topbar h1     ==  Chansongduang — Admin

Verify Login Failed
    Get Text    [id="loginError"]   ==  เข้าสู่ระบบไม่สำเร็จ / อีเมล หรือ รหัสผ่านไม่ถูกต้อง