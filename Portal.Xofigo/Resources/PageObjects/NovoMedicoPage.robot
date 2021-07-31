*** Settings ***
Library     SeleniumLibrary
Library     String


*** Keywords ***
clico no Novo Médico
    AlterarCRM.alterar CRM Geral
    LoginPage.efetuar Login
    Click                           ${NovoMedico.btnNovo}

preenche os dados do médico e clica em enviar    
    ${random}  Generate Random String  9  [LETTERS]
    click                            ${NovoMedico.selectEspecialidade}
    click                            ${NovoMedico.Especialidade}               
    Input                            ${NovoMedico.inpCrm}                      ${CRM}
    Select From List By Value        ${NovoMedico.selectUF}                    ${codUF}
    # Element Text Should Be           ${NovoMedico.inpNome}                     ${NomeMedico}  
    Input                            ${NovoMedico.inpTelefone}                 ${TelefoneCelular}
    Input                            ${NovoMedico.inpEmail}                    ${random}@teste.com
    Click                            ${NovoMedico.inputTermo}
    Sleep                            3
    Click Element                    ${NovoMedico.btnEnviar}                 
    Sleep    5

realiza cadastro do médico com sucesso
    Wait Until Element Is Visible      ${NovoMedico.msgSucesso}
    Click Element                      ${NovoMedico.btnOK}