*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
seleciona "${OPCAO}" no combobox "Possui cupom?"
    Sleep            3
    Wait Until Element Is Visible    xpath=${Coupons.cmbCupom}
    Press Keys  xpath=${Coupons.cmbCupom}  ${OPCAO}+TAB
    Capture Page Screenshot

preenche o campo CPF com "${CPF}"
    IF  $CPF.lower() == 'random_cpf'
        ${CPF}  FakerLibrary.cpf
    END
    SeleniumLibrary.Input Text    xpath=${Register.inpCPF}    ${CPF}
    Capture Page Screenshot

preenche o campo Cupom com "${CUPOM}"
    SeleniumLibrary.Input Text    xpath=${Register.inpNrCoupon}    ${CUPOM}
    Capture Page Screenshot

preenche o campo CRM com "${CRM}"
    SeleniumLibrary.Input Text    xpath=${Register.inpCRM}     ${CRM}
    Capture Page Screenshot

seleciona "${ESTADO}" no combobox "UF"
    Press Keys  xpath=${Register.cmbUF}  ${ESTADO}+TAB
    Capture Page Screenshot

marca o checkbox "Declaro que li e aceito os termos de consentimento"
    Click Element    xpath=${Register.chkTermos}
    Capture Page Screenshot

clica no botão "OK"
    Click Element    xpath=${Register.bntOK}
    Capture Page Screenshot

a label do botão "OK" muda para "${realizandoCadastro}"
    Wait Until Page Contains    ${realizandoCadastro}  30
    Capture Page Screenshot

será exibido a mensagem de erro "${falha}"
    Wait Until Page Contains    ${falha}  30
    Capture Page Screenshot

é possível visualizar o combobox "Possui cupom?" na tela de validação
    HomePage.que o usuário está na página de validação de cupom
    Wait Until Element is Visible    ${Register.cmbPossuiCupom}  ${TIMEOUT}
    Element Should Be Visible    ${Register.cmbPossuiCupom}

não é possível visualizar o combobox "Possui cupom?" na tela de validação
    HomePage.que o usuário está na página de validação de cupom
    Wait Until Element is Not Visible    ${Register.cmbPossuiCupom}  ${TIMEOUT}
    Element Should Not Be Visible    ${Register.cmbPossuiCupom}

acesso a tela de validação de cupom e visualizo os campos de validação
    HomePage.que o usuário está na página de validação de cupom
    Click And Wait    ${Home.btnValidarCupom}  ${Register.cmbPossuiCupom}
    Wait Until Element is Visible    ${Register.inpCRM}  ${TIMEOUT}
    Element Should Be Visible       ${Register.inpCRM}
    Element Should Be Visible       ${Register.chkTermos}
    Element Should Be Visible       ${Register.bntOK}

acesso a tela de validação de cupom e visualizo a mensagem "${suspensao}"
    Click And Wait    ${Home.btnValidarCupom}  ${Register.msgSuspensao}
    Wait Until Page Contains    ${suspensao}
