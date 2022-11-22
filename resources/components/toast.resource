*** Settings ***
Documentation    Representação do componente toaster

Library    Browser

*** Keywords ***
Verify Toaster
    [Arguments]    ${expected_message}
    Wait For Elements State    
    ...    css=.Toastify__toast-body div >> text=${expected_message}
    ...    visible    5

    Wait For Elements State    
    ...    css=.Toastify__toast-body div
    ...    detached    10            #O "detached = 10" foi adicionado para conseguir ver o toaster presente na tela
