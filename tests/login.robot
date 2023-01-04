*** Settings ***
Documentation    Suite de testes de autenticação
...              Administrador deve acessar o portal de gestão de academias
Resource    ../resources/base.resource

# Comandos que podemos utilizar
#Suite Setup       Log    Executado uma única vez antes de todos os testes
#Suite Teardown    Log    Executado uma única vez depois de todos os testes

#Test Setup        Log    Executado sempre antes de cada teste
#Test Teardown     Log    Executado sempre depois de cada teste

Test Teardown    Take Screenshot

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


Email no formato incorreto
    #[Tags]    wip
    Go to Login Page
    Fill Credentials    @smartbit.com    abc123
    Submit Credentials
    Field Type Should Be Email  

Senha em branco
    #[Tags]    wip
    Go to Login Page
    Fill Credentials    admin@smartbit.com    ${EMPTY}
    Submit Credentials
    Alert Text Should Be    "password"    A senha é obrigatória

Email em branco
    #[Tags]    wip
    Go to Login Page
    Fill Credentials    ${EMPTY}    abc123
    Submit Credentials
    Alert Text Should Be   "email"    O e-mail é obrigatório


Email e senha são obrigatórios
    #[Tags]    wip
    Go To Login Page
    #Fill Credentials    ${EMPTY}    ${EMPTY}      #Para o teste, esse steps é desnecessário
    Submit Credentials
    Alert Text Should Be   "email"    O e-mail é obrigatório
    Alert Text Should Be    "password"    A senha é obrigatória    