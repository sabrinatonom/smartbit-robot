*** Settings ***
Documentation        Suite de testes de login

Resource    ../resources/Base.resource

Test Setup    Start session    
Test Teardown    Finish session

*** Test Cases ***
Deve logar com cpf e IP
    [Tags]    temp1
    ${data}    Get Json fixture    login
   
    Insert Membership    ${data}

    SignIn with document    ${data}[account][cpf]
    User is logged in

Não deve logar com cpf não cadastrado

    SignIn with document    48487877001
    Popup have text    Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com cpf com digito inválido
    [tags]    temp
    SignIn with document    00000014144
    Popup have text    CPF inválido, tente novamente

