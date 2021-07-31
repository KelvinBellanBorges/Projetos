*** Settings ***
Resource  ../Main.robot

*** Keywords ***
esteja na área de Rede Credenciada
    Click  ${rede_credenciada.btnRedeCredenciada}
    Switch Window  NEW
    Wait Until Page Contains    Consulte entre as redes credenciadas no Programa NovoDia qual é a farmácia mais próxima de você ?
    Wait Until Page Contains    Para o medicamento NovoPen Echo + Fiasp Penfill, as únicas redes credenciadas disponíveis são as lojas Drogasil e Droga Raia em todo o Brasil e a 4Bio Medicamentos, que realiza entregas em todo o Brasil e atende pelos telefones (11) 3508-2900 para São Paulo - Capital e região metropolitana ou 0800 882 4030 para demais localidades do país. O 0800 atende somente de telefone fixo.

seleciono o estado "${ESTADO}"
    Select From List By Label    ${rede_credenciada.inpRCEstado}  ${ESTADO}
    Wait Until Element Is Enabled    ${rede_credenciada.inpRCCidade}
    wait combo loading    ${rede_credenciada.inpRCCidade}

seleciono a cidade "${CIDADE}"
    Select From List By Label    ${rede_credenciada.inpRCCidade}  ${CIDADE}
    Wait Until Element Is Enabled    ${rede_credenciada.inpRCBairro}
    wait combo loading    ${rede_credenciada.inpRCBairro}

seleciono o bairro "${BAIRRO}"
    Select From List By Label    ${rede_credenciada.inpRCBairro}  ${BAIRRO}
    Wait Until Element Is Visible    ${rede_credenciada.textResultados}

deve ser retornado as unidades encontradas
    ${elements}  Get WebElements    ${rede_credenciada.textResultados}
    ${size}  Evaluate    len($elements)
    Capture Page Screenshot
    Should Be True    ${size} > 0