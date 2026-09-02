*** Settings ***
Library     Browser

*** Variables ***
${URL}    https://chansongduang.web.app/admin.html

*** Keywords ***
Open Admin Page
    New Browser     chromium    headless=true
    New Page    ${URL}

Close Browser
    Browser.Close Browser