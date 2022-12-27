*** Settings ***
Documentation    Gerenciando a massa de testes através do BD

Library    DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database
    ...    psycopg2
    ...    gnkbytxp
    ...    gnkbytxp
    ...    Hhpb7tzPbgvisTPFvPQdb8j8zELX0hhb
    ...    babar.db.elephantsql.com
    ...    5432

Select Student Where email
    [Arguments]    ${email}

    ${query}    Set Variable
    ...         SELECT * FROM "public"."students" where email = '${email}';

    ${result}    Query    ${query}

    #Log To Console    ${result}[0][0]        #Atraves dessa informacao sera possivel capturar o ID para utilizar abaixo
    [return]    ${result}[0]


Delete Enroll By Email
    [Arguments]    ${email}

    ${user}    Select Student Where email    ${email}

    ${query}    Set Variable
    ...         DELETE FROM public.enrollments where student_id = ${user}[0];

    Execute Sql String    ${query}

# Helpers
Reset Student Enroll
    [Arguments]    ${email}

    Connect To Postgres
    Delete Enroll By Email    ${email}
    Disconnect From Database

