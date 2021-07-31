*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***
informa um CPF Válido
    Click                          ${TermosAceite.chkAceite}
    Click                          ${TermosAceite.chkAceite2}
    Click                          ${TermosAceite.chkAceite3}
    Input                          ${TermosAceite.inpCpf}              ${CPF}

informa um CPF Válido ja cadastrado
    Click                          ${TermosAceite.chkAceite}
    Click                          ${TermosAceite.chkAceite2}
    Click                          ${TermosAceite.chkAceite3}
    Input                          ${TermosAceite.inpCpf}              ${CPF_JA_CADASTRADO}
    Click                          ${TermosAceite.btnAvancar}

informa um CPF inválido
    Click                          ${TermosAceite.chkAceite}
    Click                          ${TermosAceite.chkAceite2}
    Click                          ${TermosAceite.chkAceite3}
    Input                          ${TermosAceite.inpCpf}              ${CPF_INVALIDO}

é exibido mensagem de erro
    Click                          ${TermosAceite.btnAvancar}
    Wait Until Element Is Visible  ${TermosAceite.msgErroCPF}
    Element Should Be Visible      ${TermosAceite.msgErroCPF}

informa um CPF válido sem marcar os termos de aceite
    Input                          ${TermosAceite.inpCpf}              ${CPF}

é exibido uma mensagem de erro do termo
    Click                          ${TermosAceite.btnAvancar}
    Wait Until Element Is Visible  ${TermosAceite.msgErroAceite}
    Element Should Be Visible      ${TermosAceite.msgErroAceite}
