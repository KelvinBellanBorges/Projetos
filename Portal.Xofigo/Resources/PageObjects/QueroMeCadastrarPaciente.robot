*** Settings ***
Library     SeleniumLibrary
Library     String


*** Keywords ***
clico em quero me cadastrar paciente home
    Click Link                      xpath://a[(text()='Quero me cadastrar')]
    sleep                           2

preencher os dados do quero me cadastrar paciente e clica em enviar
    ${random}                        Generate Random String                               9  [LETTERS]
    ${randomNumb}                    Generate Random String                               8  [NUMBERS]
    Input                            ${QueroMeCadPaciente.inpNomePaciente}                ${NomePaciente}${random}
    Input                            ${QueroMeCadPaciente.inpTelefone1}              (51) ${TelefoneCelular}
    Input                            ${QueroMeCadPaciente.inpTelefone2}              (51) 9${randomNumb}
    Input                            ${QueroMeCadPaciente.inpEmail}                       ${random}@testeKelvin.com.br
    Input                            ${QueroMeCadPaciente.inpCrmMedicoOncologista}        ${CRM}
    Select From List By Value        ${QueroMeCadPaciente.ufMedicoOncologista}            ${codUF}
    Click                            ${QueroMeCadPaciente.aceitoTermoPaciente}
    sleep                            3
    Click                            ${QueroMeCadPaciente.btnEnviar}
    Sleep                            5  

realiza cadastro em quero me cadastrar paciente com sucesso
    Wait Until Element Is Visible    ${QueroMeCadPaciente.qmcdMsgSucesso}
    Capture Page Screenshot
    Click                            ${QueroMeCadPaciente.qmcdBtnOK}