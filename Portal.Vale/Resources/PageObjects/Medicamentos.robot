*** Settings ***
Library     SeleniumLibrary

*** Variables ***

# Input                                    ${}
# Click
# Capture Page Screenshot
# Input                                    id=${Beneficiario.txtCPF}                                    ${cpfNovo}


*** Keywords ***

acessa o menu de Sugestão de Medicamento
    Click    ${homePage.btnSugestaoMedicamentos}

acessa o menu Nova Sugestão
    Click    ${sugestaoDeMedicamentos.btnNovaSugestao}

inclui um produto listado na lista de produtos sugeridos
    Click And Wait     ${sugestaoDeMedicamentos.btnCmbMedicamentos}  ${sugestaoDeMedicamentos.opcaoAcarsan}
    Click     ${sugestaoDeMedicamentos.opcaoAcarsan}
    Click     ${sugestaoDeMedicamentos.btnIncluir}
    Wait Until Element is Visible  ${sugestaoDeMedicamentos.lblMedicamentoIncluso}
    
envia a sugestão
    Click    ${sugestaoDeMedicamentos.btnEnviarSugestao}

recebe mensagem de confirmação do envio
    Wait Until Element is Visible  ${sugestaoDeMedicamentos.msgEnviadoSucesso}


inclui um produto não listado na lista de produtos sugeridos
    Click    ${sugestaoDeMedicamentos.cmbMedicamentos}
    Input    ${sugestaoDeMedicamentos.inpMedicamentos}  Teste Preenchimento de medicamento
    Press Keys  None  RETURN
    Click     ${sugestaoDeMedicamentos.btnIncluir}

inclui produtos listados na lista de produtos sugeridos
    Click     ${sugestaoDeMedicamentos.btnCmbMedicamentos}
    Click     ${sugestaoDeMedicamentos.opcaoAcarsan}
    Click     ${sugestaoDeMedicamentos.btnIncluir}
    Wait Until Element is Visible  ${sugestaoDeMedicamentos.lblMedicamentoIncluso}
    Click     ${sugestaoDeMedicamentos.btnCmbMedicamentos}
    Click     ${sugestaoDeMedicamentos.opcaoAcetofen}
    Click     ${sugestaoDeMedicamentos.btnIncluir}
    Wait Until Element is Visible  ${sugestaoDeMedicamentos.lblMedicamentoIncluso2}

acessa o menu Acompanhamento de Sugestão
    Click    ${sugestaoDeMedicamentos.btnAcompanhamentoSugestao}

seleciona o pedido com status "${status}"
    ${Elements}  Get WebElements  //*[contains(text(),'${status}')]
    Click  ${Elements[0]}

é destacado status "${status}" na área de acompanhamento da sugestão
    Wait Until Element Is Visible      //p[contains(text(),'${status}')]/../../div[not(contains(@class,'semOcorrencia'))][not(contains(@class,'hidden'))]  60
    Element Should Be Visible          //p[contains(text(),'${status}')]/../../div[not(contains(@class,'semOcorrencia'))][not(contains(@class,'hidden'))]
