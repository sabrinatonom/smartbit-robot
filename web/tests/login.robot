*** Settings ***
Documentation       Cenários de testes do Login SAC

Resource            ../resources/Base.resource
Library             Collections

Test Setup          Start session
Test Teardown       Take Screenshot


*** Test Cases ***
Deve logar como Gestor de Academia
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

# Não deve logar com e-mail inválido
#    [Tags]    gestor_email_inv
#    Go to login page
#    Submit login form    sac@smartbit    pwd123
#    Notice should be    Oops! O email informado é inválido

Não deve logar com a senha incorreta
    [Tags]    gestor_senha_inc
    Go to login page
    Submit login form    sac@smartbit.com    pwd124
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Não deve logar com as credenciais inválidas
    [Tags]    gestor_cred_inv
    Go to login page
    Submit login form    404@smartbit.com    pwd123
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativa de login com dados incorretos
    [Tags]    temp
    [Template]    Login with verify notice
    ${EMPTY}    ${EMPTY}    Os campos email e senha são obrigatórios.
    ${EMPTY}    pwd123    Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}    Os campos email e senha são obrigatórios.
    sac@smartbit    pwd123    Oops! O email informado é inválido
    sa&gmail.com    pwd123    Oops! O email informado é inválido
    www.teste.com.br    pwd123    Oops! O email informado é inválido
    $9#$*%&$$&%$*$    pwd123    Oops! O email informado é inválido
    sac*smartbit    pwd123    Oops! O email informado é inválido
    yahoo.com@&*    pwd123    Oops! O email informado é inválido


*** Keywords ***
Login with verify notice
    [Arguments]    ${email}    ${password}    ${output_message}

    Go to login page
    Submit login form    ${email}    ${password}
    Notice should be    ${output_message}
