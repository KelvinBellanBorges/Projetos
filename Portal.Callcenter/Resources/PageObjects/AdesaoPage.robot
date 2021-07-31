*** Settings ***
Resource  ../Main.robot

*** Keywords ***
realiaso a adesão do medicamento "${MEDICAMENTO}" com CRM invalido
    realiaso a adesão ao medicamento  ${MEDICAMENTO}  invalid_crm=True

realiaso a adesão do medicamento "${MEDICAMENTO}" para um CRM que não existe
    realiaso a adesão ao medicamento  ${MEDICAMENTO}  invalid_crm=True

realiaso a adesão do medicamento "${MEDICAMENTO}"
    realiaso a adesão ao medicamento  ${MEDICAMENTO}

realiaso a adesão ao medicamento
    [Arguments]  ${MEDICAMENTO}
    ...  ${invalid_crm}=False

    Wait Until Element Is Visible    ${adesao.txtTresiba}
    IF  $MEDICAMENTO.lower() == 'tresiba'
        Set Test Variable    ${MEDICAMENTO_INDEX}  1
        Click  ${adesao.txtTresiba}
    ELSE IF  $MEDICAMENTO.lower() == 'victoza'
        Set Test Variable    ${MEDICAMENTO_INDEX}  2
        Click  ${adesao.txtVictoza}
    ELSE IF  $MEDICAMENTO.lower() == 'saxenda'
        Set Test Variable    ${MEDICAMENTO_INDEX}  3
        Click  ${adesao.txtSaxenda}
    ELSE IF  $MEDICAMENTO.lower() == 'xultophy'
        Set Test Variable    ${MEDICAMENTO_INDEX}  4
        Click  ${adesao.txtXultophy}
    ELSE IF  $MEDICAMENTO.lower() == 'ozempic'
        Set Test Variable    ${MEDICAMENTO_INDEX}  5
        Click  ${adesao.txtOzempic}
    ELSE IF  $MEDICAMENTO.lower() == 'fiasp'
        Set Test Variable    ${MEDICAMENTO_INDEX}  6
        Click  ${adesao.txtFiasp}
    ELSE IF  $MEDICAMENTO.lower() == 'norditropin'
        Set Test Variable    ${MEDICAMENTO_INDEX}  7
        Click  ${adesao.txtNorditropin}
    ELSE IF  $MEDICAMENTO.lower() == 'novofine'
        Set Test Variable    ${MEDICAMENTO_INDEX}  8
        Click  ${adesao.txtNovoFine}
    ELSE IF  $MEDICAMENTO.lower() == 'rybelsus'
        Set Test Variable    ${MEDICAMENTO_INDEX}  9
        Click  ${adesao.txtRybelsus}
    END

    Sleep  3  Aguardando Tela Abrir por completo.
    
    ${inpCRM}  Format String    ${adesao.inpCRM}  index=${MEDICAMENTO_INDEX}
    ${inpUF}  Format String    ${adesao.inpUF}  index=${MEDICAMENTO_INDEX}
    ${inpMedico}  Format String    ${adesao.inpMedico}  index=${MEDICAMENTO_INDEX}
    # ${btnAdicionar}  Format String    ${adesao.btnAdicionar}  index=${MEDICAMENTO_INDEX}

    IF  ${invalid_crm}
        Input  ${inpCRM}  0
        Select From List By Label    ${inpUF}  SAO PAULO
    ELSE
        Input  ${inpCRM}  ${CRM}
        Select From List By Label    ${inpUF}  SAO PAULO
        wait load element text   ${inpMedico}

        Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)

        Click  ${adesao.btnAdicionar}
        Wait Until Element Is Enabled    ${adesao.btnFinalizar}
    END
    
    
finalizo o cadastro
    Click  ${adesao.btnFinalizar}

    Click  ${adesao.btnSimAdesao}
    Wait Until Element Is Visible    ${LOADING}
    Wait Until Element Is Not Visible    ${LOADING}  90
    Capture Page Screenshot