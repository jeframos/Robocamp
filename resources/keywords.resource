*** Settings ***
Library    Browser


*** Keywords ***
Go to Login Page
    New Browser    headless=false    browser=chromium
    New Page       http://localhost:3000/

Fill Credentials
    [Arguments]    ${email}    ${pass}

    Fill Text    css=input[name=email]       ${email}
    Fill Text    css=input[name=password]    ${pass}

Submit Credentials
    Click        css=button >> text=Entrar no sistema

Verify Toaster
    [Arguments]    ${expected_message}
    Wait For Elements State    
    ...    css=.Toastify__toast-body div >> text=${expected_message}
    ...    visible    5

    Wait For Elements State    
    ...    css=.Toastify__toast-body div
    ...    detached    10

User Should Be Looged In
    [Arguments]    ${user_name}

    ${logged_user}    Set Variable    css=aside strong   

    Wait For Elements State    ${logged_user}    visible    5

    Get Text     ${logged_user}    equal    ${user_name}