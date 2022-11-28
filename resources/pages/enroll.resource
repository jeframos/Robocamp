*** Settings ***
Documentation    Keywords que representam a página de cadastro de matriculas

Library    Browser


*** Keywords ***
Go To Enrolls
    Click        css=a[href="/matriculas"]

Go To Enroll Form
    Click        css=a[href="/matriculas/new"]

Select Student
    [Arguments]    ${student_name}

    Fill Text    xpath=//div[contains(text(),"nome do aluno")]/..//input
    ...          ${student_name}

    #<div class=" css-1n7v3ny-option" id="react-select-2-option-0" tabindex="-1">1 - Falcão</div>
    Click        css=div[class$=-option] >> text=${student_name}

Select Plan
    [Arguments]    ${plan_name}

    Click        xpath=//label[contains(text(),"PLANO")]/..//div[contains(text(),"Selecione")]

    #<div class=" css-1n7v3ny-option" id="react-select-3-option-0" tabindex="-1">Smart - R$&nbsp;99,99 / 1 (Mês)</div>
    Click        css=div[class$=-option] >> text=${plan_name}
    

    #Os dois steps abaixo foram utilizados para capturar o HTML que não 
    #conseguimos capturar direto no HTML da página WEB
    #Após capturar a página HTML presente no arquivo "log.html" dentro da Keyword "log"
    #acessar a página "https://codebeautify.org/htmlviewer", copiar o código, crie uma pagina
    #"temp.html" e capture o elemento para conseguir dar andamento na automação.
   
    #${temp}    Get Page Source

    #Log    ${temp}

