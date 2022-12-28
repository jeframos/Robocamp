*** Settings ***
Documentation    Consumindo a rota services da API REST

Library    RequestsLibrary
Resource    ../base.resource

*** Keywords ***
Get Service Token
    [Arguments]    ${user}

    ${response}    POST    http://localhost:3333/sessions
    ...            json=${user}
    ...            expected_status=200
    
    # Dentro  do Log To Console, foi informado o parametro ${response.json()} para
    # informar os detalhes do corpo do response
    #Log To Console    Bearer ${response.json()}[token]
    
    ${token}    Set Variable        Bearer ${response.json()}[token]

    [Return]    ${token}
