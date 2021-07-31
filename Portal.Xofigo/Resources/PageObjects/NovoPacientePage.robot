*** Settings ***
Library     SeleniumLibrary
Library     String


*** Keywords ***
clico no Novo Paciente
    LoginPage.efetuar Login
    # Wait Until Element Is Visible     ${NovoPaciente.elementoVisivel}
    Click                             ${NovoPaciente.btnPaciente}


preenche os dados do paciente e clica em enviar
    ${random}  Generate Random String  9  [LETTERS]
    Input                           ${NovoPaciente.NomePaciente}   ${NomePaciente}${SPACE}${random}
    Input                           ${NovoPaciente.dtNasc}         ${DataNasc}
    Input                           ${NovoPaciente.telefone}       ${TelefoneCelular}
    Click                           ${NovoPaciente.selectUF}
    Click                           ${NovoPaciente.UF}
    Click                           ${NovoPaciente.selectCidade}
    Click                           ${NovoPaciente.Cidade}
    ${email}  Catenate  ${NomePaciente}${random}@teste.com
    Input                           ${NovoPaciente.email}          ${email}
    Click                           ${NovoPaciente.pacienteCttNuclear}
    Input                           ${NovoPaciente.crm}            ${CRM}
    Select From List By Value       ${NovoPaciente.uf}              25
    Click                           ${NovoPaciente.termo}
    Click                           ${NovoPaciente.btnEnviar}
    



realiza cadastro do paciente com sucesso
    Wait Until Element Is Visible  ${NovoPaciente.msgSucesso}
    Capture Page Screenshot
    Click                           ${NovoPaciente.btnOK}
    
