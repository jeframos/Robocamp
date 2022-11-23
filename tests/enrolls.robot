*** Settings ***
Documentation    Suite de testes de matricula de aluno
...              Administrador uma vez logado consegue matricular  alunos na academia


Resource    ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    
    #Falcão
    #Smart
    #22/11/2022

    ${admin}    Create Dictionary
    ...         name=Admin
    ...         email=admin@smartbit.com
    ...         pass=qacademy

    Do Login    ${admin}

    #Go To Enrolls
    Click    css=a[href="/matriculas"]

    #Go To Enroll Form
    Click    css=a[href="/matriculas/new"]