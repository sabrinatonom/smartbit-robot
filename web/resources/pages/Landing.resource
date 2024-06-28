*** Settings ***
Documentation       Ações e elementos da Landing

Library             Browser


*** Keywords ***
Submit signup form
    [Arguments]    ${account}
    Get Text    css=#signup h2
    ...    equal    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=cpf    ${account}[cpf]
    # Poderíamos usar esta sintaxe, porém há outras mais elegantes
    # Click    xpath=//button[text()="Cadastrar"]

    # Esta também poderia ser usada, porém pode clicar em qualquer local que esteja escrito Cadastrar
    # Click    text=Cadastrar

    # A mais elegante e simples é esta abaixo, que optei por consdirar para o teste, ela aborda duas das sintaxes da documentação
    Click    css=button >> text=Cadastrar
