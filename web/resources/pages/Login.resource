*** Settings ***
Documentation       Ações e elementosd da página de Login

Library             Browser
Library             XML


*** Keywords ***
Go to login page
    Go To    http://localhost:3000/login

Submit login form
    [Arguments]    ${email}    ${password}

    Fill Text    css=input[name=email]    ${email}
    Fill Text    css=input[name=password]    ${password}

    Click    css=button[type=submit]

Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}
    Submit signup form    ${account}
    Notice should be    ${output_message}
