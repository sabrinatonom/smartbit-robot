*** Settings ***
Documentation       Arquivo principal do projeto Robot

Library             Browser
Library             ../../libs/Account.py
Library             ../../libs/Database.py
Library             JSONLibrary
Resource            pages/Landing.resource
Resource            pages/Welcome.resource
Resource            pages/Login.resource
Resource            pages/Accounts.resource
Resource            pages/Memberships.resource
Resource            pages/components/NavBar.resource
Resource            pages/components/Toast.resource
Resource            pages/components/BoxNotice.resource
Resource            pages/components/Modal.resource


*** Variables ***
${ADMIN_EMAIL}      sac@smartbit.com
${ADMIN_PASS}       pwd123


*** Keywords ***
Start session
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000/

Get Json fixture
    [Arguments]    ${file_name}    ${scenario}

    ${data}    Load JSON from file
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    RETURN    ${data}[${scenario}]

SignIn admin
    Go to login page
    Submit login form    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    User is logged in    ${ADMIN_EMAIL}
