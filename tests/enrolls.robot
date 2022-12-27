*** Settings ***
Documentation    Suite de testes de matricula de aluno
...              Administrador uma vez logado consegue matricular  alunos na academia


Resource    ../resources/base.resource


*** Test Cases ***
Deve matricular um aluno
    
#    ${admin}    Create Dictionary
#    ...         name=Admin
#    ...         email=admin@smartbit.com
#    ...         pass=qacademy
    ${admin}      Get fixture    admin
    #Para utilizar essa Keyword Json, é necessário instalar a lib JSONLibrary
    ${student}    Get fixture    student

    
 #   Connect To Postgres
 #   Delete Enroll By Email    ${student}[email]
 #   Disconnect From Database
    Reset Student Enroll    ${student}[email]
    Do Login                ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student    ${student}[name]
    Select Plan       ${student}[enroll][plan]
    Fill Start Date
    Submmit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso
