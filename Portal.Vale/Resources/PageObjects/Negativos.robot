*** Settings ***
Library     SeleniumLibrary

*** Variables ***

# Input                                    ${}
# Click
# Capture Page Screenshot
# Input                                    id=${Beneficiario.txtCPF}                                    ${cpfNovo}


*** Keywords ***

Informo os dados inválidos para acesso
    ${json_string}=  catenate
    ...    [
    ...        {
    ...            "Debug": ,
    ...            "UploadNative": ,
    ...            "IdPlano": ,
    ...            "Cartao": "",
    ...            "Cpf": "",
    ...            "Nome": "",
    ...            "Sexo": "",
    ...            "Cep": "",
    ...            "DataNascimento": "",
    ...            "Email": "",
    ...            "GrauDep": "T"
    ...        }
    ...    ]
    Input                            ${homePage.inpJson}    ${json_string}
    Click                            ${homePage.btnEnviar}

é exibido tela de alerta
    Wait Until Element Is Visible    ${negativos.msgErro}    ${TIMEOUT}
    Element Should Be Visible        ${negativos.msgErro}

recebe mensagem de erro no envio da Sugestão
    Wait Until Element is Visible  ${sugestaoDeMedicamentos.msgErroEnvio}