*** Settings ***
Library     SeleniumLibrary
Library     String


*** Keywords ***
clico no Novo Admin
    LoginPage.efetuar Login
    Click                            ${NovoAdmin.btnNovoAdmin}

preenche os dados do admin e clica em enviar
    Input                            ${NovoAdmin.NomeAdmin}              ${NomeAdmin}
    Select From List By Value        ${NovoAdmin.selectAdmin}              1
    ${Email}=  New Email
    Input                            ${NovoAdmin.email}                  ${Email}
    Input                            ${NovoAdmin.senha}                  ${SenhaAdmin}
    Input                            ${NovoAdmin.confirmaSenha}          ${SenhaAdmin}
    Click                            ${NovoAdmin.btnEnviarAdmin}

realiza cadastro do admin com sucesso
  Wait Until Element Is Visible    ${NovoAdmin.msgSucesso}
  Click                            ${NovoAdmin.btnOK}
