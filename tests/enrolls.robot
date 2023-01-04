*** Settings ***
Documentation    Suite de testes de matricula de aluno
...              Administrador uma vez logado consegue matricular  alunos na academia

Resource    ../resources/base.resource

*** Test Cases ***
#Testando API
#    [Tags]    api

#    ${admin}     Get fixture    admin
#    ${falcao}    Get fixture    falcao
#
#    Reset Student    ${falcao}[student][email]
#
#    ${token}    Get Service Token    ${admin}
#
#    POST New Student    ${token}    ${falcao}[student]


Deve matricular um aluno
    
#    ${admin}    Create Dictionary
#    ...         name=Admin
#    ...         email=admin@smartbit.com
#    ...         pass=qacademy
    ${admin}      Get fixture    admin
    #Para utilizar essa Keyword Json, é necessário instalar a lib JSONLibrary
    #${student}    Get fixture    student
    ${falcao}    Get fixture    falcao

    
 #   Connect To Postgres
 #   Delete Enroll By Email    ${student}[email]
 #   Disconnect From Database
 #   Reset Student Enroll    ${student}[email]
    Reset Student    ${falcao}[student][email]

    ${token}    Get Service Token    ${admin}

    POST New Student    ${token}    ${falcao}[student]

    Do Login                ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student    ${falcao}[student][name]
    Select Plan       ${falcao}[enroll][plan]
    Fill Start Date
    Submmit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso
