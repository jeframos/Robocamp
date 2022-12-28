*** Settings ***
Library    Browser


*** Keywords ***
Go to Login Page
    New Browser    headless=false    browser=chromium
    New Page       http://localhost:3000/

Fill Credentials
    [Arguments]    ${email}    ${password}

    Fill Text    css=input[name=email]       ${email}
    Fill Text    css=input[name=password]    ${password}

Submit Credentials
    Click        css=button >> text=Entrar no sistema

Field Type Should Be Email
    Get Attribute    css=input[placeholder="Seu e-mail"]
    ...    type    equal    email


Alert Text Should Be
    [Arguments]    ${field}    ${expect_text}

  #ESTRATEGIA SIMPLE PARA MAPEAR O ELEMENTO COM CSS
    #Wait For Elements State    css=span >> text=${expect_text}
    #...                        visible    5
    
  #ESSA ESTRATEGIA DE TESTES E MAIS EFICIENTE PARA VALIDAR O ELEMENTO NO LOCAL CORRETO
    Get Text    xpath=//input[@type=${field}]/../span
    ...         equal    ${expect_text}