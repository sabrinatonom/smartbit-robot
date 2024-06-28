*** Settings ***
Documentation       Cenários de testes de pré-cadastro de clientes

Resource            ../resources/Base.resource

Test Setup          Start session
Test Teardown       Take Screenshot


*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    smoke
    ${account}    Create Dictionary
    ...    name=Papito Fernando
    ...    email=papito@msn.com
    ...    cpf=06097411871

    Delete Account By Email    ${account}[email]

    Submit signup form    ${account}
    Verify welcome message

# Estes cenários foram construídos na seção 3 do curso Universo Robot Framework, porém não é necessario usar,
# pois na seção 4 aprendemos sobre Template e em apenas 5 linhas foi feito todos estes testes, muito mais prático e inteligente
# Campo nome deve ser obrigatório
#    [Tags]    required_name

#    ${account}    Create Dictionary
#    ...    name=${EMPTY}
#    ...    email=papito@teste.com.br
#    ...    cpf=00000014141

#    Submit signup form    ${account}
#    Notice should be    Por favor informe o seu nome completo

# Campo email deve ser obrigatório
#    [Tags]    required_email

#    ${account}    Create Dictionary
#    ...    name=Fernando Papito
#    ...    email=${EMPTY}
#    ...    cpf=00000014141

#    Submit signup form    ${account}
#    Notice should be    Por favor, informe o seu melhor e-mail

# Campo cpf deve ser obrigatório
#    [Tags]    required_cpf

#    ${account}    Create Dictionary
#    ...    name=Fernando Papito
#    ...    email=papito@teste.com.br
#    ...    cpf=${EMPTY}

#    Submit signup form    ${account}
#    Notice should be    Por favor, informe o seu CPF

# Email no formato inválido
#    [Tags]    email_inv

#    ${account}    Create Dictionary
#    ...    name=Fernando Papito
#    ...    email=papito&teste.com.br
#    ...    cpf=00000014141

#    Submit signup form    ${account}
#    Notice should be    Oops! O email informado é inválido

# CPF no formato inválido
#    [Tags]    cpf_inv

#    ${account}    Create Dictionary
#    ...    name=Fernando Papito
#    ...    email=papito@teste.com.br
#    ...    cpf=00000014

#    Submit signup form    ${account}
#    Notice should be    Oops! O CPF informado é inválido

Tentativa de pré-cadastro
    [Template]    Attempt signup
    ${EMPTY}    papito@gmail.com    00000014141    Por favor informe o seu nome completo
    Fernando Papito    ${EMPTY}    00000014141    Por favor, informe o seu melhor e-mail
    Fernando Papito    papito@gmail.com    ${EMPTY}    Por favor, informe o seu CPF
    Fernando Papito    papito&gmail.com    00000014141    Oops! O email informado é inválido
    Fernando Papito    papito@gmail    00000014141    Oops! O email informado é inválido
    Fernando Papito    papito@gmail.com    000000141    Oops! O CPF informado é inválido
    Fernando Papito    papito@gmail.com    000000141ab    Oops! O CPF informado é inválido
    Fernando Papito    papito@gmail.com    fsadfsl    Oops! O CPF informado é inválido
    Fernando Papito    papito@gmail.com    0%#(*#$@&)    Oops! O CPF informado é inválido
    Fernando Papito    papito@gmail.com    0    Oops! O CPF informado é inválido
