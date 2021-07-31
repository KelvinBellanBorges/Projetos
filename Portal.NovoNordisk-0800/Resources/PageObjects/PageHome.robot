*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***

que o usuario acessa o Portal 0800
    Wait Until Element Is Visible  ${pageHome.btnCadastro}

Solicita Cadastro no programa
    Click                          ${pageHome.btnCadastro}

ainda não possui cadastro e informa um CPF Válido e uma senha
    Input                          ${pageHome.inpCPF}            ${CPF_MAIOR}
    Execute JavaScript             window.scrollTo(0, document.body.scrollHeight)
    Click                          ${pageHome.btnAcessar}

será recebida mensagem informativa para a realização do cadastro
    Wait Until Element Contains    ${pageHome.txtMsgInformativoCadastro}        CPF não está cadastrado na nossa base. Para realizar o cadastro, só clicar no botão "Cadastre-se" ao lado

ainda não possui cadastro e informa um CPF
    Input                          ${pageHome.inpCPF}            ${CPF_MAIOR}

voltará para a página inicial
    Wait Until Element Contains    ${pageHome.txtPageHome}            Ainda não tenho cadastro no programa
