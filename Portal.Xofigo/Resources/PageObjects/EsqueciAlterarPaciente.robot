*** Settings ***
Library     SeleniumLibrary
 
*** Keywords ***

Acessar pagina principal home
    go to     ${URL}

clico em esqueci minha senha  
    Acessar pagina principal home
    Click Element                                   ${EsqueciSenhaPaciente.btnEsqueciSenha}
    
preencho o email cadastrado
    Input Text                                      ${EsqueciSenhaPaciente.inputEmailCadastrado}     ${EmailPaciente}
    Click Element                                   ${EsqueciSenhaPaciente.btnOK}
 
email será enviado com sucesso
   Wait Until Element Is Visible                    ${EsqueciSenhaPaciente.msgSucesso}
   Click Element                                    ${EsqueciSenhaPaciente.btnOK}
