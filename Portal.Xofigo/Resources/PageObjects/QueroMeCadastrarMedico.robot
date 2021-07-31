*** Settings ***
Library     SeleniumLibrary
Library     String


*** Keywords ***
clico em quero me cadastrar medico home
    AlterarCRM.alterar CRM Geral
    sleep                           2
    Click Link                      xpath://a[(text()='Quero me cadastrar')]
    Click                           ${QueroMeCadMedico.qmcdMedico}
    sleep                           2

preencher os dados do quero me cadastrar medico e clica em enviar
    ${random}                        Generate Random String                               9  [LETTERS]
    Click                            ${QueroMeCadMedico.selectEspecialidade}
    Click                            ${QueroMeCadMedico.qmcdEspecialidade}
    Input                            ${QueroMeCadMedico.qmcdCrm}                        ${CRM}
    Select From List By Value        ${QueroMeCadMedico.qmcdSelectUF}                   ${codUF}
    Input                            ${QueroMeCadMedico.inpTelefone}                    ${TelefoneCelular}
    Input                            ${QueroMeCadMedico.inpEmail}                       ${random}@testeKelvin.com.br
    Input                            ${QueroMeCadMedico.inpSenha}                       ${SenhaGeral}
    Input                            ${QueroMeCadMedico.inpSenhaConfirma}               ${SenhaGeral}
    sleep                            2
    Click                            ${QueroMeCadMedico.qcmdAceitoTermoMedico}
    Click Element                    xpath=//*[@id="radio-2-div"]/form/div/div[8]/input

realiza cadastro em quero me cadastrar medico com sucesso
    Wait Until Element Is Visible    ${QueroMeCadMedico.qmcdMsgSucesso}
    Capture Page Screenshot
    Click                            ${QueroMeCadMedico.qmcdBtnOK}