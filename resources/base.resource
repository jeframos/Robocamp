*** Settings ***
Documentation    Arquivo raiz, onde será passado o caminho de todos recursos


Resource    components/navbar.resource
Resource    components/toast.resource
Resource    pages/login.resource


*** Keywords ***
#helper
Do Login
    [Arguments]    ${user}

    Go to Login Page
    Fill Credentials    ${user}[email]    ${user}[pass]
    Submit Credentials
    User Should Be Looged In    ${user}[name]