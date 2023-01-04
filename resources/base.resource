*** Settings ***
Documentation    Arquivo raiz, onde será passado o caminho de todos recursos


Resource    components/navbar.resource
Resource    components/toast.resource
Resource    components/notification.resource
Resource    pages/login.resource
Resource    pages/enroll.resource

Resource    services/sessions.resource
Resource    services/students.resource

Resource    database.resource
Library     JSONLibrary


*** Keywords ***
#helper
Do Login
    [Arguments]    ${user}

    Go to Login Page
    Fill Credentials    ${user}[email]    ${user}[password]
    Submit Credentials
    User Should Be Looged In    ${user}[name]

Get fixture
    [Arguments]       ${fixture_file}

    ${fixture}        Load Json From File
    ...               ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...               encoding=UTF-8

    [Return]          ${fixture}  