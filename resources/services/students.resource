*** Settings ***
Documentation    Consumindo a rota students da API REST

Library    RequestsLibrary
Resource    ../base.resource

*** Keywords ***
POST New Student
    [Arguments]    ${token}    ${student}

    ${headers}    Create Dictionary    Authorization=${token}

    ${response}    POST    http://localhost:3333/students
    ...            json=${student}
    ...            headers=${headers}
    ...            expected_status=201

    # Este return foi adicionado para conseguir capturar o ID do usuário para 
    # utilizar no request abaixo 'POST Question'
    [Return]    ${response.json()}[id]    


# A rota da requisição abaixo é utilizada na API do Frontend Mobile
POST Question
    [Arguments]    ${student_id}    ${question}

    ${payload}    Create Dictionary    question=${question}

    POST    http://localhost:3333/students/${student_id}/help-orders
    ...    json=${payload}
    ...    expected_status=201
