*** Settings ***
Documentation       Suite de testes de adesões de planos

Resource            ../resources/Base.resource
Library             OperatingSystem

Test Setup          Start session
Test Teardown       Take Screenshot


*** Test Cases ***
Deve porder realizar uma nova adesão
# Este conteúdo foi desconsiderado, pois criamos o arquivo memberships.json, anotação de 11/06/2024
    # ${account}    Create Dictionary
    # ...    name=Paulo Cintura
    # ...    email=paulo@cintura.com.br
    # ...    cpf=11852857099

    # ${plan}    Set Variable    Plano Black

    # ${credit_card}    Create Dictionary
    # ...    number=4242424242424242
    # ...    holder=Paulo Cintura
    # ...    month=12
    # ...    year=2030
    # ...    cvv=123

    ${data}    Get Json fixture    memberships    create

    Delete Account By Email    ${data}[account][email]
    Insert Account    ${data}[account]

    SignIn admin
    Go to Memberships
    Create new membership    ${data}
    Toast should be    Matrícula cadastrada com sucesso.

Não deve realizar adesão duplicada
    [Tags]    dup

    ${data}    Get Json fixture    memberships    duplicate

    Insert Membership    ${data}

    SignIn admin
    Go to Memberships
    Create new membership    ${data}
    Toast should be    O usuário já possui matrícula.

Deve buscar por nome
    [Tags]    search

    ${data}    Get Json fixture    memberships    search

    Insert Membership    ${data}

    SignIn admin
    Go to Memberships
    Search by name    ${data}[account][name]
    Should filter by name    ${data}[account][name]

Deve excluir uma matrícula
    [Tags]    remove

    ${data}    Get Json fixture    memberships    remove

    Insert Membership    ${data}

    SignIn admin
    Go to Memberships
    Request removal    ${data}[account][name]
    Confirm removal
    Membership should not be visible    ${data}[account][name]
