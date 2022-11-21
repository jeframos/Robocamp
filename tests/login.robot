*** Settings ***
Documentation    Suite de testes de autenticação
...              Administrador deve acessar o portal de gestão de academias
Resource    ../resources/keywords.resource

*** Test Cases ***
Login do Administrador
    Go to Login Page
    Fill Credentials    admin@smartbit.com    qacademy
    Submit Credentials
    User Should Be Looged In    Admin

Email não cadastrado
    Go to Login Page
    Fill Credentials    404@smartbit.com    qacademy
    Submit Credentials
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!

Senha incorreta
    Go to Login Page
    Fill Credentials    admin@smartbit.com    abc123
    Submit Credentials
    Verify Toaster    Suas credenciais são inválidas, por favor tente novamente!