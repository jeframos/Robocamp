*** Settings ***
Documentation    Representação do componente de notificação

Library    Browser

*** Keywords ***
Open Notifications
    Click    xpath=(//aside//button)[1]

Notification Should Be
    [Arguments]    ${text}

    ${element}        Set Variable    css=.scrollbar-container p
    
    #comando abaixo é para deixar a notificação do sininho visivel
    Wait For Elements State    ${element}
    ...                        visible
    ...                        timeout=2    #Ficara visivel por 2 segundos

    Get Text    ${element}   equal    ${text}